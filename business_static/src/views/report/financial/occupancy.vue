<template>
  <div id="occupancy">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select @change="search()"
            multiple
            collapse-tags
            v-model="ruleForm.assetList"
            placeholder="请选择项目名称">
            <el-option
              class='select-option-selected'
              v-for="item in projectList"
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择时间：" >
          <el-date-picker
            v-model="ruleForm.yearMonth"
            type="month"
            placeholder="选择时间"
            :clearable="false"
            :picker-options="{
              disabledDate(time) {
                return time.getTime() > Date.now();
              },
            }"
          />
        </el-form-item>
        <el-form-item label="业态：">
          <el-select
            @change="handelSelect"
            v-model="ruleForm.assetLayout"
            filterable
            placeholder="请选择业态">
            <el-option
              v-for="{code, name} in assetTypes"
              class='select-option-selected'
              :key="code"
              :label="name"
              :value="code">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="block">
      <h3 class="title">出租率变化</h3>
      <line-area :option="occupancy.option" width="100%" height="430px"/>
      <div>
        <el-table
          :data="listData"
          style="width:100%;margin-top: 20px;"
          row-key="nowYearMonth"
          border
          lazy
          :load="rentalRateReportForm"
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
        >
          <el-table-column width="200" prop="nowYearMonth" label="月份">
            <template slot-scope="scope">
              <span>{{ scope.row.nowYearMonth.indexOf('--') !== -1 ? '' : scope.row.nowYearMonth }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="assetName" label="项目">
            <template slot-scope="scope">{{scope.row.assetName || '-'}}</template>
          </el-table-column>
          <el-table-column prop="newTotalRentArea" label="新签约面积(㎡)" align="right">
            <template slot-scope="scope">{{scope.row.newTotalRentArea | comdify}}</template>
          </el-table-column>
          <el-table-column prop="expireTotalRentArea" label="到期面积(㎡)" align="right">
            <template slot-scope="scope">{{scope.row.expireTotalRentArea | comdify}}</template>
          </el-table-column>
          <el-table-column prop="vacantArea" label="空置面积(㎡)" align="right">
            <template slot-scope="scope">{{scope.row.vacantArea | comdify}}</template>
          </el-table-column>
          <el-table-column prop="rentalRate" label="出租率(%)" align="right">
            <template slot-scope="scope">{{scope.row.rentalRate | comdify}}{{scope.row.rentalRate ? '%' : ''}}</template>
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { reduce, isEmpty } from 'lodash-es'
import dayjs from 'dayjs'
import { ASSET_TYPEs } from '@/components/const'
import LineArea from 'src/components/echarts/LineArea'
import { rentalRateReportFormChart, rentalRateReportForm } from '@/http/report'
export default {
  components: {LineArea},
  data () {
    return {
      ruleForm: {
        assetLayout: '1',
        yearMonth: new Date()
      },
      assetTypes: [],
      occupancy: {
        option: {
          xAxis: { data: [] },
          series: [
            { data: [] },
            { data: [] },
          ],
        },
      },
      listData: [],
      projectList: []
    }
  },
  watch: {
    'ruleForm.yearMonth' (val) {
      this.rentalRateReportFormChart()
    }
  },
  activated () {
    this.handelSelect()
    this.assetTypes = ASSET_TYPEs
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    search () {
      this.rentalRateReportFormChart()
    },
    reset () {
      this.ruleForm = {
        assetLayout: '1',
        yearMonth: new Date(),
        assetList: []
      }
      this.rentalRateReportFormChart()
    },
    handelSelect () {
      this.ruleForm.assetList = []
      if (isEmpty(this.projectNameList)) {
        this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then(res => {
          this.projectList = res.filter(item => Number(item.assetLayout) === Number(this.ruleForm.assetLayout))
        })
      } else {
        this.projectList = this.projectNameList.filter(item => Number(item.assetLayout) === Number(this.ruleForm.assetLayout))
      }
      this.rentalRateReportFormChart()
    },
    // 图表
    rentalRateReportFormChart () {
      this.listData = []
      let yearMonth = dayjs(this.ruleForm.yearMonth).format('YYYY-MM')
      let params = {
        mainId: this.merchant.id,
        assetLayout: this.ruleForm.assetLayout,
        yearMonth
      }
      rentalRateReportFormChart(params).then(res => {
        let listData = res.data
        listData.forEach(item => { item.hasChildren = true })
        this.listData = listData
        let result = reduce(res.data, (prev, sale) => {
          const { nowYearMonth } = sale
          prev[nowYearMonth] = sale
          return prev
        }, {})

        let xAxisData = Object.keys(result).sort()
        const newTotalRentArea = xAxisData.map((item) => result[item].newTotalRentArea || 0) // 新签约面积
        const expireTotalRentArea = xAxisData.map((item) => result[item].expireTotalRentArea || 0) // 到期面积
        const vacantArea = xAxisData.map((item) => result[item].vacantArea || 0) // 空置面积
        const rentalRate = xAxisData.map((item) => result[item].rentalRate || 0) // 出租率

        this.occupancy.option = {
          color: ['#62a8e8', '#a6d587', '#f5ba77', '#5625f5'],
          legend: { data: ['新签约面积', '到期面积', '空置面积', '出租率'] },
          grid: {
            top: '10%',
            left: '0',
            right: '3%',
            bottom: 40,
            containLabel: true
          },
          xAxis: [ { data: xAxisData, boundaryGap: true } ],
          yAxis: [
            {
              type: 'value',
              name: '平方米(㎡)'
            },
            {
              type: 'value',
              name: '出租率（%）',
              min: 0,
              max: 100
            }
          ],
          series: [
            {
              name: '新签约面积',
              type: 'bar',
              stack: '面积',
              barWidth: 30,
              data: newTotalRentArea
            },
            {
              name: '到期面积',
              type: 'bar',
              stack: '面积',
              barWidth: 30,
              data: expireTotalRentArea,
            },
            {
              name: '空置面积',
              type: 'bar',
              stack: '面积',
              barWidth: 30,
              data: vacantArea
            },
            {
              name: '出租率',
              type: 'line',
              yAxisIndex: 1,
              data: rentalRate
            }
          ]
        }
      })
    },
    // table
    rentalRateReportForm (tree, treeNode, resolve) {
      let params = {
        mainId: this.merchant.id,
        yearMonth: tree.nowYearMonth,
        assetLayout: this.ruleForm.assetLayout,
        assetList: this.ruleForm.assetList
      }
      rentalRateReportForm(params).then(res => {
        res.data.forEach((item, index) => { item.nowYearMonth = tree.nowYearMonth + '--' + index })
        resolve(res.data)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  #occupancy {
    .title {
      font-size: 16px;
      font-weight: 400;
      margin-bottom: 30px;
    }
  }
</style>

<!-- 执行分析列表 -->
<template>
  <div id="budget_exec_list">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="filter" size="small" label-width="88px">
        <el-form-item label="项目名称：" >
          <el-select v-model="filter.assetId" placeholder="请选择">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分期名称：" v-show="assetLayout === '3'">
          <el-select v-model="filter.stagesId" placeholder="请选择">
            <el-option
              v-for="item in stagesList"
              class='select-option-selected'
              :key="item.id"
              :label="item.stagesName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年度名称：" >
          <el-date-picker
            placeholder="请选择"
            type="year"
            value-format="yyyy"
            v-model="filter.year">
          </el-date-picker>
        </el-form-item>
      </el-form>
    </div>

<!--    <el-card class="box-card" style="margin-bottom: 20px">-->
<!--      <el-form :inline="true" :model="filter" size="small" label-width="88px">-->
<!--        <el-form-item label="项目名称：" >-->
<!--          <el-select v-model="filter.assetId" placeholder="请选择" @change="selectProject">-->
<!--            <el-option-->
<!--              v-for="item in projectNameList"-->
<!--              class='select-option-selected'-->
<!--              :key="item.id"-->
<!--              :label="item.assetName"-->
<!--              :value="item.id">-->
<!--            </el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="分期名称：" v-show="assetLayout === '3'">-->
<!--          <el-select v-model="filter.stagesId" placeholder="请选择" @change="search()">-->
<!--            <el-option-->
<!--              v-for="item in stagesList"-->
<!--              class='select-option-selected'-->
<!--              :key="item.id"-->
<!--              :label="item.stagesName"-->
<!--              :value="item.id">-->
<!--            </el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="年度名称：" >-->
<!--          <el-date-picker-->
<!--            placeholder="请选择"-->
<!--            type="year"-->
<!--            value-format="yyyy"-->
<!--            v-model="filter.year"-->
<!--            @change="search()">-->
<!--          </el-date-picker>-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--    </el-card>-->
    <el-card class="box-card">
      <div class="table-header clearfix">
        <el-button class="btn btn-default pull-right" @click.native="exportExcel">导出执行分析</el-button>
      </div>
      <budget-rate-charts :main-id="filter.mainId" :asset-id="chartsFilter.assetId" :stages-id="filter.stagesId" :asset-layout="assetLayout" :year="filter.year" :updated="updated" />
      <div class="table-wrapper">
        <!-- 主表 -->
        <el-table
          :data="tableData"
          row-key="fid"
          default-expand-all border
          style="width: 100%;"
          max-height="550"
          :tree-props="{children: 'child', hasChildren: 'hasChildren'}">
          <el-table-column label="预算科目" width="150" show-overflow-tooltip prop="budgetSubjectName" fixed></el-table-column>
          <el-table-column label="预算达成率(%)" prop="achievementRate" width="120" fixed  align="right"></el-table-column>
          <el-table-column v-for="({id,year,month}, index) in tableData.length > 0 ? tableData[0].child[0].monthRes : []" :key="id" :label="`${year}-${month}`" align="center">
            <el-table-column label="实际(元)" width="100" align="right">
              <template v-if="scope.row.monthRes" slot-scope="scope">{{scope.row.monthRes[index].actualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="预算(元)" width="100" align="right">
              <template v-if="scope.row.monthRes" slot-scope="scope">{{scope.row.monthRes[index].budgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异额(元)" width="100" align="right">
              <template v-if="scope.row.monthRes" slot-scope="scope">{{scope.row.monthRes[index].differenceAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异率(%)" width="100" align="right">
              <template v-if="scope.row.monthRes" slot-scope="scope">{{scope.row.monthRes[index].differenceRate | comdify}}</template>
            </el-table-column>
          </el-table-column>
          <el-table-column label="全年累计" align="center">
            <el-table-column label="实际(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearTotalActualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="预算(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearTotalBudgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异额(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearTotalDifferenceAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异率(%)" width="100" align="right">
              <template slot-scope="scope">{{scope.row.fullYearTotalDifferenceRate | comdify}}</template>
            </el-table-column>
          </el-table-column>
          <el-table-column label="全年预测" align="center">
            <el-table-column label="实际(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearPredictionActualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="预算(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearPredictionBudgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异额(元)" width="120" align="right">
              <template slot-scope="scope">{{scope.row.fullYearPredictionDifferenceAmount | comdify}}</template>
            </el-table-column>
            <el-table-column label="差异率(%)" width="100" align="right">
              <template slot-scope="scope">{{scope.row.fullYearPredictionDifferenceRate | comdify}}</template>
            </el-table-column>
          </el-table-column>
        </el-table>
      </div>
    </el-card>
  </div>
</template>

<script>

import { mapState } from 'vuex'
import { cloneDeep } from 'lodash-es'
import { budgetedPerformance, exportPerformance } from '../../http/budget'
import { getAssetName, queryBsAssetStagesList } from '../../http/assets'
import budgetRateCharts from './budget_exec_charts'
import * as utils from '../../utils/index'

export default {
  components: { budgetRateCharts },
  data () {
    return {
      filter: {
        mainId: null,
        year: new Date().getFullYear() + '',
        assetId: void 0,
        stagesId: void 0,
        assetLayout: null
      },
      assetLayout: void 0,
      chartsFilter: {},
      updated: false,
      projectNameList: [],
      tableData: [],
      stagesList: []
    }
  },
  watch: {
    // 分期相关 先注释
    'filter.assetId': {
      handler (val) {
        this.filter.stagesId = void 0
        let selectedAsset = this.projectNameList.filter(res => { return res.id === val })[0]
        this.assetLayout = selectedAsset.assetLayout
        if (this.assetLayout === '3') {
          queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: val}).then(res => {
            this.stagesList = res.list
            if (this.stagesList && this.stagesList.length > 0) {
              this.filter.stagesId = this.stagesList[0].id
            }
          })
        } else {
          this.stagesList = []
        }
      }
    },
    'filter.stagesId': {
      handler (val) {
        this.search()
      }
    },
    'filter.year': {
      handler (val) {
        this.search()
      }
    }
  },
  computed: mapState(['merchant']),
  activated () {
    getAssetName({mainId: this.merchant.id}).then((res) => {
      this.filter.mainId = this.merchant.id
      this.projectNameList = res
      this.budgetedPerformance(this.filter)
    })
  },
  methods: {
    budgetedPerformance (params) {
      if (params.assetLayout === '') {
        params.assetLayout = null
      }
      // 默认选择项目
      if (this.projectNameList && this.projectNameList.length > 0 && utils.isEmpty(this.filter.assetId)) {
        this.filter.assetId = this.projectNameList[0].id
        this.assetLayout = this.projectNameList[0].assetLayout
        this.chartsFilter.assetId = this.projectNameList[0].id
      }
      budgetedPerformance({...params, assetLayout: this.assetLayout}).then(res => {
        if (res.code === '0') {
          let parentSubjects = []
          res.data.forEach((subject, index) => {
            if (parentSubjects.find(p => p.subjectCode === subject.parentSubjectCode)) {
              return false
            }
            parentSubjects.push({
              fid: 'p' + index,
              subjectCode: subject.parentSubjectCode,
              budgetTypeName: subject.parentSubjectName,
              budgetSubjectCode: subject.parentSubjectCode,
              budgetSubjectName: subject.parentSubjectName
            })
          })
          parentSubjects.forEach(p => {
            res.data.forEach((subject, index) => {
              if (p.subjectCode === subject.parentSubjectCode) {
                p.child = p.child ? p.child : []
                p.months = []
                subject.monthRes.forEach(item => {
                  if (item.month.startsWith('0')) {
                    item.month = item.month.replace('0', '')
                  }
                })
                subject.months = cloneDeep(subject.monthRes)
                p.child.push({...subject, input: true, fid: index})
              }
            })
          })
          this.tableData = cloneDeep(parentSubjects)
        } else {
          this.$message.error({message: res.msg})
        }
      })
    },
    search () {
      this.chartsFilter = this.filter
      this.budgetedPerformance(this.filter)
    },
    selectProject (assetId) {
      // let selectedAsset = this.projectNameList.filter(res => { return res.id === assetId })[0]
      // this.assetLayout = selectedAsset.assetLayout
      // this.search()
    },
    cellStyle ({row, column, rowIndex, columnIndex}) {
      if ((rowIndex === 0 || rowIndex === 1) && columnIndex === 0) {
        return 'border-right:0;'
      }
    },
    itemCellStyle ({row, column, rowIndex, columnIndex}) {
      if (columnIndex < 2) {
        return 'padding-left: 8px'
      }
    },
    headerCellStyle ({row, column, rowIndex, columnIndex}) {
      if (rowIndex === 0 && columnIndex === 0) {
        return 'border-right:0;'
      }
    },
    exportExcel () {
      exportPerformance(this.filter).then(res => {
        const { data, name } = res
        let blob = new Blob([data], {type: 'application/vnd.ms-excel'})
        let url = URL.createObjectURL(blob)
        let a = document.createElement('a')
        a.download = name
        a.href = url
        document.body.appendChild(a)
        a.click()
        document.body.removeChild(a)
      })
    }
  }
}
</script>
<style lang="scss">
  #budget_exec_list{
    .el-table__expanded-cell{
      padding: 0px 0px;
    }
    .el-table th.gutter{
      display: table-cell!important;
    }
    .el-table .cell{
      padding-left: 3px;
      padding-right: 3px;
    }
    .table-wrapper{
      padding-top: 20px;
      padding-bottom: 0;
      border-top: 1px solid #EBEEF5;
      .btn-gtoup{
        margin-bottom: 20px;
      }
      td{
        padding-left: 5px;
        padding-right: 5px;
      }
    }
  }
</style>

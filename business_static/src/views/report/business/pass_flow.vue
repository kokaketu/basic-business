<!--客流报表-->
<template>
  <div id="pass_flow_report" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="filter" ref="form" size="small" label-width="100px">
        <el-form-item label="月份：">
          <el-date-picker
            :clearable="false"
            type="month"
            v-model="filter.yearMonth"
            format="yyyy-MM"
            value-format="yyyy-MM"
            placeholder="选择月份"
            :pickerOptions="pickerOptions"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="项目名称" prop="assetIdList">
          <el-select v-model="filter.assetIdList" class="select-width-100" multiple collapse-tags clearable filterable>
            <el-option v-for="{id, assetName} in projectNameList" :key="id" :label="assetName" :value="id"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <el-table
        border
        :data="dataList"
        :select-on-indeterminate="false"
        style="width: 100%"
        row-key="fid"
        :tree-props="{children: 'assetPassFlowVOList', hasChildren: 'hasChildren'}"
      >
        <el-table-column
          show-overflow-tooltip
          prop="yearMonth"
          label="月份"
          width="300">
        </el-table-column>
<!--        <el-table-column-->
<!--          prop="assetName"-->
<!--          label="项目名称"-->
<!--          min-width="160">-->
<!--        </el-table-column>-->
        <el-table-column
          prop="currentMonthPassFlow"
          label="本月客流量(人)"
          width="200"
          align="right"
        >
          <template slot-scope="scope">{{scope.row.currentMonthPassFlow | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="receivableAmount"
          label="同比(%)"
          width="150"
          align='right'>
          <template slot-scope="scope">{{scope.row.yoy ? (scope.row.yoy > 0 ?  `↑ ${scope.row.yoy}%` : `↓ ${scope.row.yoy}%`) : '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="currentYearPassFlow"
          label="本年累计客流量(人)"
          width="300"
          align='right'>
          <template slot-scope="scope">{{scope.row.currentYearPassFlow | comdify}}</template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { passFlowAnalysis } from '@/http/report'
import { mapState } from 'vuex'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import * as utils from '@/utils/index'

export default {
  components: {ProjectAutoComplete},
  data () {
    return {
      pickerOptions: {
        disabledDate (time) {
          return time.getTime() > Date.now()
        },
      },
      filter: {
        assetIdList: [],
        yearMonth: utils.format(new Date(), 'YYYY-MM')
      },
      dataList: [],
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.search()
  },
  computed: {
    ...mapState(['merchant']),
    projectNameList () {
      return this.$store.state.projectNameList.filter(item => item.assetLayout === '2')
    }
  },
  watch: {
    filter: {
      handler: function () {
        this.search()
      },
      deep: true
    }
  },
  methods: {
    search () {
      this.dataList = []
      const {filter: { yearMonth, companyId, ...args }} = this
      let yearMonthArr = yearMonth.split('-')
      passFlowAnalysis({...args, mainId: this.merchant.id, year: yearMonthArr[0] * 1, month: yearMonthArr[1] * 1}).then((res) => {
        if (res.data) {
          res.data.forEach((e1, index1) => {
            e1.fid = `${index1}`
            if (e1.assetPassFlowVOList) {
              e1.assetPassFlowVOList.forEach((e2, index2) => {
                e2.fid = `${index1}-${index2}`
                e2.yearMonth = e2.assetName
              })
            }
          })
        }
        this.dataList = res.data
      })
    },
    tabClick (tab) {
      this.filter.statisticsType = tab.name
    },
    selectProject ({ id }) {
      this.filter.assetId = id
    },
    reset () {
      this.filter = {
        assetIdList: [],
        yearMonth: utils.format(new Date(), 'YYYY-MM')
      }
    }
  }
}
</script>
<style lang="scss">
</style>

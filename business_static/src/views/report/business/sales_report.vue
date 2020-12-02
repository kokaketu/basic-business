<!--销售额报表-->
<template>
  <div id="sales_report" class="page">
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
        <el-form-item label="项目名称" prop="assetId">
          <el-select v-model="filter.assetIds" class="select-width-100" multiple collapse-tags clearable filterable>
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
      <el-tabs type="border-card" @tab-click="tabClick" v-model="filter.statisticsType" style="width: 1240px">
        <el-tab-pane label="按楼层" name="floor">
          <el-table
            border
            :data="dataList"
            :select-on-indeterminate="false"
            style="width: 100%"
            row-key="fid"
            :tree-props="{children: 'data', hasChildren: 'hasChildren'}"
          >
            <el-table-column
              show-overflow-tooltip
              prop="yearMonth"
              label="月份"
              width="300">
            </el-table-column>
<!--            <el-table-column-->
<!--              prop="assetName"-->
<!--              label="项目名称"-->
<!--              min-width="160">-->
<!--            </el-table-column>-->
<!--            <el-table-column-->
<!--              prop="floorName"-->
<!--              label="楼层"-->
<!--              min-width="100"-->
<!--            >-->
<!--              <template slot-scope="scope" v-if="scope.row.floorName">{{scope.row.floorName}}({{scope.row.buildingName}})</template>-->
<!--            </el-table-column>-->
            <el-table-column
              prop="receivableAmount"
              label="本月销售额(元)"
              width="300"
              align='right'>
              <template slot-scope="scope">{{scope.row.salesMoney | comdify}}</template>
            </el-table-column>
            <el-table-column
              prop="receivedAmount"
              label="同比(%)"
              width="300"
              align='right'>
              <template slot-scope="scope">{{scope.row.yearOnYear ? (scope.row.yearOnYear > 0 ?  `↑ ${scope.row.yearOnYear}%` : `↓ ${scope.row.yearOnYear}%`) : '-'}}</template>
            </el-table-column>
            <el-table-column
              prop="yearReceivableAmount"
              label="本年累计销售额(元)"
              align='right'>
              <template slot-scope="scope">{{scope.row.yearSalesMoney | comdify}}</template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="按业态" name="layout">
          <el-table
            border
            :data="dataList"
            :select-on-indeterminate="false"
            style="width: 100%"
            row-key="fid"
            :tree-props="{children: 'data', hasChildren: 'hasChildren'}"
          >
            <el-table-column
              show-overflow-tooltip
              prop="yearMonth"
              label="月份"
              width="300">
            </el-table-column>
<!--            <el-table-column-->
<!--              prop="assetName"-->
<!--              label="项目名称"-->
<!--              min-width="160"-->
<!--            >-->
<!--            </el-table-column>-->
<!--            <el-table-column-->
<!--              prop="layoutName"-->
<!--              label="业态"-->
<!--              min-width="100">-->
<!--            </el-table-column>-->
            <el-table-column
              prop="receivableAmount"
              label="本月销售额(元)"
              width="300"
              align='right'>
              <template slot-scope="scope">{{scope.row.salesMoney | comdify}}</template>
            </el-table-column>
            <el-table-column
              prop="receivedAmount"
              label="本月同比变化(%)"
              width="300"
              align='right'>
              <template slot-scope="scope">{{scope.row.yearOnYear ? `${scope.row.yearOnYear}%` : '-'}}</template>
            </el-table-column>
            <el-table-column
              prop="yearReceivableAmount"
              label="本年累计销售额(元)"
              align='right'>
              <template slot-scope="scope">{{scope.row.yearSalesMoney | comdify}}</template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>
<script>
import { salesAnalysis } from '@/http/report'
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
        assetIds: [],
        buildingId: void 0,
        floorId: void 0,
        statisticsType: 'floor',
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
      return this.$store.state.projectNameList.filter(res => res.assetLayout === '2')
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
      const {filter: { date, companyId, ...args }} = this
      salesAnalysis({...args, mainId: this.merchant.id}).then((res) => {
        res.data.forEach((e1, index1) => {
          e1.fid = `${index1}`
          if (e1.data) {
            e1.data.forEach((e2, index2) => {
              e2.fid = `${index1}-${index2}`
              e2.yearMonth = e2.assetName
              if (e2.data) {
                e2.data.forEach((e3, index3) => {
                  e3.fid = `${index1}-${index2}-${index3}`
                  e3.yearMonth = e3.floorName ? `${e3.floorName}(${e3.buildingName})` : e3.layoutName
                })
              }
            })
          }
        })
        this.dataList = res.data
        console.log(this.dataList)
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
        assetIds: [],
        buildingId: void 0,
        floorId: void 0,
        statisticsType: 'floor',
        yearMonth: utils.format(new Date(), 'YYYY-MM')
      }
    }
  }
}
</script>
<style lang="scss">
  #sales_report{
    .el-tabs{
      box-shadow: none
    }
    .table-wrapper{
      padding-bottom: 0;
    }
  }
</style>

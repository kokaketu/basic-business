<!--收入报表-->
<template>
  <div id="receivables" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="filter" ref="form" size="small" label-width="100px">
        <el-form-item label="日期范围：">
          <el-date-picker
            :clearable="false"
            type="monthrange"
            v-model="filter.date"
            format="yyyy-MM"
            value-format="yyyy-MM"
            range-separator="~"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
        <project-auto-complete @select="selectProject" :projectId="filter.assetId" size="small"/>
        <el-form-item label="分期名称：" v-if="assetLayout === '3'">
          <el-select
            clearable
            v-model="filter.stagesId"
            placeholder="请选择"
            @change="search()">
            <el-option
              v-for="item in stagesList"
              class='select-option-selected'
              :key="item.id"
              :label="item.stagesName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="楼栋：">
          <el-select
            v-model="filter.buildingId"
            clearable
            placeholder="请选择楼栋">
            <el-option
              v-for="{id, buildingName} in buildings"
              class='select-option-selected'
              :key="id"
              :label="buildingName"
              :value="id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="楼层：">
          <el-select
            v-model="filter.floorId"
            clearable
            placeholder="请选择楼层">
            <el-option
              v-for="{id, floorName} in floors"
              class='select-option-selected'
              :key="id"
              :label="floorName"
              :value="id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="租赁单元：">
          <el-select
            v-model="filter.roomId"
            clearable
            placeholder="请选择租赁单元">
            <el-option
              v-for="{id, roomNo} in rooms"
              class='select-option-selected'
              :key="id"
              :label="roomNo"
              :value="id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="租户：">
          <el-select
            v-model="filter.companyId"
            clearable
            filterable
            placeholder="输入搜索"
            remote
            :remote-method="searchCompany"
          >
            <el-option
              v-for="{id, companyName} in companys"
              class='select-option-selected'
              :key="id"
              :label="companyName"
              :value="id">
            </el-option>
          </el-select>
        </el-form-item>
        <subject-auto-complete @select="selectSubject" :subjectCode="filter.subjectCode" />
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
        :tree-props="{children: 'data', hasChildren: 'hasChildren'}"
      >
        <el-table-column
          show-overflow-tooltip
          type=""
          prop="month"
          label="时间"
          width="100">
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          width="240">
        </el-table-column>
<!--        <el-table-column-->
<!--          show-overflow-tooltip-->
<!--          prop="buildingName"-->
<!--          label="楼栋"-->
<!--          min-width="100">-->
<!--        </el-table-column>-->
<!--        <el-table-column-->
<!--          prop="floorName"-->
<!--          label="楼层"-->
<!--          min-width="100">-->
<!--        </el-table-column>-->
<!--        <el-table-column-->
<!--          prop="roomNos"-->
<!--          label="租赁单元"-->
<!--          min-width="100">-->
<!--        </el-table-column>-->
        <el-table-column
          prop="companyName"
          label="租户"
          width="180">
          <template slot-scope="scope">{{scope.row.companyName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="subjectName"
          label="款项名称"
          width="180">
          <template slot-scope="scope">{{scope.row.subjectName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="receivableAmount"
          v-bind:label="'本月应收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.receivableAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="receivedAmount"
          v-bind:label="'本月实收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.receivedAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="receivedLeftAmount"
          v-bind:label="'本月剩余应收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.receivableLeftAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="yearReceivableAmount"
          v-bind:label="'本年累计应收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.yearReceivableAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="yearReceivedAmount"
          v-bind:label="'本年累计实收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.yearReceivedAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="yearReceivedAmount"
          v-bind:label="'本年累计剩余应收\n金额(元)'"
          min-width="140"
          align='right'>
          <template slot-scope="scope">{{scope.row.yearReceivableLeftAmount | comdify}}</template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { getBuildingNameList, getFloorNameList, getrentalUnitList, queryBsAssetStagesList } from '@/http/assets'
import { receivableAnalysis } from '@/http/report'
import { getCompanyNameList } from '@/http/rentControl'
import { mapState } from 'vuex'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import * as utils from '@/utils/index'
import { ASSET_TYPEs } from '@/components/const'

export default {
  components: {ProjectAutoComplete, SubjectAutoComplete},
  data () {
    return {
      filter: {
        assetId: void 0,
        stagesId: void 0,
        buildingId: void 0,
        floorId: void 0,
        roomId: void 0,
        companyId: void 0,
        subjectCode: void 0,
        date: [`${utils.format(new Date(), 'YYYY-MM')}`, utils.format(new Date(), 'YYYY-MM')]
      },
      assetLayout: '',
      stagesList: [],
      buildings: [],
      floors: [],
      rooms: [],
      companys: [],
      dataList: [],
      assetTypes: []
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.search()
  },
  created () {
    this.assetTypes = ASSET_TYPEs
  },
  computed: mapState(['merchant', 'projectNameList']),
  watch: {
    'filter.assetId': {
      handler (newVal, oldVal) {
        this.filter.stagesId = void 0
        this.filter.buildingId = void 0
        this.filter.floorId = void 0
        this.stagesList = []
        this.buildings = []
        this.floors = []
        this.companys = []
        if (newVal !== oldVal && newVal) {
          let selectedAsset = this.projectNameList.filter(res => { return res.id === newVal })[0]
          this.assetLayout = selectedAsset.assetLayout
          if (this.assetLayout === '3') {
            queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: newVal}).then(res => {
              this.stagesList = res.list
            })
          } else {
            getBuildingNameList({assetId: newVal}).then(res => {
              this.buildings = res
            })
          }
        }
      }
    },
    'filter.stagesId': {
      handler (newVal, oldVal) {
        this.filter.buildingId = void 0
        this.filter.floorId = void 0
        this.buildings = []
        this.floors = []
        this.companys = []
        if (newVal !== oldVal && newVal) {
          getBuildingNameList({assetId: this.filter.assetId, stagesId: newVal}).then(res => {
            this.buildings = res
          })
        }
      }
    },
    'filter.buildingId': {
      handler (newVal, oldVal) {
        this.filter.floorId = void 0
        this.floors = []
        if (newVal !== oldVal && newVal) {
          getFloorNameList({buildingId: newVal}).then(res => {
            this.floors = res
          })
        }
      }
    },
    'filter.floorId': {
      handler (newVal, oldVal) {
        this.filter.roomId = void 0
        this.rooms = []
        if (newVal !== oldVal && newVal) {
          getrentalUnitList({mainId: this.merchant.id, floorId: newVal, limit: 999}).then(res => {
            this.rooms = res.list
          })
        }
      }
    },
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
      const {filter: { date, ...args }} = this
      const [startMonth, endMonth] = date || []
      receivableAnalysis({...args, mainId: this.merchant.id, startMonth, endMonth}).then((res) => {
        res.data.forEach((e1, index1) => {
          e1.fid = `${index1}`
          if (e1.data) {
            e1.data.forEach((e2, index2) => {
              e2.fid = `${index1}-${index2}`
              e2.assetName = e2.stagesName ? `${e2.buildingName}（${e2.stagesName}）` : e2.buildingName
              if (e2.data) {
                e2.data.forEach((e3, index3) => {
                  e3.fid = `${index1}-${index2}-${index3}`
                  e3.assetName = e3.floorName
                  if (e3.data) {
                    e3.data.forEach((e4, index4) => {
                      e4.fid = `${index1}-${index2}-${index3}-${index4}`
                      e4.month = ''
                      e4.assetName = e4.roomNos
                    })
                  }
                })
              }
            })
          }
        })
        this.dataList = res.data
      })
    },
    selectProject ({ id }) {
      this.filter.assetId = id
    },
    selectSubject ({subjectCode}) {
      this.filter.subjectCode = subjectCode
    },
    searchCompany (key) {
      if (!this.filter.assetId) {
        this.$message.warning('请先选择项目')
      } else {
        getCompanyNameList({mainId: this.merchant.id, assetId: this.filter.assetId, companyName: key}).then(res => {
          this.companys = res.data
        })
      }
    },
    reset () {
      this.filter = {
        // assetId: void 0,
        // stagesId: void 0,
        // buildingId: void 0,
        // floorId: void 0,
        // date: [`${utils.format(new Date(), 'YYYY-MM')}`, utils.format(new Date(), 'YYYY-MM')]
        assetId: void 0,
        stagesId: void 0,
        buildingId: void 0,
        floorId: void 0,
        roomId: void 0,
        companyId: void 0,
        subjectCode: void 0,
        date: [`${utils.format(new Date(), 'YYYY-MM')}`, utils.format(new Date(), 'YYYY-MM')]
      }
      this.stagesList = []
      this.buildings = []
      this.floors = []
    }
  }
}
</script>
<style lang="scss" scoped>
  .left-rece-money-disabled{
    background-color: #F5F7FA;
    border-color: #E4E7ED;
    color: #C0C4CC;
  }
</style>
<style lang="scss">
  #receivables .el-table .cell{
    white-space: pre-line !important;
  }
</style>

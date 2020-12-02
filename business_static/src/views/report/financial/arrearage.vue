<!--欠费报表-->
<template>
  <div id="receivables" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="filter" ref="form" size="small" label-width="100px">
        <el-form-item label="欠费天数：">
          <input-number :value="filter.leftArrearageDay" @input="(v)=>{filter.leftArrearageDay=v;search(1)}"
                        placeholder="请输入" style="width: 120px"/>
          ~
          <input-number :value="filter.rightArrearageDay" @input="(v)=>{filter.rightArrearageDay=v;search(1)}"
                        placeholder="请输入" style="width: 120px"/>
          天
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
        :data="dataList"
        style="width: 100%"
        row-key="fid"
        border
        :tree-props="{children: 'data', hasChildren: 'hasChildren'}"
      >
        <el-table-column
          prop="assetName"
          label="项目名称"
          width="300">
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
          width="200"
        >
          <!-- <template slot-scope="scope">
            <el-popover
              placement="top-start"
              title=""
              width="200"
              trigger="hover"
              :content="`保证金：${scope.row.depositAmount}`">
              <span slot="reference" style="cursor: pointer">{{scope.row.companyName || '-'}}</span>
            </el-popover>
          </template> -->
          <template slot-scope="scope">{{scope.row.companyName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="subjectName"
          label="款项名称"
          width="200">
          <template slot-scope="scope">{{scope.row.subjectName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="receivableAmount"
          label="累计欠费金额(元)"
          width="300"
          align='right'>
          <template slot-scope="scope">{{scope.row.arrearageAmount | comdify}}</template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { getBuildingNameList, getFloorNameList, getrentalUnitList, queryBsAssetStagesList } from '@/http/assets'
import { arrearageAnalysis } from '@/http/report'
import { getCompanyNameList } from '@/http/rentControl'
import { mapState } from 'vuex'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import * as utils from '@/utils/index'
import { ASSET_TYPEs } from '@/components/const'
import InputNumber from '@/components/InputNumber'

export default {
  components: {ProjectAutoComplete, SubjectAutoComplete, InputNumber},
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
        date: [`${utils.format(new Date(), 'YYYY')}-01`, utils.format(new Date(), 'YYYY-MM')]
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
      arrearageAnalysis({...args, mainId: this.merchant.id, startMonth, endMonth}).then((res) => {
        res.data.forEach((e1, index1) => {
          // 项目数据行
          e1.fid = `${index1}`
          if (e1.data) {
            e1.data.forEach((e2, index2) => {
              // 楼栋数据行
              e2.fid = `${index1}-${index2}`
              e2.assetName = e2.stagesName ? `${e2.buildingName}（${e2.stagesName}）` : e2.buildingName || '其他'
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
      if (id) {
        let selectedAsset = this.projectNameList.filter(res => { return res.id === id })[0]
        this.assetLayout = selectedAsset.assetLayout
      } else {
        this.filter.assetId = null
        this.assetLayout = ''
      }
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
        // date: [`${utils.format(new Date(), 'YYYY')}-01`, utils.format(new Date(), 'YYYY-MM')]
        assetId: void 0,
        stagesId: void 0,
        buildingId: void 0,
        floorId: void 0,
        roomId: void 0,
        companyId: void 0,
        subjectCode: void 0,
        date: [`${utils.format(new Date(), 'YYYY')}-01`, utils.format(new Date(), 'YYYY-MM')]
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

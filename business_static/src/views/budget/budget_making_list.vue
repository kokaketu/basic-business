<!--预算编制列表-->
<template>
  <div id="budget_making_list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="filter"  size="small" label-width="88px">
        <el-form-item label="项目名称：" >
          <el-select v-model="filter.assetId" placeholder="请选择" @change="selectProject" clearable>
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分期名称：" v-if="assetLayout === '3'">
          <el-select v-model="filter.stagesId" clearable placeholder="请选择" @change="search()">
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
          v-model="filter.year"
          @change="search()">
          </el-date-picker>
        </el-form-item>
        <!-- <el-form-item>
          <el-button class="btn" style="margin-top: 20px" @click="search()">搜索</el-button>
          <el-button class="btn btn-default" style="margin-top: 20px" @click="reset()">重置</el-button>
        </el-form-item> -->
      </el-form>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">预算编制列表</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="create">新增</el-button>
      </div>
      <el-table
        :data="tableData"
        @row-click="detail"
        style="width: 100%;">
        <el-table-column
          prop="budgetYear"
          label="年度"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column label="项目">
          <template slot-scope="scope">
            <el-link @click.stop="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
            <el-link :underline="false" type="info" v-if="scope.row.stagesName" style="cursor: default;" @click.stop="">
              （{{scope.row.stagesName}}）
            </el-link>
          </template>
        </el-table-column>
        <!-- <el-table-column
          prop="assetName"
          label="项目"
          show-overflow-tooltip>
        </el-table-column> -->
        <el-table-column
          prop="inAmount"
          label="收入(元)"
          show-overflow-tooltip
          align="right">
          <template slot-scope="scope">{{scope.row.inAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="outAmount"
          label="支出(元)"
          show-overflow-tooltip
          align="right"
          class-name="set-last-cell">
          <template slot-scope="scope">{{scope.row.outAmount | comdify}}</template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>

import { mapState } from 'vuex'
import { getBudgetMakingList } from '@/http/budget'
import { queryBsAssetStagesList } from '../../http/assets'

export default {
  data () {
    return {
      permission: '',
      filter: {
        mainId: null,
        assetId: null,
        year: new Date().getFullYear() + ''
      },
      assetLayout: void 0,
      stagesList: [],
      buildingList: [],
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      drawerCreateStatus: false,
      drawerDetailStatus: false,
      drawerEditStatus: false,
      selectedFloorId: ''
    }
  },
  watch: {
    // 分期相关
    'filter.assetId': {
      handler (val) {
        this.filter.stagesId = null
        if (this.assetLayout === '3') {
          queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: val}).then(res => {
            this.stagesList = res.list
          })
        } else {
          this.stagesList = []
        }
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    getList () {
      this.filter.mainId = this.merchant.id
      // 默认选择项目
      // if (this.projectNameList && this.projectNameList.length > 0 && utils.isEmpty(this.filter.assetId)) {
      //   this.filter.assetId = this.projectNameList[0].id
      // }
      getBudgetMakingList(this.filter).then(res => {
        this.tableData = res.data
      })
    },
    reset () {
      this.filter = {mainId: this.merchant.id}
      this.getList()
    },
    create () {
      this.$router.push('/budget/budget-making-create')
    },
    detail (row) {
      this.$router.push({path: `/budget/budget-making-detail`, query: {mainId: row.mainId, assetId: row.assetId, assetLayout: row.assetLayout, year: row.budgetYear, stagesId: row.stagesId}})
    },
    handleClose (done) {
      done()
    },
    forwardToProject (row) {
      event.preventDefault()
      this.$router.push('/asset/project/detail/' + row.assetId)
    },
    selectProject (assetId) {
      if (assetId) {
        let selectedAsset = this.projectNameList.filter(res => { return res.id === assetId })[0]
        this.assetLayout = selectedAsset.assetLayout
      } else {
        this.filter.assetId = null
        this.assetLayout = ''
      }
      this.search()
    },
  },
  components: {
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
  }
}
</script>
<style lang="scss" scoped>
  #asset{
    .block{
      background: #fff;
      padding: 20px;
      margin-bottom: 20px;
    }
  }
</style>

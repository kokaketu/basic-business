<!--
 * @Author: your name
 * @Date: 2020-08-19 15:10:05
 * @LastEditTime: 2020-08-21 15:38:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\budget\budget_fill_list.vue
-->
<template>
  <div id="budget_fill_list" class="page">
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
          <el-select v-model="filter.stagesId" placeholder="请选择" @change="search()">
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
          v-model="filter.budgetYear"
          @change="search()">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="月度名称：">
          <el-date-picker
          placeholder="请选择"
          type="month"
          format="MM"
          value-format="MM"
          v-model="filter.budgetMonth"
          @change="search()">
          </el-date-picker>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">执行填报列表</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="createVisible = true">新增</el-button>
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
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
            <el-link :underline="false" type="info" v-if="scope.row.stagesName" style="cursor: default;" @click.stop="">
              （{{scope.row.stagesName}}）
            </el-link>
          </template>
        </el-table-column>
        <el-table-column
          prop="budgetMonth"
          label="月份"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="inAmount"
          label="实际收入(元)"
          show-overflow-tooltip
          align="right">
          <template slot-scope="scope">{{scope.row.inAmount | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="outAmount"
          label="实际支出(元)"
          show-overflow-tooltip
          align="right"
          class-name="set-last-cell">
          <template slot-scope="scope">{{scope.row.outAmount | comdify}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
    <el-dialog
      title="新增执行填报"
      :visible="createVisible"
      @close="createVisible = false"
    >
      <div class="base-info">
        <div class="new-block" style="padding: 0px;">
          <div class="filter-wrapper clearfix" style="box-shadow: none; margin-bottom: 0px">
            <el-form :inline="true" size="small" label-width="100px" :model="createForm" ref="createForm">
              <el-form-item label="项目名称" prop="assetId" :rules="[{required: true, message: '请选择项目名称', trigger: 'blur'}]">
                <el-select v-model="createForm.assetId" @change="selectCreateProject">
                  <el-option
                    v-for="item in createForm.projectNameList"
                    class='select-option-selected'
                    :key="item.assetId"
                    :label="item.assetName"
                    :value="item.assetId">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="分期名称" prop="stagesId" :rules="[{required: true, message: '请选择分期名称', trigger: 'blur'}]" v-if="createForm.assetLayout === '3'">
                <el-select v-model="createForm.stagesId" @change="selectCreateStages">
                  <el-option
                    v-for="item in createForm.stagesList"
                    class='select-option-selected'
                    :key="item.stagesId"
                    :label="item.stagesName"
                    :value="item.stagesId">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="填报年份" prop="year" :rules="[{required: true, message: '请选择填报年份', trigger: 'blur'}]">
                <el-select v-model="createForm.year">
                  <el-option
                    v-for="item in createForm.budgetYearList"
                    class='select-option-selected'
                    :key="item.budgetYear"
                    :label="item.budgetYear"
                    :value="item.budgetYear">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="填报月份" prop="month" :rules="[{required: true, message: '请选择填报月份', trigger: 'blur'}]">
                <el-select v-model="createForm.month">
                  <el-option
                    v-for="item in createForm.budgetMonthList"
                    class='select-option-selected'
                    :key="item"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
      <div class="btn-group" align="center">
        <el-button class="btn " style="margin-right: 0" @click.native="create">保存</el-button>
        <el-button class="btn btn-default" @click.native="createVisible= false" style="margin-right: 10px">取消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>

import { mapState } from 'vuex'
import { queryBudgetImplementList, queryAssetNameList, queryBudgetYearList, queryStagesByAssetId } from '@/http/budget'
import { queryBsAssetStagesList } from '@/http/assets'

export default {
  data () {
    return {
      permission: '',
      filter: {
        mainId: null,
        assetId: null,
        stagesId: null,
        budgetYear: null,
        budgetMonth: null
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
      selectedFloorId: '',
      createVisible: false,
      createForm: {
        projectNameList: [],
        stagesList: [],
        budgetYearList: [],
        budgetMonthList: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        assetId: void 0,
        stagesId: void 0,
        assetLayout: '',
        year: '',
        month: '',
      },
    }
  },
  watch: {
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    getList () {
      this.filter.mainId = this.merchant.id
      const params = {
        mainId: this.merchant.id,
        assetId: this.filter.assetId,
        stagesId: this.filter.stagesId,
        budgetYear: this.filter.budgetYear,
        budgetMonth: this.filter.budgetMonth,
        page: this.currentPage,
        limit: this.limit
      }
      queryBudgetImplementList(params).then(res => {
        const data = res.data
        this.tableData = data.list
        this.total = data.total * 10
      })
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    create () {
      this.$refs['createForm'].validate(valid => {
        if (valid) {
          this.$router.push({path: '/budget/budget-fill-create',
            query: {
              assetLayout: this.createForm.assetLayout,
              assetId: this.createForm.assetId,
              stagesId: this.createForm.stagesId,
              year: this.createForm.year,
              month: this.createForm.month
            }})
          this.createVisible = false
          this.createForm = {
            projectNameList: this.createForm.projectNameList,
            stagesList: [],
            budgetYearList: [],
            budgetMonthList: this.createForm.budgetMonthList,
            assetId: void 0,
            stagesId: void 0,
            assetLayout: '',
            year: '',
            month: '',
          }
        }
      })
    },
    detail (row) {
      const mainId = row.mainId
      const assetId = row.assetId
      const stagesId = row.stagesId
      const budgetYear = row.budgetYear
      const budgetMonth = row.budgetMonth
      const data = {
        mainId: mainId,
        assetId: assetId,
        stagesId: stagesId,
        budgetYear: budgetYear,
        budgetMonth: budgetMonth
      }
      this.$router.push(`/budget/budget-fill-detail/${encodeURIComponent(JSON.stringify(data))}`)
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
        this.filter.stagesId = null
        if (this.assetLayout === '3') {
          queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: assetId}).then(res => {
            this.stagesList = res.list
          })
        } else {
          this.stagesList = []
        }
      } else {
        this.filter.assetId = null
        this.assetLayout = ''
      }
      this.search()
    },
    selectCreateProject (assetId) {
      if (assetId) {
        this.createForm.stagesList = []
        this.createForm.budgetYearList = []
        let selectedAsset = this.createForm.projectNameList.filter(res => { return res.assetId === assetId })[0]
        this.createForm.assetLayout = selectedAsset.assetLayout
        this.createForm.stagesId = null
        if (this.createForm.assetLayout === '3') {
          queryStagesByAssetId({mainId: this.merchant.id, assetId: assetId}).then(res => {
            this.createForm.stagesList = res.data.filter(item => item && item.stagesId)
          })
        } else {
          this.queryBudgetYearList()
        }
      } else {
        this.createForm.assetLayout = ''
      }
    },
    selectCreateStages () {
      this.queryBudgetYearList()
    },
    getAssetNameList () {
      queryAssetNameList({mainId: this.merchant.id}).then(res => {
        this.createForm.projectNameList = res.data
      })
    },
    queryBudgetYearList () {
      queryBudgetYearList({mainId: this.merchant.id, assetId: this.createForm.assetId, stagesId: this.createForm.stagesId}).then(res => {
        this.createForm.budgetYearList = res.data
      })
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
    this.getAssetNameList()
  }
}
</script>
<style lang="scss" scoped>
</style>

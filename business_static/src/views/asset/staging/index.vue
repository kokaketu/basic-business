<template>
  <div id="staging">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select @change="search()"
            v-model="ruleForm.projectName"
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
        <el-form-item label="分期名称：" >
          <el-input placeholder="请输入分期名称：" v-model="ruleForm.stagesName" @input="search()"></el-input>
        </el-form-item>
        <el-form-item label="经营阶段：" >
          <el-select
            v-model="ruleForm.operationStageList"
            multiple
            collapse-tags
            placeholder="请选择经营阶段，支持多选"
            @change="search()"
            clearable>
            <el-option
              v-for="item in operationStageList"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">分期列表</el-button>
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">导出分期</el-button>
        <el-button
          class="btn btn-default pull-right"
          :disabled="permission"
          @click.native="$router.push({path: '/asset/staging/import', query: {type: 'staging'}})">导入分期</el-button>
        <el-button class="btn pull-right" :disabled="permission" @click.native="drawerOpenCreate">新建分期</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="stagesName"
          label="分期名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName || '-'}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column
          label="经营阶段">
          <template slot-scope="scope">
            <span>{{ operationObj[scope.row.operationStage] || '-'}}</span>
          </template>
        </el-table-column>

        <el-table-column
          prop="totalBuildingArea"
          label="总建筑面积(㎡)"
          sortable
          align="right"
          class-name="set-sortable-align">
          <template slot-scope="scope">{{scope.row.totalBuildingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="总可出租面积(㎡)"
          sortable
          align="right"
          class-name="set-sortable-align">
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="buildCount"
          label="楼栋数(栋)"
          sortable
          align="right"
          class-name="set-sortable-align">
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="limit"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { queryBsAssetStagesList, ExportExcelAssetStagesList } from '@/http/assets'
import { reset, getOperationStageList, objToArray } from '../assets'
import { isEmpty } from 'lodash-es'
export default {
  data () {
    return {
      projectList: null,
      assetLayout: '3',
      permission: '',
      ruleForm: {},
      tableData: [],
      operationStageList: [],
      currentPage: 1,
      total: 0,
      limit: 10,
      operationObj: {0: '', 1: '未营业', 2: '试营业', 3: '筹备期', 4: '培育期', 5: '成熟期'}
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    if (isEmpty(this.projectNameList)) {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then(res => {
        this.projectList = res.filter(item => Number(item.assetLayout) === Number(this.assetLayout))
      })
    } else {
      this.projectList = this.projectNameList.filter(item => Number(item.assetLayout) === Number(this.assetLayout))
    }
    this.getList()
    this.init()
  },
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    reset () {
      this.currentPage = 1
      let object = this.ruleForm
      reset(object)
      this.getList()
    },
    init () {
      // 获取经营阶段
      getOperationStageList().then(res => {
        this.operationStageList = objToArray(res)
      })
    },
    forwardToProject (row) {
      this.$router.push('/asset/project/detail/' + row.assetId)
    },
    listAndExportParams () {
      return {
        assetLayout: this.assetLayout,
        page: this.currentPage,
        limit: this.limit,
        mainId: this.merchant.id,
        assetId: this.ruleForm.projectName,
        stagesName: this.ruleForm.stagesName,
        operationStageList: this.ruleForm.operationStageList
      }
    },
    getList () {
      const params = this.listAndExportParams()
      queryBsAssetStagesList(params).then(res => {
        this.total = res.total
        this.tableData = res.list
      })
    },
    exportExcel () {
      const params = this.listAndExportParams()
      ExportExcelAssetStagesList(params).then(res => {
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
    },
    // 新建项目
    drawerOpenCreate () {
      this.$router.push('/asset/staging/create')
    },
    // 整行点击
    drawerOpenDetail (rows) {
      this.$router.push({path: '/asset/staging/detail/' + rows.id, query: this.$route.query})
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    }
  }
}
</script>

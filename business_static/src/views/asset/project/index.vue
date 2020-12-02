<template>
  <div id="asset-project" class="page">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select @change="search()"
            v-model="ruleForm.projectName"
            placeholder="请选择项目名称">
            <el-option
              class='select-option-selected'
              v-for="item in projectNameList"
              :key="item.id"
              :label="item.assetName"
              :value="item.assetName">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="业态：" prop="assetLayout">
          <el-select
            v-model="ruleForm.assetLayout"
            multiple
            collapse-tags
            placeholder="请选择业态，支持多选"
            @change="search()">
            <el-option
              v-for="item in assetLayoutList"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="资产分类：" prop="status">
          <el-select
            v-model="ruleForm.status"
            multiple
            collapse-tags
            placeholder="请选择资产分类，支持多选"
            @change="search()">
            <el-option
              v-for="item in statusList"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="经营阶段：" prop="stage">
          <el-select
            v-model="ruleForm.stage"
            multiple
            collapse-tags
            placeholder="请选择经营阶段，支持多选"
            @change="search()">
            <el-option
              v-for="item in operationStageList"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="开业日期：" v-if="ruleForm.assetLayout == 2">
          <el-date-picker @change="search()"
            v-model="ruleForm.openingDate"
            type="daterange"
            range-separator="至"
            value-format="yyyy-MM-dd"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">项目列表</el-button>
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">导出项目</el-button>
        <el-button
          class="btn btn-default pull-right"
          :disabled="permission"
          @click.native="importProject">导入项目</el-button>
        <el-button
          class="btn pull-right"
          :disabled="permission"
          @click.native="drawerOpenCreate">新建项目</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="assetName"
          label="项目名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="shortName"
          label="项目简称"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.shortName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="assetLayoutString"
          label="业态"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="cityName"
          label="所在城市"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.cityName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="assetStatusString"
          label="资产分类"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.assetStatusString || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="operationStageString"
          label="经营阶段"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.operationStageString || '-'}}</template>
        </el-table-column>
        <el-table-column
          label="开业日期"
          sortable
          width="110px"
          show-overflow-tooltip
          prop="openingDate">
          <template slot-scope="scope">
            <span v-if="scope.row.assetLayout == 2">{{scope.row.openingDate ? scope.row.openingDate.slice(0, 10) : scope.row.openingDate || '-'}}</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="totalBuildingArea"
          label="总建筑面积(㎡)"
          sortable
          width="150px"
          align="right"
          class-name="set-sortable-align"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.totalBuildingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="总可出租面积(㎡)"
          sortable
          width="160px"
          align="right"
          class-name="set-sortable-align"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="buildCount"
          label="楼栋数(栋)"
          sortable
          width="150px"
          class-name="set-sortable-align"
          show-overflow-tooltip
          align="right">
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

  </div>
</template>
<script>
import { getAssetListByMainId, exportExcelAssetList, quotaTotalCheck } from '@/http/assets'
import { reset, getOperationStageList, getAssetStatusList, objToArray } from '../assets'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        projectName: '',
        assetLayout: '1',
        stage: [],
        status: [],
        openingDate: '',
        creationDate: ''
      },
      operationStageList: [],
      statusList: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      drawerCreateStatus: false,
      drawerDetailStatus: false,
      drawerEditStatus: false,
      tableData: [],
      flag: false,
      orderBy: ''
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList', 'assetLayoutList']),
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
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    // 详情、新建、编辑弹窗
    drawerOpenDetail (rows) {
      this.$router.push({path: '/asset/project/detail/' + rows.id, query: this.$route.query})
    },
    drawerOpenCreate () {
      // 配额总数校验
      const params = {
        mainId: this.merchant.id,
        quotaType: '2',
        addCount: '1',
        addArea: null
      }
      quotaTotalCheck(params).then(res => {
        if (Number(res.code) === 0) {
          this.$router.push('/asset/project/create')
        }
      })
    },
    handleClose (done) {
      done()
    },
    listAndExportParams () {
      let openStartTime
      let openEndTime
      let daterange
      daterange = this.ruleForm.openingDate
      if (daterange) {
        openStartTime = daterange[0]
        openEndTime = daterange[1]
      } else {
        openStartTime = ''
        openEndTime = ''
      }
      return {
        page: this.currentPage,
        limit: this.limit,
        mainId: this.merchant.id,
        assetName: this.ruleForm.projectName,
        assetLayoutList: this.ruleForm.assetLayout,
        operationStageList: this.ruleForm.stage,
        statusList: this.ruleForm.status,
        openStartTime: openStartTime,
        openEndTime: openEndTime,
        orderBy: this.orderBy,
        creaStartTime: '',
        creaEndTime: ''
      }
    },
    // 获取列表数据
    getList () {
      const params = this.listAndExportParams()
      getAssetListByMainId(params).then(res => {
        this.tableData = (res && res.list) || []
        this.total = res && res.total * 10
        this.flag = true
      })
    },
    importProject () {
      // 配额总数校验
      const params = {
        mainId: this.merchant.id,
        quotaType: '2',
        addCount: '1',
        addArea: null
      }
      quotaTotalCheck(params).then(res => {
        if (res && Number(res.code) === 0) {
          this.$router.push({path: '/asset/project/import', query: {type: 'project'}})
        }
      })
    },
    exportExcel () {
      const params = this.listAndExportParams()
      exportExcelAssetList(params).then(res => {
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
    /**
     * 获取下拉列表
     */
    getEnumList () {
      // 获取经营阶段
      getOperationStageList().then(res => {
        this.operationStageList = objToArray(res)
      })
      // 资产分类枚举
      getAssetStatusList().then(res => {
        this.statusList = objToArray(res)
      })
    }

  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.$store.dispatch('setAssetLayoutEnum')
    this.getEnumList()
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

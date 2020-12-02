<template>
  <div id="asset-building" class="page">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">

        <el-form-item label="项目名称：" >
          <el-select v-model="ruleForm.projectName" placeholder="请选择项目" @change="queryFQ()">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-show="assetLayout == 3" label="分期名称：">
          <el-select v-model="ruleForm.stagesId" placeholder="请选择所属分期"  @change="search()">
            <el-option
              v-for="item in stageList"
              class='select-option-selected'
              :key="item.id"
              :label="item.stagesName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="楼栋名称：" >
          <el-input placeholder="请输入楼栋名称" v-model="ruleForm.buildingName" @input="search()"></el-input>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">楼栋列表</el-button>
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">导出楼栋</el-button>
        <el-button
          class="btn btn-default pull-right"
          :disabled="permission"
          @click.native="importBuilding">导入楼栋</el-button>
        <el-button
          :disabled='permission'
          class="btn pull-right"
          @click.native="drawerOpenCreate">新建楼栋</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @sort-change="sortTable"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="buildingName"
          label="楼栋名称"
          sortable
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.buildingName}}<span style="color: #909399;margin-left: 10px;" v-if="scope.row.buildingLayout == 3">({{scope.row.stagesName}})</span></span>
          </template>
        </el-table-column>
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
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
          label="可出租面积(㎡)"
          sortable
          width="150px"
          align="right"
          class-name="set-sortable-align"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="floorCount"
          label="楼层数(层)"
          show-overflow-tooltip
          align="right">
        </el-table-column>
        <el-table-column
          prop="totalStore"
          label="总租赁单元数"
          show-overflow-tooltip
          align="right">
        </el-table-column>
        <el-table-column
          prop="vacantStore"
          label="空铺"
          show-overflow-tooltip
          align="right">
        </el-table-column>
        <el-table-column
          prop="signProportion"
          sortable="custom"
          label="出租率"
          align="right"
          class-name="set-sortable-align"
          show-overflow-tooltip>
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
import { getBsBuildingListByMainId, queryFQByAssetId, exportBuildingExcel, quotaTotalCheck } from '@/http/assets'
import { reset } from '../assets'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      selectedBuildingId: '',
      stageList: [],
      assetLayout: '',
      ruleForm: {
        projectName: '',
        stagesId: '',
        buildingName: ''
      },
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      sortCode: '',
      orderBy: ''
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    queryFQ () {
      const choosed = this.projectNameList.filter(it => (Number(it.id) === Number(this.ruleForm.projectName)))
      this.assetLayout = choosed[0].assetLayout
      Number(this.assetLayout) === 3 && queryFQByAssetId({assetId: this.ruleForm.projectName}).then(res => {
        this.stageList = res.data
      })
      this.search()
    },
    sortTable ({ column, prop, order }) {
      this.orderBy = prop
      this.sortCode = order
      this.getList()
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    listAndExportParams () {
      return {
        page: this.currentPage,
        limit: this.limit,
        stagesId: this.ruleForm.stagesId,
        orderBy: this.orderBy,
        sortCode: this.sortCode,
        mainId: this.merchant.id,
        assetId: this.ruleForm.projectName,
        buildingName: this.ruleForm.buildingName
      }
    },
    getList () {
      const params = this.listAndExportParams()
      getBsBuildingListByMainId(params).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
        this.tableData.forEach(item => {
          item.signProportion = item.signProportion === '-' ? '-' : Number(item.signProportion.replace('%', '')).toFixed(2) + '%'
        })
      })
    },
    importBuilding () {
      // 配额总数校验
      const params = {
        mainId: this.merchant.id,
        quotaType: '3',
        addCount: '1',
        addArea: null
      }
      quotaTotalCheck(params).then(res => {
        if (res && Number(res.code) === 0) {
          this.$router.push({path: '/asset/building/import', query: {type: 'building'}})
        }
      })
    },
    exportExcel () {
      const params = this.listAndExportParams()
      exportBuildingExcel(params).then(res => {
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
      this.$router.push({path: '/asset/building/detail/' + rows.id, query: this.$route.query})
    },
    drawerOpenCreate () {
      // 配额总数校验
      const params = {
        mainId: this.merchant.id,
        quotaType: '3',
        addCount: '1',
        addArea: null
      }
      quotaTotalCheck(params).then(res => {
        if (Number(res.code) === 0) {
          this.$router.push('/asset/building/create')
        }
      })
    },
    handleClose (done) {
      done()
    },
    forwardToProject (row) {
      this.$router.push('/asset/project/detail/' + row.assetId)
    }
  },
  components: {
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
  },

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

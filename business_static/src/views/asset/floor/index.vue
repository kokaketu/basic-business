<template>
  <div id="asset-floor" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">

        <el-form-item label="项目名称：" >
          <el-select @change = "getBuildingList" v-model="ruleForm.assetId" placeholder="请选择" clearable>
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="楼栋名称：" prop="buildingId">
          <el-select
            clearable
            no-data-text='请先选择项目'
            v-model="ruleForm.buildingId"
            placeholder="请选择楼栋"
            @change="search()">
            <el-option
              v-for="item in buildingList"
              class='select-option-selected'
              :key="item.id"
              :label="item.buildingStages"
              :value="item.id">
              <span style="float: left">{{ item.buildingName }}</span>
              <span v-show="item.stagesName" class="select-stages-tip">({{ item.stagesName }})</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="楼层名称：" >
          <el-input placeholder="请输入楼层名称" v-model="ruleForm.floorName" @input="search()"></el-input>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">楼层列表</el-button>
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">导出楼层</el-button>
        <el-button
          :disabled="permission"
          class="btn btn-default pull-right"
          @click.native="$router.push({path: '/asset/floor/import', query: {type: 'floor'}})">导入楼层</el-button>
        <el-button
          :disabled="permission"
          class="btn pull-right"
          @click.native="drawerOpenCreate">新建楼层</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="floorName"
          label="楼层名称"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.floorName}}</span>
          </template>
        </el-table-column>
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column label="楼栋">
          <template slot-scope="scope">
            <el-link @click="forwardToBuilding(scope.row)" :underline="false">
              <span>{{scope.row.buildingName}}<span v-show="scope.row.stagesName" class="stages-tip">({{scope.row.stagesName}})</span></span>
            </el-link>
          </template>
        </el-table-column>
        <!-- <el-table-column
          prop="assetName"
          label="项目"
          show-overflow-tooltip>
        </el-table-column> -->
        <!-- <el-table-column
          prop="buildingName"
          label="楼栋"
          show-overflow-tooltip>
        </el-table-column> -->
        <el-table-column
          prop="totalBuildingArea"
          label="总建筑面积(㎡)"
          show-overflow-tooltip
          align="right"
          >
          <template slot-scope="scope">{{scope.row.totalBuildingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="可出租面积(㎡)"
          show-overflow-tooltip
          align="right">
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
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
          label="出租率(%)"
          show-overflow-tooltip
          align="right"
          class-name="set-last-cell">
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
    <!-- 右弹窗--楼层详情 -->
    <el-drawer
      :visible.sync="drawerDetailStatus"
      :with-header="false"
      size="1000px"
      :modal-append-to-body="false"
      :before-close="handleClose">
      <detail-component ref="detail"></detail-component>
    </el-drawer>
    <!-- 右弹窗--新建楼层 -->
    <el-drawer
      :visible.sync="drawerCreateStatus"
      :with-header="false"
      size="1000px"
      :before-close="handleClose">
      <create-component ref="create"></create-component>
    </el-drawer>
    <!-- 右弹窗--编辑楼层 -->
    <el-drawer
      :visible.sync="drawerEditStatus"
      :with-header="false"
      size="1000px"
      :before-close="handleClose">
      <edit-component ref="edit"></edit-component>
    </el-drawer>
  </div>
</template>
<script>

import { getBsFloorListByMainId, exportFloorExcel } from '@/http/assets'
import { reset, getBuildingList } from '../assets'
import DetailComponent from './detail'
import CreateComponent from './create'
import { mapState } from 'vuex'
import EditComponent from './edit'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        assetId: '',
        buildingId: '',
        floorName: ''
      },
      buildingList: [],
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      drawerCreateStatus: false,
      drawerDetailStatus: false,
      drawerEditStatus: false,
      selectedFloorId: '',
      orderBy: ''
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    listAndExportParams () {
      return {
        page: this.currentPage,
        limit: this.limit,
        mainId: this.merchant.id,
        orderBy: this.orderBy,
        assetId: this.ruleForm.assetId,
        buildingId: this.ruleForm.buildingId,
        floorName: this.ruleForm.floorName
      }
    },
    getList () {
      const params = this.listAndExportParams()
      getBsFloorListByMainId(params).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
        this.tableData.forEach(item => {
          item.signProportion = item.signProportion === '-' ? '-' : Number(item.signProportion.replace('%', '')).toFixed(2) + '%'
        })
      })
    },
    exportExcel () {
      const params = this.listAndExportParams()
      exportFloorExcel(params).then(res => {
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
      reset(this.ruleForm)
      this.getList()
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    // 获取楼栋
    getBuildingList () {
      this.getList()
      this.ruleForm.buildingId = ''
      this.buildingList = ''
      getBuildingList(this.ruleForm.assetId).then(res => {
        let arr = []
        res.forEach(element => {
          arr.push({
            id: element.id,
            stagesName: element.stagesName,
            buildingName: element.buildingName,
            buildingStages: element.buildingName + (element.stagesName ? `(${element.stagesName})` : '')
          })
        })
        this.buildingList = arr
      })
    },
    // 详情、新建、编辑弹窗
    drawerOpenDetail (rows) {
      this.$router.push({path: '/asset/floor/detail/' + rows.id, query: this.$route.query})
    },
    drawerOpenCreate () {
      this.$router.push('/asset/floor/create')
    },
    drawerOpenEdit (floorId) {
      this.drawerEditStatus = !this.drawerEditStatus
      this.$nextTick(() => {
        this.$refs.edit.getDetail(floorId)
      })
    },
    handleClose (done) {
      done()
    },
    forwardToProject (row) {
      this.$router.push('/asset/project/detail/' + row.assetId)
    },
    forwardToBuilding (row) {
      this.$router.push('/asset/building/detail/' + row.buildingId)
    }
  },
  components: {
    DetailComponent,
    CreateComponent,
    EditComponent
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

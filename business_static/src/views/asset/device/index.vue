<template>
  <div id="asset-device" class="page">
    <div class="filter-wrapper">
      <el-form
        :inline="true"
        :model="filter"
        size="small"
        label-width="90px">
        <el-form-item label="项目名称：">
          <el-select
            clearable
            v-model="filter.assetId"
            @change="search()"
            placeholder="请选择项目">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="设备名称：">
          <el-input type="" v-model="filter.term" @keyup.enter.native="search" placeholder="请输入设备名称或设备编号"/>
        </el-form-item>
        <el-form-item label="设备分类：">
          <el-select v-model="filter.type" placeholder="请选择" @change="search()" clearable>
            <el-option class='select-option-selected' v-for="item in deviceTypes" :key="item.id" :label="item.name" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="设备状态：">
          <el-select v-model="filter.status" placeholder="请选择" @change="search()" clearable>
            <el-option class='select-option-selected' v-for="item in deviceStatus" :key="item.id" :label="item.name" :value="item.id"></el-option>
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
        <el-button class="table-title" type="text">设备列表</el-button>
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">导出设备
        </el-button>
        <el-button
          :disabled="permission"
          class="btn btn-default pull-right"
          @click.native="$router.push({path: '/asset/device/import', query: {type: 'device'}})">导入设备
        </el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="drawerOpenCreate">新建设备</el-button>
      </div>
      <el-table
        :data="tableData"
        @row-click="drawerOpenDetail"
        style="width: 100%;">
        <el-table-column
          prop="no"
          label="设备编号"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column label="关联租赁单元">
          <template slot-scope="scope">
            <el-link v-if="scope.row.roomName !== '-'" @click="forwardToRentUnit(scope.row)" :underline="false">
              {{scope.row.roomName}}
            </el-link>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="name"
          label="设备名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="typeString"
          label="设备分类"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="brandName"
          label="设备品牌"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          label="责任人"
          show-overflow-tooltip
          prop="personLiable">
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="filter.page"
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>

    <!-- 右弹窗--项目详情 -->
    <el-drawer
      :visible.sync="drawerDetailStatus"
      :with-header="false"
      :modal-append-to-body="false"
      :before-close="handleCloseDetail"
      v-if="drawerDetailStatus"
      ref="drawerDetail"
      size="1000px">
      <detail-component ref="detail" :drawer="objDrawer" @search="search"></detail-component>
    </el-drawer>
    <!-- 右弹窗--新建设备 -->
    <el-drawer
      :visible.sync="drawerCreateStatus"
      :before-close="handleCloseCreate"
      :with-header="false"
      v-if="drawerCreateStatus"
      ref="drawerCreate"
      size="1000px">
      <create-component :drawer="objDrawer" @search="search"></create-component>
    </el-drawer>
  </div>
</template>
<script>

import ProjectAutoComplete from '../../../components/ProjectAutoComplete'
import DetailComponent from './detail'
import CreateComponent from './create'
import {mapState} from 'vuex'
import { queryList, deleteById, exportDeviceExcel } from '@/http/device'

export default {
  data () {
    return {
      permission: '',
      filter: {
        assetId: void 0,
        mainId: '',
        term: '',
        type: '',
        status: '',
        currentPage: 1,
        limit: 10
      },
      deviceTypes: [
        {id: '1', name: '给排水设备'},
        {id: '2', name: '暖通设备'},
        {id: '3', name: '强电设备'},
        {id: '4', name: '升降设备'},
        {id: '5', name: '弱电设备'},
        {id: '6', name: '消防设备'},
        {id: '7', name: '其他设备'}
      ],
      deviceStatus: [
        {id: '1', name: '正常'},
        {id: '2', name: '异常'},
        {id: '3', name: '报废'}
      ],
      assetLayoutList: [],
      operationStageList: [],
      statusList: [],
      drawerCreateStatus: false,
      drawerDetailStatus: false,
      tableData: [],
      total: 0,
      objDrawer: this.$refs
    }
  },
  methods: {
    search () {
      this.filter.page = 1
      this.getList()
    },
    reset () {
      this.filter = {}
      this.search()
    },
    handleCurrentChange (val) {
      this.filter.page = val
      this.getList()
    },
    // 详情、新建、编辑弹窗
    drawerOpenDetail (row) {
      // const deviceId = row.id
      // this.drawerDetailStatus = !this.drawerDetailStatus
      // this.$nextTick(() => {
      //   this.$refs.detail.getDetail(deviceId)
      // })
      this.$router.push('/asset/device/detail/' + row.id)
    },
    drawerOpenCreate () {
      // this.drawerCreateStatus = !this.drawerCreateStatus
      this.$router.push('/asset/device/create')
    },
    handleCloseDetail (done) {
      done()
    },
    handleCloseCreate (done) {
      // done()
    },
    forwardToRentUnit (row) {
      event.stopPropagation()
      let asset = this.projectNameList.find(res => res.id === row.assetId) || {}
      this.$router.push(`/asset/rentalUnit/detail/${row.roomId}/${asset.assetLayout}`)
      // this.$message('跳转功能维护中。。。')
    },
    // 获取列表数据
    getList () {
      this.filter.mainId = this.merchant.id
      queryList(this.filter).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
        this.tableData.forEach(item => {
          item.roomName = item.roomName || '-'
          item.name = item.name || '-'
          item.typeString = item.typeString || '-'
          item.brandName = item.brandName || '-'
          item.personLiable = item.personLiable || '-'
        })
      })
    },
    selectProject ({ id }) {
      this.filter.assetId = id
      this.search()
    },
    deleteDevice ({id}) {
      this.$confirm('此操作将删除设备, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(() => {
        deleteById({id}).then(res => {
          if (res.code === '0') {
            this.$message({message: res.msg})
            this.getList()
          }
        })
      }).catch(() => {})
    },
    exportExcel () {
      this.filter.mainId = this.merchant.id
      exportDeviceExcel(this.filter).then(res => {
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
  },
  components: {
    DetailComponent,
    CreateComponent,
    ProjectAutoComplete
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
  },
  computed: {
    ...mapState(['merchant', 'projectNameList', 'permissionList'])
  }
}
</script>
<style>
  .btn-custom-cancel {
    float: right;
    margin-left: 10px!important;
  }
</style>

<!--
 * @Author: your name
 * @Date: 2020-05-22 13:53:19
 * @LastEditTime: 2020-08-04 17:42:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\systerm\paymentSettings\index.vue
-->
<template>
  <div id="payment-settings" class="page">
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-checkbox class="pull-left"
          style="margin-top: 10px; margin-right: 20px"
          :indeterminate="isIndeterminate"
          v-model="checkAll"
          @change="handleCheckAllChange">全选</el-checkbox>

        <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del" style="margin-left: 10px" type="">删除</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="dis(1)" type="">启用</el-button>
        <el-button :disabled="permission"  class="btn pull-right" @click.native="dis(2)" type="">禁用</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="drawerOpenCreate">新增</el-button>
      </div>
      <el-table
        :data="tableData"
        type=index
        style="width: 100%"
        @row-click="drawerOpenDetail">
         <el-table-column
          width="100">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.checked" @click.native.prevent.stop="handleCheck(scope.row)"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column
          label="款项编码"
          prop="subjectCode">
        </el-table-column>
        <el-table-column
          prop="subjectTypeName"
          label="款项类别"
          show-overflow-tooltip>
        </el-table-column>
        <!-- <el-table-column
          prop="assetLayoutName"
          label="款项分组"
          show-overflow-tooltip>
        </el-table-column> -->
        <el-table-column
          prop="subjectName"
          label="款项名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="taxRate"
          label="税率(%)"
          align="right"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.taxRate | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="subjectDescription"
          label="描述"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.subjectDescription || '-'}}</template>
        </el-table-column>
        <el-table-column
          label="状态"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span :style="{color: scope.row.subjectStatus == 2 ? '#DE1010' : ''}">{{scope.row.subjectStatusName}}</span>
          </template>
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
    <!-- 右弹窗--款项详情 -->
    <el-dialog
      :visible.sync="drawerDetailStatus"
      :with-header="false"
      width="430px"
      :modal-append-to-body="false"
      :before-close="handleClose">
      <detail-component ref="detail"></detail-component>
    </el-dialog>
    <!-- 右弹窗--新建款项 -->
    <el-dialog
      :visible.sync="drawerCreateStatus"
      :with-header="false"
      width="430px"
      :before-close="handleClose">
      <create-component></create-component>
    </el-dialog>
    <!-- 右弹窗--编辑款项 -->
    <el-dialog
      :visible.sync="drawerEditStatus"
      :with-header="false"
      width="430px"
      :before-close="handleClose">
      <edit-component ref="edit"></edit-component>
    </el-dialog>
  </div>
</template>
<script>
import CreateComponent from './create'
import DetailComponent from './detail'
import EditComponent from './edit'
import {initSubject, getSubjectList, delSubject, disSubject} from '@/http/systerm'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      isIndeterminate: false,
      checkAll: false,
      currentPage: 1,
      limit: 10,
      total: 0,
      tableData: [],
      multipleSelection: [],
      drawerDetailStatus: false,
      drawerCreateStatus: false,
      drawerEditStatus: false,
      subjectType: [],
      assetLayout: [],
      subjectStatus: []
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    handleCheckAllChange (value) {
      this.isIndeterminate = false
      this.tableDat = this.tableData.map(item => {
        item.checked = this.checkAll
        return item
      })
    },
    handleCheck (object) {
      const id = object.id
      this.tableDat = this.tableData.map(item => {
        if (item.id === id) {
          item.checked = !item.checked
        }
        return item
      })
      const checkedCount = this.tableData.filter(item => item.checked).length
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.limit
      this.checkAll = checkedCount === this.limit
    },
    initSubject () {
      initSubject().then(res => {
        this.subjectType = res.subjectType
        this.assetLayout = res.assetLayout
        this.subjectStatus = res.subjectStatus
      })
    },
    getList () {
      let params = {
        pageNum: this.currentPage,
        pageSize: this.limit,
        mainId: this.merchant.id,
        assetLayout: '',
        subjectType: '',
        subjectStatus: ''
      }
      getSubjectList(params).then(res => {
        this.tableData = res.list.map(element => {
          element.checked = false
          return element
        })
        this.total = res.total * 10
      })
    },
    del () {
      this.$confirm('此操作将删除款项, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let params = {
          ids: this.tableData.filter(item => item.checked).map(item => item.id)
        }
        delSubject(params).then(res => {
          if (res.code === '0') {
            this.$message({
              message: res.msg,
              type: 'success'
            })
            setTimeout(() => {
              this.getList()
            }, 1000)
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    dis (type) {
      let params = {
        ids: this.tableData.filter(item => item.checked).map(item => item.id),
        subjectStatus: type // 1.启用 2.禁用
      }
      disSubject(params).then(res => {
        if (res.code === '0') {
          this.$message({
            message: res.msg,
            type: 'success'
          })
          // 重新加载科目数据
          this.$store.dispatch('setSubjectNames', { mainId: this.merchant.id, refresh: true })
          setTimeout(() => {
            this.checkAll = false
            this.getList()
          }, 1000)
        }
      })
    },
    // 详情、新建、编辑弹窗
    drawerOpenDetail (rows) {
      const id = rows.id
      this.drawerDetailStatus = !this.drawerDetailStatus
      this.$nextTick(() => {
        this.$refs.detail.getDetail(id)
      })
    },
    drawerOpenCreate () {
      this.drawerCreateStatus = !this.drawerCreateStatus
    },
    handleClose (done) {
      done()
    }
  },
  components: {
    DetailComponent,
    CreateComponent,
    EditComponent
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.getList()
    this.initSubject()
  }
}
</script>
<style lang="scss" scoped>
#payment-settings{
  .table-wrapper{
    .pull-left{
      margin-right: 20px;
    }
  }
}
</style>

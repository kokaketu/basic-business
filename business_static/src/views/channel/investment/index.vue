<!--
 * @Author: your name
 * @Date: 2020-07-02 14:38:14
 * @LastEditTime: 2020-11-05 17:03:17
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\investment\index.vue
-->
<template>
  <div id="investment">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm" size="small" label-width="90px">
        <el-form-item label="项目名称：" prop="assetId">
          <el-select
            clearable
            v-model="ruleForm.assetId"
            placeholder="请选择项目名称"
            @change="search">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="招商编号：" prop="attractCode">
            <el-input
              v-model="ruleForm.attractCode"
              placeholder="请输入招商编号"
              @input="search">
            </el-input>
          </el-form-item>
        <el-form-item label="租赁单元：" prop="leaseNo">
          <el-input
            v-model="ruleForm.leaseNo"
            placeholder="请输入租赁单元编号"
            @input="search">
          </el-input>
        </el-form-item>
        <el-form-item label="租赁情况：" prop="rentalStatus">
          <el-select
            clearable
            v-model="ruleForm.rentalStatus"
            placeholder="请选择租赁情况"
            @change="search">
            <el-option
              v-for="item in [{id: 1, value: '已签约'}, {id: 2, value: '空铺'}]"
              class='select-option-selected'
              :key="item.id"
              :label="item.value"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合约到期：" prop="status">
          <el-select
            clearable
            v-model="ruleForm.contEnd"
            placeholder="请选择合约到期情况"
            @change="search">
            <el-option
              v-for="item in [{id: 1, value: '近1个月到期'}, {id: 2, value: '近3个月到期'}, {id: 3, value: '近6个月到期'}]"
              class='select-option-selected'
              :key="item.id"
              :label="item.value"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="招商进度：" prop="attractStage">
          <el-select
            clearable
            v-model="ruleForm.attractStage"
            placeholder="请选择招商进度"
            @change="search">
            <el-option
              v-for="item in [{value: 1, name: '未开始'},{value: 2, name: '进行中'},{value: 3, name: '已完成'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.name"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">招商计划列表</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="drawerOpenCreate">新建招商计划</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="attractCode"
          label="招商编号"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column label="租赁单元编号" sortable prop='leaseNo'>
        </el-table-column>
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click.stop="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column
          prop="rentalStatus"
          label="租赁情况"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span :style="{color: scope.row.rentalStatus == '空铺' ? '#F5A623': ''}">{{scope.row.rentalStatus}}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="contEndDate"
          sortable
          label="合同到期时间"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.plannedCompletionDate || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="attractStage"
          label="招商进度"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span v-if="scope.row.attractStage == 1">未开始</span>
            <span v-else-if="scope.row.attractStage == 2">进行中</span>
            <span v-else-if="scope.row.attractStage == 3">已完成</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="contNo"
          label="合同编号"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span @click.stop="forwardToContract(scope.row)" v-if="scope.row.contNo" style="color: #5E0EFF;">{{scope.row.contNo}}</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column
          label="计划完成时间"
          sortable
          show-overflow-tooltip
          prop="plannedCompletionDate">
          <template slot-scope="scope">{{scope.row.plannedCompletionDate || '-'}}</template>
        </el-table-column>
        <el-table-column
          label="负责人"
          width="200px"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.memberName || '-'}}</span>
            <span v-if="scope.row.memberId">{{scope.row.memberMobile || '-'}}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <span
              @click.stop="dispatchFn(scope.row)"
              style="cursor: pointer;"
              :style="{
                cursor: scope.row.attractStage == 3 ? 'not-allowed': 'pointer',
                color: scope.row.attractStage == 3 ? '#999':'#5E0EFF'
              }"
              >{{scope.row.memberId ? '重新分配':'分配'}}</span>
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
    <!-- 右弹窗--新建招商计划 -->
    <create-component
      class="animated fadeIn"
      v-show="drawerCreateStatus"
      ref="create">
    </create-component>
    <!-- 分配 -->
    <dispatch-component
      class="animated fadeIn"
      v-show="drawerDispatchStatus"
      ref="dispatchComponent">
    </dispatch-component>
  </div>
</template>
<script>
import { getAttractList } from '@/http/rentControl'
import { mapState } from 'vuex'
import CreateComponent from './create'
import DispatchComponent from './dispatch'
import { isEmpty } from 'lodash-es'

export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        assetId: null,
        attractCode: null,
        leaseNo: null,
        rentalStatus: null,
        contEnd: null,
        attractStage: null
      },
      assetLayout: null,
      currentPage: 1,
      limit: 10,
      total: 0,
      tableData: [],
      drawerDispatchStatus: false,
      drawerCreateStatus: false
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  watch: {
    'ruleForm.assetId': {
      handler () {
        const project = this.projectNameList.filter(item => {
          if (this.ruleForm.assetId === item.id) {
            return item
          }
        })
        this.assetLayout = project[0] ? project[0].assetLayout : null
      }
    }
  },
  methods: {
    reset () {
      this.ruleForm = {
        assetId: null,
        leaseNo: null,
        rentalStatus: null,
        contEnd: null,
        attractStage: null,
        attractCode: null,
        type: this.assetLayout
      }
      this.search()
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    forwardToRentUnit (row) {
      const assetLayout = this.projectNameList.filter(item => Number(item.id) === Number(row.assetId))[0].assetLayout
      this.$router.push(`/asset/rentalUnit/detail/${row.leaseId}/${assetLayout}`)
    },
    forwardToContract (row) {
      const assetLayout = this.projectNameList.filter(item => Number(item.id) === Number(row.assetId))[0].assetLayout
      const params = `${assetLayout}&${row.contId}`
      this.$router.push(`/contract/detail/${params}`)
    },
    forwardToProject (row) {
      this.$router.push('/asset/project/detail/' + row.assetId)
    },
    drawerOpenCreate () {
      this.drawerCreateStatus = !this.drawerCreateStatus
      this.$nextTick(() => {
        this.$refs.create.getList()
      })
    },
    dispatchFn (row) {
      if (Number(row.attractStage) === 3) return
      this.drawerDispatchStatus = !this.drawerDispatchStatus
      this.$nextTick(() => {
        this.$refs.dispatchComponent.getMemberList()
        this.$refs.dispatchComponent.id = row.id
      })
    },
    getList () {
      let params = {
        page: this.currentPage,
        limit: this.limit,
        mainId: this.merchant.id,
        assetId: this.ruleForm.assetId,
        leaseNo: this.ruleForm.leaseNo,
        rentalStatus: this.ruleForm.rentalStatus,
        contEnd: this.ruleForm.contEnd,
        type: this.assetLayout,
        orderBy: null,
        attractStage: this.ruleForm.attractStage,
        attractCode: this.ruleForm.attractCode,
        operation: 0
      }
      getAttractList(params).then(res => {
        this.tableData = res.data.list
        this.total = res.data.total * 10
      })
    },
    getProjectNameList () {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    },
    drawerOpenDetail (rows) {
      // console.log(rows)
      // console.log(this.projectNameList)
      // const assetLayout = this.projectNameList.filter(item => Number(item.id) === Number(rows.assetId))[0].assetLayout
      this.$router.push('/channel/investment/detail/' + rows.id + '&' + rows.assetLayout)
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
  },
  activated () {
    isEmpty(this.projectNameList) && this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getProjectNameList()
    this.getList()
  },
  components: {
    CreateComponent,
    DispatchComponent
  }
}
</script>
<style lang="scss">
#investment{
  .el-table__row{
    cursor: pointer;
  }
}
#investment .el-dialog{
  margin-top: 0 !important;
  overflow: hidden;
}
</style>

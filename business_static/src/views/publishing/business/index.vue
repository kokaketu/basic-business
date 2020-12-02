<template>
  <div id="customer-list" class="page">
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button :disabled="permission" class="btn pull-right" @click.native="goCreate">创建商机</el-button>
      </div>
      <!-- <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="goDetail"
        > -->
      <el-table
        :data="tableData"
        style="width: 100%;"
        >
        <el-table-column
          prop="assetName"
          label="交易项目">
        </el-table-column>
        <el-table-column
          prop="tradeArea"
          label="交易项目面积(㎡)"
          align="right">
          <template slot-scope="scope">{{scope.row.tradeArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="assetAddress"
          label="项目位置详细">
        </el-table-column>
        <el-table-column
          prop="productionCertificateType"
          label="产证类型">
        </el-table-column>
        <el-table-column
          prop="tradeType"
          label="交易方式">
        </el-table-column>
        <el-table-column
          label="发布平台"
          prop="pushPlatform">
        </el-table-column>
        <el-table-column
          prop="pushStatus"
          label="发布状态">
        </el-table-column>
        <el-table-column
          prop="createdDate"
          label="提交日期">
        </el-table-column>
        <el-table-column
          prop="pushDate"
          label="发布日期">
          <template slot-scope="scope">{{scope.row.pushDate || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="memo"
          label="备注">
          <template slot-scope="scope">{{scope.row.memo || '-'}}</template>
        </el-table-column>
        <el-table-column
          label="操作"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-link v-show="scope.row.pushStatus === '未提交' && !permission" type="primary" :underline="false" @click.stop="submitReview(scope.row.id)">提交审核</el-link>
            <el-tooltip v-show="scope.row.pushStatus !== '未提交'" class="item" effect="dark" content="您提交的发布商机正在审核中,如需帮助请联系:021-60868853" placement="right">
              <el-link type="primary" :underline="false">查看审核状态</el-link>
            </el-tooltip>
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
  </div>
</template>
<script>
import {getPushBusinessList, submitReview} from '../../../http/publishing'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      customerList: [],
      beforeCompanySort: '2',
      currentPage: 1,
      total: 0,
      tableData: []
    }
  },
  watch: {
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    // 获取客户列表
    getPushBusinessList () {
      let params = {
        pageNum: this.currentPage,
        pageSize: 10,
        mainId: this.merchant.id
      }
      getPushBusinessList(params).then(res => {
        console.info(res)
        this.tableData = res.data.list
        this.total = res.data.total * 10
      })
    },
    handleCurrentChange (val) {
      this.pageNum = val
      this.getPushBusinessList()
    },
    goCreate () {
      this.$router.push('/publishing/business/create')
    },
    submitReview (id) {
      this.$confirm('此操作提交审核, 是否继续?', '操作确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(() => {
        submitReview(id).then(res => {
          this.$message({message: res.msg, type: res.code === '0' ? 'success' : 'error'})
          this.getPushBusinessList()
        })
      }).catch(() => {})
    }
  },
  components: {
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getPushBusinessList()
  }
}
</script>

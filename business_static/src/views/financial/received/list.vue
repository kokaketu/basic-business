<!--实收列表-->
<template>
  <div id="paidInAmount" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" size="small" label-width="132px">
        <project-auto-complete @select="selectProject" :projectId="form.assetId"/>
        <el-form-item label="实收流水号：">
          <el-input v-model="form.receivedNo" placeholder="请输入实收流水号" @input="search(1)"/>
        </el-form-item>

        <subject-auto-complete @select="selectSubject" :subjectCode="form.subjectCode"/>

        <el-form-item label="实收日期：">
          <el-date-picker
            type="daterange"
            v-model="form.date"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            range-separator="~"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @input="search(1)">
          </el-date-picker>
        </el-form-item>

        <payer-auto-complete @select="selectPayer" :id="form.companyId"/>

        <el-form-item label="应收流水号：">
          <el-input v-model="form.receivableNo" placeholder="请输入关联应收流水号" @input="search(1)"></el-input>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search(1)">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <div class="table-header text-right">
        <el-button :disabled="permission" class="btn" @click="createOpen">新增</el-button>
        <el-button :disabled="permission" class="btn  btn-default" @click="deleteOrder">删除</el-button>
      </div>
      <el-table
        :data="received.list"
        ref="table"
        class="hidden-all-selection"
        @selection-change="selectionChange"
        @row-click="detailOpen"
        @sort-change="sort"
      >
        <el-table-column
          fixed="left"
          type="selection"
          width="70"
        />
        <el-table-column
          prop="receivedNo"
          label="实收流水号"
          width="200"
        >
        </el-table-column>
        <el-table-column
          sortable
          prop="receiveDate"
          label="实收日期"
          width="120"
        >
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          min-width="180"
        >
        </el-table-column>
        <el-table-column
          show-overflow-tooltip
          prop="payerName"
          label="付款方"
          min-width="180"
        />
        <el-table-column
          prop="subjectNames"
          label="款项名称"
          min-width="120"
        >
        </el-table-column>
        <el-table-column
          prop="paymentMethod"
          label="支付方式"
          width="100"
        >
          <template slot-scope="scope">{{scope.row.paymentMethod | payWay}}</template>
        </el-table-column>
        <el-table-column
          prop="receivedMoney"
          label="实收金额(元)"
          sortable
          min-width="140"
          align="right"
          class-name="set-sortable-align"
          :formatter="numberFormat">
        </el-table-column>
        <el-table-column
          prop="receivableNos"
          label="关联应收流水号"
          width="160"
        >
          <template slot-scope="scope">
            <el-popover placement="left" trigger="hover">
              <el-button
                v-for="(item) in scope.row.receivableNos.split(',')"
                :key="item"
                size="mini"
                @click="$router.push(`/financial/receivables/${item}`)"
              >{{item}}
              </el-button>
              <el-link slot="reference" type="primary" @click.stop :underline="false">{{scope.row.receivableNos}}</el-link>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注"
          min-width="180"
        ><template slot-scope="scope">{{scope.row.remark || '-'}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="received.total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
    <received-detail :visible="detailVisible" :id="receivedId" @close="detailClose" @edit="editOpen"/>
    <received-edit :visible="editVisible" :id="receivedId" @close="editClose"/>
    <received-create :visible="createVisible" @close="createClose" @notarize="init"/>
  </div>
</template>
<script>
import { deleteReceived, getReceivedList } from '@/http/financial'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import ReceivedDetail from './detail'
import ReceivedEdit from './edit'
import ReceivedCreate from './create'
import { mapState } from 'vuex'
import * as utils from '@/utils/index'

const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}

export default {
  components: {ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete, ReceivedCreate, ReceivedDetail, ReceivedEdit},
  data () {
    return {
      permission: '',
      received: {},
      form: {
        assetId: void 0,
        subjectCode: void 0,
        companyId: void 0,
        receivedNo: this.$route.query.receivedNo,
        receivedId: this.$route.query.receivedId
      },
      page: 1,
      selection: {},
      receivedId: void 0,
      createVisible: false,
      detailVisible: false,
      editVisible: false,
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    let date = new Date()
    let ym = utils.format(date, 'YYYY-MM')
    let dateEnd = new Date(date.getFullYear(), date.getMonth() + 1, 0)
    let start = `${ym}-01`
    let end = `${ym}-${dateEnd.getDate()}`
    this.form.date = [start, end]
    console.log(this.$route.query.receivedId)
    console.log(this.$route.query.receivedNo)
    if (this.$route.query.receivedNo || this.$route.query.receivedId) {
      console.log('this.form')
      console.log(this.form)
      this.form = {
        assetId: void 0,
        subjectCode: void 0,
        companyId: void 0,
        receivedNo: this.$route.query.receivedNo,
        receivedId: this.$route.query.receivedId
      }
      console.log('this.form')
      console.log(this.form)
    }
    this.init()
  },
  methods: {
    init (page) {
      this.page = page || 1
      const {form: { date, receivedId, receivedNo, ...args }} = this
      const [startDate, endDate] = date || []
      getReceivedList({...args, mainId: this.merchant.id, pageNum: page, pageSize: 10, startDate, endDate, id: receivedId, receivedNo: receivedNo})
        .then((res) => {
          this.received = res
        })
    },
    search (page) {
      this.page = page || 1
      const {form: { date, receivedId, receivedNo, ...args }} = this
      const [startDate, endDate] = date || []
      getReceivedList({...args, mainId: this.merchant.id, pageNum: page, pageSize: 10, startDate, endDate, receivedNo: receivedNo})
        .then((res) => {
          this.received = res
        })
    },
    reset () {
      this.form = {assetId: null, companyId: null, subjectCode: null}
      this.search(1)
    },
    selectProject ({ id }) {
      this.form.assetId = id
      this.search(1)
    },
    selectSubject ({ subjectCode }) {
      this.form.subjectCode = subjectCode
      this.search(1)
    },
    selectPayer (id) {
      console.log(id)
      this.form.companyId = id
      this.search(1)
    },
    numberFormat (row, column, cellValue, index) {
      return comdify(cellValue)
    },
    getSummaries (param) {
      const { columns, data } = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 1) {
          sums[index] = '本页小计(元)'
          return
        }
        if (index !== 7) {
          return
        }
        const values = data.map(item => Number(item[column.property]))
        if (!values.every(value => isNaN(value))) {
          sums[index] = comdify(values.reduce((prev, curr) => {
            const value = Number(curr)
            if (!isNaN(value)) {
              return prev + curr
            } else {
              return prev
            }
          }, 0))
        }
      })
      return sums
    },
    createOpen () {
      this.createVisible = true
    },
    detailOpen ({ id }) {
      this.receivedId = id
      this.detailVisible = true
    },
    editOpen () {
      this.detailVisible = false
      this.editVisible = true
    },
    createClose () {
      this.createVisible = false
    },
    detailClose () {
      this.detailVisible = false
    },
    editClose (refresh) {
      this.editVisible = false
      if (refresh) this.search()
    },
    selectionChange (val) {
      const [f = {}, s] = val
      if (val.length > 1) {
        this.$refs.table.toggleRowSelection(f, false)
        this.selection = s
      } else {
        this.selection = f
      }
    },
    deleteOrder () {
      const { id } = this.selection
      if (id != null) {
        this.$confirm('确认删除该实收记录？', '删除实收', {}).then(() => {
          deleteReceived(id).then((res) => {
            if (res.code === '0') {
              this.$message.success('删除实收订单成功')
              this.search(1)
            } else {
              this.$message.warning(res.msg)
            }
          })
        }).catch(() => {})
      } else {
        this.$message.warning('请选择需要删除的应收订单')
      }
    },
    sort (column) {
      this.form.order = column.order === 'descending' ? 'desc' : 'asc'
      if (column.prop === 'receiveDate') {
        this.form.orderFiled = 'receive_date'
      } else if (column.prop === 'receivedMoney') {
        this.form.orderFiled = 'received_money'
      } else {
        this.form.orderFiled = 'receive_date'
      }
      this.search()
    }
  },
}
</script>
<style lang="scss" scoped>

</style>

<!--保证金列表-->
<template>
  <div id="paidInAmount" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="depositForm" size="small" label-width="120px">
        <el-form-item label="项目名称：" >
          <el-select v-model="depositForm.assetId" placeholder="请选择项目名称" @change="search()" clearable>
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <subject-auto-complete @select="selectSubject" :subject-code="depositForm.subjectCode"/>
        <el-form-item label="日期范围：">
          <el-date-picker
            v-model="depositForm.date"
            type="daterange"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            range-separator="~"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @input="search(1)">
          </el-date-picker>
        </el-form-item>
        <PayerAutoComplete label="租户名称：" @select="selectPayer" :id="depositForm.companyId"/>
        <el-form-item label="合同编号：">
          <el-select
            v-model="depositForm.contNo"
            clearable
            filterable
            remote
            reserve-keyword
            placeholder="请输入合同编号"
            :remote-method="selectContract"
            :loading="false"
            @input="search(1)">
            <el-option
              v-for="{id,contNo,companyName} in contracts"
              class='select-option-selected'
              :key="id"
              :label="`${companyName} / ${contNo}`"
              :value="contNo">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态：">
          <el-select v-model="depositForm.depositStatus" clearable placeholder="请选择保证金状态" @change="search(1)">
            <el-option
              v-for="(name, key) in depositStatusName"
              class='select-option-selected'
              :key="key"
              :label="name"
              :value="key">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search(1)">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <el-table
        :data="deposit.list"
        style="width: 100%;"
        @row-click="rowClick"
        @sort-change="sort"
      >
        <el-table-column
          prop="assetName"
          label="项目名称"
          show-overflow-tooltip
        />
        <el-table-column
          prop="subjectName"
          label="款项名称"
          show-overflow-tooltip
        />
        <el-table-column
          prop="companyName"
          label="租户名称"
          show-overflow-tooltip
        />
        <el-table-column
          prop="receiveDate"
          label="实收日期"
          sortable
          show-overflow-tooltip
        >
          <template slot-scope="scope">
            {{(scope.row.receiveDate || '').slice(0, 10)}}
          </template>
        </el-table-column>
        <el-table-column
          prop="receivedMoney"
          label="保证金金额(元)"
          sortable
          align="right"
          class-name="set-sortable-align"
          :formatter="numberFormat"
          show-overflow-tooltip
        >
        </el-table-column>
        <el-table-column
          prop="contNo-1"
          label="合同编号"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-button
              type="text"
              class="text-purple"
              size="small"
              @click.stop="goToContract(scope.row)">
              {{scope.row.contNo}}
            </el-button>
          </template>
        </el-table-column>
        <el-table-column
          prop="depositStatus"
          label="状态"
          show-overflow-tooltip>
          <template slot-scope="scope">
            {{scope.row.depositStatus | depositStatus}}
          </template>
        </el-table-column>
        <el-table-column
          fixed="right"
          show-overflow-tooltip
          label="操作">
          <template slot-scope="scope">
            <el-button
              :disabled="permission"
              v-if="scope.row.depositStatus == '1'"
              slot="reference"
              type="text"
              class="text-purple"
              size="small"
              @click.stop="refund(scope.row)"
            >退款</el-button>
            <el-button
              v-else-if="scope.row.depositStatus == '2'"
              type="text"
              class="text-purple"
              size="small"
              @click.stop="refundDetail(scope.row)">
              查看退款
            </el-button>
            <span v-else>-</span>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="deposit.total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
    <deposit-refund :visible="visible" :row="depositRefund" @close="updateClose"/>
    <deposit-refund-detail :visible="detailVisible" :details="depositRefundDetails" @close="depositRefundDetailClose"/>
  </div>
</template>

<script>
import { fetchDepositList, depositRefund } from '@/http/financial'
import { getList } from '@/http/contract'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import DepositRefund from './refund'
import DepositRefundDetail from './refund_detail'
import { depositStatusName } from '@/components/const'
import {mapState} from 'vuex'

const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}

export default {
  components: {SubjectAutoComplete, PayerAutoComplete, DepositRefund, DepositRefundDetail},
  data () {
    return {
      permission: '',
      deposit: {},
      depositForm: {},
      page: 1,
      selection: {},
      visible: false,
      detailVisible: false,
      depositRefund: {},
      depositRefundDetails: [],
      contracts: []
    }
  },
  created () {
    this.depositStatusName = depositStatusName
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.search()
  },
  computed: {
    ...mapState(['merchant', 'projectNameList', 'permissionList'])
  },
  methods: {
    search (page) {
      this.page = page || 1
      const {depositForm: { date, ...args }} = this
      const [beginDate, endDate] = date || []

      fetchDepositList({...args, page, beginDate, endDate, mainId: this.merchant.id})
        .then((res) => {
          this.deposit = res.data
        })
    },
    reset () {
      this.depositForm = {assetId: null, subjectCode: null, companyId: null}
      this.search(1)
    },
    selectProject ({ id, assetName }) {
      this.depositForm.assetName = assetName
      this.search(1)
      this.depositForm.assetId = id
    },
    selectSubject ({ subjectCode, subjectName }) {
      this.depositForm.subjectName = subjectName
      this.search(1)
      this.depositForm.subjectCode = subjectCode
    },
    selectPayer (id, payer) {
      this.depositForm.companyId = id
      this.depositForm.companyName = payer.companyName
      this.search(1)
    },
    updateClose (fresh = true) {
      this.row = {}
      this.visible = false
      if (fresh) {
        this.search()
      }
    },
    depositRefundDetailClose () {
      this.detailVisible = false
      this.depositRefundDetails = []
    },
    refund (depositRefund) {
      this.depositRefund = depositRefund
      this.visible = true
    },
    numberFormat (row, column, cellValue, index) {
      return comdify(cellValue)
    },
    getSummaries (param) {
      const { columns, data } = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = '本页小计(元)'
          return
        }
        if (index !== 4) {
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
    selectable ({ depositStatus }) {
      return depositStatus === '1'
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
    selectContract (keyword) {
      getList({assetId: this.depositForm.assetId, contNo: keyword}).then(res => {
        this.contracts = res.list
      })
    },
    refundDetail (row) {
      depositRefund({assetID: row.assetId, id: row.id, type: 2}).then(res => {
        console.log(res)
        if (res && res.length > 0) {
          this.$router.push({path: '/financial/receiveds', query: {receivedNo: res[0].receivedNo}})
        } else {
          this.$message.warning('未查询到退款数据')
        }
      })
    },
    rowClick (row) {
      this.$router.push({path: '/financial/receiveds', query: {receivedNo: row.serialNo}})
    },
    sort ({column, prop, order}) {
      this.depositForm.order = order === 'ascending' ? 'asc' : 'desc'
      this.depositForm.orderFiled = prop
      this.search()
    },
    goToContract (row) {
      const assetLayout = (this.projectNameList.find(res => row.assetId === res.id) || {}).assetLayout
      const params = `${assetLayout}&${row.contId}`
      const contType = row.contType
      if (contType !== null && contType !== '' && contType === '2') {
        this.$router.push(`/contract/multiplePoints/detail/${params}`)
      } else {
        this.$router.push(`/contract/detail/${params}`)
      }
    },
  }
}
</script>
<style lang="scss">

</style>

<!--实付列表-->
<template>
  <div id="paidInAmount" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" size="small" label-width="88px">
        <project-auto-complete @select="selectProject" :project-id="form.assetId"/>

        <el-form-item label="款项名称：">
          <el-select
            class="select-width-100"
            v-model="form.subjectName"
            clearable
            filterable
            placeholder="请选择款项名称"
            @change="selectSubject"
          >
            <el-option
              v-for="{subjectName, subjectCode} in subjectNamesLabel"
              class='select-option-selected'
              :value="subjectName"
              :label="subjectName"
              :key="subjectCode"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="实付日期：">
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

        <el-form-item label="收款方：">
          <el-input v-model="form.payeeName" placeholder="请输入收款方" @input="search(1)"/>
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
        <el-button :disabled="permission" class="btn btn-default" @click="deleteRealPay">删除</el-button>
      </div>
      <el-table
        :data="payList.list"
        style="width: 100%;"
        class="hidden-all-selection"
        ref="table"
        @row-click="detailOpen"
        @selection-change="selectionChange"
        @sort-change="sort"
      >
        <el-table-column
          fixed="left"
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          prop="serialNo"
          label="实付流水号"
          min-width="180">
        </el-table-column>
        <el-table-column
          sortable
          prop="paymentDate"
          label="实付日期"
          width="150">
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          min-width="180">
        </el-table-column>
        <el-table-column
          show-overflow-tooltip
          prop="payeeName"
          label="收款方"
          min-width="180"
        >
        </el-table-column>
        <el-table-column
          prop="subjectName"
          label="款项名称"
          min-width="150">
        </el-table-column>
        <el-table-column
          prop="totalAmount"
          label="实付金额(元)"
          sortable
          align="right"
          class-name="set-sortable-align"
          :formatter="numberFormat"
          width="150">
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注"
          min-width="150">
          <template slot-scope="scope">{{scope.row.remark || '-'}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="payList.total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
    <payment-create :visible="createVisible" @close="createClose"/>
    <payment-edit :visible="editVisible" @close="editClose" :id="paymentId"/>
    <payment-detail :visible="detailVisible" @close="detailClose" @edit="editOpen" :id="paymentId"/>
  </div>
</template>
<script>
import { deleteRealPay, realPayList } from '@/http/financial'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PaymentCreate from './create'
import PaymentEdit from './edit'
import PaymentDetail from './detail'
import { mapState, mapGetters } from 'vuex'
import * as utils from '@/utils/index'

const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}
export default {
  components: {ProjectAutoComplete, SubjectAutoComplete, PaymentCreate, PaymentEdit, PaymentDetail},
  data () {
    return {
      permission: '',
      payList: {},
      form: {},
      page: 1,
      createVisible: false,
      detailVisible: false,
      editVisible: false,
      paymentId: void 0,
      selection: {},
    }
  },
  computed: {
    ...mapState(['merchant', 'subjectNames', 'permissionList']),
    ...mapGetters(['subjectNamesLabel']),
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setSubjectNames', {refresh: false})
    let date = new Date()
    let ym = utils.format(date, 'YYYY-MM')
    let dateEnd = new Date(date.getFullYear(), date.getMonth() + 1, 0)
    let start = `${ym}-01`
    let end = `${ym}-${dateEnd.getDate()}`
    this.form.date = [start, end]
    this.search()
  },
  methods: {
    search (page = this.page) {
      this.page = page
      const { form: { date, ...args } } = this
      const [startYearMonth, endYearMonth] = date || []
      realPayList({ ...args, mainId: this.merchant.id, page, limit: 10, startYearMonth, endYearMonth }).then((res) => {
        this.payList = res
      })
    },
    reset () {
      this.form = {assetId: null, subjectName: null}
      this.subjectName = null
      this.search(1)
    },
    selectSubject (subjectName) {
      this.form.subjectName = subjectName
      this.search(1)
    },
    selectProject ({ id, assetName }) {
      this.form.assetId = id
      this.form.assetName = assetName
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
        if (index !== 6) {
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
      this.paymentId = id
      this.detailVisible = true
    },
    editOpen () {
      this.detailVisible = false
      this.editVisible = true
    },
    createClose (fresh = true) {
      this.createVisible = false
      if (fresh) {
        this.search()
      }
    },
    detailClose (fresh = true) {
      this.detailVisible = false
      if (fresh) {
        this.search()
      }
    },
    editClose (fresh = true) {
      this.editVisible = false
      if (fresh) {
        this.search()
      }
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
    deleteRealPay () {
      const { id } = this.selection
      if (id != null) {
        this.$confirm('确认删除当前选择的实付订单?', '删除确认').then(() => {
          deleteRealPay(id).then((res) => {
            if (res.data) {
              this.$message.success('删除实付订单成功')
              this.search(1)
            }
          })
        }).catch(() => {})
      } else {
        this.$message.warning('请选择需要删除的实付订单')
      }
    },
    sort (column) {
      this.form.order = column.order === 'descending' ? 'desc' : 'asc'
      if (column.prop === 'paymentDate') {
        this.form.orderFiled = 'payment_date'
      } else if (column.prop === 'totalAmount') {
        this.form.orderFiled = 'total_amount'
      } else {
        this.form.orderFiled = 'payment_date'
      }
      this.search()
    }
  }
}
</script>
<style lang="scss" scoped>

</style>

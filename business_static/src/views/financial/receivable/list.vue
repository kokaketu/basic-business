<!--应收列表-->
<template>
  <div id="receivables" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="receivableForm" ref="form" size="small" label-width="100px">
        <project-auto-complete @select="selectProject" :projectId="receivableForm.assetId"/>

        <el-form-item label="流水号：">
          <el-input v-model="receivableForm.receivableNo" placeholder="请输入流水号" @input="search(1)"/>
        </el-form-item>

        <el-form-item label="款项名称：">
          <el-select
            class="select-width-100"
            v-model="subjectCode"
            clearable
            filterable
            placeholder="请选择款项名称"
            @change="selectSubject"
          >
            <el-option
              v-for="{subjectName, subjectCode} in subjectNamesLabel"
              class='select-option-selected'
              :value="subjectCode"
              :label="subjectName"
              :key="subjectCode"
            />
          </el-select>
        </el-form-item>
        <!-- <subject-auto-complete @select="selectSubject" :test='test' /> -->

        <el-form-item label="应收日期：">
          <el-date-picker
            type="daterange"
            v-model="receivableForm.date"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            range-separator="~"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @input="search(1)">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="合同编号：">
          <!-- <el-input v-model="receivableForm.contNo" placeholder="请输入合同编号"/> -->
          <el-select
            v-model="receivableForm.contNo"
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
        <payer-auto-complete @select="selectPayer" :id="receivableForm.companyId"/>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search(1)">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <div class="table-header text-right">
        <el-button :disabled="permission" class="btn" @click="openCreate">新增</el-button>
        <el-button :disabled="permission" class="btn btn-default" @click="receivedOpen">收款</el-button>
        <el-button :disabled="permission" class="btn btn-default" @click="badReceivable">坏账</el-button>
        <el-button :disabled="permission" class="btn btn-default" @click="deleteReceivable" style="margin-left: 10px;">删除
        </el-button>
      </div>
      <el-table
        :data="receivable.list"
        :select-on-indeterminate="false"
        style="width: 100%;"
        class="hidden-all-selection"
        ref="table"
        @row-click="openDetail"
        @selection-change="selectionChange"
        @sort-change="sort"
      >
        <el-table-column
          fixed="left"
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          show-overflow-tooltip
          prop="receivableNo"
          label="应收流水号"
          width="180">
        </el-table-column>
        <el-table-column
          sortable
          prop="receivableDate"
          label="应收日期"
          width="120">
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          min-width="160">
        </el-table-column>
        <el-table-column
          show-overflow-tooltip
          prop="companyName"
          label="付款方"
          min-width="200">
        </el-table-column>
        <el-table-column
          prop="subjectName"
          label="款项名称"
          min-width="100">
        </el-table-column>
        <el-table-column
          prop="receivableMoney"
          label="应收金额(元)"
          sortable
          :formatter="numberFormat"
          align="right"
          class-name="set-sortable-align"
          min-width="140">
        </el-table-column>
        <el-table-column
          prop="receivedMoney"
          label="实收金额(元)"
          :formatter="numberFormat"
          min-width="140"
          align="right">
        </el-table-column>
        <el-table-column
          prop="leftReceivableMoney"
          label="剩余应收金额(元)"
          :formatter="numberFormat"
          min-width="170"
          align="right">
          <template slot-scope="scope">
            <span :class="{'left-rece-money-disabled':scope.row.receivableStatus==='2'}">{{numberFormat({}, {}, scope.row.leftReceivableMoney)}}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="contNo"
          label="合同编号"
          min-width="130">
          <template slot-scope="scope">
            <el-button
              type="text"
              class="text-purple"
              size="small"
              @click.stop="goToContract(scope.row)">
              {{scope.row.contNo || '-'}}
            </el-button>
          </template>
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注"
          min-width="180">
          <template slot-scope="scope">{{scope.row.remark || '-'}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="receivable.total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
    <receivables-create :visible="createVisible" @close="createClose"/>
    <receivables-detail :visible="detailVisible" @close="detailClose" @edit="openEdit" :id="receivableId"/>
    <receivables-edit :visible="editVisible" @close="editClose" :id="receivableId"/>
    <receivables-received :visible="receivedVisible" @close="receivedClose" :dataList="receivables"/>
  </div>
</template>
<script>
import {deleteReceivable, getReceivableList, badReceivable} from '@/http/financial'
import {getList} from '@/http/contract'
import {getCompanyNameList} from '@/http/rentControl'
import {mapState, mapGetters} from 'vuex'
import {cloneDeep} from 'lodash-es'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import ReceivablesCreate from './create'
import ReceivablesEdit from './edit'
import ReceivablesDetail from './detail'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import ReceivablesReceived from './receivables_received'
import * as utils from '@/utils'

const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}
export default {
  components: {ProjectAutoComplete, ReceivablesCreate, PayerAutoComplete, ReceivablesEdit, ReceivablesDetail, ReceivablesReceived},
  data () {
    return {
      permission: '',
      receivable: {},
      receivableForm: {
        receivableNo: this.$route.params.receivableNo
      },
      subjectCode: void 0,
      test: '',
      page: 1,
      receivableId: void 0,
      createVisible: false,
      detailVisible: false,
      editVisible: false,
      receivedVisible: false,
      selection: [],
      contracts: [],
      companys: [],
      receivables: []
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setSubjectNames', {refresh: false})
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    // 有路由参数应收编号
    if (this.$route.params.receivableNo) {
      this.receivableForm.date = []
    } else {
      let date = new Date()
      let ym = utils.format(date, 'YYYY-MM')
      let dateEnd = new Date(date.getFullYear(), date.getMonth() + 1, 0)
      let start = `${ym}-01`
      let end = `${ym}-${dateEnd.getDate()}`
      this.receivableForm.date = [start, end]
    }
    this.search()
  },
  computed: {
    ...mapGetters(['subjectNamesLabel', 'merchant']),
    ...mapState(['merchant', 'subjectNames', 'permissionList']),
    projectNameList () {
      return this.$store.state.projectNameList
    }
  },
  methods: {
    search (page = this.page) {
      this.page = page
      const {receivableForm: {date, companyId, ...args}, subjectCode} = this
      const [startDate, endDate] = date || []
      getReceivableList({
        ...args,
        mainId: this.merchant.id,
        subjectCode: subjectCode,
        pageNum: page,
        pageSize: 10,
        startDate,
        endDate,
        companyId
      })
        .then((res) => {
          this.receivable = res
          let subjects = utils.listToHash(this.subjectNames, 'subjectCode', 'subjectName')
          this.receivable.list.forEach(e => {
            e.subjectName = subjects.hash[e.subjectCode] ? subjects.hash[e.subjectCode].text : ''
          })
        })
    },
    reset () {
      this.receivableForm = {assetId: null}
      this.subjectCode = null
      this.search(1)
    },
    selectProject ({id}) {
      this.receivableForm.assetId = id
      this.search(1)
    },
    selectSubject (e) {
      this.subjectCode = e
      this.search(1)
    },
    selectPayer (id) {
      this.receivableForm.companyId = id
      this.search(1)
    },
    numberFormat (row, column, cellValue, index) {
      return comdify(cellValue)
    },
    getSummaries (param) {
      const {columns, data} = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 1) {
          sums[index] = '本页小计(元)'
          return
        }
        if (index !== 6 && index !== 7 && index !== 8) {
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
    openCreate () {
      this.createVisible = true
    },
    openDetail ({id}) {
      this.receivableId = id
      this.detailVisible = true
    },
    openEdit () {
      this.detailVisible = false
      this.editVisible = true
    },
    editClose (fresh) {
      this.editVisible = false
      if (fresh) {
        this.page = 1
        this.search()
      }
    },
    receivedClose (fresh = true) {
      this.receivedVisible = false
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
    createClose (fresh = true) {
      this.createVisible = false
      if (fresh) {
        this.search()
      }
    },
    selectionChange (val) {
      // const [f = {}, s] = val
      // if (val.length > 1) {
      //   this.$refs.table.toggleRowSelection(f, false)
      //   this.selection = s
      // } else {
      //   this.selection = f
      // }
      this.selection = val
    },
    deleteReceivable () {
      if (this.selection.length === 0) {
        this.$message.error('请选择需要删除的应收订单')
      } else {
        this.$confirm('确认删除当前选择的应收账单?', '删除确认', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.selection.forEach(item => {
            deleteReceivable(item.id).then(res => {
              this.$message({message: res.msg, type: res.code === '0' ? 'success' : 'error'})
              this.search()
            })
          })
        }).catch(() => {
        })
      }
    },
    badReceivable () {
      if (this.selection.length === 0) {
        this.$message.error('请选择需要执行坏账的应收订单')
      } else {
        this.$confirm('是否确认当前选择的应收为坏账?', '坏账确认', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.selection.forEach(item => {
            badReceivable(item.id).then(res => {
              this.$message({message: res.msg, type: res.code === '0' ? 'success' : 'error'})
              this.search()
            })
          })
        }).catch(() => {
        })
      }
    },
    selectContract (keyword) {
      getList({assetId: this.receivableForm.assetId, contNo: keyword}).then(res => {
        this.contracts = res.list
      })
    },
    getCustomerList (keyword) {
      getCompanyNameList({mainId: this.merchant.id, companyName: keyword}).then(res => {
        this.companys = res.data
      })
    },
    receivedOpen () {
      const data = this.selection
      const isEmpty = data.length === 0
      const unEqualAssetId = [...new Set(data.map(({assetId}) => assetId))].length !== 1
      const unBadReceivable = data.some(({receivableStatus}) => Number(receivableStatus) === 2)
      const unEqualCompany = [...new Set(data.map(({companyId}) => companyId))].length !== 1
      if (isEmpty) {
        this.$message.error('请选择需要收款的应收订单')
      } else if (unEqualAssetId) {
        this.$message.error('请选择相同项目的应收订单')
      } else if (unBadReceivable) {
        this.$message.error('请选择非坏账应收订单进行收款操作')
      } else if (unEqualCompany) {
        this.$message.error('请选择相同付款方的应收订单')
      } else {
        this.receivedVisible = true
        this.receivables = cloneDeep(this.selection)
      }
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
    sort (column) {
      this.receivableForm.order = column.order === 'descending' ? 'desc' : 'asc'
      if (column.prop === 'receivableDate') {
        this.receivableForm.orderFiled = 'receivable_date'
      } else if (column.prop === 'receivableMoney') {
        this.receivableForm.orderFiled = 'receivable_money'
      } else if (column.prop === 'receivedMoney') {
        this.receivableForm.orderFiled = 'received_money'
      } else {
        this.receivableForm.orderFiled = 'receivable_date'
      }
      this.search()
    }
  }
}
</script>
<style lang="scss" scoped>
  .left-rece-money-disabled {
    background-color: #F5F7FA;
    border-color: #E4E7ED;
    color: #C0C4CC;
  }
</style>

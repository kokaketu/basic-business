<!--欠费列表-->
<template>
  <div id="paidInAmount" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" size="small" label-width="120px">
        <project-auto-complete @select="selectProject" :project-id="arrearsForm.assetId"/>
        <subject-auto-complete @select="selectSubject" :subject-code="arrearsForm.subjectCode"/>
        <PayerAutoComplete @select="selectPayer" label="租户名称：" :id="arrearsForm.companyId" placeholder="请选择租户名称"/>
        <el-form-item label="合同编号：">
          <el-select
            v-model="arrearsForm.contNo"
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

        <el-form-item label="欠费天数：">
          <input-number :value="arrearsForm.minArrearsDate" @input="(v)=>{arrearsForm.minArrearsDate=v;search(1)}"
                        placeholder="请输入" style="width: 120px"/>
          ~
          <input-number :value="arrearsForm.maxArrearsDate" @input="(v)=>{arrearsForm.maxArrearsDate=v;search(1)}"
                        placeholder="请输入" style="width: 120px"/>
          天
        </el-form-item>
        <rental-unit-auto-complete @select="selectRentalUnit" :asset-id="arrearsForm.assetId" :id="arrearsForm.roomId"/>

      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search(1)">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <el-table
        :data="arrears.list"
        @sort-change="sortChange"
        @row-click="rowClick"
      >
        <el-table-column
          prop="assetName"
          label="项目名称"
          min-width="150"
        />
        <el-table-column
          prop="payerName"
          label="租户名称"
          min-width="150">
        </el-table-column>
        <el-table-column
          label="租赁单元"
          min-width="120">
          <template slot-scope="scope">
            {{scope.row.roomInfo.map(res => {return res.roomNo}).join(';') || '-'}}
          </template>
        </el-table-column>
        <el-table-column
          prop="subjectName"
          label="款项名称"
          width="150">
        </el-table-column>
        <el-table-column
          prop="arrearMoney"
          label="欠费金额(元)"
          sortable="custom"
          align="right"
          class-name="set-sortable-align"
          :formatter="numberFormat"
          width="150">
        </el-table-column>
        <el-table-column
          prop="contNo"
          label="合同编号"
          min-width="150">
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
          prop="receivableDateStr"
          label="应收日期"
          width="150">
        </el-table-column>
        <el-table-column
          prop="arrearsDay"
          label="欠费天数"
          width="120"
          sortable="custom"
          align="right"
          class-name="set-sortable-align"
        >
          <template slot-scope="scope">
            <span class="oweDate">{{scope.row.arrearsDay}}</span>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="arrears.total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
  </div>
</template>
<script>
import {queryArrears} from '@/http/financial'
import {getList} from '@/http/contract'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import RentalUnitAutoComplete from '@/components/RentalUnitAutoComplete'
import {mapState} from 'vuex'
import InputNumber from '@/components/InputNumber'

const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}
export default {
  components: {ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete, RentalUnitAutoComplete, InputNumber},
  data () {
    return {
      arrears: {},
      arrearsForm: {
        assetId: void 0,
        roomId: void 0
      },
      page: 1,
      contracts: []
    }
  },
  computed: {
    ...mapState(['merchant']),
    projectNameList () {
      return this.$store.state.projectNameList
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.search()
  },
  methods: {
    search (page = this.page) {
      this.page = page
      const {arrearsForm, orderBy} = this
      queryArrears({...arrearsForm, mainId: this.merchant.id, unitId: arrearsForm.roomId, orderBy, page})
        .then((res) => {
          this.arrears = res
        })
    },
    reset () {
      this.arrearsForm = {assetId: null, roomId: null, subjectCode: null, companyId: null}
      this.search(1)
    },
    payerNameSearch (queryString, cb) {
      const results = queryString
        ? this.payerNamesLabel.filter(({value}) => (value + '').includes(queryString))
        : this.payerNamesLabel

      cb(results)
    },
    selectProject ({id}) {
      this.arrearsForm.roomId = null
      this.arrearsForm.assetId = id
      this.search(1)
    },
    selectSubject ({subjectId, subjectCode}) {
      this.arrearsForm.subjectCode = subjectCode
      this.search(1)
      this.arrearsForm.subjectId = subjectId
    },
    selectPayer (payerName, {companyId}) {
      this.arrearsForm.companyId = companyId
      this.search(1)
    },
    selectRentalUnit ({id}) {
      this.arrearsForm.roomId = id
      this.search(1)
    },
    numberFormat (row, column, cellValue, index) {
      return comdify(cellValue)
    },
    getSummaries (param) {
      const {columns, data} = param
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
    sortChange ({column, prop, order}) {
      console.log(column, prop, order)
      const orderStr = {
        ascending: 'asc',
        descending: 'desc',
      }
      if (order in orderStr) {
        this.orderBy = `${prop} ${orderStr[order]}`
        this.search()
      }
    },
    selectContract (keyword) {
      getList({assetId: this.arrearsForm.assetId, contNo: keyword}).then(res => {
        this.contracts = res.list
      })
    },
    rowClick (row) {
      this.$router.push(`/financial/receivables/${row.receivableNo}`)
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
<style lang="scss" scoped>
  .page {
    .oweDate {
      color: red;
    }
  }
</style>

<!--预算编制详情-->
<template>
  <div id="budget_fill_create" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="form" ref="form" size="small" label-width="100px">
        <el-form-item label="项目名称" prop="assetId" :rules="[{required:true,trigger:'blur',message:'请选择项目'}]">
          <el-select v-model="form.assetId" clearable placeholder="请选择" @change="selectProject" disabled>
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.assetId"
              :label="item.assetName"
              :value="item.assetId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分期名称" prop="stagesId" v-if="assetLayout == 3"
          :rules="[{required:true,trigger:'blur',message:'请选择分期名称'}]">
          <el-select v-model="form.stagesId" placeholder="请选择" disabled>
            <el-option
              v-for="item in stagesList"
              class='select-option-selected'
              :key="item.id"
              :label="item.stagesName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="填报年份"
          prop="budgetYear"
          :rules="[{required:true,trigger:'blur',message:'请选择预算年份'}]">
          <el-select @change="getMonths" v-model="form.budgetYear" placeholder="请选择" disabled>
            <el-option
              v-for="item in budgetYearList"
              class='select-option-selected'
              :key="item.budgetYear"
              :label="item.budgetYear"
              :value="item.budgetYear">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="填报月份"
          prop="budgetMonth"
          :rules="[{required:true,trigger:'blur',message:'请选择预算月份'}]">
          <el-select v-model="form.budgetMonth" placeholder="请选择" disabled>
            <el-option
              v-for="item in budgetMonthList"
              class='select-option-selected'
              :key="item.budgetMonth"
              :label="item.budgetMonth"
              :value="item.budgetMonth">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-wrapper">
      <div class="clearfix" style="padding: 20px 20px">
        <el-button @click="cancel" class="fr" style="margin-left: 10px">取消</el-button>
        <el-button @click="reset" class="fr" style="margin-left: 10px">重置</el-button>
        <el-button type="primary" @click="save" class="fr" :loading="saving">保存</el-button>
        <el-button type="primary" @click.native="fillFinancial" class="fr autofill" :loading="saving">
          <p>自动填充</p>
          <p>(使用财务数据)</p>
        </el-button>
      </div>
      <el-table
        :data="tableData"
        row-key="key"
        border
        default-expand-all
        style="width: 1001px;"
        :tree-props="{children: 'child', hasChildren: 'hasChildren'}">
        <el-table-column
          prop="budgetSubjectName"
          label="科目"
          width="400px">
          <template slot-scope="scope">
            <span v-if="!scope.row.isAdd">{{scope.row.budgetSubjectName}}</span>
            <el-select
              size="small"
              v-model="scope.row.budgetSubjectCode"
              placeholder="请选择"
              style="margin-left: -10px;"
              v-if="scope.row.isAdd">
              <el-option
                v-for="item in subjects"
                :key="item.subjectCode"
                :label="item.subjectName"
                :value="item.subjectCode">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column
          label="实际金额（元）"
          width="300px">
          <template slot-scope="scope">
            <InputNumber
              v-if="scope.row.key > 10"
              :value="scope.row.amount"
              placeholder="保留2位小数"
              className="input-unit"
              unit=""
              @input="result => scope.row.amount = result">
            </InputNumber>
            <p v-else style="padding-left: 5px;">{{scope.row.amount}}</p>
          </template>
        </el-table-column>
        <el-table-column
          label="预算金额（元）"
          prop="budgetAmount"
          width="300px">
        </el-table-column>
        <!-- <el-table-column label="操作"  width="100">
          <template slot-scope="scope">
            <el-button v-if="scope.row.child" type="text" @click.native="addRow(scope.row)">增加</el-button>
            <el-button v-else type="text" @click.native="delRow(scope.row.key)">删除</el-button>
          </template>
        </el-table-column> -->
      </el-table>
    </div>
  </div>
</template>
<script>

import AssetType from '@/components/AssetType'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import InputNumber from '@/components/InputNumber'
import BudgetCharts from './BudgetCharts'
import { cloneDeep } from 'lodash-es'
import { mapState } from 'vuex'
import { addBudgetImolement, queryAssetNameList, queryBudgetYearList, fillFinancialData, queryPlaitList, queryBudgetList } from '@/http/budget'
import { queryBsAssetStagesList } from '@/http/assets'
import { getSubjectDropDown } from '@/http/financial'
import * as utils from '@/utils/index'
export default {
  name: 'budget_making_create',
  components: { AssetType, BudgetCharts, ProjectAutoComplete, InputNumber },
  data () {
    return {
      projectNameList: [],
      budgetYearList: [],
      budgetMonthList: [],
      form: {
        assetId: this.$route.query.assetId * 1,
        stagesId: this.$route.query.stagesId * 1,
        budgetYear: this.$route.query.year,
        budgetMonth: this.$route.query.month
      },
      assetLayout: this.$route.query.assetLayout,
      tableData: [],
      tableDataCopy: [],
      subjects: [],
      stagesList: [],
      saving: false
    }
  },
  computed: mapState(['merchant']),
  watch: {
    tableData: {
      handler: function () {
        this.calculation()
      },
      deep: true,
      immediate: false
    },
    // form: {
    //   handler: function () {
    //     this.queryPlaitList()
    //     this.budgetList()
    //   },
    //   deep: true,
    //   immediate: false
    // }
  },
  methods: {
    // 方法
    initData () {
      let {assetId, assetLayout, year, month} = this.$route.query
      if (utils.isNotEmpty(assetId) && utils.isNotEmpty(assetLayout) && utils.isNotEmpty(year) && utils.isNotEmpty(month)) {
        this.budgetList()
        this.queryPlaitList()
      } else {
        this.$message.error('参数不完整，请检查参数。')
      }
    },
    budgetList () {
      let {assetId, year} = this.$route.query
      if (utils.isNotEmpty(assetId) && utils.isNotEmpty(year)) {
        const params = {
          mainId: this.merchant.id,
          assetId: this.form.assetId,
          stagesId: this.form.stagesId,
          budgetYear: this.form.budgetYear
        }
        queryBudgetList(params).then(res => {
          if (res.data && res.data.length > 0) {
            const data = res.data.map(item => {
              item.child = item.resList
              return item
            })
            this.tableDataCopy = ''
            this.tableData = []
            this.dealData(data)
          }
        })
      }
    },
    dealData (data) {
      data.forEach((element, index) => {
        element.key = index + 1
        element.amount = 0
        if (element.child) {
          element.child.forEach((child, childIndex) => {
            child.key = (index + 1) * 100 + childIndex
            child.amount = 0
          })
        }
      })
      this.tableDataCopy = JSON.stringify(data)
      this.tableData = data
    },
    queryBudgetList () {
      if (utils.isNotEmpty(this.form.assetId) && utils.isNotEmpty(this.form.budgetYear)) {
        queryBudgetList({
          mainId: this.merchant.id,
          assetId: this.form.assetId,
          stagesId: this.form.stagesId,
          budgetYear: this.form.budgetYear,
        }).then(res => {
          console.log(res)
        })
      }
    },
    getAssetNameList () {
      queryAssetNameList({mainId: this.merchant.id}).then(res => {
        this.projectNameList = res.data
      })
      var {assetId, assetLayout} = this.$route.query
      if (assetId && assetLayout === '3') {
        queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: assetId}).then(res => {
          this.stagesList = res.list
        })
      }
    },
    queryBudgetYearList () {
      queryBudgetYearList({mainId: this.merchant.id, assetId: this.form.assetId}).then(res => {
        this.budgetYearList = res.data
      })
    },
    getMonths () {
      const monthList = []
      const curYear = new Date().getFullYear()
      const len = Number(curYear) === Number(this.form.budgetYear) ? (new Date().getMonth() + 1) : 12
      for (let index = 1; index <= len; index++) {
        monthList.push({
          budgetMonth: index < 10 ? '0' + index : index
        })
      }
      this.budgetMonthList = monthList
    },
    getSubjectList () {
      getSubjectDropDown({mainId: 1}).then((res) => {
        if (!res) return false
        this.subjects = res
      })
    },
    fillFinancial () {
      const params = {
        mainId: this.merchant.id,
        assetId: this.form.assetId,
        budgetYear: this.form.budgetYear,
        budgetMonth: this.form.budgetMonth
      }
      fillFinancialData(params).then(res => {
        if (!res.data) return false
        this.tableData.map(item => {
          if (item.child) {
            item.child.map(child => {
              res.data.map(res => {
                if (Number(res.budgetSubjectCode) === Number(child.budgetSubjectCode)) {
                  child.amount = res.budgetAmount
                }
              })
            })
          }
        })
      })
    },
    addRow (row) {
      if (this.subjects.length === 0) {
        this.getSubjectList()
      }
      const child = cloneDeep(row.child)
      const addRow = cloneDeep(child[0])
      addRow['budgetSubjectCode'] = null
      addRow['budgetSubjectName'] = null
      addRow['budgetTypeName'] = null
      addRow['amount'] = null
      addRow['isAdd'] = true
      child.forEach((element, index) => {
        element.key = element.key + 1
      })
      child.unshift(addRow)
      row.child = child
    },
    delRow (key) {
      this.tableData.forEach(element => {
        if (element.child) {
          element.child.forEach((child, index) => {
            if (child.key === key) {
              element.child.splice(index, 1)
            }
          })
        }
      })
    },
    calculation () {
      this.tableData.map(element => {
        const amount = element.child
          .map(item => Number(item.amount))
          .reduce((prev, cur) => prev + cur, 0)
        const budgetAmount = element.child
          .map(item => isNaN(Number(item.budgetAmount)) ? 0 : Number(item.budgetAmount))
          .reduce((prev, cur) => prev + cur, 0)
        element.amount = amount.toFixed(2)
        element.budgetAmount = budgetAmount.toFixed(2)
      })
    },
    selectProject () {
      this.assetLayout = this.projectNameList.filter(res => res.assetId === this.form.assetId)[0].assetLayout
      this.form.stagesId = null
      if (this.assetLayout === '3') {
        queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: this.form.assetId}).then(res => {
          this.stagesList = res.list
        })
      } else {
        this.stagesList = []
      }
      // this.queryBudgetYearList()
      this.budgetList()
    },
    reset () {
      this.tableData = []
      this.tableData = JSON.parse(this.tableDataCopy)
      this.$message({message: '已重置', type: 'success'})
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/budget/budget-fill-list')
    },
    save () {
      this.$refs['form'].validate(valid => {
        if (!valid) return
        const params = []
        const mainId = this.merchant.id
        const id = null
        const assetId = this.form.assetId
        const stagesId = this.form.stagesId
        const assetLayout = this.assetLayout
        const budgetYear = this.form.budgetYear
        const budgetMonth = this.form.budgetMonth
        this.tableData.map(item => {
          if (item.child) {
            item.child.map(item => {
              params.push({
                mainId: mainId,
                id: id,
                assetId: assetId,
                stagesId: stagesId,
                assetLayout: assetLayout,
                budgetType: item.budgetType,
                budgetSubjectCode: item.budgetSubjectCode,
                budgetSubjectName: item.budgetSubjectName,
                budgetAmount: item.amount,
                budgetYear: budgetYear,
                budgetMonth: budgetMonth
              })
            })
          }
        })
        addBudgetImolement(params).then(res => {
          if (res.code === '0') {
            this.$message({message: res.msg, type: 'success'})
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/budget/budget-fill-list')
          }
        })
      })
    },
    // 从预算查询数据赋值给对应的科目
    queryPlaitList () {
      let {assetId, stagesId, assetLayout, year, month} = this.$route.query

      if (utils.isNotEmpty(assetId) && utils.isNotEmpty(assetLayout) && utils.isNotEmpty(year) && utils.isNotEmpty(month)) {
        queryPlaitList({
          mainId: this.merchant.id,
          assetId: assetId,
          assetLayout: assetLayout,
          stagesId: stagesId,
          year: year,
        }).then(res => {
          if (res.data && res.data.length > 0) {
            this.tableData.forEach(element => {
              element.child.forEach(item => {
                let budget = res.data.find(o => o.budgetSubjectCode === item.budgetSubjectCode) || {monthResults: []}
                this.$set(item, 'budgetAmount', (budget.monthResults.find(o => o.month === month) || {}).amount || 0)
              })
            })
          } else {
            this.tableData.forEach(element => {
              element.child.forEach(item => {
                this.$set(item, 'budgetAmount', 0)
              })
            })
          }
        })
      }
    },
  },
  activated () {
    // 获取项目名称
    this.getAssetNameList()
    this.initData()
  },
}
</script>
<style lang="scss" scoped>
  .state-container {
    padding: 14px 20px;
    font-size: 14px;
    color: #333;
  }
  .btn-group{
    margin-top: 10px;
    margin-bottom: 40px;
  }
  .state {
    padding: 6px 0;
    > {
      span {
        display: inline-block;
        height: 28px;
        line-height: 28px;
        margin-right: 20px;
        padding: 0 11px;
        background: #F5F6F9;
        border: 1px solid #E2E3E5;
        border-radius: 2px;
        cursor: pointer;
      }
      .active {
        color: white;
        background-color: #5E0EFF;
        border-color: #5E0EFF;
      }
    }
  }

</style>
<style lang="scss">
  #budget_fill_create{
    .table-wrapper {
      .el-input__inner {
        padding: 0 0 0 5px;
        border: unset;
        color: #000;
      }
    }
    .autofill{
      padding: 2px 20px;
      p:nth-child(2){
        line-height: 20px;
        transform: scale(.8);
      }
    }
    .el-table .cell{
      padding: 0 10px;
    }
    .table-wrapper .el-table th:nth-child(1){
      padding: 0;
    }
  }
</style>

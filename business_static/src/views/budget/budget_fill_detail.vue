<!--
 * @Author: your name
 * @Date: 2020-08-19 15:10:05
 * @LastEditTime: 2020-09-04 09:33:25
 * @LastEditTime: 2020-08-24 19:18:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\budget\budget_fill_list.vue
-->
<!--预算编制详情-->
<template>
  <div id="budget_fill_detail" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="form" ref="form" size="small" label-width="100px">
        <el-form-item label="项目名称" prop="assetId" :rules="[{required:true,trigger:'blur',message:'请选择项目'}]">
          <el-select disabled v-model="form.assetId" placeholder="请选择" >
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.assetId"
              :label="item.assetName"
              :value="item.assetId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分期名称" prop="stagesId" v-if="assetLayout == 3">
          <el-select disabled v-model="form.stagesId" placeholder="请选择">
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
          <el-select disabled v-model="form.budgetYear" placeholder="请选择">
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
          <el-select disabled v-model="form.budgetMonth" placeholder="请选择">
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
        <el-button @click.native="cancel" class="fr" style="margin-left: 10px">取消</el-button>
        <el-button @click.native="reset" class="fr" style="margin-left: 10px">重置</el-button>
        <el-button type="primary" @click.native="save" class="fr" :loading="saving">保存</el-button>
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
        style="width: 1001px"
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
      </el-table>
    </div>
  </div>
</template>
<script>

import AssetType from '@/components/AssetType'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import InputNumber from '@/components/InputNumber'
import BudgetCharts from './BudgetCharts'
import { mapState } from 'vuex'
import { queryDetailsList, addBudgetImolement, queryAssetNameList, queryBudgetYearList, fillFinancialData, queryPlaitList } from '@/http/budget'
import { queryBsAssetStagesList } from '@/http/assets'
import { getSubjectDropDown } from '@/http/financial'

export default {
  name: 'budget_making_create',
  components: { AssetType, BudgetCharts, ProjectAutoComplete, InputNumber },
  data () {
    return {
      projectNameList: [],
      budgetYearList: [],
      budgetMonthList: [],
      form: {
        assetId: null,
        stagesId: null,
        budgetYear: null,
        budgetMonth: null
      },
      assetLayout: null,
      tableData: [],
      tableDataCopy: [],
      subjects: [],
      stagesList: [],
      saving: false,
      budgetSubjectData: {}
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
    }
  },
  methods: {
    // 方法
    getDetail () {
      const data = JSON.parse(decodeURIComponent(this.$route.params.data))
      const params = {
        mainId: data.mainId,
        assetId: data.assetId,
        stagesId: data.stagesId,
        budgetYear: data.budgetYear,
        budgetMonth: data.budgetMonth
      }
      queryDetailsList(params).then(res => {
        if (!res || res.data.length < 1) return false
        const data = res.data
        data.forEach((item, index) => {
          item.key = index + 1
          item.amount = 0
          item.child = item.resList
          if (!item.child) return false
          item.child.forEach((child, childIndex) => {
            child.key = (index + 1) * 100 + childIndex
            child.amount = child.budgetAmount || 0
          })
        })
        this.tableDataCopy = JSON.stringify(data)
        const { assetId, stagesId, budgetYear, budgetMonth } = data[0]
        this.assetLayout = this.projectNameList
          .filter(item => Number(item.assetId) === Number(assetId))[0].assetLayout
        this.form = {
          assetId: assetId,
          stagesId: stagesId,
          budgetYear: budgetYear,
          budgetMonth: budgetMonth
        }
        // 设置预算金额
        this.queryPlaitList(data).then(() => {
          this.tableData = data
        })
      })
    },
    // 从预算查询数据赋值给对应的科目
    queryPlaitList (data) {
      return (
        queryPlaitList({
          mainId: this.merchant.id,
          assetId: this.form.assetId,
          assetLayout: this.assetLayout,
          stagesId: this.form.stagesId,
          year: this.form.budgetYear,
        }).then(res => {
          if (res.data && res.data.length > 0) {
            data.forEach(element => {
              element.child.forEach(item => {
                let budget = res.data.find(o => o.budgetSubjectCode === item.budgetSubjectCode) || {monthResults: []}
                item.budgetAmount = (budget.monthResults.find(o => o.month === this.form.budgetMonth) || {}).amount || 0
              })
            })
          }
        })
      )
    },
    getAssetNameList () {
      queryAssetNameList({mainId: this.merchant.id}).then(res => {
        this.projectNameList = res.data
      })
    },
    queryBudgetYearList () {
      queryBudgetYearList({mainId: this.merchant.id}).then(res => {
        this.budgetYearList = res.data
        const monthList = []
        for (let index = 1; index <= 12; index++) {
          monthList.push({
            budgetMonth: index < 10 ? '0' + index : index
          })
        }
        this.budgetMonthList = monthList
      })
    },
    getSubjectList () {
      getSubjectDropDown({mainId: 1}).then((res) => {
        if (res) {
          this.subjects = res
          this.subjects.forEach(item => { this.subjectsMap[item.subjectCode] = item })
        }
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
    calculation () {
      this.tableData.map(element => {
        const amount = element.child
          .map(item => Number(item.amount))
          .reduce((prev, cur) => prev + cur, 0)
        const budgetAmount = element.child
          .map(item => Number(item.budgetAmount))
          .reduce((prev, cur) => prev + cur, 0)
        element.amount = amount.toFixed(2)
        element.budgetAmount = budgetAmount.toFixed(2)
      })
    },
    reset () {
      this.tableData = []
      this.tableData = JSON.parse(this.tableDataCopy)
      this.$message({message: '已重置', type: 'success'})
    },
    getBsAssetStagesList () {
      queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: this.form.assetId}).then(res => {
        this.stagesList = res.list
      })
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
        const assetId = this.form.assetId
        const stagesId = this.form.stagesId
        const assetLayout = this.assetLayout
        const budgetYear = this.form.budgetYear
        const budgetMonth = this.form.budgetMonth
        this.tableData.map(item => {
          // params.push({
          //   mainId: mainId,
          //   id: item.id,
          //   assetId: assetId,
          //   stagesId: stagesId,
          //   assetLayout: assetLayout,
          //   budgetType: item.budgetType,
          //   budgetSubjectCode: item.budgetSubjectCode,
          //   budgetSubjectName: item.budgetSubjectName,
          //   budgetAmount: item.amount,
          //   budgetYear: budgetYear,
          //   budgetMonth: budgetMonth
          // })
          if (item.child) {
            item.child.map(item => {
              params.push({
                mainId: mainId,
                id: item.id,
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
  },
  activated () {
    // 获取项目名称
    this.getBsAssetStagesList()
    this.getAssetNameList()
    this.getDetail()
    this.queryBudgetYearList()
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
  #budget_fill_detail{
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

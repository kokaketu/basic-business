<template>
  <div class="authorized-strength">
    <el-row>
      <el-col :span="22">
        <span>预算年份：</span>
        <el-date-picker
          v-model="year"
          type="year"
          placeholder="请选择预算年份"
          @change="queryPlaitList"
        />
        <el-form label-width="4em" style="display: inline-block">
          <project-auto-complete label="项目" :project-id="assetId" @select="selectProject" @complete="selectProject" />
        </el-form>
      </el-col>
      <el-col :span="2">
<!--        <el-button type="primary">新增</el-button>-->
      </el-col>
    </el-row>
    <div class="authorized-strength-chart content-container">
      <!--<el-tabs v-model="budgetType">
        <el-tab-pane :label="name" :name="code" v-for="{code, name} in budgetTypes" :key="code"/>
      </el-tabs>-->
      <!--<div class="state-container">
        <asset-type :active="activeAssetType" :change="assetType"/>
      </div>
      <div class="state-container">
        <div class="state" style="margin: -13px 0 0">
          <span class="active">大宁国际商业广场</span>
        </div>
      </div>-->
      <div style="margin-top: 20px;"/>
      <budget-charts :main-id="1" :asset-id="assetId" :updated="updated" />
    </div>
    <div class="authorized-strength-body content-container">
<!--      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">-->
      <div>
        <el-table
          :data="tableData"
          class="authorized-strength-table"
          style="margin: -1px;width: auto;max-width: inherit"
          row-key="id"
          border
          default-expand-all
          :summary-method="getSummaries"
          show-summary
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
          <!--<el-table-column
            prop="parentSubjectName"
            label="预算名称"
          />-->
          <el-table-column
            prop="budgetSubjectName"
            label="预算科目"
          />
          <!--<el-table-column
            prop="assetName"
            label="项目"
          />-->
          <el-table-column
            prop="monthsTotal"
            label="小计"
          />
          <el-table-column
            :label="month + '月'"
            :prop="index + 'x'"
            v-for="({id, amount, month}, index) in (tableData[0] || {}).monthResults"
            :key="id"
          >
            <template slot-scope="scope">
              <el-input type="number" v-model="months[scope.$index][index].amount" min="0" />
              <!--{{((tableData[scope.$index] || {}).monthResults[index] || {}).amount}}-->
            </template>
          </el-table-column>
          <!--<el-table-column
            prop="address"
            fixed="right"
            label="操作"
          >
            <template>
              <el-button type="text" size="small">调整</el-button>
            </template>
          </el-table-column>-->
        </el-table>
      </div>
       <div class="text-right" style="margin: 20px;">
        <el-button type="primary" @click="save">保存</el-button>
        <el-button @click="reset">重置</el-button>
      </div>
      <!--</el-form>-->
    </div>
  </div>
</template>

<script>
/* eslint-disable camelcase */

import AssetType from '../../components/AssetType'
import ProjectAutoComplete from '../../components/ProjectAutoComplete'
import BudgetCharts from './BudgetCharts'
// import { BUDGET_TYPEs } from '../../components/const'
import { getAssetBudgetTemplateList, queryPlaitList, updatePlaitList } from '../../http/budget'
import { cloneDeep, reduce, isEmpty, forEach, padStart } from 'lodash-es'
import { mapState } from 'vuex'

export default {
  name: 'AuthorizedStrength',
  components: { AssetType, BudgetCharts, ProjectAutoComplete },
  data () {
    return {
      year: new Date(),
      assetId: void 0,
      updated: false,
      // budgetType: BUDGET_TYPEs[0].code,
      tableData: [],
      activeAssetType: 2,
      activeProjectId: 1,
      months: [],
    }
  },
  computed: mapState(['merchant']),
  created () {
    // this.budgetTypes = BUDGET_TYPEs
  },
  activated () {
    // this.queryPlaitList()
  },
  watch: {
    /* budgetType () {
      this.queryPlaitList()
    }, */
    activeAssetType () {
      this.queryPlaitList()
    }
  },
  methods: {
    assetType (activeAssetType) {
      this.activeAssetType = activeAssetType
    },
    selectProject ({ id }) {
      this.assetId = id
      if (id != null) {
        this.queryPlaitList()
      }
    },
    async queryPlaitList () {
      const { activeAssetType, year, assetId, budgetType } = this
      const yearFormat = new Date(year).getFullYear()
      const mainId = this.merchant.id

      const res = await queryPlaitList({ assetLayout: activeAssetType, year: yearFormat, budgetType, mainId, assetId })

      if (!isEmpty(res)) {
        this.tableData = res

        this.months = cloneDeep(res.map(({monthResults}) => monthResults))
      } else {
        const [template] = await getAssetBudgetTemplateList({mainId: this.merchant.id, assetLayout: activeAssetType})
        const { customDetailList } = template
        const result = reduce(customDetailList, (prev, {
          budgetSubjectCode: parentSubjectCode,
          budgetSubjectName: parentSubjectName,
          budgetType,
          child
        }) => {
          forEach(child, ({budgetSubjectCode, budgetSubjectName}) => {
            const item = {
              mainId,
              assetId,
              parentSubjectCode,
              parentSubjectName,
              budgetType,
              budgetSubjectCode,
              budgetSubjectName,
              monthsTotal: 0,
              monthResults: Array.from({ length: 12 }, (v, index) => ({
                year: yearFormat,
                month: padStart(index + 1 + '', 2, '0'),
                amount: 0
              }))
            }

            prev.push(item)
          })

          return prev
        }, [])

        this.tableData = result
        this.months = cloneDeep(result.map(({monthResults}) => monthResults))
      }
    },
    getSummaries (param) {
      const { columns, data } = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 0) {
          sums[index] = '小计'
          return
        }
        const values = data.map(item => {
          const { property } = column
          if (/x$/.test(property)) {
            const monthResults = item.monthResults
            const i = Number(property.replace('x', ''))

            return (monthResults && monthResults[i] && monthResults[i].amount) || 0
          }
          return Number(item[property])
        })
        if (!values.every(value => isNaN(value))) {
          sums[index] = values.reduce((prev, curr) => {
            const value = Number(curr)
            if (!isNaN(value)) {
              return prev + curr
            } else {
              return prev
            }
          }, 0).toFixed(2)
        } else {
          // sums[index] = 'N/A'
        }
      })

      return sums
    },
    save () {
      const {months, tableData} = this
      const data = reduce(tableData, (prev, {monthResults, ...rest}, index) => {
        rest.assetLayout = 2
        rest.months = months[index]
        prev.push(rest)

        return prev
      }, [])
      updatePlaitList(data).then((res) => {
        if (res === true) {
          this.updated = Math.random()
          this.$message({
            message: '修改预算编制成功！',
            type: 'success'
          })
        }
      })
    },
    reset () {
      this.months = this.tableData.map(({monthResults}) => monthResults)
    }
  }
}
</script>

<style lang="scss">
  /*.authorized-strength-chart {
    .el-tabs__header {
      margin-bottom: 0;
    }

    .el-tabs__nav {
      margin: 0 20px;
    }

    .el-tabs__item {
      height: 60px;
      line-height: 60px;
      font-size: 15px;
    }

    .el-tabs__nav-wrap::after {
      height: 1px;
      background-color: #E6E6E6;
    }
  }*/
  .authorized-strength-table {
    .el-input__inner {
      padding: 0 0 0 5px;
    }
  }
</style>

<style lang="scss" scoped>
  .state-container {
    padding: 14px 20px;
    font-size: 14px;
    color: #333;
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

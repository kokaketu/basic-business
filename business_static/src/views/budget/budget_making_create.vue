<!--预算编制详情-->
<template>
  <div id="budget_making_create" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="form" ref="form" size="small" label-width="120px">
        <el-form-item label="项目名称" prop="assetId" :rules="[{required:true,trigger:'blur',message:'请选择项目'}]">
          <el-select v-model="form.assetId" placeholder="请选择" @change="selectProject">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分期" prop="stagesId" :rules="[{required:true,trigger:'blur',message:'请选择分期'}]" v-if="assetLayout == 3">
          <el-select v-model="form.stagesId" placeholder="请选择">
            <el-option
              v-for="item in stagesList"
              class='select-option-selected'
              :key="item.id"
              :label="item.stagesName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="预算年份" prop="year" :rules="[{required:true,trigger:'blur',message:'请选择预算年份'}]">
          <el-date-picker
            placeholder="请选择"
            type="year"
            value-format="yyyy"
            v-model="form.year">
          </el-date-picker>
        </el-form-item>
      </el-form>
    </div>
    <div class="content-wrapper" style="background: #fff">
      <el-table
        :data="tableData"
        border
        :header-cell-style="headerCellStyle"
        :cell-style="cellStyle"
        default-expand-all
        class="authorized-strength-table"
        style="width: 100%"
        height="500"
        row-key="budgetSubjectCode">
        <el-table-column width="20" type="expand">
          <template slot-scope="props">
            <div class="child-table">
              <el-table
                :data="props.row.child"
                :border="true"
                :show-header="false"
                :cell-style="itemCellStyle">
                <el-table-column prop="budgetSubjectName" width="160">
                  <template slot-scope="scope">
                    <span v-if="!scope.row.isAdd">{{scope.row.budgetSubjectName}}</span>
                    <el-select
                      size="small"
                      v-model="scope.row.budgetSubjectCode"
                      placeholder="请选择"
                      no-data-text="请先在系统设置中新建预算科目"
                      v-if="scope.row.isAdd">
                      <el-option
                        v-for="item in scope.row.budgetSubjects"
                        :key="item.budgetSubjectCode"
                        :label="item.budgetSubjectName"
                        :value="item.budgetSubjectCode">
                      </el-option>
                    </el-select>
                  </template>
                </el-table-column>
                <el-table-column prop="monthsTotal" width="120" align="center"/>
                <el-table-column
                  v-for="({id, amount, month}, index) in props.row.child.length > 0 ? props.row.child[0].months : []"
                  :prop="index + 'x'"
                  :key="id"
                >
                  <template slot-scope="scope">
                    <el-input size="mini" type="number" @input="inputed" v-if="1" v-model="scope.row.months[index].amount" min="0"/>
<!--                    <InputNumber-->
<!--                      :value="scope.row.months[index].amount"-->
<!--                      placeholder=""-->
<!--                      className="input-unit"-->
<!--                      size="mini"-->
<!--                      unit=""-->
<!--                      min="0"-->
<!--                      @input="result => {scope.row.months[index].amount = result; inputed();}">-->
<!--                    </InputNumber>-->
                  </template>
                </el-table-column>
                <el-table-column align="center" width="">
                  <template slot-scope="scope">
<!--                    <el-link type="primary" @click.native="props.row.child.splice(scope.$index, 1)" :underline="false">删除</el-link>-->
                    <el-popconfirm
                      title="确认删除吗？删除后对应的执行填报和执行分析页，也将相应删除科目对应的所有数据。"
                      @onConfirm="props.row.child.splice(scope.$index, 1)"
                    >
                      <el-link slot="reference" type="primary" :underline="false">删除</el-link>
                    </el-popconfirm>
                  </template>
                </el-table-column>
              </el-table>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="budgetTypeName" label="科目" width="140" :resizable="false">
        </el-table-column>
        <el-table-column prop="monthsTotal" label="小计(元)" align="center" width="120" :resizable="false">
        </el-table-column>
        <el-table-column
          :resizable="false"
          v-for="({id, amount, label}, index) in tableData.length > 0 ? tableData[0].child[0].months : []"
          :prop="index + 'x'"
          :label="label"
          :key="id"
          align="center">
          <template slot-scope="scope">
            {{scope.row.months.length > 0 ? scope.row.months[index].amount : '0.00'}}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-link type="primary" @click.native="addRow(scope.row)" :underline="false">增加</el-link>
          </template>
        </el-table-column>
      </el-table>
      <div class="clearfix" style="padding: 20px 20px">
        <el-button @click="cancel" class="fr" style="margin-left: 10px">取消</el-button>
        <el-button @click="reset" class="fr" style="margin-left: 10px">重置</el-button>
        <el-button type="primary" @click="save" class="fr" :loading="saving">保存</el-button>
      </div>
    </div>
  </div>
</template>
<script>

import AssetType from '../../components/AssetType'
import ProjectAutoComplete from '../../components/ProjectAutoComplete'
import BudgetCharts from './BudgetCharts'
import { cloneDeep } from 'lodash-es'
import { mapState } from 'vuex'
import * as utils from '../../utils'
import { updatePlaitList, getAssetBudgetTemplateList } from '../../http/budget'
import { queryBsAssetStagesList } from '../../http/assets'
import { getBudgetSubjectList } from '@/http/budget_subject_setting'
import InputNumber from '@/components/InputNumber'

export default {
  name: 'budget_making_create',
  components: { AssetType, BudgetCharts, ProjectAutoComplete, InputNumber },
  data () {
    return {
      form: {
        stagesId: void 0
      },
      months: [
        {month: '01', amount: '0', label: '1月'},
        {month: '02', amount: '0', label: '2月'},
        {month: '03', amount: '0', label: '3月'},
        {month: '04', amount: '0', label: '4月'},
        {month: '05', amount: '0', label: '5月'},
        {month: '06', amount: '0', label: '6月'},
        {month: '07', amount: '0', label: '7月'},
        {month: '08', amount: '0', label: '8月'},
        {month: '09', amount: '0', label: '9月'},
        {month: '10', amount: '0', label: '10月'},
        {month: '11', amount: '0', label: '11月'},
        {month: '12', amount: '0', label: '12月'}
      ],
      assetLayout: null,
      tableData: [],
      stagesList: [],
      budgetSubjects: [],
      budgetSubjectsMap: {},
      saving: false
    }
  },
  created () {

  },
  activated () {
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    getAssetBudgetTemplateList({mainId: this.merchant.id}).then(res => {
      if (res || res.length > 0) {
        res[0].customDetailList.forEach(item => {
          item.child.forEach(subject => {
            subject.months = cloneDeep(this.months)
            subject.monthsTotal = 0
          })
        })
        this.tableData = cloneDeep(res[0].customDetailList)
        this.dataSum()
      }
    })
  },
  computed: mapState(['merchant', 'projectNameList']),
  watch: {
    'form.assetId': {
      handler (val) {
        this.form.stagesId = null
        if (this.assetLayout === '3') {
          queryBsAssetStagesList({mainId: this.merchant.id, limit: 999, assetId: val}).then(res => {
            this.stagesList = res.list
          })
        } else {
          this.stagesList = []
        }
      }
    }
  },
  methods: {
    save () {
      this.$refs['form'].validate(valid => {
        if (valid) {
          let selectedAsset = this.projectNameList.filter(res => { return res.id === this.form.assetId })[0]
          let params = []
          this.tableData.forEach(item => {
            item.child.forEach(subject => {
              subject.months.forEach(month => {
                month.year = this.form.year
                month.amount = !month.amount ? 0 : month.amount
              })
              subject.mainId = this.merchant.id
              subject.assetId = selectedAsset.id
              subject.assetName = selectedAsset.assetName
              subject.assetLayout = selectedAsset.assetLayout
              subject.parentSubjectCode = item.budgetSubjectCode
              subject.parentSubjectName = item.budgetSubjectName
              subject.stagesId = this.form.stagesId
              if (utils.isEmpty(subject.budgetSubjectName)) {
                subject.budgetSubjectName = (this.budgetSubjectsMap[subject.budgetSubjectCode] || {}).budgetSubjectName
              }
              params.push(subject)
            })
          })
          // 科目是否重复
          let hasRepeatSubject = false
          // 科目是否未填
          let hasEmptySubject = false
          // 判断科目不重复
          this.tableData.forEach(item => {
            let subjectCodes = item.child.map(res => res.budgetSubjectCode)
            let hash = {}
            for (var i in subjectCodes) {
              if (utils.isEmpty(subjectCodes[i])) {
                hasEmptySubject = true
              }
              if (hash[subjectCodes[i]]) {
                hasRepeatSubject = true
              }
              hash[subjectCodes[i]] = true
            }
          })
          if (hasRepeatSubject) {
            this.$message.error('科目不能重复')
            return false
          }
          if (hasEmptySubject) {
            this.$message.error('科目不能为空')
            return false
          }
          console.log('save params:')
          console.log(params)
          this.saving = !this.saving
          updatePlaitList(params).then(res => {
            this.saving = !this.saving
            if (res.code === '0') {
              this.$message({message: res.msg, type: 'success'})
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/budget/budget-making-list')
            }
          })
        } else {
          return false
        }
      })
    },
    addRow (row) {
      let newRow = {isAdd: true}
      for (let k in row.child[0]) {
        newRow[k] = row.child[0][k]
      }
      newRow.months = cloneDeep(this.months)
      newRow.budgetSubjectCode = ''
      newRow.budgetSubjectName = ''
      newRow.monthsTotal = 0
      this.getBudgetSubjectList().then(() => {
        newRow.budgetSubjects = this.budgetSubjects
          .filter(item => item.budgetType === newRow.budgetType)
          .filter(item => {
            if (row.child.every(sub => sub.budgetSubjectCode !== item.budgetSubjectCode)) {
              return item
            }
          })
        row.child.unshift(newRow)
      })
    },
    subjectChange (row) {
      row.budgetSubjectCode = row.subject.subjectCode
      row.budgetSubjectName = row.subject.subjectName
    },
    getBudgetSubjectList () {
      // if (this.budgetSubjects.length === 0) {
      return getBudgetSubjectList({mainId: this.merchant.id}).then((res) => {
        if (res) {
          this.budgetSubjects = res
          this.budgetSubjects.forEach(item => { this.budgetSubjectsMap[item.budgetSubjectCode] = item })
        }
      })
      // }
    },
    inputed () {
      this.dataSum()
    },
    dataSum () {
      this.tableData.forEach(item => {
        item.child.forEach(subject => {
          subject.months.forEach(res => { res.amount = res.amount * 1 > 999999999 ? 999999999 : res.amount })
          // 行合计
          subject.monthsTotal = subject.months.map(res => res.amount).reduce((p, c) => { return p * 1 + c * 1 }, 0).toFixed(2)
        })
        this.$set(item, 'monthsTotal', item.child.map(subject => subject.monthsTotal).reduce((a, b) => { return a * 1 + b * 1 }, 0).toFixed(2))
        let months = []
        item.child.forEach(subject => {
          for (let i = 0; i < 12; i++) {
            if (months[i]) {
              months[i].amount = (months[i].amount * 1 + subject.months[i].amount * 1).toFixed(2)
            } else {
              months.push({amount: (subject.months[i].amount * 1).toFixed(2)})
            }
          }
        })
        this.$set(item, 'months', months)
        // 横向合计+纵向合计
        // this.$set(item, 'monthsTotal', (item.monthsTotal * 1 + months.map(e => e.amount).reduce((a, b) => { return a * 1 + b * 1 }, 0)).toFixed(2))
      })
    },
    selectProject (assetId) {
      let selectedAsset = this.projectNameList.filter(res => { return res.id === assetId })[0]
      this.assetLayout = selectedAsset.assetLayout
    },
    reset () {
      this.tableData.forEach(item => {
        item.child.forEach(item1 => {
          item1.months.forEach(month => {
            month.amount = 0
          })
        })
      })
      this.dataSum()
      this.$message({message: '已重置', type: 'success'})
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/budget/budget-making-list')
    },
    cellStyle ({row, column, rowIndex, columnIndex}) {
      if ((rowIndex === 0 || rowIndex === 1) && columnIndex === 0) {
        return 'border-right:0;'
      }
    },
    itemCellStyle ({row, column, rowIndex, columnIndex}) {
      if (columnIndex < 1) {
        return 'padding-left: 30px'
      }
    },
    headerCellStyle ({row, column, rowIndex, columnIndex}) {
      if (rowIndex === 0 && columnIndex === 0) {
        return 'border-right:0;'
      }
    }
  }
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
  #budget_making_create{
    .el-table__expanded-cell{
      padding: 0px 0px;
    }
    .authorized-strength-table {
      .el-input__inner {
        padding: 0 0 0 5px;
        border: unset;
      }
    }
    .el-table th.gutter{
      display: table-cell!important;
    }
    .el-table .cell{
      padding-left: 3px;
      padding-right: 3px;
    }
    .child-table .el-table__body-wrapper{
      overflow-x: hidden;
    }
  }
</style>

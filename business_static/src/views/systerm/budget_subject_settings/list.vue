<!--预算科目设置template-->
<!-- 执行分析列表 -->
<template>
  <div id="budget_subject_list">

    <div class="table-wrapper" style="padding-bottom: 0">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">预算科目列表</el-button>
        <el-button class="btn pull-right" @click.native="createVisible = true">新建科目</el-button>
      </div>
      <!-- 主表 -->
      <el-table
        :data="tableData"
        :row-key="rowKeyFun"
        :tree-props="{children: 'finSubjectReqList', hasChildren: 'hasChildren'}"
        @row-click="detailOpen"
        style="width: 100%;"
      >
        <el-table-column label="科目编码" prop="budgetSubjectCode" width="200" />
        <el-table-column label="科目名称" prop="budgetSubjectName" width="200" />
        <el-table-column label="预算类型" width="200">
          <template slot-scope="scope">
            {{( budgetTypes.find(res => res.code === scope.row.budgetType) || {} ).name}}
          </template>
        </el-table-column>
        <!--
        <el-table-column label="业态类型" width="200">
          <template slot-scope="scope">
            {{( assetTypes.find(res => res.code === scope.row.assetLayout) || {} ).name}}
          </template>
        </el-table-column>
        -->
        <el-table-column label="款项名称" prop="finSubjectName" />
      </el-table>
    </div>
    <create :visible="createVisible" @close="createClose"/>
    <edit :visible="editVisible" @close="editClose" :data="currentRow"/>
    <detail :visible="detailVisible" @close="detailClose" @edit="editOpen" :data="currentRow"/>
  </div>
</template>

<script>

import { ASSET_TYPEs, BUDGET_TYPEs } from '@/components/const'
import { mapState } from 'vuex'
import { getBudgetSubjectList } from '@/http/budget_subject_setting'
import create from './create'
import edit from './edit'
import detail from './detail'

export default {
  components: { create, edit, detail },
  data () {
    return {
      filter: {
        mainId: null,
        assetId: void 0,
        assetLayout: null
      },
      createVisible: false,
      editVisible: false,
      detailVisible: false,
      tableData: [],
      currentRow: {},
    }
  },
  computed: mapState(['merchant']),
  activated () {
    this.getBudgetSubjectList()
  },
  created () {
    this.assetTypes = ASSET_TYPEs
    this.budgetTypes = BUDGET_TYPEs
  },
  methods: {
    getBudgetSubjectList () {
      getBudgetSubjectList({mainId: this.merchant.id}).then(res => {
        this.tableData = res
      })
    },
    rowKeyFun (row) {
      if (row.finSubjectCode) {
        return `${row.budgetSubjectId}-${row.finSubjectCode}`
      }
      return row.id
    },
    createClose (refresh) {
      this.createVisible = false
      if (refresh) {
        this.search()
      }
    },
    editOpen () {
      this.detailVisible = false
      this.editVisible = true
    },
    editClose (refresh) {
      this.editVisible = false
      if (refresh) {
        this.search()
      }
    },
    detailOpen (row) {
      // 只有点击预算科目才显示明细 点击科目里的款项不显示
      if (row.budgetSubjectCode) {
        this.currentRow = row
        this.detailVisible = true
      }
    },
    detailClose (refresh) {
      this.detailVisible = false
      if (refresh) {
        this.search()
      }
    },
    search () {
      this.getBudgetSubjectList()
    },
    reset () {
      this.filter = {mainId: this.merchant.id}
      this.budgetedPerformance(this.filter)
    },
    cellStyle ({row, column, rowIndex, columnIndex}) {
      if ((rowIndex === 0 || rowIndex === 1) && columnIndex === 0) {
        return 'border-right:0;'
      }
    },
    itemCellStyle ({row, column, rowIndex, columnIndex}) {
      if (columnIndex < 2) {
        return 'padding-left: 8px'
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
<style lang="scss">
  #budget_subject_list{
    .el-table__expanded-cell{
      padding: 0px 0px;
    }
    .el-table th.gutter{
      display: table-cell!important;
    }
    .el-table .cell{
      padding-left: 3px;
      padding-right: 3px;
    }
  }
</style>

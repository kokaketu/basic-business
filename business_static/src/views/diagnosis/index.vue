<!--
 * @Author: your name
 * @Date: 2020-07-14 19:08:50
 * @LastEditTime: 2020-10-27 16:07:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\index.vue
-->
<template>
  <div id="diagnosis" class="page">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select
            v-model="ruleForm.projectName"
            placeholder="请选择项目名称"
            clearable
            @change="getList">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.assetName">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="业态：" prop="assetLayout">
          <el-select
            v-model="ruleForm.assetLayout"
            multiple
            collapse-tags
            placeholder="请选择业态"
            @change="getList">
            <el-option
              v-for="item in [{name: '办公', value: '1'}, {name: '商业', value: '2'}, {name: '产业园', value: '3'}]"
              :key="item.value"
              :label="item.name"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="诊断区间：" prop="date">
          <el-date-picker
            v-model="ruleForm.date"
            type="daterange"
            range-separator="-"
            value-format="yyyy-MM-dd"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="getList()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">诊断报告</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="reportName"
          label="报告名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="projectName"
          label="项目名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="assetLayout"
          label="业态"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.assetLayout ? ['办公','商业','产业园'][scope.row.assetLayout - 1] : '-'}}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="诊断区间"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.year}}年Q{{scope.row.quarter}}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="updatedDate"
          label="报告更新时间"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{ scope.row.updatedDate? scope.row.updatedDate.slice(0,10): '-' }}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="dataStatus"
          label="状态"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>
              <span v-if="Number(scope.row.dataStatus) === 0">未提交数据</span>
              <span v-else-if="Number(scope.row.dataStatus) === 1">已提交数据</span>
              <span v-else>-</span>
            </span>
            <span>
              <span v-if="Number(scope.row.reportStatus) === 0">未生成报告</span>
              <span v-else-if="Number(scope.row.reportStatus) === 1">已生成报告</span>
              <span v-else>-</span>
            </span>
          </template>
        </el-table-column>
        <el-table-column
          prop="reportStatus"
          label="操作"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span style="color: #5E0EFF">
              <span style="cursor: pointer;" @click="goPage('create', scope.row)" v-if="Number(scope.row.dataStatus) === 0">提交数据</span>
              <span style="cursor: pointer;" @click="goPage('detail', scope.row)" v-else-if="Number(scope.row.dataStatus) === 1">查看数据</span>
              <span v-else>-</span>
            </span>
            <span>
              <span style="color: #999;" v-if="Number(scope.row.reportStatus) === 0">查看报告</span>
              <span style="cursor: pointer;color:#5E0EFF"  @click="goPage('report', scope.row)" v-else-if="Number(scope.row.reportStatus) === 1">查看报告</span>
              <span v-else>-</span>
            </span>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { queryDiagnoseList } from '@/http/diagnosis'
export default {
  data () {
    return {
      ruleForm: {
        projectName: null,
        assetLayout: null,
        date: null
      },
      tableData: []
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    getList () {
      const params = {
        projectName: this.ruleForm.projectName,
        layouts: this.ruleForm.assetLayout,
        startTime: this.ruleForm.date ? this.ruleForm.date[0] : null,
        endTime: this.ruleForm.date ? this.ruleForm.date[1] : null
      }
      queryDiagnoseList(params).then(res => {
        this.tableData = res
        const mock = [{
          id: 'detailc',
          reportName: '城汇大厦demo诊断报告',
          projectName: '城汇大厦demo',
          assetLayout: 1,
          year: '2019',
          quarter: '1',
          updatedDate: '2019-04-08',
          dataStatus: '1',
          reportStatus: '1'
        }, {
          id: 'detailw',
          reportName: '吾月广场demo诊断报告',
          projectName: '吾月广场demo',
          assetLayout: 2,
          year: '2019',
          quarter: '1',
          updatedDate: '2019-04-10',
          dataStatus: '1',
          reportStatus: '1'
        }]
        const mainId = Number(this.merchant.id)
        if (mainId === 101704) {
          this.tableData.push(...mock)
        }
      })
    },
    reset () {
      this.ruleForm = {
        projectName: null,
        assetLayout: null,
        date: null
      }
      this.getList()
    },
    drawerOpenDetail (row) {
      const id = row.id // detailc 、detailw
      if (id === 'detailc' || id === 'detailw') {
        this.$router.push(`/diagnosis/${id}`)
      }
    },
    goPage (type, data) {
      const assetLayout = Number(data.assetLayout)
      const {projectId, year, quarter} = data
      const params = {projectId, year, quarter}
      if (data.id === 'detailc' || data.id === 'detailw') {
        return false
      }
      if (assetLayout !== 1 && assetLayout !== 3) {
        this.$message({
          message: '暂未开发！',
          type: 'warning'
        })
      }
      if (assetLayout === 1) { // 办公
        this.$router.push(`/diagnosis/office/${type}/${JSON.stringify(params)}`)
      }
      if (assetLayout === 3) { // 产业园
        this.$router.push(`/diagnosis/park/${type}/${JSON.stringify(params)}`)
      }
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
  }
}
</script>
<style lang="scss" scoped>
#diagnosis{
  .btn-group{
    .btn{
      height: 32px;
      line-height: 32px;
      padding: 0 5px;
      min-width: 71px;
    }
  }
  .wrapper{
    width: 210px;
    height: 600px;
    margin: 0 auto;
    text-align: center;
    img{
      margin-top: 160px;
      width: 155px;
      height: 155px;
    }
    h2{
      height:28px;
      margin: 10px 0;
      font-size:20px;
      font-weight:500;
      color:rgba(51,51,51,1);
      line-height:28px;
    }
    p{
      height:22px;
      margin: 10px 0;
      font-size:16px;
      font-weight:400;
      color:rgba(153,153,153,1);
      line-height:22px;
    }
    .btn{
      width: 140px;
      margin-top: 15px;
    }
  }
}
</style>

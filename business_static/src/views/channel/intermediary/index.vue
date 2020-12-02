<!--
 * @Author: your name
 * @Date: 2020-10-26 14:10:06
 * @LastEditTime: 2020-10-30 14:18:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\channel\Intermediary.vue
-->
<template>
  <div id="intermediary" class="page">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="渠道名称：">
          <el-input placeholder="请输入中介名称" v-model="ruleForm.agencyName" @input="search()"></el-input>
        </el-form-item>

        <el-form-item label="渠道类型：">
          <el-select v-model="ruleForm.agencyType" @change="search()" clearable placeholder="请选择中介类型">
            <el-option
              v-for="item in types"
              class='select-option-selected'
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="渠道等级：">
          <el-select v-model="ruleForm.agencyLevel" @change="search()" clearable placeholder="请选择中介等级">
            <el-option
              v-for="item in levels"
              class='select-option-selected'
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="联系电话：">
          <el-input placeholder="请输入联系电话" v-model="ruleForm.mobile" @input="getList()"></el-input>
        </el-form-item>

        <!-- <el-form-item label="时间选择：">
          <el-date-picker
            v-model="ruleForm.date"
            type="daterange"
            value-format="yyyy-MM-dd"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item> -->
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">渠道列表</el-button>
        <!-- <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          :disabled="permission">报表导出</el-button> -->
        <el-button
          class="btn pull-right"
          :disabled="permission"
          @click.native="drawerOpenCreate">新建渠道</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="agencyName"
          label="渠道名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="agencyType"
          label="渠道类型"
          show-overflow-tooltip>
          <template slot-scope="scope">{{['中介公司','独立经纪'][scope.row.agencyType-1] || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="agencyLevel"
          label="渠道等级"
          show-overflow-tooltip>
          <template slot-scope="scope">{{['金牌','银牌','铜牌'][scope.row.agencyLevel-1] || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="mobile"
          label="联系电话"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.mobile || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="agencyScale"
          label="人数规模"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.agencyScale || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="seeCounts"
          label="带看次数(本年)"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.seeCounts || '-'}}</template>
        </el-table-column>
        <el-table-column
          label="成交次数(本年)"
          width="130px"
          show-overflow-tooltip
          prop="dealCounts">
          <template slot-scope="scope">{{scope.row.dealCounts || '-'}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { queryContactsPage } from '@/http/channel'
const types = [{id: 1, name: '中介公司'}, {id: 2, name: '独立经纪'}]
const levels = [{id: 1, name: '金牌'}, {id: 2, name: '银牌'}, {id: 3, name: '铜牌'}]
export default {
  data () {
    return {
      permission: '',
      types: types,
      levels: levels,
      ruleForm: {
        agencyName: null,
        agencyType: null,
        agencyLevel: null,
        mobile: null,
        date: null
      },
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
    }
  },

  computed: mapState(['merchant', 'permissionList']),
  methods: {
    getList () {
      queryContactsPage({
        id: null,
        mainId: this.merchant.id,
        agencyName: this.ruleForm.agencyName,
        agencyType: this.ruleForm.agencyType,
        agencyLevel: this.ruleForm.agencyLevel,
        mobile: this.ruleForm.mobile,
        timeStart: this.ruleForm.date ? this.ruleForm.date[0] : null,
        timeEnd: this.ruleForm.date ? this.ruleForm.date[0] : null,
        page: this.currentPage,
        limit: this.limit,
      }).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
      })
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    reset () {
      this.ruleForm = {
        agencyName: null,
        agencyType: null,
        agencyLevel: null,
        mobile: null,
        date: null
      }
      this.search()
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    drawerOpenDetail (rows) {
      this.$router.push('/channel/intermediary/detail/' + rows.id)
    },
    drawerOpenCreate () {
      this.$router.push('/channel/intermediary/create')
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getList()
  }
}
</script>
<style lang="scss" scoped>
</style>

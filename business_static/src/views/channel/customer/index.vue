<!--
 * @Author: your name
 * @Date: 2020-06-01 15:01:08
 * @LastEditTime: 2020-10-30 09:51:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\customer\index.vue
-->
<template>
  <div id="customer-list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="120px">
        <el-form-item label="客户全称：">
          <el-input v-model="ruleForm.fullNameKeywords" placeholder="请输入客户全称" @input="search()"></el-input>
        </el-form-item>

        <el-form-item label="客户状态：" prop="stage">
          <el-select
            clearable
            v-model="ruleForm.clientStatus"
            placeholder="请选客户状态"
            @change="search()">
            <el-option
              v-for="item in [{label: '潜在客户', value: '1'}, {label: '意向客户', value: '2'}, {label: '成交客户', value: '3'}, {label: '流失客户', value: '4'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="客户分类：" prop="customerCate">
          <el-select
            v-model="ruleForm.clientSort"
            placeholder="请选客户分类"
            @change="search()">
            <el-option
              v-for="item in [ {label: '办公', value: '1'},{label: '商业', value: '2'},{label: '产业园', value: '3'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="意向程度：" prop="intention">
          <el-select
            clearable
            v-model="ruleForm.intention"
            placeholder="请选意向程度"
            @change="search()">
            <el-option
              v-for="item in [{label: '一般', value: '1'}, {label: '中等', value: '2'}, {label: '强烈', value: '3'}, {label: '不感兴趣', value: '4'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="初次到访：" >
          <el-date-picker
            v-model="ruleForm.createdDate"
            type="daterange"
            range-separator="-"
            value-format="yyyy-MM-dd"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @input="search()">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button :disabled="permission" class="btn pull-right" @click.native="goCreate">新建客户</el-button>
      </div>
      <!-- 商业 -->
      <el-table
        :data="tableData"
        style="width: 100%;"
        v-show="beforeCompanySort == '2'"
        @row-click="goDetail">
        <el-table-column
          prop="fullName"
          label="客户全称">
        </el-table-column>
        <el-table-column
          prop="clientStatusStr"
          label="客户状态">
        </el-table-column>
        <el-table-column
          prop="intentionStr"
          label="意向程度">
        </el-table-column>
        <el-table-column
          prop="needAreaRange"
          label="需求面积(㎡)">
        </el-table-column>
        <el-table-column
          prop="expectPriceRange"
          label="期望价格(元/㎡/月)">
        </el-table-column>
        <el-table-column
          label="需求时间"
          prop="needDateRange"
          width="220px">
        </el-table-column>
        <el-table-column
          prop="clientSortStr"
          label="客户分类">
        </el-table-column>
        <el-table-column
          prop="brand"
          label="品牌">
        </el-table-column>
        <el-table-column
          prop="latestFollowUpDateStr"
          label="最新跟进时间"
          sortable>
        </el-table-column>
      </el-table>
      <!-- 办公 -->
      <el-table
        :data="tableData"
        style="width: 100%;"
        v-show="beforeCompanySort == '1' || beforeCompanySort == '3'"
        @row-click="goDetail">
        <el-table-column
          prop="fullName"
          label="客户全称">
        </el-table-column>
        <el-table-column
          prop="clientStatusStr"
          label="客户状态">
        </el-table-column>
        <el-table-column
          prop="intentionStr"
          label="意向程度">
        </el-table-column>
        <el-table-column
          prop="needAreaRange"
          label="需求面积(㎡)">
        </el-table-column>
        <el-table-column
          prop="expectPriceRange"
          label="期望价格(元/㎡/月)">
        </el-table-column>
        <el-table-column
          label="需求时间"
          prop="needDateRange"
          width="220px">
        </el-table-column>
        <el-table-column
          prop="clientSortStr"
          label="客户分类">
        </el-table-column>
        <el-table-column
          prop="industryStr"
          label="行业">
        </el-table-column>
        <el-table-column
          prop="latestFollowUpDateStr"
          label="最新跟进时间"
          sortable>
          <template slot-scope="scope">{{scope.row.latestFollowUpDateStr || '-'}}</template>
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
import {getCustomerList} from '@/http/rentControl'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        clientSort: '1'
      },
      customerList: [],
      beforeCompanySort: '2',
      currentPage: 1,
      total: 0,
      tableData: []
    }
  },
  watch: {
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    // 获取客户列表
    search (page) {
      this.currentPage = page || 1
      if (this.ruleForm.clientSort !== this.beforeCompanySort) {
        this.beforeCompanySort = this.ruleForm.clientSort
        // this.currentPage = 1
      }
      let params = {
        page: page || this.currentPage,
        limit: 10,
        mainId: this.merchant.id,
        fullNameKeywords: this.ruleForm.fullNameKeywords,
        clientStatus: this.ruleForm.clientStatus,
        clientSort: this.ruleForm.clientSort,
        intention: this.ruleForm.intention,
        recordStartTime: this.ruleForm.createdDate ? this.ruleForm.createdDate[0] : null,
        recordEndTime: this.ruleForm.createdDate ? this.ruleForm.createdDate[1] : null
      }
      getCustomerList(params).then(res => {
        this.tableData = res.data.list
        this.total = res.data.total * 10
      })
    },
    reset () {
      this.ruleForm = {
        clientSort: '1'
      }
      this.currentPage = 1
      this.search()
    },

    handleCurrentChange (val) {
      this.currentPage = val
      this.search(val)
    },
    goDetail (rows) {
      const companyId = rows.id
      this.$router.push('/channel/customer/detail/' + companyId)
    },
    goCreate () {
      this.$router.push('/channel/customer/create')
    }
  },
  components: {
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.search()
  }
}
</script>
<style lang="scss" scoped>
#tenant-list{
  $purple: #5E0EFF;
  .block{
    background: #fff;
    padding: 20px;
    margin-bottom: 20px;
  }
  .tabs{
    margin-top: 8px;
    li{
      position: relative;
      float: left;
      height: 20px;
      padding: 0 10px;
      font-size:15px;
      font-weight:400;
      line-height:21px;
      &::after{
        position: absolute;
        top: 3px;
        right: 0;
        display: block;
        content: '';
        height: 14px;
        width: 2px;
        border-right: 1px solid rgba(151, 151, 151, 1);
      }
    }
    li:first-child{
      padding-left: 0;
    }
    li:last-child{
      &::after{
        display: none;
      }
    }
    .active{
      color: $purple;
    }
  }
}
</style>

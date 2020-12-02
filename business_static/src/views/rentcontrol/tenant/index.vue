<!--
 * @Author: your name
 * @Date: 2020-06-01 15:01:08
 * @LastEditTime: 2020-09-04 14:31:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\tenant\index.vue
-->
<template>
  <div id="tenant-list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目：" prop="projectName">
          <el-select
            clearable
            v-model="ruleForm.projectName"
            placeholder="请选择项目"
            @change="selectProject()">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="租户全称：" prop="tenantName">
          <el-input v-model="ruleForm.tenantName" placeholder="请输入租户全称" @input="search()"></el-input>
        </el-form-item>

        <el-form-item label="租户分类：" prop="stage">
          <el-select
            v-model="ruleForm.companySort"
            placeholder="请选租户分类"
            @change="search()">
            <el-option
              v-for="item in companySort"
              class='select-option-selected'
              :key="item.code"
              :label="item.name"
              :value="item.code">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button :disabled="permission" class="btn pull-right" @click.native="goCreate">新建租户</el-button>
      </div>
      <!-- 商业 -->
      <el-table
        :data="tableData"
        style="width: 100%;"
        v-show="beforeCompanySort == '2'"
        @row-click="goDetail">
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
          </template>
        </el-table-column>
        <!-- <el-table-column
          prop="assetName"
          label="项目">
        </el-table-column> -->
        <el-table-column
          prop="companyName"
          label="租户全称">
        </el-table-column>
        <el-table-column
          prop="companyShortName"
          label="租户简称">
        </el-table-column>
        <el-table-column
          prop="companySortName"
          label="租户分类">
        </el-table-column>
        <el-table-column
          prop="companyTypeName"
          label="租户类型">
        </el-table-column>
        <el-table-column
          prop="companyBrand" show-overflow-tooltip
          label="品牌">
        </el-table-column>
        <el-table-column
          label="经营业态" show-overflow-tooltip
          prop="operatingLayoutName">
        </el-table-column>
        <el-table-column
          prop="operatingTypeName"
          label="经营类型">
        </el-table-column>
      </el-table>
      <!-- 办公 -->
      <el-table
        :data="tableData"
        style="width: 100%;"
        v-show="beforeCompanySort == '1'  || beforeCompanySort == '3' "
        @row-click="goDetail">
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click="forwardToProject(scope.row)" :underline="false">
              {{scope.row.assetName}}
            </el-link>
          </template>
        </el-table-column>
        <!-- <el-table-column
          prop="assetName"
          label="项目">
        </el-table-column> -->
        <el-table-column
          prop="companyName"
          label="租户全称">
        </el-table-column>
        <el-table-column
          prop="companyShortName"
          label="租户简称">
        </el-table-column>
        <el-table-column
          prop="companySortName"
          label="租户分类">
        </el-table-column>
        <el-table-column
          prop="companyTypeName"
          label="租户类型">
        </el-table-column>
        <el-table-column
          label="行业"
          prop="companyIndustryName">
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
import { initCompany, getPageCompany } from '@/http/rentControl'
import { mapState } from 'vuex'

export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        projectName: '',
        tenantName: '',
        companySort: '1'
      },
      beforeCompanySort: '2',
      currentPage: 1,
      total: 0,
      tableData: [],
      companySort: [],
      companyType: [],
      operatingType: [],
      companyIndustry: [],
      brandLayout: [],
      brandLevel: [],
    }
  },
  watch: {
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    initCompany () {
      initCompany().then(res => {
        this.companySort = res.companySort
        this.companyType = res.companyType
        this.operatingType = res.operatingType
        this.companyIndustry = res.companyIndustry
        this.brandLayout = res.brandLayout
        this.brandLevel = res.brandLevel
      })
    },
    forwardToProject (e) {
      event.stopPropagation()
      this.$router.push('/asset/project/detail/' + e.assetId)
    },
    selectProject () {
      this.currentPage = 1
      if (this.ruleForm.projectName != null && this.ruleForm.projectName != '') {
        let obj = {}
        obj = this.projectNameList.find(
          item => {
            return item.id === this.ruleForm.projectName // 筛选出对应数据
          }
        )
        this.ruleForm.companySort = obj.assetLayout
      }
      this.search()
    },
    // 获取列表
    search (page) {
      this.currentPage = page || 1
      if (!this.ruleForm.companySort || this.ruleForm.companySort == null) {
        this.ruleForm.companySort = '1'
        // this.currentPage = 1
      } else if (this.ruleForm.companySort !== this.beforeCompanySort) {
        this.beforeCompanySort = this.ruleForm.companySort
        // this.currentPage = 1
      }
      let params = {
        pageNum: page || this.currentPage,
        pageSize: 10,
        mainId: this.merchant.id,
        assetId: this.ruleForm.projectName,
        city: '',
        companyName: this.ruleForm.tenantName,
        companyIndustry: '',
        brandLayout: '',
        companySort: this.ruleForm.companySort
      }
      getPageCompany(params).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
      })
    },
    reset () {
      this.ruleForm = {
        projectName: '',
        tenantName: '',
        companySort: '2'
      }
      this.currentPage = 1
      this.beforeCompanySort = '2'
      this.search()
    },
    handleCurrentChange (val) {
      this.pageNum = val
      this.search(this.pageNum)
    },
    goDetail (rows) {
      const companyId = rows.id
      this.$router.push('/rentcontrol/tenant/detail/' + companyId)
    },
    goCreate () {
      this.$router.push('/rentcontrol/tenant/create')
    }
  },
  components: {
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.search()
    this.initCompany()
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
        width: 2;
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

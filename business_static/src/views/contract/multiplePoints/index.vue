<!--
 * @Author: your name
 * @Date: 2020-08-24 15:40:25
 * @LastEditTime: 2020-09-01 17:13:57
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\multiplePoints\index.vue
-->
<template>
  <div id="contract-list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm" size="small" label-width="90px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select
            v-model="ruleForm.projectName"
            placeholder="请选择项目"
            clearable
            @change="search">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同编号：" prop="contractNumber">
          <el-input
            v-model="ruleForm.contractNumber"
            @input="search"
            placeholder="请输入合同编号" ></el-input>
        </el-form-item>
        <el-form-item label="业态：" prop="assetLayout">
          <el-select
            v-model="ruleForm.assetLayout"
            placeholder="请选择业态"
            @change="search">
            <el-option
              v-for="item in assetLayoutList"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="多经编号：" prop="rentUnitId">
          <el-input
            v-model="ruleForm.rentUnitId"
            @input="search"
            placeholder="请输入多经编号"></el-input>
        </el-form-item>

        <el-form-item label="租户名称：" prop="tenant">
          <el-autocomplete
            v-model="ruleForm.tenant"
            :trigger-on-focus="false"
            :fetch-suggestions="querySearchAsync"
            placeholder="请输入租户，支持模糊搜索"
            @blur="isSelectedRent"
            @select="handleSelect">
          </el-autocomplete>
        </el-form-item>

        <el-form-item label="合同状态：" prop="contractState">
          <el-select
            v-model="ruleForm.contractState"
            placeholder="请选择合同状态"
            @change="search">
            <el-option
              v-for="item in contractStatusList"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同期限：">
          <el-date-picker
            v-model="ruleForm.openingDate"
            type="daterange"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @input="search">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search">搜索</el-button>
        <el-button class="btn btn-default" @click="reset">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button :disabled="permission" class="btn pull-right" @click.native="createContract">新建合同</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="openDetails">
        <el-table-column label="合同编号">
          <template slot-scope="scope">
            <span>{{scope.row.contNo}}</span>
          </template>
        </el-table-column>
        <el-table-column label="项目名称">
          <template slot-scope="scope">
            <el-link @click.stop="forwardToProject(scope.row)" :underline="false">
              {{scope.row.project.name}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column label="多经编号" show-overflow-tooltip>
          <template slot-scope="scope">
            <span v-for="(item, index) in scope.row.rentalUnits" :key="index">
              {{item.name}}
              <span v-show="index < scope.row.rentalUnits.length-1">,</span>
            </span>
          </template>
        </el-table-column>
        <el-table-column label="租户">
          <template slot-scope="scope">
            <el-link @click.stop="forwardToRentName(scope.row)" :underline="false">
              {{scope.row.companyName}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column v-if="ruleForm.assetLayout != 2" prop="industryName" label="行业"> </el-table-column>
        <el-table-column v-if="ruleForm.assetLayout == 2" prop="brandName" label="品牌"> </el-table-column>
        <el-table-column label="合同期限">
          <template slot-scope="scope">
            <span>{{scope.row.contStartDate}}~{{scope.row.contEndDate}}</span>
          </template>
        </el-table-column>
        <el-table-column label="合同状态">
          <template slot-scope="scope">
            <span :style="{color: colors[scope.row.contStatus.code - 1]}">{{scope.row.contStatus.name}}</span>
          </template>
        </el-table-column>
        <el-table-column prop="createdDate" label="创建时间" sortable></el-table-column>
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
import {
  getRentNameList,
  getList
} from '@/http/contract'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      permission: '',
      contractStatusList: [
        { value: '1', label: '待生效' },
        { value: '2', label: '已生效' },
        { value: '3', label: '已过期' },
        { value: '4', label: '已解约' },
        { value: '5', label: '已作废' }
      ],
      ruleForm: {
        projectName: '',
        contractNumber: '',
        assetLayout: '1',
        rentUnitId: '',
        tenant: '',
        tenantId: '',
        contractState: '',
        openingDate: ''
      },
      colors: ['#000000', '#000000', '#D80000', '#F5A623', '#F5A623'],
      tableData: [],
      currentPage: 1,
      total: 0
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList', 'assetLayoutList']),
  methods: {
    querySearchAsync (queryString, cb) {
      let params = {
        mainId: this.merchant.id,
        assetId: this.ruleForm.projectName,
        companyName: this.ruleForm.tenant,
        pageNum: '1',
        pageSize: '10'
      }
      getRentNameList(params).then(res => {
        let data = res.list
        data.map(item => (item.value = item.companyName))
        cb(data)
      })
    },
    handleSelect (item) {
      this.ruleForm.tenantId = item.id
      this.search()
    },
    isSelectedRent () {
      if (!this.ruleForm.tenant) {
        this.ruleForm.tenantId = ''
      }
      if (this.ruleForm.tenant && !this.ruleForm.tenantId) {
        this.ruleForm.tenant = ''
      }
    },
    getList () {
      let daterange, contStartDate, contEndDate
      daterange = this.ruleForm.openingDate
      if (daterange) {
        contStartDate = daterange[0]
        contEndDate = daterange[1]
      } else {
        contStartDate = ''
        contEndDate = ''
      }
      let params = {
        assetId: this.ruleForm.projectName,
        contNo: this.ruleForm.contractNumber,
        companyId: this.ruleForm.tenantId,
        contSort: this.ruleForm.assetLayout,
        contType: 2,
        contStatus: this.ruleForm.contractState,
        contStartDate: contStartDate,
        contEndDate: contEndDate,
        createStartDate: null,
        createEndDate: null,
        pageNum: this.currentPage,
        pageSize: '10',
        rentalUnitNo: this.ruleForm.rentUnitId
      }
      getList(params).then(res => {
        if (res) {
          res.list.forEach(item => {
            item.createdDate = item.createdDate.substr(0, 10)
          })
          this.tableData = res.list
          this.total = res.total * 10
        }
      })
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    openDetails (row) {
      const assetLayout = this.ruleForm.assetLayout
      const params = `${assetLayout}&${row.id}`
      this.$router.push(`/contract/multiplePoints/detail/${params}`)
    },
    reset () {
      this.ruleForm = {
        assetLayout: '1'
      }
      this.currentPage = 1
      this.getList()
    },
    createContract () {
      this.$router.push('/contract/multiplePoints/create')
    },
    forwardToProject (row) {
      this.$router.push('/asset/project/detail/' + row.project.id)
    },
    forwardToRentName (row) {
      this.$router.push('/rentcontrol/tenant/detail/' + row.company.id)
    }
  },
  components: {
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.$store.dispatch('setAssetLayoutEnum')
    this.getList()
  }
}
</script>
<style lang="scss" scoped>
  #contract-list {
    .block {
      background: #fff;
      padding: 20px;
      margin-bottom: 20px;
    }
  }
</style>
<style lang="scss">
  #contract-list .el-date-editor .el-range-separator{
    line-height: 24px;
  }

  #contract-list .text-underline {
    color: #000;
  }
</style>

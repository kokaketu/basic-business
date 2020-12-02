<template>
  <div id="home" class="clearfix">
    <div class="report-wrapper">
      <div slot="header" class="table-header clearfix">
        <span class=""><img src="../../assets/icon-home-dig-report.svg"/>诊断报告</span>
        <el-link @click="$router.push('/diagnosis/index')" :underline="false">更多<i class="el-icon-arrow-right el-icon--right"></i></el-link>
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
          prop="rentableArea"
          label="诊断区间"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span>{{scope.row.year}}年Q{{scope.row.quarter}}</span>
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
    <div class="entrance-wrapper">
      <div slot="header" class="table-header" style="border-bottom: 1px solid #EFEFEF">
        <span class=""><img src="../../assets/icon-home-entrance.svg"/>快速入口</span>
      </div>
      <div style="padding: 20px">
        <el-row :gutter="20">
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link " :underline="false" @click.native="goto('/contract/index')">
                <img src="../../assets/icon-home-contract.svg"/>&nbsp;查看合同
              </el-link>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link" :underline="false" @click.native="goto('/channel/customer')">
                <img src="../../assets/icon-home-customer.svg"/>&nbsp;客户跟进
              </el-link>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link" :underline="false" @click.native="goto('/financial/receivables')">
                <img src="../../assets/icon-home-receivable-view.svg"/>&nbsp;查看应收
              </el-link>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link" :underline="false" @click.native="goto('/financial/receiveds')">
                <img src="../../assets/icon-home-received.svg"/>&nbsp;实收
              </el-link>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link" :underline="false" @click.native="goto('/asset/project')">
                <img src="../../assets/icon-home-create.svg"/>&nbsp;查看项目
              </el-link>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="grid-content bg-purple">
              <el-link class="col-link" :underline="false" @click.native="goto('/operation/analysis')">
                <img src="../../assets/icon-home-analysis-view.svg"/>&nbsp;查看经营分析
              </el-link>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <div class="content-wrapper">
      <div slot="header" class="table-header">
        <span class=""><img src="../../assets/icon-home-investment.svg"/>我的招商计划</span>
        <el-link :underline="false" @click.native="goto('/channel/investment')">更多<i class="el-icon-arrow-right el-icon--right"></i></el-link>
      </div>
      <el-table
        :data="plans">
        <el-table-column label="项目" prop="assetName"/>
        <el-table-column label="铺位" prop="leaseNo"/>
        <el-table-column label="建筑面积(㎡)" prop="buildingArea" align="right">
          <template slot-scope="scope">
            {{scope.row.buildingArea | comdify}}
          </template>
        </el-table-column>
        <el-table-column label="业态" prop="attractLayoutName"/>
        <el-table-column label="品牌" prop="attractBrand"/>
        <el-table-column label="计划完成时间">
          <template slot-scope="scope">{{scope.row.plannedCompletionDate|dateFormat}}<span></span></template>
        </el-table-column>
      </el-table>
    </div>
    <div class="content-wrapper">
      <div slot="header" class="table-header">
        <span class=""><img src="../../assets/icon-home-mycustomer.svg"/>我跟进的客户</span>
        <el-link :underline="false" @click.native="goto('/channel/customer')">更多<i class="el-icon-arrow-right el-icon--right"></i></el-link>
      </div>
      <el-table
        :data="customers">
        <el-table-column label="客户名称" prop="fullName"/>
        <el-table-column label="创建日期">
          <template slot-scope="scope"><span>{{scope.row.createdDate|dateFormat}}</span></template>
        </el-table-column>
        <el-table-column label="未跟进天数(天)" prop="nonFollowDay" align="right" />
      </el-table>
    </div>
    <div class="content-wrapper" v-if="false">
      <div slot="header" class="table-header">
        <span class=""><img src="../../assets/icon-home-sale.svg"/>销售额录入</span>
        <el-link :underline="false" @click.native="goto('/operation/sale-amount')">更多<i class="el-icon-arrow-right el-icon--right"></i></el-link>
      </div>
      <el-table
        :data="sales">
        <el-table-column label="项目" prop="name"/>
        <el-table-column label="合同编号" prop="name"/>
        <el-table-column label="铺位" prop="name">
          <template slot-scope="scope">{{scope.row.name || '-'}}</template>
        </el-table-column>
        <el-table-column label="销售时间" prop="name"/>
      </el-table>
    </div>
      <div class="content-wrapper">
        <div slot="header" class="table-header">
          <span class=""><img src="../../assets/icon-home-receivable.svg"/>我的催收</span>
          <el-link :underline="false" @click.native="goto('/financial/arrears')">更多<i class="el-icon-arrow-right el-icon--right"></i></el-link>
        </div>
      <el-table
        :data="receivables">
        <el-table-column label="项目" prop="assetName"/>
        <el-table-column label="合同编号" prop="contNo"/>
        <el-table-column label="铺位" prop="storeNo">
          <template slot-scope="scope">{{scope.row.storeNo || '-'}}</template>
        </el-table-column>
        <el-table-column label="金额(元)" prop="arrearsMoney" align="right">
          <template slot-scope="scope">{{scope.row.arrearsMoney | comdify}}</template>
        </el-table-column>
        <el-table-column label="已欠费天数(天)" prop="arrearsDays" align="right"/>
      </el-table>
    </div>
  </div>
</template>

<script>

import {getTodoAttract, getTodoClient, getTodoArrears} from '@/http/home'
import { queryDiagnoseList } from '@/http/diagnosis'
import {mapState} from 'vuex'
import * as utils from '../../utils/index'

export default {
  name: 'home',
  data () {
    return {
      mainId: '',
      reports: [],
      plans: [],
      customers: [],
      sales: [],
      receivables: [],
      tableData: []
    }
  },
  computed: mapState(['merchant']),
  activated () {
    // 诊断报告
    this.getReports()
    // 招商计划
    this.getPlans()
    // 客户
    this.getCustomers()
    // 销售
    this.getSales()
    // 催收
    this.getReceivables()
    //
    this.getList()
  },
  filters: {
    dateFormat: function (value, template = 'YYYY-MM-DD') {
      if (utils.isNotEmpty(value)) {
        return utils.format(value, template)
      } else {
        return '-'
      }
    }
  },
  methods: {
    getList () {
      const params = {
        projectName: null,
        layouts: null,
        startTime: null,
        endTime: null
      }
      queryDiagnoseList(params).then(res => {
        // this.tableData = res.length > 0 ? res.filter(item => (Number(item.assetLayout) === 1)) : res
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
        this.tableData = this.tableData.length > 5 ? this.tableData.slice(0, 5) : this.tableData
      })
    },
    drawerOpenDetail (row) {
      const id = row.id
      if (id === 'detailc') {
        this.$router.push('/diagnosis/detailc')
      } else if (id === 'detailw') {
        this.$router.push('/diagnosis/detailw')
      }
    },
    goPage (type, data) {
      const assetLayout = Number(data.assetLayout)
      const {projectId, year, quarter} = data
      const params = {projectId, year, quarter}
      if (data.id === 'detailc' || data.id === 'detailw') {
        return false
      }
      if (assetLayout === 1) { // 办公
        this.$router.push(`/diagnosis/office/${type}/${JSON.stringify(params)}`)
      } else if (assetLayout === 3) { // 产业园
        this.$router.push(`/diagnosis/park/${type}/${JSON.stringify(params)}`)
      } else {
        this.$message({
          message: '暂未开发！',
          type: 'warning'
        })
      }
    },
    goto (route) {
      this.$router.push(route)
    },
    getReports () {

    },
    getPlans () {
      getTodoAttract({mainId: this.merchant.id}).then(res => {
        if (res.list && res.list.length > 5) {
          this.plans = res.list.slice(0, 5)
        } else {
          this.plans = res.list
        }
        this.plans.forEach(item => {
          item.attractLayoutName = item.attractLayoutName || '-'
          item.attractBrand = item.attractBrand || '-'
        })
      })
    },
    getCustomers () {
      getTodoClient({mainId: this.merchant.id}).then(res => {
        if (res.list && res.list.length > 5) {
          this.customers = res.list.slice(0, 5)
        } else {
          this.customers = res.list
        }
      })
    },
    getSales () {
      // getTodoSales({mainId: this.merchant.id})
    },
    getReceivables () {
      getTodoArrears({mainId: this.merchant.id}).then(res => {
        if (res.list && res.list.length > 5) {
          this.receivables = res.list.slice(0, 5)
        } else {
          this.receivables = res.list
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
<style lang="scss">
  #home{
    position: relative;
    .report-wrapper {
      width: 60%;
      height: 330px;
      padding-bottom: 20px;
      background: #fff;
      float: left;
    }
    .entrance-wrapper {
      position: absolute;
      left: 60%;
      top: 0;
      right: 0;
      height: 330px;
      padding-bottom: 20px;
      margin-left: 20px;
      background: #fff;
    }
    .content-wrapper {
      width: 100%;
      height: 330px;
      margin-top: 20px;
      padding-bottom: 20px;
      background: #fff;
      float: left;
    }

    .table-header{
      padding: 10px 20px;
      height:30px;
      font-size:15px;
      font-family:PingFangSC-Medium,PingFang SC;
      font-weight:500;
      color:rgba(51,51,51,1);
      line-height:30px;
      box-sizing: content-box;
      span{
        img{line-height: 30px}
      }
      .el-link{
        float: right;
        width:50px;
        height:30px;
        font-size:12px;
        font-family:PingFangSC-Regular,PingFang SC;
        font-weight:400;
        color:rgba(153,153,153,1);
      }
      .el-link--default{
        color:rgba(153,153,153,1) !important;
      }
    }
    .el-card__header{
      padding: 12px 12px;
    }
    .el-card__body{
      padding: 0;
    }
    .el-row {
      margin-bottom: 15px;
      &:last-child {
        margin-bottom: 0;
      }
    }
    .el-col {
      border-radius: 4px;
    }
    .bg-purple-dark {
      background: rgba(247,247,247,1);
    }
    .bg-purple {
      background: rgba(247,247,247,1);
    }
    .bg-purple-light {
      background: #e5e9f2;
    }
    .grid-content {
      min-height: 46px;
      img {
        margin-top: 0;
      }
    }
    .row-bg {
      padding: 10px 0;
      background-color: #f9fafc;
    }
    .grid-content:hover{
      background-color: rgba(239,239,239,1);
    }
    .col-link{
      padding-left: 20px;
      height:auto;
      font-size:14px;
      font-family:PingFangSC-Regular,PingFang SC;
      font-weight:400;
      color:rgba(51,51,51,1) !important;
      line-height: 46px;
    }

    img{
      vertical-align: middle;
      margin-top: -3px;
      margin-right: 4px;
    }
    .el-table::before {
      height: 0px;
    }
    .el-table th {
      height: 50px;
      padding: 10px 10px;
      font-weight: normal;
      font-size: 15px;
      color: #808080;
      background: #fbfbfb;
      border-bottom: none;
    }
    .el-table td {
      height: 50px;
      padding: 6px 10px;
      font-size: 15px;
      color: #000;
    }
  }
</style>

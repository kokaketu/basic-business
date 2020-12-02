<!--
 * @Author: your name
 * @Date: 2020-09-15 17:19:48
 * @LastEditTime: 2020-09-21 09:59:16
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\office\report.vue
-->
<template>
  <div id="diagnosis-report">
    <div class="iframe-wrapper">
    <div class="filter">
      <el-select
        class="pull-left"
        v-model="reportId"
        placeholder="请选择季度"
        @change="changeDate(reportId)">
        <el-option
          class='select-option-selected'
          v-for="item in dateList"
          :key="item.reportId"
          :label="item.reportDate"
          :value="item.reportId">
        </el-option>
      </el-select>
      <el-button
        class="btn pull-right"
        :disabled="permission"
        @click="cochain"
        style="margin-right: 20px">{{chainStatus ? '重新上链' : '上链'}}报告</el-button>
      <el-button
        class="btn pull-right"
        :disabled="permission"
        @click.native="getReport"
        style="margin-right: 10px">下载报告</el-button>
    </div>
      <iframe :src="url" frameborder="0"></iframe>
    </div>
  </div>
</template>
<script>
// import { ebaasProcess } from '@/utils/ebass/process'
import { getNow, queryReportDateList } from '@/http/diagnosis'
import { mapState } from 'vuex'

export default {
  data () {
    return {
      projectId: '',
      year: '',
      quarter: '',
      layout: '1',
      reportId: '',
      url: '',
      permission: '',
      chainStatus: false,
      dateList: []
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    getReport () {
      const params = {
        projectId: this.projectId,
        year: this.year,
        quarter: this.quarter,
        layout: this.layout,
        reportType: 'pdf'
      }
      getNow(params).then(res => {
        const { data, fileName } = res
        let blob = new Blob([data], {type: 'application/pdf'})
        let url = URL.createObjectURL(blob)
        let a = document.createElement('a')
        a.download = decodeURIComponent(fileName)
        a.href = url
        document.body.appendChild(a)
        a.click()
        document.body.removeChild(a)
      })
    },
    cochain () {
      this.$message({
        message: '开发中',
        type: 'warning'
      })
      // let params = {
      //   merchantId: this.merchant.id,
      //   id: this.$route.params.id,
      //   dataType: 'BS_ASSET'
      // }
      // ebaasProcess.init(params, () => {
      //   this.chainStatus = true
      // })
    },
    changeDate (reportId) {
      this.dateList.map(item => {
        if (item.reportId === this.reportId) {
          this.year = item.year
          this.quarter = item.quarter
        }
      })
      const { layout, projectId, year, quarter } = this
      const hostname = window.location.hostname
      const isDev = hostname.includes('test') || hostname.includes('local')
      this.url = isDev
        ? `http://test-asset.caicchina.com/office-pdf/index.html?projectId=${projectId}&year=${year}&quarter=${quarter}&layout=${layout}&env=test`
        : `https://asset.caicchina.com/office-pdf/index.html?projectId=${projectId}&year=${year}&quarter=${quarter}&layout=${layout}&env=product`
    },
    reportDateList () {
      queryReportDateList(this.projectId).then(res => {
        this.dateList = res.data
        this.dateList.map(item => {
          if (item.year === this.year && item.quarter === this.quarter) {
            this.reportId = item.reportId
          }
        })
      })
    },
    initReportUrl () {
      const params = this.$route.params.data
      const {projectId, year, quarter} = JSON.parse(params)
      this.projectId = projectId
      this.year = year
      this.quarter = quarter
      const {layout} = this
      const hostname = window.location.hostname
      const isDev = hostname.includes('test') || hostname.includes('local')
      this.url = isDev
        ? `http://test-asset.caicchina.com/office-pdf/index.html?projectId=${projectId}&year=${year}&quarter=${quarter}&layout=${layout}&env=test`
        : `https://asset.caicchina.com/office-pdf/index.html?projectId=${projectId}&year=${year}&quarter=${quarter}&layout=${layout}&env=product`
      this.reportDateList()
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.initReportUrl()
  }
}
</script>
<style scoped lang="scss">
#diagnosis-report{
  .iframe-wrapper{
    height: calc(100vh - 150px);
    background: #fff;
    .filter{
      height: 85px;
      padding: 25px 20px;
      box-sizing: border-box;
    }
    iframe{
      width: 100%;
      height: calc(100vh - 235px);
    }
  }
}
</style>

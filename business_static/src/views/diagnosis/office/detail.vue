<!--
 * @Author: your name
 * @Date: 2020-09-11 11:33:11
 * @LastEditTime: 2020-09-11 20:54:41
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\office\detail.vue
-->
<template>
  <div id="diagnosis-office-detail">
    <div class="base-info">
      <div class="detailInfo">
        <div class="title">
          办公 {{projectName}} {{year}}年第{{['一','二','三','四'][Number(quarter)-1]}}季度
          <el-button class="btn pull-right" @click.native="edit" style="margin-right: 0">重新提交</el-button>
        </div>
      </div>
      <div class="new-block-title">项目数据</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>土地属性：</div>
          <div class='value-label'>{{data.landAttribute || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>办公建筑面积：</div>
          <div class='value-label'>{{data.officeBuildingArea || '-'}}㎡</div>
        </div>
        <div class="state">
          <div class='key-label'>办公楼层数量：</div>
          <div class='value-label'>{{data.officeFloorCount || '-'}}层</div>
        </div>
        <div class="state">
          <div class='key-label'>标准净高：</div>
          <div class='value-label'>{{data.floorHeight || '-'}}米</div>
        </div>
        <div class="state">
          <div class='key-label'>标准层使用率：</div>
          <div class='value-label'>{{data.standardLayerUsageRate || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>架高地板：</div>
          <div class='value-label'>{{data.raisedFloor || '-'}}mm</div>
        </div>
        <div class="state">
          <div class='key-label'>楼板荷载：</div>
          <div class='value-label'>{{data.floorLoad || '-'}}kg/㎡</div>
        </div>
      </div>

      <div class="new-block-title">经营数据</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>管理成本率：</div>
          <div class='value-label'>{{managementData.manageCost || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>营销成本率：</div>
          <div class='value-label'>{{managementData.saleCost || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>EBITDA Margin：</div>
          <div class='value-label'>{{managementData.ebitdaMargin || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>重要客户面积占比：</div>
          <div class='value-label'>{{managementData.mainAreaRate || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>年度租金收入：</div>
          <div class='value-label'>{{managementData.rentIncome || '-'}}万</div>
        </div>
        <div class="state">
          <div class='key-label'>年度其他收入：</div>
          <div class='value-label'>{{managementData.otherIncome || '-'}}万</div>
        </div>
        <div class="state">
          <div class='key-label'>年度运营成本、费用及税金：</div>
          <div class='value-label'>{{managementData.operateFeeAndTax || '-'}}万</div>
        </div>
      </div>
      <div class="new-block-title">融资数据（如需做企业融资诊断，请填写以下企业财务数据）</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>净资产：</div>
          <div class='value-label'>{{financingData.netAssets || '-'}}亿</div>
        </div>
        <div class="state">
          <div class='key-label'>资产负债率：</div>
          <div class='value-label'>{{financingData.liabilitiesRate || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>流动比率：</div>
          <div class='value-label'>{{financingData.flowRate || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>速动比率：</div>
          <div class='value-label'>{{financingData.quickRate || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>年营业收入：</div>
          <div class='value-label'>{{financingData.businessIncome || '-'}}亿</div>
        </div>
        <div class="state">
          <div class='key-label'>年营业总收入增长率：</div>
          <div class='value-label'>{{financingData.incomeIncrease || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>EBITDA：</div>
          <div class='value-label'>{{financingData.ebitda || '-'}}亿</div>
        </div>
        <div class="state">
          <div class='key-label'>全部债务/EBITDA：</div>
          <div class='value-label'>{{financingData.debtEbitda || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>ROE：</div>
          <div class='value-label'>{{financingData.roe || '-'}}%</div>
        </div>
        <div class="state">
          <div class='key-label'>EBITDA/利息费用：</div>
          <div class='value-label'>{{financingData.ebitdaInterest || '-'}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { queryDiagnoseData } from '@/http/diagnosis'
import { isEmpty } from 'lodash-es'

export default {
  data () {
    return {
      projectName: null,
      projectId: null,
      year: null,
      quarter: null,
      data: '',
      managementData: '',
      financingData: ''
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    getList (projectId, year, quarter) {
      const params = {projectId, year, quarter}
      queryDiagnoseData(params).then(res => {
        this.data = res
        this.managementData = res.managementData
        this.financingData = res.financingData
      })
    },
    edit () {
      const params = {
        projectId: this.projectId,
        year: this.year,
        quarter: this.quarter
      }
      this.$router.push(`/diagnosis/office/create/${JSON.stringify(params)}`)
    }
  },
  activated () {
    const { projectId, year, quarter } = JSON.parse(this.$route.params.data)
    if (isEmpty(this.projectNameList)) {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then(res => {
        this.projectName = res.filter(item => item.id === projectId)[0].assetName
      })
    } else {
      this.projectName = this.projectNameList.filter(item => item.id === projectId)[0].assetName
    }
    this.year = year
    this.quarter = quarter
    this.projectId = projectId
    this.getList(projectId, year, quarter)
  }
}
</script>
<style lang="scss" scoped>
#diagnosis-office-detail{
  .title{
    width: 100%;
    padding: 10px 0;
    font-size: 16px;
    line-height: 30px;
  }
  .detailInfo{
    .state{
      width: 25%;
      line-height: 28px;
    }
  }
}
</style>

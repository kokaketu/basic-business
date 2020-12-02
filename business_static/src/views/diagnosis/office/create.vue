<!--
 * @Author: your name
 * @Date: 2020-09-04 18:41:19
 * @LastEditTime: 2020-10-26 11:00:41
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\office\index.vue
-->
<template>
  <div id="diagnosis-office">
    <div class="base-info">
      <div class="new-block">
        <div class="title">
          办公 {{projectName}} {{year}}年第{{['一','二','三','四'][Number(quarter)-1]}}季度
        </div>
        <div class="tips">
          为更好地完成资产诊断，需要您确认以下数据（系统中的数据，也要确保准确）
        </div>
      </div>
      <!-- 项目数据 -->
      <div class="new-block-title">项目数据</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form
            :inline="true"
            :model="projectData"
            :rules="projectRules"
            ref="projectRef"
            size="small"
            label-width="120px">
            <el-form-item label="土地属性" prop="landAttribute" required>
              <el-input v-model="projectData.landAttribute" placeholder="请输入土地属性"></el-input>
            </el-form-item>
            <el-form-item label="办公建筑面积" prop="officeBuildingArea" required>
              <InputNumber
                :value="projectData.officeBuildingArea"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => projectData.officeBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="办公楼层数量" prop="officeFloorCount" required>
              <InputNumber
                :value="projectData.officeFloorCount"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="层"
                @input="result => projectData.officeFloorCount = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="标准净高" prop="floorHeight" required>
              <InputNumber
                :value="projectData.floorHeight"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="米"
                @input="result => projectData.floorHeight = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="标准层使用率" prop="standardLayerUsageRate" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="标准层套内面积/标准层建筑面积">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="projectData.standardLayerUsageRate"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => projectData.standardLayerUsageRate = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="架高地板" prop="raisedFloor" required>
              <InputNumber
                :value="projectData.raisedFloor"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="mm"
                @input="result => projectData.raisedFloor = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="楼板荷载" prop="floorLoad" required>
              <InputNumber
                :value="projectData.floorLoad"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="kg/㎡"
                @input="result => projectData.floorLoad = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <!-- 经营数据 -->
      <div class="new-block-title">经营数据</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form
            :inline="true"
            :model="managementData"
            :rules="managementRules"
            ref="managementRef"
            size="small"
            label-width="120px">
            <el-form-item label="管理成本率" prop="manageCost" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="项目近一年管理成本/项目近一年营业收入">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.manageCost"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => managementData.manageCost = result">
              </InputNumber>
            </el-form-item>

            <el-form-item label="营销成本率" prop="saleCost" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="项目近一年营销成本/项目近一年营业收入">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.saleCost"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => managementData.saleCost = result">
              </InputNumber>
            </el-form-item>

            <el-form-item class="twoLine-label" label="EBITDA Margin" prop="ebitdaMargin" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="项目近一年EBITDA/项目近一年营业收入">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.ebitdaMargin"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => managementData.ebitdaMargin = result">
              </InputNumber>
            </el-form-item>

            <el-form-item class="twoLine-label" label="重要客户面积占比" prop="mainAreaRate" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="国际500强、国内500强、行业龙头企业等所租赁的面积/自持已出租办公建筑面积">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.mainAreaRate"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => managementData.mainAreaRate = result">
              </InputNumber>
            </el-form-item>

            <el-form-item label="年度租金收入" prop="rentIncome" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="近一年租金收入">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.rentIncome"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="万"
                @input="result => managementData.rentIncome = result">
              </InputNumber>
            </el-form-item>

            <el-form-item label="年度其他收入" prop="otherIncome" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="近一年其他收入">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.otherIncome"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="万"
                @input="result => managementData.otherIncome = result">
              </InputNumber>
            </el-form-item>

            <el-form-item class="twoLine-label" label="年度运营成本、费用及税金" prop="operateFeeAndTax" required>
              <el-popover
                placement="bottom"
                trigger="hover"
                popper-class="popper"
                content="近一年运营成本、费用及税金">
                <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
              </el-popover>
              <InputNumber
                :value="managementData.operateFeeAndTax"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="万"
                @input="result => managementData.operateFeeAndTax = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <!-- 融资数据 -->
      <div class="new-block-title">融资数据<span style="font-size: 14px; color: #666;"> (如需做企业融资诊断，请填写以下企业财务数据)</span></div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form
            :inline="true"
            :model="financingData"
            size="small"
            label-width="120px">
            <el-form-item label="净资产" prop="">
              <InputNumber
                :value="financingData.netAssets"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="亿"
                @input="result => financingData.netAssets = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="资产负债率" prop="">
              <InputNumber
                :value="financingData.liabilitiesRate"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => financingData.liabilitiesRate = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="流动比率" prop="">
              <InputNumber
                :value="financingData.flowRate"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit=""
                @input="result => financingData.flowRate = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="速动比率" prop="">
              <InputNumber
                :value="financingData.quickRate"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit=""
                @input="result => financingData.quickRate = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="年营业收入" prop="">
              <InputNumber
                :value="financingData.businessIncome"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="亿"
                @input="result => financingData.businessIncome = result">
              </InputNumber>
            </el-form-item>
            <el-form-item class="twoLine-label" label="年营业总收入增长率" prop="">
              <InputNumber
                :value="financingData.incomeIncrease"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => financingData.incomeIncrease = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="EBITDA" prop="">
              <InputNumber
                :value="financingData.ebitda"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="亿"
                @input="result => financingData.ebitda = result">
              </InputNumber>
            </el-form-item>
            <el-form-item class="twoLine-label" label="全部债务/EBITDA" prop="">
              <InputNumber
                :value="financingData.debtEbitda"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit=""
                @input="result => financingData.debtEbitda = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="ROE" prop="">
              <InputNumber
                :value="financingData.roe"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => financingData.roe = result">
              </InputNumber>
            </el-form-item>
            <el-form-item class="twoLine-label" label="EBITDA/利息费用" prop="">
              <InputNumber
                :value="financingData.ebitdaInterest"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit=""
                @input="result => financingData.ebitdaInterest = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
        <div class="btn-group clearfix">
          <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
          <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click="cancel">取消</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import InputNumber from '@/components/InputNumber'
import { saveDiagnoseData, queryDiagnoseData } from '@/http/diagnosis'
import { isEmpty } from 'lodash-es'

export default {
  data () {
    return {
      flag: true,
      projectName: null,
      projectId: null,
      year: null,
      quarter: null,
      projectData: {
        landAttribute: null,
        officeBuildingArea: null,
        officeFloorCount: null,
        floorHeight: null,
        standardLayerUsageRate: null,
        raisedFloor: null,
        floorLoad: null
      },
      projectRules: {
        landAttribute: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        officeBuildingArea: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        officeFloorCount: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        floorHeight: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        standardLayerUsageRate: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        raisedFloor: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        floorLoad: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
      },
      managementData: {
        manageCost: null,
        saleCost: null,
        ebitdaMargin: null,
        mainAreaRate: null,
        rentIncome: null,
        otherIncome: null,
        operateFeeAndTax: null,
      },
      managementRules: {
        manageCost: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        saleCost: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        ebitdaMargin: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        mainAreaRate: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        rentIncome: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        otherIncome: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        operateFeeAndTax: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
      },
      financingData: {
        netAssets: null,
        liabilitiesRate: null,
        flowRate: null,
        quickRate: null,
        businessIncome: null,
        incomeIncrease: null,
        ebitda: null,
        debtEbitda: null,
        roe: null,
        ebitdaInterest: null
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    add () {
      this.$confirm('请确认系统中及提交页面数据的准确性。', '是否确定提交', {
        confirmButtonText: '确定',
        cancelButtonText: '我再想想',
        type: 'warning'
      }).then(() => {
        if (!this.flag) return
        this.flag = false
        let projectBool, managementBool
        this.$refs.projectRef.validate(valid => {
          projectBool = valid
        })
        this.$refs.managementRef.validate(valid => {
          managementBool = valid
        })
        if (!projectBool || !managementBool) return false
        const params = {
          mainId: this.merchant.id,
          projectId: this.projectId,
          year: this.year,
          quarter: this.quarter,
          landAttribute: this.projectData.landAttribute,
          officeBuildingArea: this.projectData.officeBuildingArea,
          officeFloorCount: this.projectData.officeFloorCount,
          floorHeight: this.projectData.floorHeight,
          standardLayerUsageRate: this.projectData.standardLayerUsageRate,
          raisedFloor: this.projectData.raisedFloor,
          floorLoad: this.projectData.floorLoad,
          managementData: this.managementData,
          financingData: this.financingData
        }
        saveDiagnoseData(params).then(res => {
          this.flag = true
          if (res.code === '0') {
            this.$message.success(res.msg)
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push(`/diagnosis/index`)
          }
        })
      })
    },
    getList (projectId, year, quarter) {
      const params = {projectId, year, quarter}
      queryDiagnoseData(params).then(res => {
        for (const key in this.projectData) {
          this.projectData[key] = res[key] || null
        }
        for (const key in this.managementData) {
          this.managementData[key] = res.managementData ? res.managementData[key] : null
        }
        for (const key in this.financingData) {
          this.financingData[key] = res.financingData ? res.financingData[key] : null
        }
      })
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push(`/diagnosis/index`)
    },
  },
  components: {
    InputNumber
  },
  activated () {
    const params = JSON.parse(this.$route.params.data)
    const { projectId, year, quarter } = params
    if (isEmpty(this.projectNameList)) {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then(res => {
        this.projectName = res.filter(item => item.id === projectId)[0].assetName
      })
    } else {
      this.projectName = this.projectNameList.filter(item => item.id === projectId)[0].assetName
    }
    this.projectId = projectId
    this.year = year
    this.quarter = quarter
    this.getList(projectId, year, quarter)
  }
}
</script>
<style scoped lang="scss">
#diagnosis-office{
  .new-block{
    .title{
      font-size: 15px;
      color: #333;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .tips{
      font-size: 14px;
      color: #999;
    }
  }
  .el-form-item{
    position: relative;
    .el-icon-info{
      position: absolute;
      top: 9px;
      cursor: pointer;
    }
  }
}
</style>
<style lang="scss">
#diagnosis-office .left-wrapper .el-form-item__label{
  text-align: right;
}
#diagnosis-office .input-unit .el-input__inner{
  padding-right: 30px;
}
#diagnosis-office .el-input-group__append{
  position: absolute;
  z-index: 999;
  top: 0;
  right: 0px;
  bottom: 0;
  width: 42px;
  padding: 0;
  line-height: 30px;
  text-align: center;
  background: none;
  border: none;
  color: #333;
  cursor: pointer;
}
#diagnosis-office .twoLine-label .el-form-item__label{
  line-height: 16px;
}
</style>

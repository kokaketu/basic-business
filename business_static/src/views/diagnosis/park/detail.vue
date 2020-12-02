<!--
 * @Author: your name
 * @Date: 2020-09-11 11:33:11
 * @LastEditTime: 2020-10-30 14:49:32
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\office\detail.vue
-->
<template>
  <div id="diagnosis-park-detail">
    <div class="base-info">
      <div class="detailInfo">
        <div class="title">
          产业园 {{projectName}} {{year}}年第{{['一','二','三','四'][Number(quarter)-1]}}季度
          <el-button class="btn pull-right" @click.native="edit" style="margin-right: 0">重新提交</el-button>
        </div>
      </div>
      <div class="new-block-title">项目数据</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>土地属性：</div>
          <div class='value-label'>{{landAttribute || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>办公建筑面积：</div>
          <div class='value-label'>{{officeBuildingArea || '-'}}㎡</div>
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

      <!-- 楼栋数据 -->
      <div class="new-block-title">楼栋数据</div>
      <div class="table-wrapper">
        <el-table
          :data="tableData"
          style="width: 100%;">
          <el-table-column
            label="楼栋名称"
            prop="buildingName">
          </el-table-column>
          <el-table-column
            label="状态">
            <template slot-scope="scope">
              <span v-if="scope.row.isUpload">已上传</span>
              <span v-else style="color: #f00;cursor: not-allowed;">未上传</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作">
            <template slot-scope="scope">
             <span @click="look(scope.row)" style="cursor: pointer" v-if="scope.row.isUpload">查看</span>
              <span v-else style="color: #5E0EFF;cursor: not-allowed;">上传</span>
            </template>
          </el-table-column>
        </el-table>
        <!-- <div class="pagination">
          <el-pagination
            @size-change="handleCurrentChange"
            @current-change="handleCurrentChange"
            :current-page.sync="page"
            :page-size="100"
            layout="prev, pager, next, jumper"
            :total="total">
          </el-pagination>
        </div> -->
      </div>
    </div>
        <!-- 上传 -->
    <el-dialog
      :title="`查看楼栋数据${buildingName}`"
      :visible.sync="dialogVisible"
      width="80%"
      :before-close="handleClose">
      <div class="base-info dialog">
        <div class="new-block">
          <div class="filter-wrapper remove-style">
            <el-form
              :inline="true"
              :model="buildings"
              ref="buildings"
              size="small"
              label-width="130px">
              <div class="new-block-title">基本信息</div>
              <el-form-item label="土地获取时间" required>
                <span>{{buildings.landAcquisitionDate ? buildings.landAcquisitionDate.slice(0, 10) : '-'}}</span>
              </el-form-item>

              <el-form-item label="翻新日期" required>
                <span>{{buildings.renovationDate ? buildings.renovationDate.slice(0, 10) : '-'}}</span>
              </el-form-item>

              <el-form-item label="办公建筑面积" required>
                <span>{{buildings.officeBuildingArea}}㎡</span>
              </el-form-item>

              <el-form-item label="标准层净高" required>
                <span>{{buildings.standardLayerHigh}}米</span>
              </el-form-item>

              <el-form-item label="标准层使用率" required>
                <span>{{buildings.standardLayerRate}}%</span>
              </el-form-item>

              <el-form-item label="架高地板" required>
                <span>{{buildings.raiseTheFloor}}mm</span>
              </el-form-item>

              <el-form-item label="楼板荷载" required>
                <span>{{buildings.floorLoad}}kg/㎡</span>
              </el-form-item>

              <div class="new-block-title">设备信息</div>
              <el-form-item label="电梯个数" required>
                <span>{{buildings.elevatorCount}}</span>
              </el-form-item>

              <el-form-item label="电梯性能(客梯)" required>
                <span>{{buildings.lowSpeed}}m/s</span>
              </el-form-item>

              <el-form-item label="空调系统" required>
                <span>{{buildings.airConditionSystem}}</span>
              </el-form-item>

              <el-form-item label="电力系统" required>
                <span>{{buildings.powerSystem}}w/㎡</span>
              </el-form-item>

              <el-form-item label="楼宇智能化" required>
                <span>{{buildings.buildingIntelligence}}</span>
              </el-form-item>

              <el-form-item label="无障碍设计" required>
                <span>{{buildings.barrierFreeDesign}}</span>
              </el-form-item>

              <el-form-item label="建筑认证" required>
                <span>{{buildings.buildingCertification}}</span>
              </el-form-item>

              <div class="new-block-title">产权信息</div>
              <el-form-item label="销售模式" required>
                <span>{{buildings.saleMode}}</span>
              </el-form-item>

              <el-form-item label="产权性质" required>
                <span>{{buildings.propertyRights}}</span>
              </el-form-item>

              <el-form-item label="产权人" required>
                <span>{{buildings.propertyOwner}}</span>
              </el-form-item>

              <div class="new-block-title">经营信息</div>

              <el-form-item label="管理成本" required>
                <span>{{buildings.manageCost}}万</span>
              </el-form-item>

              <el-form-item label="营销成本" required>
                <span>{{buildings.saleCost}}万</span>
              </el-form-item>

              <el-form-item label="EBITDA" required>
                <span>{{buildings.ebitda}}万</span>
              </el-form-item>

              <el-form-item label="营业总收入" required>
                <span>{{buildings.turnover}}万</span>
              </el-form-item>

              <el-form-item label="年度租金收入" required>
                <span>{{buildings.yearRentIncome}}万</span>
              </el-form-item>

              <el-form-item label="年度其他收入" required>
                <span>{{buildings.yearOtherIncome}}万</span>
              </el-form-item>

              <el-form-item class="twoLine-label" label="年度运营成本、费用及税金" required>
                <span>{{buildings.yearOperateFeeAndTax}}万</span>
              </el-form-item>

            </el-form>
          </div>
        </div>
      </div>
      <!-- <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
      </span> -->
    </el-dialog>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import InputNumber from '@/components/InputNumber'
import { queryDiagnoseParkData, queryBuildingData, getBuildingData } from '@/http/diagnosis'
import { isEmpty } from 'lodash-es'

export default {
  data () {
    return {
      projectName: null,
      projectId: null,
      year: null,
      quarter: null,
      data: '',
      landAttribute: '',
      officeBuildingArea: '',
      financingData: '',
      page: 1,
      total: 0,
      tableData: [],
      dialogVisible: false,
      buildingName: '',
      buildingId: '',
      buildings: {
        landAcquisitionDate: null,
        renovationDate: null,
        officeBuildingArea: null,
        standardLayerHigh: null,
        standardLayerRate: null,
        raiseTheFloor: null,
        floorLoad: null,
        elevatorCount: null,
        lowSpeed: null,
        airConditionSystem: null,
        powerSystem: null,
        buildingIntelligence: null,
        barrierFreeDesign: null,
        buildingCertification: null,
        saleMode: null,
        propertyRights: null,
        propertyOwner: null,
        manageCost: null,
        saleCost: null,
        ebitda: null,
        turnover: null,
        yearRentIncome: null,
        yearOtherIncome: null,
        yearOperateFeeAndTax: null
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    handleClose () {
      this.dialogVisible = false
    },
    look (item) {
      const { buildingId } = item
      getBuildingData(this.projectId, buildingId, this.year, this.quarter).then(res => {
        if (res.code === '0') {
          this.dialogVisible = !this.dialogVisible
          for (const key in this.buildings) {
            if (this.buildings.hasOwnProperty(key)) {
              this.buildings[key] = res.data[key]
            }
          }
        }
      })
    },
    getList (projectId, year, quarter) {
      queryDiagnoseParkData(projectId, year, quarter).then(res => {
        const { financingData, landAttribute, officeBuildingArea } = res.data
        this.landAttribute = landAttribute
        this.officeBuildingArea = officeBuildingArea
        this.financingData = financingData
      })
    },
    queryBuildingList (projectId, year, quarter) {
      queryBuildingData(projectId, year, quarter).then(res => {
        this.tableData = res.data
      })
    },
    edit () {
      const params = {
        projectId: this.projectId,
        year: this.year,
        quarter: this.quarter
      }
      this.$router.push(`/diagnosis/park/create/${JSON.stringify(params)}`)
    }
  },
  components: {
    InputNumber
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
    this.queryBuildingList(projectId, year, quarter)
  }
}
</script>
<style lang="scss" scoped>
#diagnosis-park-detail{
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
<style lang="scss">
#diagnosis-park-detail .left-wrapper .el-form-item__label{
  text-align: right;
}
#diagnosis-park-detail .input-unit .el-input__inner{
  padding-right: 30px;
}
#diagnosis-park-detail .el-input-group__append{
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
#diagnosis-park-detail .twoLine-label .el-form-item__label{
  line-height: 16px;
}
#diagnosis-park-detail {
  .dialog{
    .filter-wrapper{
      margin-left: 200px;
      .new-block-title{
        margin-left: -200px;
      }
    }
    .el-form-item{
      width: 30%;
      margin: 0;
      .el-form-item__label{
        text-align: left;
      }
    }
  }
  .el-dialog{
    min-width: 1200px;
    .el-dialog__body{
      padding: 0;
      .new-block-title{
        margin-bottom: 20px;
      }
    }
  }
}
</style>

<!--
 * @Author: your name
 * @Date: 2020-09-04 18:41:19
 * @LastEditTime: 2020-10-26 11:05:37
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\diagnosis\office\index.vue
-->
<template>
  <div id="diagnosis-park">
    <div class="base-info">
      <div class="new-block">
        <div class="title">
          产业园 {{projectName}} {{year}}年第{{['一','二','三','四'][Number(quarter)-1]}}季度
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
              <span v-else style="color: #f00;">未上传</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作">
            <template slot-scope="scope">
             <span @click="look(scope.row)" v-if="scope.row.isUpload" style="cursor: pointer;">查看</span>
              <span @click="upload(scope.row)" v-else style="color: #5E0EFF;cursor: pointer;">上传</span>
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
        <div class="btn-group clearfix" style="margin-right: 20px;margin-top: 20px;">
          <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
          <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click="cancel">取消</el-button>
        </div>
      </div>
    </div>
    <!-- 上传 -->
    <el-dialog
      :title="`上传楼栋数据${buildingName}`"
      :visible.sync="dialogVisible"
      width="80%"
      :before-close="handleClose">
      <div class="base-info">
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
                <el-date-picker
                  v-model="buildings.landAcquisitionDate"
                  value-format="yyyy-MM-dd"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </el-form-item>

              <el-form-item label="翻新日期" required>
                <el-date-picker
                  v-model="buildings.renovationDate"
                  value-format="yyyy-MM-dd"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </el-form-item>

              <el-form-item label="办公建筑面积" required>
                <InputNumber
                  :value="buildings.officeBuildingArea"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="㎡"
                  @input="result => buildings.officeBuildingArea = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="标准层净高" required>
                <InputNumber
                  :value="buildings.standardLayerHigh"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="米"
                  @input="result => buildings.standardLayerHigh = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="标准层使用率" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="标准层套内面积/标准层建筑面积">
                  <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.standardLayerRate"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="%"
                  @input="result => buildings.standardLayerRate = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="架高地板" required>
                <InputNumber
                  :value="buildings.raiseTheFloor"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="mm"
                  @input="result => buildings.raiseTheFloor = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="楼板荷载" required>
                <InputNumber
                  :value="buildings.floorLoad"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="kg/㎡"
                  @input="result => buildings.floorLoad = result">
                </InputNumber>
              </el-form-item>

              <div class="new-block-title">设备信息</div>
              <el-form-item label="电梯个数" required>
                <el-input
                  @input="buildings.elevatorCount = buildings.elevatorCount.replace(/[^0-9]/g, '')"
                  v-model="buildings.elevatorCount"
                  placeholder="请输入电梯个数"></el-input>
              </el-form-item>

              <el-form-item label="电梯性能(客梯)" required>
                <InputNumber
                  :value="buildings.lowSpeed"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="m/s"
                  @input="result => buildings.lowSpeed = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="空调系统" required>
                <el-select
                  v-model="buildings.airConditionSystem"
                  collapse-tags
                  multiple
                  placeholder="请选择楼栋">
                  <el-option
                    v-for='(item, index) in ["VRV", "VAV系统", "CAV系统", "二管制风机盘管", "四管制风机盘管", "顶板辐射系统", "其他"]'
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="电力系统" required>
                <InputNumber
                  :value="buildings.powerSystem"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="w/㎡"
                  @input="result => buildings.powerSystem = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="楼宇智能化" required>
                <el-select
                  v-model="buildings.buildingIntelligence"
                  collapse-tags
                  multiple
                  placeholder="请选择楼栋">
                  <el-option
                    v-for='(item, index) in ["智能5A", "智能门禁系统", "安保自动化系统集成控制", "其他"]'
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="无障碍设计" required>
                <el-select
                  v-model="buildings.barrierFreeDesign"
                  collapse-tags
                  multiple
                  placeholder="请选择楼栋">
                  <el-option
                    v-for='(item, index) in ["盲道", "盲文标识", "坡道", "无障碍电梯", "无障碍卫生间", "母婴室", "儿童卫生间", "其他"]'
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="建筑认证" required>
                <el-select
                  v-model="buildings.buildingCertification"
                  collapse-tags
                  multiple
                  placeholder="请选择楼栋">
                  <el-option
                    v-for='(item, index) in ["LEED认证级", "LEED银级", "LEED金级", "LEED铂金级", "BREEAM认证", "DGNB认证", "WELL认证", "绿建三星", "绿建二星", "绿建一星", "其他"]'
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <div class="new-block-title">产权信息</div>
              <el-form-item label="销售模式" required>
                <el-select
                  v-model="buildings.saleMode"
                  collapse-tags
                  multiple
                  placeholder="请选择楼栋">
                  <el-option
                    v-for="(item, index) in ['整售','散售','整租（非自用）','自用','散租']"
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="产权性质" required>
                <el-select v-model="buildings.propertyRights" placeholder="请选择产权性质">
                  <el-option
                    v-for="(item, index) in ['单一产权','分割产权']"
                    class='select-option-selected'
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="产权人" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="多个人请用分号隔开“；”">
                  <i slot="reference" class="el-icon-info" style="left: -85px;"></i>
                </el-popover>
                <el-input
                  v-model="buildings.propertyOwner"
                  @input="buildings.propertyOwner = buildings.propertyOwner.replace(/；/g, ';')"
                  placeholder="请输入产权人"></el-input>
              </el-form-item>

              <div class="new-block-title">经营面积</div>

              <el-form-item label="管理成本" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="楼栋近一年管理成本">
                  <i slot="reference" class="el-icon-info" style="left: -100px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.manageCost"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.manageCost = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="营销成本" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="楼栋近一年营销成本">
                  <i slot="reference" class="el-icon-info" style="left: -100px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.saleCost"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.saleCost = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="EBITDA" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="楼栋近一年EBITDA">
                  <i slot="reference" class="el-icon-info" style="left: -90px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.ebitda"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.ebitda = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="营业总收入" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="楼栋近一年营业收入">
                  <i slot="reference" class="el-icon-info" style="left: -115px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.turnover"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.turnover = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="年度租金收入" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="近一年租金收入">
                  <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.yearRentIncome"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.yearRentIncome = result">
                </InputNumber>
              </el-form-item>

              <el-form-item label="年度其他收入" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="近一年其他收入">
                  <i slot="reference" class="el-icon-info" style="left: -130px;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.yearOtherIncome"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.yearOtherIncome = result">
                </InputNumber>
              </el-form-item>

              <el-form-item class="twoLine-label" label="年度运营成本、费用及税金" required>
                <el-popover
                  placement="bottom"
                  trigger="hover"
                  popper-class="popper"
                  content="近一年运营成本、费用及税金">
                  <i slot="reference" class="el-icon-info" style="left: -145px;top: 0;"></i>
                </el-popover>
                <InputNumber
                  :value="buildings.yearOperateFeeAndTax"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit="万"
                  @input="result => buildings.yearOperateFeeAndTax = result">
                </InputNumber>
              </el-form-item>

            </el-form>
          </div>
        </div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button class="btn btn-default" @click="handleClose">取 消</el-button>
        <el-button class="btn" type="primary" @click="submitBuildings">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import InputNumber from '@/components/InputNumber'
import { saveDiagnoseParkData, queryDiagnoseParkData, queryBuildingData, saveBuildingData, getBuildingData } from '@/http/diagnosis'
import { isEmpty, cloneDeep } from 'lodash-es'
export default {
  data () {
    return {
      buildingFlag: true,
      parkFlag: true,
      projectName: null,
      projectId: null,
      year: null,
      quarter: null,
      projectData: {
        landAttribute: null,
        officeBuildingArea: null
      },
      projectRules: {
        landAttribute: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}],
        officeBuildingArea: [{required: true, message: ' ', trigger: 'blur'}, {required: true, message: ' ', trigger: 'change'}]
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
      },
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
      this.$confirm('', '是否确认取消?', {
        confirmButtonText: '确定',
        cancelButtonText: '我再想想',
        type: 'warning'
      }).then(() => {
        this.dialogVisible = !this.dialogVisible
      })
    },
    submitBuildings () {
      for (const key in this.buildings) {
        if (this.buildings.hasOwnProperty(key)) {
          if (!this.buildings[key]) {
            this.$message({
              message: '请填写全部数据',
              type: 'warning'
            })
            return false
          }
        }
      }
      this.$confirm('请确认系统中及提交页面数据的准确性。', '是否确定提交', {
        confirmButtonText: '确定',
        cancelButtonText: '我再想想',
        type: 'warning'
      }).then(() => {
        if (!this.buildingFlag) return
        this.buildingFlag = false
        const params = cloneDeep(this.buildings)
        params.buildingName = this.buildingName
        params.buildingId = this.buildingId
        params.projectId = this.projectId
        params.year = this.year
        params.quarter = this.quarter
        const multi = ['airConditionSystem', 'buildingIntelligence', 'barrierFreeDesign', 'buildingCertification', 'saleMode']
        for (const key in params) {
          if (params.hasOwnProperty(key)) {
            if (multi.includes(key)) {
              params[key] = params[key].toString()
            }
          }
        }
        saveBuildingData(params).then(res => {
          this.buildingFlag = true
          if (res.code === '0') {
            this.$message({
              message: '上传成功',
              type: 'success'
            })
            this.dialogVisible = false
            this.queryBuildingList(this.projectId, this.year, this.quarter)
          }
        })
      })
    },
    upload (item) {
      const { buildingName, buildingId } = item
      this.buildingId = buildingId
      this.dialogVisible = !this.dialogVisible
      this.buildingName = buildingName
      for (const key in this.buildings) {
        if (this.buildings.hasOwnProperty(key)) {
          this.buildings[key] = null
        }
      }
    },
    look (item) {
      const { buildingId, buildingName } = item
      this.buildingId = buildingId
      this.buildingName = buildingName
      const multi = ['airConditionSystem', 'buildingIntelligence', 'barrierFreeDesign', 'buildingCertification', 'saleMode']
      getBuildingData(this.projectId, buildingId, this.year, this.quarter).then(res => {
        if (res.code === '0') {
          this.dialogVisible = !this.dialogVisible
          for (const key in this.buildings) {
            if (this.buildings.hasOwnProperty(key)) {
              if (multi.includes(key)) {
                this.buildings[key] = res.data[key].toString().indexOf(',') === -1 ? [res.data[key]] : res.data[key].split(',')
              } else {
                this.buildings[key] = res.data[key]
              }
            }
          }
        }
      })
    },
    add () {
      this.$confirm('请确认系统中及提交页面数据的准确性。', '是否确定提交', {
        confirmButtonText: '确定',
        cancelButtonText: '我再想想',
        type: 'warning'
      }).then(() => {
        if (!this.parkFlag) return
        this.parkFlag = false
        let projectBool
        this.$refs.projectRef.validate(valid => {
          projectBool = valid
        })
        if (!projectBool) return false
        const params = {
          mainId: this.merchant.id,
          projectId: this.projectId,
          year: this.year,
          quarter: this.quarter,
          landAttribute: this.projectData.landAttribute,
          officeBuildingArea: this.projectData.officeBuildingArea,
          financingData: this.financingData
        }
        saveDiagnoseParkData(params).then(res => {
          this.parkFlag = true
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
      queryDiagnoseParkData(projectId, year, quarter).then(res => {
        for (const key in this.projectData) {
          this.projectData[key] = res.data[key] || null
        }
        for (const key in this.financingData) {
          this.financingData[key] = res.data.financingData ? res.data.financingData[key] : null
        }
      })
    },
    queryBuildingList (projectId, year, quarter) {
      queryBuildingData(projectId, year, quarter).then(res => {
        this.tableData = res.data
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
    }
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
    this.queryBuildingList(projectId, year, quarter)
  }
}
</script>
<style scoped lang="scss">
#diagnosis-park{
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
#diagnosis-park .left-wrapper .el-form-item__label{
  text-align: right;
}
#diagnosis-park .input-unit .el-input__inner{
  padding-right: 30px;
}
#diagnosis-park .el-input-group__append{
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
#diagnosis-park .twoLine-label .el-form-item__label{
  line-height: 16px;
}
#diagnosis-park {
  .el-dialog{
    min-width: 1350px;
    .el-dialog__body{
      padding: 0;
      .new-block-title{
        margin-bottom: 20px;
      }
    }
  }
}
.el-select-dropdown.is-multiple .el-select-dropdown__item.selected.hover{
  background: #5E0EFF !important;
  color: #ffffff !important;
}
</style>

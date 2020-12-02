<template>
  <div id="business-analysis" style="margin-bottom: 40px">
    <!-- header -->
    <div class="block-title clearfix relat">
      <!-- <el-form inline class="project-auto-analyse">
            <project-auto-complete
              label="项目："
              @select="selectProject"
              @complete="selectProjectComplete"
              :project-id="assetId"
            />
      </el-form>-->
      <el-form inline class="project-auto-analyse">
        <el-form-item>
          <el-select @change="handelSearchName()" v-model="newProjectName">
            <el-option
              v-for="item in newProjectNameList"
              class="select-option-selected"
              :key="item.id"
              :label="item.assetName"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span class="line"></span>
      <!-- <span style="font-size: 14px;color: #606266;">月份：</span> -->
      <div class="project-auto-analyse">
        <el-date-picker
          v-model="date"
          type="month"
          placeholder="请选择月份"
          :clearable="false"
          :picker-options="{
              disabledDate(time) {
                return time.getTime() > Date.now();
              },
            }"
          @change="initData"
        />
      </div>
      <!-- <el-button v-show="isShowEbaas" class="btn pull-right" @click.native="cochain" style="margin: 12px 20px 0 0">{{chainStatus ? '重新上链' : '上链'}}</el-button> -->
    </div>

    <div v-if="isShowAllProject">
      <projects-analyse-value :yearMonth="date" :hidden-header="true" :projectList="newProjectNameList" @setAssetId="setAssetId" />
    </div>
    <div v-else>
      <div class="block main-info clearfix">
        <div class="left-side pull-left">
          <img :src="images.building" alt />
        </div>
        <div class="right-side pull-left">
          <h3 class="name">{{baseProjectInfo.assetName}}</h3>
          <p class="update">最近更新：{{baseProjectInfo.updatedDate}}</p>
          <div class="area-info clearfix">
            <p class="pull-left">总建筑面积：{{baseProjectInfo.totalBuildingArea}}㎡</p>
            <p class="pull-left">总计租面积：{{baseProjectInfo.rentableArea}}㎡</p>
            <p class="pull-left">楼层：{{baseProjectInfo.floorCount}}</p>
          </div>
          <p
            class="company"
            v-for="{ id, name, fieldValue } in baseProjectInfo.bsAssetEnterpriseDTOList"
            :key="id"
          >{{name}}：{{fieldValue}}</p>
        </div>
        <!-- <span v-show="chainStatus" class="ebaas-tip">已上链</span> -->
      </div>
      <div class="block-title clearfix">
        <div class="pull-left">租赁</div>
      </div>
      <div class="block" style="position: relative;">
        <el-select
          class="pull-right "
          size="small"
          style="width: 160px;position: absolute;right: 20px;top: 480px;z-index: 99;"
          v-show="assetLayout == 3"
          v-model="stagesId"
          placeholder="请选择所属分期"
          @change="queryProjectRentAnalysis">
          <el-option
            v-for="item in stageList"
            class='select-option-selected'
            :key="item.id"
            :label="item.stagesName"
            :value="item.id">
          </el-option>
        </el-select>
        <rent-charts :data="rent" :status="assetLayout" />
        <div class="trade-statistic-container">
          <div class="trade-statistic-title">
            <div class="fr">
              <el-select
                size="small"
                style="width: 160px;"
                v-show="assetLayout == 3"
                v-model="stagesId2"
                placeholder="请选择所属分期"
                @change="getStoreRentInfo">
                <el-option
                  v-for="item in stageList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.stagesName"
                  :value="item.id">
                </el-option>
              </el-select>
              <el-radio-group v-model="classify.rentInfoType" size="small">
                <el-radio-button label="1" v-if="Number(assetLayout) === 2">按业态</el-radio-button>
                <el-radio-button label="1" v-else>按行业</el-radio-button>
                <el-radio-button label="2">按楼层</el-radio-button>
              </el-radio-group>
            </div>
            <div style="line-height: 32px">出租率分析</div>
          </div>
          <div style="margin-top: 17px">
            <el-table
              :data="storeRentInfo"
              row-key="_id"
              border
              default-expand-all
              :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
            >
              <!-- <el-table-column
                label="列表"
                prop="storePositioning"
              />-->
              <el-table-column label="列表">
                <template slot-scope="scope">
                  <span>{{ scope.row.florrOrLayoutPostion || scope.row.storePositioning }}</span>
                </template>
              </el-table-column>
              <el-table-column label="总出租面积(㎡)" prop="spTotle" align="right">
                <template slot-scope="scope">{{scope.row.spTotle | comdify}}</template>
              </el-table-column>
              <el-table-column label="已出租面积(㎡)" prop="spLeased" align="right">
                <template slot-scope="scope">{{scope.row.spLeased | comdify}}</template>
              </el-table-column>
              <el-table-column label="出租率(%)" prop="rentalRate" align="right">
                <template slot-scope="scope">{{scope.row.rentalRate | comdify}}%</template>
              </el-table-column>
              <el-table-column label="租约数(个)" prop="contNum" align="right" />
              <el-table-column label="租金单价(元/㎡/天)" prop="unitRentalPrice" align="right">
              <template slot-scope="scope">{{scope.row.unitRentalPrice | comdify}}</template></el-table-column>
            </el-table>
          </div>
        </div>
      </div>
      <!-- <div class="block">
        <div class="title-box">
          <p>租金达成分析</p>
          <el-radio-group v-model="classify.rentAnalysisType" size="small">
            <el-radio-button label="1">按业态</el-radio-button>
            <el-radio-button label="2">按楼层</el-radio-button>
          </el-radio-group>
        </div>
        <el-table
          :data="rentAnalysisList"
          style="width:100%;margin-top: 20px;"
          row-key="name"
          border
          default-expand-all
          :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        >
          <el-table-column width="200" prop="name"></el-table-column>
          <el-table-column :label="`${yearMonth}`" align="center">
            <el-table-column
              prop="monRent"
              align="center"
              label="实际(元)">
            </el-table-column>
            <el-table-column
              prop="sequential"
              align="center"
              label="环比(%)">
            </el-table-column>
          </el-table-column>
          <el-table-column label="全年累计" align="center">
            <el-table-column
              prop="yearRent"
              align="center"
              label="实际(元)">
            </el-table-column>
          </el-table-column>
        </el-table>
      </div>-->
      <div class="block" v-show="Number(assetLayout) === 2">
        <div class="operation-title">运营</div>
        <div>
          <div class="set-space">
            <el-radio-group v-model="presentYear" size="small" @change="querySalesAndFlow">
              <el-radio-button :label="lastYear">{{lastYear}}</el-radio-button>
              <el-radio-button :label="thisYear">{{thisYear}}</el-radio-button>
            </el-radio-group>
          </div>
          <line-area v-if="renderLine" :option="salesAndFlow.option" width="100%" height="430px"/>
        </div>
        <div class="title-box">
          <p>销售统计</p>
          <el-radio-group v-model="classify.salesAnalysis" size="small">
            <el-radio-button label="1">按业态</el-radio-button>
            <el-radio-button label="2">按楼层</el-radio-button>
          </el-radio-group>
        </div>
        <el-table
          :data="sellStatistics"
          style="width:100%;margin-top: 20px;"
          row-key="name"
          border
          default-expand-all
          :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        >
          <el-table-column width="200" prop="name"></el-table-column>
          <el-table-column :label="`${yearMonth}`" align="center">
            <el-table-column prop="sales" align="right" label="销售额(元)">
              <template slot-scope="scope">{{scope.row.sales | comdify}}</template>
            </el-table-column>
            <!-- <el-table-column
              prop="monthlyAverage"
              align="center"
              label="月均平均(元)">
            </el-table-column>-->
            <el-table-column prop="rentRatio" align="right" label="租售比(%)">
              <template slot-scope="scope">{{scope.row.rentRatio | comdify}}%</template>
            </el-table-column>
            <el-table-column prop="flatEffect" align="right" label="月均平效(元/㎡)">
            <template slot-scope="scope">{{scope.row.flatEffect | comdify}}</template></el-table-column>
          </el-table-column>
          <el-table-column label="全年累计" align="center">
            <el-table-column prop="allYearSales" align="right" label="销售额(元)">
              <template slot-scope="scope">{{scope.row.allYearSales | comdify}}</template>
            </el-table-column>
            <!-- <el-table-column
              prop="allYearMonthlyAverage"
              align="center"
              label="月均平均(元)">
            </el-table-column>-->
            <el-table-column prop="allYearRentRatio" align="right" label="租售比(%)">
              <template slot-scope="scope">{{scope.row.allYearRentRatio | comdify}}%</template>
            </el-table-column>
          </el-table-column>
          <el-table-column prop="rentPrice" align="right" label="租金单价(元/㎡/月)">
          <template slot-scope="scope">{{scope.row.rentPrice | comdify}}</template></el-table-column>
        </el-table>
        <p class="martop">客流</p>
        <el-table
          :data="flowDataList"
          style="width:100%;margin-top: 20px;"
          row-key="name"
          border
        >
          <el-table-column
            show-overflow-tooltip
            prop="assetName"
            label="项目"/>
          <el-table-column
            prop="passengerFlow"
            label="本月累计客流量(人)"
            align='right'>
            <template slot-scope="scope">{{scope.row.passengerFlow | comdify}}</template>
          </el-table-column>
          <el-table-column
            prop="yearPassengerFlow"
            label="本年累计客流量(人)"
            align='right'>
            <template slot-scope="scope">{{scope.row.yearPassengerFlow | comdify}}</template>
          </el-table-column>
          <el-table-column
            label="同比(%)"
            align='right'>
            <template slot-scope="scope">
              <span>{{ scope.row.withProportion || 0  | comdify}}%</span>
            </template>
          </el-table-column>
          <el-table-column
            label="环比(%)"
            align='right'>
            <template slot-scope="scope">
              <span>{{ scope.row.surroundProportion || 0  | comdify}}%</span>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <!-- 财务 -->
      <div class="block-title clearfix">
        <div class="pull-left">财务</div>
        <el-select
          class="pull-right"
          size="small"
          style="width: 160px;"
          v-show="assetLayout == 3"
          v-model="stagesId3"
          placeholder="请选择所属分期"
          @change="queryProjectFinancial">
          <el-option
            v-for="item in stageList"
            class='select-option-selected'
            :key="item.id"
            :label="item.stagesName"
            :value="item.id">
          </el-option>
        </el-select>
      </div>
      <div class="block financial">
        <div class="financial-header clearfix">
          <div
            class="pull-left"
            v-for="{ icon, firstVale, twoName, threeName, twoValue, threeValue, } in financial.total"
            :key="icon"
          >
            <div class="financial-header-title flexLayout">
              <img :src="icon" alt />
              <p>{{firstVale}}</p>
              <!-- <el-button type="success" class="anaysisEditBtn" v-show="type == 2" @click="openNOIDio()">设置</el-button> -->
            </div>
            <div class="financial-content">
              <div class="content clearfix">
                <p class="pull-left">{{twoName}}</p>
                <p class="pull-left">{{twoValue}}</p>
              </div>
              <div class="content clearfix" v-show="threeName">
                <p class="pull-left">{{threeName}}</p>
                <p class="pull-left">{{threeValue}}</p>
              </div>
            </div>
          </div>
        </div>
        <el-dialog
          title="估值数据管理"
          modal
          :before-close="closeAnaysis"
          :visible.sync="anaysisDiaVisable"
        >
          <div class="noiData">
            <div>
              <span class="noi-title">NOI数据</span>
              <span class="noi-topic">(NOI估值法需要近一年的NOI数据作支持，已有财务数据月份无需再次填写。)</span>
            </div>
            <div class="noi-list-box">
              <div class="noi-list" v-for="(item,index) in form" :key="index">
                <div class="left-right">
                  <div class="noi-list-key">{{item.yearMonth.replace(/-/g, '年')}}月</div>
                  <div class="noi-list-value">
                    <el-input
                      v-if="item.forbidden"
                      disabled
                      class="money-input"
                      @change.native="setNOIValue"
                      v-model="item.noiAmount"
                      placeholder="请输入金额"
                    ></el-input>
                    <el-input
                      v-else
                      class="money-input"
                      @change.native="setNOIValue"
                      v-model="item.noiAmount"
                      placeholder="请输入金额"
                    ></el-input>
                    <div class="unit">&nbsp;万元</div>
                  </div>
                </div>
                <div class="left-right">
                  <div class="noi-list-key">资本化率</div>
                  <div class="noi-list-value">
                    <el-input
                      class="money-input"
                      placeholder="请输入资本化率"
                      v-model="item.capitalizationRate"
                    ></el-input>
                    <div class="unit">&nbsp;%</div>
                  </div>
                </div>
              </div>
              <div style="border-top:1px solid #666666;width:100%;margin:20px auto"></div>
              <div class="noi-list">
                <div class="noi-list-key font20">估值:</div>
                <div class="noi-list-value font20 colorjs">{{noiValue}}</div>
              </div>
            </div>
          </div>
          <div slot="footer" class="dialog-footer">
            <el-button @click="closeAnaysis()">取 消</el-button>
            <el-button type="primary" @click="upNoiData()">确 定</el-button>
          </div>
        </el-dialog>

        <el-table
          class="setbackground"
          :data="financial.detail"
          style="width:100%;margin-top: 20px;"
          row-key="type"
          border
          default-expand-all
          :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
        >
          <el-table-column width="220" prop="type"></el-table-column>
          <el-table-column :label="`${yearMonth}`" align="center">
            <el-table-column prop="actualAmount" align="right" label="实际(元)">
              <template slot-scope="scope">{{scope.row.actualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="budgetAmount" align="right" label="预算(元)">
              <template slot-scope="scope">{{scope.row.budgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="differenceAmount" align="right" label="差异额(元)">
              <template slot-scope="scope">{{scope.row.differenceAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="differenceRate" align="right" label="差异率(%)">
              <template slot-scope="scope">{{scope.row.differenceRate | comdify}}%</template>
            </el-table-column>
          </el-table-column>
          <el-table-column label="全年累计" align="center">
            <el-table-column prop="fullYearTotalActualAmount" align="right" label="实际(元)">
              <template slot-scope="scope">{{scope.row.fullYearTotalActualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="fullYearTotalBudgetAmount" align="right" label="预算(元)">
              <template slot-scope="scope">{{scope.row.fullYearTotalBudgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="fullYearTotalDifferenceAmount" align="right" label="差异额(元)">
              <template slot-scope="scope">{{scope.row.fullYearTotalDifferenceAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="fullYearTotalDifferenceRate" align="right" label="差异率(%)">
              <template slot-scope="scope">{{scope.row.fullYearTotalDifferenceRate | comdify}}%</template>
            </el-table-column>
          </el-table-column>
          <el-table-column label="全年预测" align="center">
            <el-table-column prop="fullYearPredictionActualAmount" align="right" label="实际(元)">
              <template slot-scope="scope">{{scope.row.fullYearPredictionActualAmount | comdify}}</template>
            </el-table-column>
            <el-table-column prop="fullYearPredictionBudgetAmount" align="right" label="预算(元)">
              <template slot-scope="scope">{{scope.row.fullYearPredictionBudgetAmount | comdify}}</template>
            </el-table-column>
            <el-table-column
              prop="fullYearPredictionDifferenceAmount"
              align="right"
              label="差异额(元)"
            ><template slot-scope="scope">{{scope.row.fullYearPredictionDifferenceAmount | comdify}}</template></el-table-column>
            <el-table-column prop="fullYearPredictionDifferenceRate" align="right" label="差异率(%)">
              <template slot-scope="scope">{{scope.row.fullYearPredictionDifferenceRate | comdify}}%</template>
            </el-table-column>
          </el-table-column>
        </el-table>
        <br>
        <br>
        <el-table :data="arrearageList" border style="width: 100%">
          <el-table-column prop="subjectName" label="欠费"></el-table-column>
          <el-table-column prop="arrearsAll" label="总额(元)" align="right">
            <template slot-scope="scope">{{scope.row.arrearsAll | comdify}}</template>
          </el-table-column>
          <el-table-column prop="arrearsThirty" label="小于30天(元)" align="right">
            <template slot-scope="scope">{{scope.row.arrearsThirty | comdify}}</template>
          </el-table-column>
          <el-table-column prop="arrearsThirtyToSixty" label="30-60天(元)" align="right">
            <template slot-scope="scope">{{scope.row.arrearsThirtyToSixty | comdify}}</template>
          </el-table-column>
          <el-table-column prop="arrearsSixtyToNinety" label="61-90天(元)" align="right">
            <template slot-scope="scope">{{scope.row.arrearsSixtyToNinety | comdify}}</template>
          </el-table-column>
          <el-table-column prop="arrearsNinety" label="大于90天(元)" align="right">
            <template slot-scope="scope">{{scope.row.arrearsNinety | comdify}}</template>
          </el-table-column>
        </el-table>
        <p class="tip-time">数据统计截止时间：{{new Date().toLocaleDateString().split('/').join('-')}}</p>
      </div>
    </div>
  </div>
</template>
<script>
import building from './img/building.png'
import dayjs from 'dayjs'
import { defaultsDeep, groupBy, reduce, map } from 'lodash-es'
import income from './img/icon-income.svg'
import cost from './img/icon-cost.svg'
import valuation from './img/icon-valuation.svg'
import RentCharts from './RentCharts'
import {
  getAssetName,
  getStoreRentInfo,
  queryProjectAnalysis,
  queryProjectFinancial,
  queryProjectRentAnalysis,
  getNoiList,
  updateNoiList,
  salesAnalysis,
  rentAnalysisQuery,
  getSubjectNoArrearsInfo,
  querySalesAndFlow,
  queryFQByAssetId
} from '../../../http/assets'
import { getPassFlowListByMainId } from '@/http/operation'
import {mapState} from 'vuex'
import LineArea from 'src/components/echarts/LineArea'
import ProjectAutoComplete from '../../../components/ProjectAutoComplete'
import ProjectsAnalyseValue from '../../home/projectsAnalyseValue/ProjectsAnalyseValue'
import { ebaasProcess } from '@/utils/ebass/process'
export default {
  components: { RentCharts, ProjectAutoComplete, ProjectsAnalyseValue, LineArea },
  data () {
    return {
      baseProjectInfo: {},
      images: { building },
      date: new Date(),
      noiValue: 25.4,
      financial: {
        detail: [],
        total: [],
      },
      stagesId: null,
      stagesId2: null,
      stagesId3: null,
      stageList: null,
      anaysisDiaVisable: false,
      form: [],
      rent: {},
      storeRentInfo: [],
      assetId: void 0,
      isShowAllProject: true,
      newProjectName: 999,
      newProjectNameList: [],
      sellStatistics: [],
      rentAnalysisList: [],
      classify: {
        rentInfoType: 1,
        salesAnalysis: 1,
        rentAnalysisType: 1,
      },
      arrearageList: [],
      assetLayout: '',
      presentYear: new Date().getFullYear(),
      thisYear: '',
      lastYear: '',
      salesAndFlow: {
        option: {
          xAxis: { data: [] },
          series: [
            { data: [] },
            { data: [] },
          ],
        },
      },
      renderLine: false,
      flowDataList: [],
      chainStatus: false,
      isShowEbaas: false,
      ebaasId: ''
    }
  },
  computed: {
    ...mapState(['merchant']),
    yearMonth () {
      return dayjs(this.date).format('YYYY-MM')
    },
  },
  watch: {
    assetId: {
      handler () {
        this.stagesId = this.stagesId2 = this.stagesId3 = null
        if (this.assetId != null) {
          this.queryProjectAnalysis()
          this.initData()
        }
        this.queryFQ()
      }
    },
    assetLayout: {
      handler () {
        if (this.newProjectName !== 999) {
          this.salesAnalysis()
          this.getStoreRentInfo()
        }
      }
    },
    'classify.rentInfoType' (val) {
      this.getStoreRentInfo()
    },
    'classify.salesAnalysis' (val) {
      this.salesAnalysis()
    },
    'classify.rentAnalysisType' (val) {
      this.rentAnalysisQuery()
    },
  },
  activated () {
    getAssetName({ mainId: this.merchant.id }).then((res) => {
      res.unshift({ assetLayout: '2', assetName: '所有项目', id: 999 })
      this.newProjectNameList = res
    })
    this.thisYear = new Date().getFullYear()
    this.lastYear = this.thisYear - 1
  },
  methods: {
    cochain () {
      let params = {
        merchantId: this.merchant.id,
        id: this.ebaasId,
        dataType: 'BS_ASSET_ANALYSIS'
      }
      ebaasProcess.init(params, () => {
        this.chainStatus = true
      })
    },
    initData () {
      this.newProjectName !== 999 && this.queryProjectRentAnalysis()
      this.newProjectName !== 999 && this.queryProjectFinancial()

      if (this.assetLayout && this.newProjectName !== 999) {
        this.salesAnalysis()
        this.getStoreRentInfo()
      }
      // this.newProjectName !== 999 && this.getStoreRentInfo()
      // this.rentAnalysis()
      // this.newProjectName !== 999 && this.salesAnalysis()
      // this.rentAnalysisQuery()
      this.newProjectName !== 999 && this.getSubjectNoArrearsInfo()
      this.newProjectName !== 999 && this.querySalesAndFlow()
      this.newProjectName !== 999 && this.getPassFlowListByMainId()
    },
    // 客流销售额折线图
    querySalesAndFlow () {
      const assetLayout = this.newProjectNameList.filter(item => item.id === this.assetId)[0].assetLayout
      if (Number(assetLayout) !== 2) return
      console.log('sss')
      let params = {
        assetId: this.assetId,
        mainId: this.merchant.id,
        year: this.presentYear + ''
      }
      querySalesAndFlow(params).then(res => {
        let {flow, sales} = res
        // 月份
        const months = Array.from({ length: 12 }, (_, index) => index + 1 + '')

        const salesValue = reduce(sales, (prev, { count, yearMonth }) => {
          prev[yearMonth] = count
          return prev
        }, {})
        const flowValue = reduce(flow, (prev, { count, yearMonth }) => {
          prev[yearMonth] = count
          return prev
        }, {})

        const salesData = months.map((month) => salesValue[month] || 0)
        const flowData = months.map((month) => flowValue[month] || 0)

        this.salesAndFlow.option = {
          legend: { data: ['客流', '销售额'] },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow'
            },
            formatter: function (params) {
              let res = `<div>${params[0].name}</div>`
              for (let i = 0; i < params.length; i++) {
                if (params[i].seriesName === '客流') {
                  res += `<p>${params[i].seriesName}：${params[i].data}人</p>`
                } else if (params[i].seriesName === '销售额') {
                  res += `<p>${params[i].seriesName}：${params[i].data}元</p>`
                }
              }
              return res
            }
          },
          xAxis: { data: months.map((month) => month + '月') },
          series: [
            {
              name: '客流',
              data: flowData
            },
            {
              name: '销售额',
              data: salesData
            }
          ]
        }
        setTimeout(() => {
          this.renderLine = true
        }, 500)
      })
    },
    // 销售统计
    salesAnalysis () {
      const { yearMonth, assetId, assetLayout } = this
      const type = this.classify.salesAnalysis
      // console.log(type);
      salesAnalysis({
        mainId: this.merchant.id,
        type,
        assetId,
        yearMonth,
        assetLayout
      }).then((res) => {
        const result = reduce(
          res,
          (prev, item) => {
            const { fid } = item
            if (fid == null) {
              prev.parent.push(item)
            } else {
              prev.children.push(item)
            }
            return prev
          },
          { parent: [], children: [] }
        )

        const child = groupBy(result.children, ({ fid }) => fid)
        const financial = reduce(
          result.parent,
          (prev, parent) => {
            const { order } = parent
            parent.children = child[order] || child[order + '']
            prev.push(parent)
            return prev
          },
          []
        )
        this.sellStatistics = financial
        // console.log(financial);
      })
    },
    // 客流
    getPassFlowListByMainId () {
      getPassFlowListByMainId({mainId: this.merchant.id, assetId: this.assetId}).then(res => {
        this.flowDataList = res.list
        // console.log(this.flowDataList);
      })
    },
    // 租金达成分析
    rentAnalysisQuery () {
      const { yearMonth, assetId } = this
      const type = this.classify.rentAnalysisType
      rentAnalysisQuery({
        mainId: this.merchant.id,
        type,
        assetId,
        yearMonth,
      }).then((res) => {
        // console.log(res);
        this.rentAnalysisList = this.toTree(res)
      })
    },
    // 欠费分析
    getSubjectNoArrearsInfo () {
      const { assetId } = this
      getSubjectNoArrearsInfo({ assetId }).then((res) => {
        this.arrearageList = res
      })
    },
    toTree (data) {
      const result = reduce(
        data,
        (prev, item) => {
          const { order } = item
          if (order != null) {
            prev.parent.push(item)
          } else {
            prev.children.push(item)
          }
          return prev
        },
        { parent: [], children: [] }
      )

      const child = groupBy(result.children, ({ fid }) => fid)
      const financial = reduce(
        result.parent,
        (prev, parent) => {
          const { order } = parent
          parent.children = child[order] || child[order + '']
          prev.push(parent)
          return prev
        },
        []
      )
      // console.log(financial);
      return financial
    },
    setNOIValue () {
      let noi = 0
      this.form.map((item) => {
        noi = noi + item.noiAmount * 10000
      })
      this.noiValue =
        noi / 100000000 > 1
          ? (noi / 100000000).toFixed(2) + ' 亿元'
          : (noi / 10000).toFixed(2) + ' 万元'
    },
    queryProjectAnalysis () {
      const { assetId } = this
      queryProjectAnalysis(assetId).then((res) => {
        if (res.chainStatus) {
          this.chainStatus = res.chainStatus
        }
        this.ebaasId = res.id
        res.updatedDate = this.renderTime(res.updatedDate).substr(0, 10)
        this.baseProjectInfo = res
        this.assetLayout = this.baseProjectInfo.assetLayout
        // if (Number(this.assetLayout) === 1) {
        //   this.classify.rentInfoType = 2
        // } else if (Number(this.assetLayout) === 2) {
        //   this.classify.rentInfoType = 1
        // }
      })
    },
    renderTime (date) {
      var dateee = new Date(date).toJSON()
      return new Date(+new Date(dateee) + 8 * 3600 * 1000)
        .toISOString()
        .replace(/T/g, ' ')
        .replace(/\.[\d]{3}Z/, '')
    },
    openNOIDio () {
      const date = new Date()
      const year = date.getFullYear()
      let month = date.getMonth() + 1
      const emonth = month < 10 ? '0' + month : month
      const smonth = month + 1 < 10 ? '0' + (month + 1) : month + 1
      const params = {
        mainId: this.merchant.id,
        assetId: this.assetId,
        startYearMonth: year - 1 + '-' + smonth,
        endYearMonth: year + '-' + emonth,
      }
      getNoiList(params).then((res) => {
        this.form =
          res &&
          res.months &&
          res.months.map((it) => {
            if (it.noiAmount > 0) {
              return { ...it, forbidden: true }
            } else {
              return { ...it, noiAmount: null, forbidden: false }
            }
          })
        this.capitalizationRate = res.capitalizationRate || 0
        this.setNOIValue()
        this.anaysisDiaVisable = true
      })
    },
    upNoiData () {
      const months = this.form.map((it) => ({
        ...it,
        noiAmount: it.noiAmount && it.noiAmount * 10000,
      }))
      const params = {
        mainId: this.merchant.id,
        assetId: this.assetId,
        months,
      }
      updateNoiList(params).then((res) => {
        // console.log('res',res)
      })
      this.anaysisDiaVisable = false
    },
    closeAnaysis () {
      this.$confirm('数据未保存，是否确认离开？', '离开确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning',
      }).then(() => {
        this.anaysisDiaVisable = false
      })
    },
    queryProjectFinancial () {
      const { yearMonth, assetId, stagesId3 } = this
      queryProjectFinancial({
        mainId: this.merchant.id,
        assetId,
        yearMonth,
        stagesId: stagesId3
      }).then((res) => {
        const { detail, total } = res
        const result = reduce(
          detail,
          (prev, item) => {
            const { parentCode } = item
            if (parentCode == null) {
              prev.parent.push(item)
            } else {
              prev.children.push(item)
            }
            return prev
          },
          { parent: [], children: [] }
        )

        const child = groupBy(result.children, ({ parentCode }) => parentCode)
        const financial = reduce(
          result.parent,
          (prev, parent) => {
            const { order } = parent
            parent.children = child[order] || child[order + '']
            prev.push(parent)
            return prev
          },
          []
        )

        this.financial = {
          detail: financial,
          total: defaultsDeep(
            [
              {
                icon: income,
                twoName: '当月实际',
                threeName: '全年预测',
                type: '0',
              },
              { icon: cost, twoName: '总成本', type: '1' },
              { icon: valuation, twoName: '估值', type: '2' },
            ],
            total || []
          ),
        }
      })
    },
    queryProjectRentAnalysis () {
      const { stagesId, mainId, yearMonth, assetId } = this
      queryProjectRentAnalysis({ stagesId, mainId, assetId, yearMonth }).then((res) => {
        // console.log('ress',res)
        this.rent = res
        console.log(this.rent)
      })
    },
    getStoreRentInfo () {
      const { yearMonth, assetId, assetLayout, stagesId2 } = this
      // if(Number(this.baseProjectInfo.assetLayout) === 2) {
      //   const dimension = 2
      // } else {
      //   const dimension = this.classify.rentInfoType
      // }
      const dimension = this.classify.rentInfoType
      getStoreRentInfo({ stagesId: stagesId2, assetId, yearMonth, dimension, assetLayout }).then((res) => {
        this.storeRentInfo = map(res, (rentInfo, index) => {
          rentInfo._id = '' + index
          if (Array.isArray(rentInfo.children)) {
            rentInfo.children.forEach((child, i) => {
              child._id = '' + index + i
              // child.storePositioning = child.signLayout
            })
          }
          return rentInfo
        })
      })
    },
    // selectProject ({ id }, value) {
    //   if (value == 999) {
    //     this.isShowAllProject = true
    //   } else {
    //     this.assetId = id
    //     this.isShowAllProject = false
    //   }
    // },
    // selectProjectComplete (project) {
    //   const { query: { projectId, date } } = this.$route
    //   if (projectId != null) {
    //     this.assetId = projectId
    //     date && (this.date = new Date(date))
    //     return
    //   }
    //   this.selectProject(project)
    // },
    handelSearchName () {
      if (this.newProjectName === 999) {
        this.isShowAllProject = true
        this.isShowEbaas = false
      } else {
        this.isShowEbaas = true
        this.isShowAllProject = false
        this.assetId = this.newProjectName
      }
    },
    setAssetId (id) {
      this.isShowEbaas = true
      this.isShowAllProject = false
      this.assetId = this.newProjectName = id
    },
    // 分期
    queryFQ () {
      const assetLayout = this.newProjectNameList.filter(item => item.id === this.assetId)[0].assetLayout
      Number(assetLayout) === 3 && queryFQByAssetId({assetId: this.assetId}).then(res => {
        this.stageList = res.data

        this.stagesId = this.stagesId2 = this.stagesId3 = this.stageList[0].id
        this.newProjectName !== 999 && this.queryProjectRentAnalysis()
        this.newProjectName !== 999 && this.queryProjectFinancial()
        if (this.assetLayout && this.newProjectName !== 999) {
          this.getStoreRentInfo()
        }
      })
    }
  },
}
</script>
<style lang="scss" scoped>
@import "./style";
</style>

<style lang="scss">
.project-auto-analyse {
  display: inline-block;
  .el-form-item {
    margin-bottom: 0;
  }
  .el-form-item__content {
    vertical-align: middle !important;
    .el-input__inner {
      border: 0;
      width: 150px;
    }
    .el-input__suffix {
      right: 15px;
    }
  }
  .el-date-editor {
    .el-input__inner {
      border: 0;
      width: 120px;
      cursor: pointer;
    }
  }
}
.anaysisEditBtn {
  height: 29px;
  width: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #00c998 !important;
  color: #ffffff;
  // outline: none;
}
.flexLayout {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.noiData {
  width: 90%;
  margin: 0 auto;
}

.noi-title {
  font-size: 18px;
  font-weight: bold;
}
.noi-topic {
  font-size: 13px;
  color: #888888;
  margin-top: 10px;
}
.noi-list-box {
  height: 700px;
}
.noi-list {
  display: flex;
  justify-content: space-around;
  margin-top: 10px;
}
.noi-list-key {
  display: flex;
  width: 20%;
  align-items: center;
  justify-content: flex-end;
}
.noi-list-value {
  display: flex;
  width: 70%;
  align-items: center;
  justify-content: space-between;
}
.unit {
  width: 50%;
}
.font20 {
  font-size: 20px;
  font-weight: bold;
}
.colorjs {
  color: #f28300;
}

.left-right {
  width: 50%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.operation-title {
  font-size: 16px;
  margin-bottom: 24px;
}

.title-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
  p {
    font-size: 16px;
  }
}

.set-space {
  margin: 30px 0 20px;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  p {
    color: #666;
    font-size: 14px;
    margin-top: 10px;
  }
}

.tip-time {
  color: red;
  font-size: 14px;
  margin-top: 10px;
}

.martop {
  margin-top: 30px;
}

.setbackground tbody tr:first-child {
  background-color: #f7f7f7;
}

.setbackground tbody tr:last-child {
  background-color: #f7f7f7;
}
</style>

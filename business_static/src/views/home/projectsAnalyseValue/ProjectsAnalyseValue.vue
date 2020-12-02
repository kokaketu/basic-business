<template>
  <div>
    <!-- <section>
      <el-date-picker
        v-model="yearMonth"
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
    </section> -->
    <section style="margin-top: 20px;">
      <el-row :gutter="20">
        <el-col :span="6">
          <card-data
            title="总项目数(个)"
            :img="require('./assets/all.svg')"
            tip="-"
            :amount="business.assetStatis.assetCount"
          >
            <div>估值合计：{{business.assetStatis.totalValuation}} 万元</div>
          </card-data>
        </el-col>
        <el-col :span="6">
          <card-data
            title="上月收入(万元)"
            :img="require('./assets/in.svg')"
            tip="-"
            :amount="business.monthIncomeStatis.monthIncome"
          >
            <div class="value">
              <div class="status fr">
                环比：<span :class="{
                  up: business.monthIncomeStatis.comparative >= 0,
                  down: business.monthIncomeStatis.comparative < 0
                }"
              >{{business.monthIncomeStatis.comparative}}%</span>
              </div>
              当年累计：{{business.monthIncomeStatis.yearIncome}} 亿元
            </div>
          </card-data>
        </el-col>
        <el-col :span="6">
          <card-data
            title="上月支出(万元)"
            :img="require('./assets/out.svg')"
            tip="-"
            :amount="business.monthExpenditureStatis.monthExpenditure"
          >
            <div class="value">
              <div class="status fr">
                环比：<span :class="{
                  up: business.monthExpenditureStatis.comparative >= 0,
                  down: business.monthExpenditureStatis.comparative < 0
                }"
              >{{business.monthExpenditureStatis.comparative}}%</span>
              </div>
              当年累计：{{business.monthExpenditureStatis.yearExpenditure}} 亿元
            </div>
          </card-data>
        </el-col>
        <el-col :span="6">
          <card-data
            title="总租金收入(万元)"
            :img="require('./assets/all-in.svg')"
            tip="-"
            :amount="business.rentalIncomeStatis.rentalIncome"
          >
            <div class="value">
              <div class="status fr">
                环比：<span :class="{
                  up: business.rentalIncomeStatis.comparative >= 0,
                  down: business.rentalIncomeStatis.comparative < 0
                }"
              >{{business.rentalIncomeStatis.comparative}}%</span>
              </div>
              当年累计：{{business.rentalIncomeStatis.yearIncome}} {{business.rentalIncomeStatis.yearIncomeUnit}}元
            </div>
          </card-data>
        </el-col>
      </el-row>
    </section>
    <section style="margin-top: 15px;">
      <card title="财务分析">
        <template v-slot:header-right>
          <asset-type class="fr" :asset-type="inOutNoiAssetLayout" @change="inOutNoiAssetLayoutChange"/>
        </template>
        <el-row :gutter="40">
          <el-col :span="14">
            <title-unit title="收入/支出趋势"/>
            <in-out-chart :option="inOutNoi" height="400px"/>
          </el-col>
          <el-col :span="10">
            <title-unit title="项目排名"/>
            <el-table
              :data="ProjectInOutNoi"
              @row-click="fetchAssetAnalysisFinanceNoi"
              style="width: 100%">
              <el-table-column
                type="index">
                <template slot-scope="scope">
                  <span :class="[
                    'index-style',
                    scope.$index === 0 ? 'index-red' : '',
                    scope.$index === 1 ? 'index-yellow' : '',
                    scope.$index === 2 ? 'index-blue' : ''
                  ]">{{scope.$index + 1}}</span>
                </template>
              </el-table-column>
              <el-table-column
                prop="assetName"
                label="项目名称"
              >
              </el-table-column>
              <el-table-column
                prop="monthIncome"
                label="收入"
                align="right"
              ><template slot-scope="scope">{{scope.row.monthIncome + '' | comdify}}</template>
              </el-table-column>
              <el-table-column
                prop="monthExpenditure"
                label="支出"
                align="right"
              ><template slot-scope="scope">{{scope.row.monthExpenditure + '' | comdify}}</template>
              </el-table-column>
              <el-table-column
                prop="monthNOI"
                label="NOI"
                align="right"
              ><template slot-scope="scope">{{scope.row.monthNOI + '' | comdify}}</template>
              </el-table-column>
            </el-table>
          </el-col>
        </el-row>
      </card>
    </section>
    <section style="margin-top: 15px;">
      <el-row :gutter="20">
        <el-col :span="12">
          <card title="预算达成率">
            <div class="budget-progress-container" style="height: 476px;overflow: auto;">
              <div
                :class="['budget-progress', {active: asset.assetId === budgetOption.assetId}]"
                v-for="asset in analysisBudget"
                @click="chooseAnalysisBudget(asset)"
                :key="asset.assetId"
              >
                <div class="title">{{asset.assetName}}<!--<span class="type">酒店</span>--></div>
                <div class="progress-a"
                  :style="{width: (asset.inRate > 86 ? 86 : asset.inRate) + '%'}">
                  <span class="rate-tip">{{asset.inRate ? asset.inRate + '%' : ''}}</span>
                </div>
                <div class="progress-b"
                  :style="{width: (asset.outRate > 86 ? 86 : asset.outRate) + '%'}">
                  <span class="rate-tip">{{asset.outRate ? asset.outRate + '%' : ''}}</span>
                </div>
              </div>
            </div>
          </card>
        </el-col>
        <el-col :span="12">
          <card :title="assetName">
            <!-- <title-unit :title="budgetOption.assetName"/> -->
            <div class="title-unit">单位：万元</div>
            <line-area :option="budgetOption.option" height="430px"/>
          </card>
        </el-col>
      </el-row>
    </section>
    <section style="margin-top: 15px;">
      <card title="租赁分析">
        <template v-slot:header-right>
          <asset-type class="fr" :asset-type="rentAssetType" @change="rentAssetTypeChange"/>
        </template>
        <el-row :gutter="20">
          <el-col :span="12">
            <title-suffix title="租金收缴"/>
            <el-table
              :data="analysisRent"
              height="460"
              @row-click="chooseAnalysisRent"
            >
              <el-table-column
                prop="assetName"
                label="项目名称"
                align="center"
              >
              </el-table-column>
              <el-table-column
                prop="cityName"
                label="城市"
                align="center"
              ><template slot-scope="scope">{{scope.row.cityName || '-'}}</template>
              </el-table-column>
              <el-table-column
                align="right"
                prop="rentAbleArea"
                label="可租赁面积(㎡)">
                <template slot-scope="scope">{{scope.row.rentAbleArea + '' | comdify}}</template>
              </el-table-column>
              <el-table-column
                prop="rentRate"
                label="出租率(%)"
                sortable
                align="center"
              ><template slot-scope="scope">{{scope.row.rentRate + '' | comdify}}</template>
              </el-table-column>
              <el-table-column
                prop="averageRentAmt"
                label="平均租金(元/㎡/天)"
                align="right"
              ><template slot-scope="scope">{{scope.row.averageRentAmt.toFixed(2) + '' | comdify}}</template>
              </el-table-column>
            </el-table>
          </el-col>
          <el-col :span="12">
            <title-suffix :title="analysisRentOption.assetName" class="clearfix">
              <el-select v-model="analysisRentSelected" placeholder="请选择" class="analysis-rent-select">
                <el-option
                  v-for="{ value, label } in analysisRentSelect"
                  :key="value"
                  :label="label"
                  :value="value">
                </el-option>
              </el-select>
            </title-suffix>
            <simple-chart :option="analysisRentOption[analysisRentSelected] || {}" height="430px"/>
          </el-col>
        </el-row>
      </card>
    </section>

    <div v-show="show">
      <div class="biz-operator-title">商业运营分析</div>
      <section style="margin-top: 20px;">
        <el-row :gutter="20">
          <el-col :span="8">
            <card-data
              title="客流（人）"
              :img="require('./assets/biz-prople.svg')"
              tip="-"
              :amount="bizOperator.passengerTab.sumCount"
            >
              <div class="value">
                <div class="status">
                  环比上月：<span :class="{
                    up: bizOperator.passengerTab.mom >= 0,
                    down: bizOperator.passengerTab.mom < 0
                  }"
                >{{bizOperator.passengerTab.mom}}%</span>
                </div>
              </div>
            </card-data>
          </el-col>
          <!-- <el-col :span="6">
            <card-data
              title="会员数量"
              :img="require('./assets/biz-sv.svg')"
              tip="-"
              :amount="bizOperator.memberTab.sumCount"
            >
              <div class="value">
                <div class="status">
                  环比上月：<span :class="{
                    up: bizOperator.memberTab.mom >= 0,
                    down: bizOperator.memberTab.mom < 0
                  }"
                >{{bizOperator.memberTab.mom}}%</span>
                </div>
              </div>
            </card-data>
          </el-col> -->
          <el-col :span="8">
            <card-data
              :title="`销售额(万元)`"
              :img="require('./assets/biz-money.svg')"
              tip="-"
              :amount="bizOperator.saleTab.sumCount"
            >
              <div class="value">
                <div class="status">
                  环比上月：<span :class="{
                    up: bizOperator.saleTab.mom >= 0,
                    down: bizOperator.saleTab.mom < 0
                  }"
                >{{bizOperator.saleTab.mom}}%</span>
                </div>
              </div>
            </card-data>
          </el-col>
          <el-col :span="8">
            <card-data
              :title="`租金收入(万元)`"
              :img="require('./assets/biz-in.svg')"
              tip="-"
              :amount="bizOperator.rentTab.sumCount"
            >
              <div class="value">
                <div class="status">
                  环比上月：<span :class="{
                    up: bizOperator.rentTab.mom >= 0,
                    down: bizOperator.rentTab.mom < 0
                  }"
                >{{bizOperator.rentTab.mom}}%</span>
                </div>
              </div>
            </card-data>
          </el-col>
        </el-row>
      </section>
      <section style="margin-top: 15px;">
        <card title="运营分析">
          <el-table
            :data="operationAnalysisData || []"
            height="480"
            class="hidden-all-selection"
            @selection-change="handleSelectionChange"
          >
            <el-table-column
              type="selection"
              width="50">
            </el-table-column>
            <el-table-column
              prop="projectName"
              label="项目名称"
              width="180">
            </el-table-column>
            <el-table-column
              prop="cityName"
              label="城市">
              <template slot-scope="scope">{{scope.row.cityName || '-'}}</template>
            </el-table-column>
            <el-table-column
              label="上月客流(万人)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.passengerCount + '' | comdify}}</template>
            </el-table-column>
            <el-table-column
              label="环比(%)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.passengerMom + '' | comdify}}%</template>
            </el-table-column>
            <el-table-column
              label="年客流(万人)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.yearPassengerCount + '' | comdify}}</template>
            </el-table-column>
            <!-- <el-table-column
              prop="addMemberCount"
              label="上月新增会员"
            >
              <template slot-scope="scope">{{scope.addMemberCount | defaultValue}}{{scope.memberUnit}}</template>
            </el-table-column> -->
            <!-- <el-table-column
              prop="addMemberMom"
              label="环比"
            >
              <template slot-scope="scope">{{scope.addMemberMom | defaultValue}}%</template>
            </el-table-column> -->
            <!-- <el-table-column
              prop="yearMemberCount"
              label="总会员"
            >
              <template slot-scope="scope">{{scope.yearMemberCount | defaultValue}}{{scope.memberUnit}}</template>
            </el-table-column> -->
            <el-table-column
              label="上月销售额(万元)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.saleCount + '' | comdify}}</template>
            </el-table-column>
            <el-table-column
              label="环比(%)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.saleMom + '' | comdify}}%</template>
            </el-table-column>
            <el-table-column
              label="年销售额(万元)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.yearSaleCount + '' | comdify}}</template>
            </el-table-column>
            <el-table-column
              label="上月租金收入(万元)"
              align="right"
              width="150px"
            >
              <template slot-scope="scope">{{scope.row.rentCount + '' | comdify}}</template>
            </el-table-column>
            <el-table-column
              label="环比(%)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.rentMom + '' | comdify}}%</template>
            </el-table-column>
            <el-table-column
              label="年租金收入(万元)"
              align="right"
            >
              <template slot-scope="scope">{{scope.row.yearRentCount + '' | comdify}}</template>
            </el-table-column>
          </el-table>
        </card>
      </section>
      <section style="margin-top: 15px;" v-if="isLeaseOption">
        <el-card>
          <div class="selectValue">
            <div>
              <el-select v-model="selectValue" placeholder="请选择" @change="handelSelectLease">
                <el-option
                  v-for="item in selectLease"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </div>
            <div>单位：万元</div>
          </div>
          <line-area v-if="isShowLine" :option="leaseOption.option" width="100%" height="430px"/>
          <p class="lasertip" v-else>暂无数据</p>
        </el-card>
      </section>
    </div>

    <section style="margin-top: 15px;">
      <card title="所有项目">
        <div class="selecttitle">
          <span @click="setAssetData(2)" :class="titleactive === 2 ? 'titleactive' : ''">商业</span>
          <span @click="setAssetData(1)" :class="titleactive === 1 ? 'titleactive' : ''">办公</span>
          <span @click="setAssetData(3)" :class="titleactive === 3 ? 'titleactive' : ''">产业园</span>
        </div>
        <el-row :gutter="20">
          <el-col :span="24" class="setindex">
            <el-button class="busiList" v-for="item in assetData.adtoList" :key="item.id" @click="goDetail(item.id)">{{item.assetName}}</el-button>
          </el-col>
        </el-row>
      </card>
    </section>
  </div>
</template>

<script>
import CardData from './CardData'
import InOutChart from './InOutChart'
import TitleUnit from './TitleUnit'
import TitleSuffix from './TitleSuffix'
import AssetType from './AssetType'
import LineArea from 'src/components/echarts/LineArea'
import SimpleChart from 'src/components/echarts/SimpleChart'
import Card from 'src/components/Card'
import dayjs from 'dayjs'
import { mapState } from 'vuex'
import { map, reduce } from 'lodash-es'
import { ASSET_TYPEs } from 'src/components/const'
import {
  fetchAssetAnalysisBusiness,
  fetchAssetAnalysisFinanceNoi,
  fetchAnalysisBudget,
  fetchAnalysisRent,
  fetchAnalysisMonthRent,
  fetchBizOperator,
  queryAssetStatue,
  getOperationAnalysis,
  getPassSalesRentInfo
} from 'src/http/assets'

export default {
  name: 'ProjectsAnalyseValue',
  components: { Card, CardData, InOutChart, TitleUnit, TitleSuffix, LineArea, SimpleChart, AssetType },
  props: {
    yearMonth: {
      type: [Date, Object],
      default: () => { return new Date() }
    },
    projectList: {
      type: Array
    }
  },
  data () {
    const analysisRentSelect = [
      { value: 'realIncomeRentCollection', label: '租金收缴额(元)', type: 'bar' },
      { value: 'rentCollectionRate', label: '租金收缴率(%)', type: 'line' },
      { value: 'rentRate', label: '出租率(%)', type: 'line' },
    ]

    return {
      show: false,
      // yearMonth: new Date(),
      assetData: {
        adtoList: [],
        bdtoList: [],
        cdtoList: []
      },
      assetName: null,
      leareData: [],
      selectValue: 'TYPE_3',
      isShowLine: true,
      selectLease: [
        {label: '客流', value: 'TYPE_1'},
        {label: '销售额', value: 'TYPE_2'},
        {label: '租金收入', value: 'TYPE_3'},
      ],
      leaseOption: {
        assetId: void 0,
        assetName: '',
        option: {
          legend: { data: [] },
          xAxis: { data: [] },
          series: [
            { data: [] },
            { data: [] },
          ],
        },
      },
      isLeaseOption: false,
      titleactive: 2,
      business: {
        assetStatis: {},
        monthIncomeStatis: {},
        monthExpenditureStatis: {},
        rentalIncomeStatis: {}
      },
      inOutNoiAssetLayout: ASSET_TYPEs[0].code,
      inOutNoi: {
        xAxis: { data: [] },
        series: [
          { data: [] },
          { data: [] },
          { data: [] },
        ],
      },
      rentAssetType: ASSET_TYPEs[0].code,
      ProjectInOutNoi: [],
      analysisBudget: [],
      budgetOption: {
        assetId: void 0,
        assetName: '',
        option: {
          legend: { data: ['收入', '支出'] },
          xAxis: { data: [] },
          series: [
            { data: [] },
            { data: [] },
          ],
        },
      },
      analysisRent: [],
      analysisRentSelect,
      analysisRentSelected: analysisRentSelect[0].value,
      analysisRentOption: {
        assetId: void 0,
        assetName: '',
        option: {
          legend: { data: ['收入', '支出'] },
          xAxis: { data: [] },
          series: [
            { data: [] },
            { data: [] },
          ],
        },
      },
      bizOperator: {
        passengerTab: {},
        memberTab: {},
        saleTab: {
          unit: '',
        },
        rentTab: {
          unit: '',
        },
        projectCategoryDataVOList: []
      },
      operationAnalysisData: [],
      assetIdList: {}
    }
  },
  watch: {
    yearMonth: function () {
      this.initData()
    }
  },
  computed: {
    ...mapState(['merchant']),
    yearMonthFormat () {
      return dayjs(this.yearMonth).format('YYYY-MM')
    }
  },
  updated () {
    this.show = this.projectList.some(item => Number(item.assetLayout) === 1)
  },
  mounted () {
    this.initData()
  },
  methods: {
    initData () {
      this.fetchAssetAnalysisBusiness()
      this.fetchAssetAnalysisFinanceNoi()
      this.fetchAnalysisBudget()
      this.fetchAnalysisRent()
      this.fetchBizOperator()
      this.queryAssetStatue(2)
      this.getOperationAnalysis()
    },
    goDetail (id) {
      // this.$router.push({path: '/asset/project/detail/' + id})
      this.$emit('setAssetId', id)
    },
    // 运营分析
    getOperationAnalysis () {
      const {yearMonthFormat: yearMonth} = this
      getOperationAnalysis({mainId: this.merchant.id, yearMonth}).then(res => {
        this.operationAnalysisData = res.projectTableDetailVOList
      })
    },
    // 查看项目资质列表
    queryAssetStatue (assetLayout) {
      queryAssetStatue({mainId: this.merchant.id, assetLayout}).then(res => {
        this.assetData.adtoList = res.assetStatusADTOList
      }).catch(err => console.log(err))
    },
    setAssetData (val) {
      this.titleactive = val
      this.queryAssetStatue(val)
    },
    inOutNoiAssetLayoutChange (code) {
      this.inOutNoiAssetLayout = code
      this.fetchAssetAnalysisFinanceNoi()
      this.fetchAnalysisBudget()
    },
    rentAssetTypeChange (code) {
      this.rentAssetType = code
      this.fetchAnalysisRent()
    },
    // 经营分析
    fetchAssetAnalysisBusiness () {
      const { yearMonth } = this
      fetchAssetAnalysisBusiness({
        mainId: this.merchant.id,
        year: yearMonth.getFullYear(),
        month: yearMonth.getMonth() + 1,
      }).then((res) => {
        this.business = res
      })
    },
    // 收入/支出趋势分析
    fetchAssetAnalysisFinanceNoi (row) {
      const { yearMonth, inOutNoiAssetLayout: assetLayout } = this

      let params = {
        mainId: this.merchant.id,
        year: yearMonth.getFullYear(),
        month: yearMonth.getMonth() + 1,
        assetLayout,
        months: 12,
      }
      if (row) {
        params.assetId = row.assetId
      }
      fetchAssetAnalysisFinanceNoi(params).then((res) => {
        const { monthNoiList, assetNoiList } = res
        this.inOutNoi = {
          xAxis: { data: map(monthNoiList, ({ yearMonth }) => yearMonth) },
          series: [
            { data: map(monthNoiList, ({ totalIncome }) => totalIncome) },
            { data: map(monthNoiList, ({ totalExpenditure }) => totalExpenditure) },
            { data: map(monthNoiList, ({ totalNOI }) => totalNOI) },
          ],
        }
        this.ProjectInOutNoi = (assetNoiList || []).slice(0, 7)
      })
    },
    // 预算达成率分析
    fetchAnalysisBudget () {
      const { yearMonthFormat: yearMonth, inOutNoiAssetLayout: assetLayout } = this
      fetchAnalysisBudget({
        mainId: this.merchant.id,
        yearMonth,
        assetLayout,
      }).then((res) => {
        if (Array.isArray(res)) {
          this.analysisBudget = res.filter(item => item.inRate || item.outRate)
          const active = this.analysisBudget[0]
          if (active) {
            this.chooseAnalysisBudget(active)
          }
        }
      })
    },
    chooseAnalysisBudget ({ assetId, assetName, monthRes }) {
      this.assetName = assetName
      if (assetId === this.budgetOption.assetId) return

      const budgetOption = {
        assetId,
        assetName,
      }
      if (Array.isArray(monthRes)) {
        const option = reduce(monthRes, (prev, { year, month, inAmt, outAmt }) => {
          prev.xAxisData.push(`${year}-${month}`)
          prev.inData.push(inAmt)
          prev.outData.push(outAmt)

          return prev
        }, { xAxisData: [], inData: [], outData: [] })

        budgetOption.option = {
          color: ['#00DAD9', '#FCB644'],
          legend: { data: ['收入', '支出'] },
          xAxis: { data: option.xAxisData },
          series: [
            { name: '收入', data: option.inData },
            { name: '支出', data: option.outData }
          ]
        }
      }

      this.budgetOption = budgetOption
    },
    // 租赁分析
    fetchAnalysisRent () {
      const { yearMonthFormat: yearMonth, rentAssetType } = this
      fetchAnalysisRent({
        mainId: this.merchant.id,
        yearMonth,
        assetLayout: rentAssetType,
      }).then((res) => {
        this.analysisRent = res

        const active = res[0]
        if (active) {
          this.chooseAnalysisRent(active)
        }
      })
    },
    chooseAnalysisRent ({ assetId, assetName, yearMonth }) {
      if (this.analysisRentOption.assetId === assetId) return

      const analysisRentOption = {
        assetId,
        assetName,
      }
      // 租赁分析--月度数据获取
      fetchAnalysisMonthRent({ mainId: this.merchant.id, assetId, yearMonth }).then((res) => {
        const result = reduce(res, (prev, {
          yearMonth,
          realIncomeRentCollection,
          rentCollectionRate,
          rentRate,
        }) => {
          prev.xAxis.push(yearMonth)
          prev.realIncomeRentCollection.push(realIncomeRentCollection)
          prev.rentCollectionRate.push(rentCollectionRate)
          prev.rentRate.push(rentRate)

          return prev
        }, {
          xAxis: [],
          ...reduce(this.analysisRentSelect, (p, { value }) => {
            p[value] = []
            return p
          }, {})
        }, {})

        for (let { value, label: name, type } of this.analysisRentSelect) {
          analysisRentOption[value] = {
            legend: { show: false, data: [name] },
            xAxis: { data: result.xAxis },
            series: [
              { name, data: result[value], type, barWidth: 25 },
            ],
          }
        }

        this.analysisRentOption = analysisRentOption
      })
    },
    // 商业运营分析
    fetchBizOperator () {
      const {yearMonthFormat: yearMonth} = this
      fetchBizOperator({mainId: this.merchant.id, yearMonth})
        .then(res => {
          this.bizOperator = res
        }).catch(err => console.log(err))
    },
    handelSelectLease () {
      // this.leare(this.leareData)
      this.getPassSalesRentInfo()
    },
    getPassSalesRentInfo () {
      const { yearMonthFormat: yearMonth } = this
      let params = {
        mainId: this.merchant.id,
        assetIdList: Object.keys(this.assetIdList),
        dataType: this.selectValue,
        yearValue: yearMonth.substr(0, 4)
      }
      getPassSalesRentInfo(params).then(res => {
        const months = Array.from({ length: 12 }, (_, index) => (index + 1 + '').padStart(2, 0))
        const xAxisData = months.map(item => params.yearValue + '-' + item)
        if (res.length > 0) {
          res.forEach(item => {
            let child = item.data
            if (child) {
              item.array = reduce(child, (prev, { data, yearMonth }) => {
                prev[yearMonth] = data
                return prev
              }, {})
              item.salesData = xAxisData.map((yearMonth) => item.array[yearMonth] || 0)
            }
          })
          let seriesData = res.map(item => (
            {
              name: this.assetIdList[item.assetId],
              data: item.salesData,
              type: 'line',
              showSymbol: false
            }))

          this.leaseOption.option = {
            xAxis: {data: xAxisData},
            series: seriesData
          }
          this.isShowLine = true
        } else {
          this.isShowLine = false
        }
      })
    },
    handleSelectionChange (row) {
      if (row.length > 0) {
        this.isLeaseOption = true
        this.assetIdList = {}
        // row.forEach(item => this.assetIdList.push(item.assetId))
        row.forEach(item => { this.assetIdList[item.assetId] = item.projectName })
        this.getPassSalesRentInfo()
      } else {
        this.isLeaseOption = false
        this.leaseOption = {
          assetId: void 0,
          assetName: '',
          option: {
            legend: { data: [] },
            xAxis: { data: [] },
            series: [
              { data: [] },
              { data: [] },
            ],
          },
        }
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  .value {
    font-size: 14px;

    .status {
      .up {
        padding-left: 15px;
        color: #00CB00;
        background: url("./assets/value-up.svg") left center no-repeat;
      }

      .down {
        padding-left: 15px;
        color: #FF0016;
        background: url("./assets/value-down.svg") left center no-repeat;
      }
    }
  }

  .budget-progress-container {
    margin: -14px -20px 0;
    min-height: 488px;
  }

  .budget-progress {
    padding: 12px 20px;

    &:not(.active) {
      cursor: pointer;
    }

    &:hover, &.active {
      background-color: #F5F5F5;
    }

    .title {
      margin-bottom: 7px;
      font-size: 15px;
      color: #333;
      font-weight: bold;

      > .type {
        height: 16px;
        margin-left: 5px;
        padding: 0 5px;
        font-size: 8px;
        color: white;
        vertical-align: middle;
        background-color: #F5A623;
        border-radius: 1px;
      }
    }

    [class|='progress'] {
      height: 16px;
      margin: 1px 0;
    }

    .progress-a {
      position: relative;
      background-color: #00DAD9;
    }

    .progress-b {
      position: relative;
      background-color: #FCB644;
    }

    .rate-tip {
      position: absolute;
      right: -80px;
    }
  }

  .analysis-rent-dropdown-link {
    color: #5E0EFF;
  }

  .biz-operator-title {
    margin-top: 20px;
    font-size: 18px;
    font-weight: bold;
    color: #333;
  }

  .selecttitle {
    margin-bottom: 20px;
    span {
      font-size: 15px;
      padding-bottom: 4px;
      color: #333;
      margin-right: 16px;
      cursor: pointer;
    }
    .titleactive {
      border-bottom: 3px solid #5e0eef;
    }
  }

  .selectValue {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .lasertip {
    height: 100px;
    line-height: 100px;
    text-align: center;
  }
  .busiList{
    font-size:15px;
    font-weight:400;
    color:rgba(51,51,51,1);
    border-radius:0;
    height:36px;
    background:rgba(239,239,239,1);
    line-height: 3px;
    margin: 0 10px 10px 0;
    margin-left: 0 !important;
  }
  .busiList:hover{
    color:rgba(255,255,255,1);
    border-radius:0;
    height:36px;
    background:rgba(94,14,255,1);
    line-height: 3px;
  }

  .index-style {
    display: inline-block;
    width: 23px;
    height: 23px;
    text-align: center;
    color: #fff;
    border-radius:2px;
    background:rgba(196,196,196,1);
  }

  .index-red {
    background:rgba(255,54,84,1);
  }

  .index-yellow {
    background:rgba(251,183,51,1);
  }

  .index-blue {
    background:rgba(59,94,254,1);
  }

  .title-unit {
    font-size: 16px;
    font-weight: bold;
    padding: 15px 0;
  }
</style>

<style lang="scss">
  .analysis-rent-select {
    float: right;
    width: 150px;

    input {
      border: 0 none;
    }
  }
</style>

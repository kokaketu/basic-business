<template>
  <div class="budget-charts">
    <div class="title">预算对比<span class="title-tip">本年度每月预算与去年预算同比</span></div>
    <span class="unit">万元</span>
    <div
      ref="charts"
      style="width: 100%;height: 380px;"
      :budget-type="budgetType"
      :main-id="mainId"
      :asset-id="assetId"
      :update="updated"
    />
  </div>
</template>

<script>
import echarts from 'echarts'
import { statisticsAssetDetail } from '../../http/budget'
import { map } from 'lodash-es'

export default {
  name: 'BudgetCharts',
  // props: ['budgetType', 'mainId', 'assetId'],
  props: {
    budgetType: Number | String,
    mainId: Number,
    assetId: Number,
    updated: Number | Boolean, // 用于外部数据更新后触发 updated 生命周期，可以使用 Math.random 触发更新
  },
  created () {

  },
  activated () {
    this.charts = echarts.init(this.$refs.charts)

    this.option = {
      color: ['#CFD1DA', '#DD7471'],
      tooltip: {
        trigger: 'axis',
        axisPointer: { // 坐标轴指示器，坐标轴触发有效
          type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
        }
        // formatter: '{b}<br/>{c} 万元'
      },
      grid: {
        left: 70,
        right: 40
      },
      legend: {
        show: false,
        data: []
      },
      xAxis: {
        type: 'category',
        // boundaryGap: false,
        data: [],
        axisLine: {
          show: false
        },
        axisTick: {
          show: false
        },
        axisLabel: {
          color: '#666'
        }
      },
      yAxis: {
        type: 'value',
        axisLine: {
          show: false
        },
        axisTick: {
          show: false
        },
        splitLine: {
          lineStyle: {
            color: '#F2F2F2'
          }
        },
        axisLabel: {
          color: '#999'
        }
      },
      series: [
        {
          name: '2019',
          data: [],
          type: 'bar',
          barMaxWidth: 30
        },
        {
          name: '2020',
          data: [],
          type: 'bar',
          // barGap: '-100%',
          barMaxWidth: 30
        }
      ]
    }
    this.charts.setOption(this.option)

    if (this.assetId != null) {
      this.statisticsAssetDetail()
    }
  },
  updated () {
    this.statisticsAssetDetail()
  },
  methods: {
    statisticsAssetDetail () {
      const {budgetType, mainId, assetId} = this
      statisticsAssetDetail({ budgetType, mainId, assetId })
        .then(res => {
          const data = res || []
          this.charts.setOption({
            legend: {
              data: map(data, ({ year }) => year)
            },
            xAxis: {
              data: map((data[0] || {}).monthResult, ({ month }) => month)
            },
            series: map(data, ({ year, monthResult }) => ({
              name: year,
              data: map(monthResult, ({ amounts }) => amounts || 0)
            }))
          })
        })
    }
  }
}
</script>

<style lang="scss" scoped>
.budget-charts {
  position: relative;
  .title {
    position: absolute;
    top: 10px;
    left: 20px;
    font-size: 18px;
    color: #1F242D;
    font-weight: bold;
    > .title-tip {
      margin-left: 8px;
      font-size: 13px;
      font-weight: 400;
      color: #999;
    }
  }
  .unit {
    position: absolute;
    top: 10px;
    right: 40px;
    font-size: 14px;
  }
}
</style>

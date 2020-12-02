<!-- 执行分析页面的图标 -->
<template>
<!--  <el-card class="box-card">-->
<!--    <div class="title">预算达成率<span class="title-tip">每个月收入预算与支出预算情况展示</span></div>-->
<!--    <div class="notice">-->
<!--      <p class="notice-tip">收入预算：{{incomeBudgetDesc}}</p>-->
<!--      <p class="notice-tip">支出预算：{{outcomeBudgetDesc}}</p>-->
<!--    </div>-->
    <div
      ref="charts"
      style="width: 100%;height: 380px;"
      :main-id="mainId"
      :asset-id="assetId"
      :stages-id="stagesId"
      :asset-layout="assetLayout"
      :year="year"
      :update="updated"
    />
<!--  </el-card>-->
</template>

<script>
import echarts from 'echarts'
import { budgetAchievementRate } from '@/http/budget'
import { map } from 'lodash-es'
import * as utils from '@/utils/index'

export default {
  name: 'budgetRateCharts',
  // props: ['budgetType', 'mainId', 'assetId'],
  data () {
    return {
      incomeBudgetDesc: '',
      outcomeBudgetDesc: ''
    }
  },
  props: {
    assetLayout: Number | String,
    mainId: Number,
    assetId: Number,
    stagesId: Number,
    year: String,
    updated: Number | Boolean, // 用于外部数据更新后触发 updated 生命周期，可以使用 Math.random 触发更新
  },
  created () {

  },
  mounted () {
    this.budgetAchievementRate()
    this.charts = echarts.init(this.$refs.charts)
    this.option = {
      title: {
        text: '预算达成率',
        subtext: '每个月收入预算与支出预算情况展示',
        textStyle: {
          fontSize: 16,
          color: '#1F242D',
        },
        subtextStyle: {
          fontSize: 14,
          color: '#999',
        },
      },
      tooltip: {
        show: true,
        trigger: 'axis',
        position: function (p) {
          return [p[0] + 10, p[1] - 10]
        },
        formatter: function (params, ticket, callback) {
          var res = params[0].name
          for (var i = 0, l = params.length; i < l; i++) {
            res += '<br/>' + params[i].seriesName + ' : ' + params[i].value + ' %' // 鼠标悬浮显示的字符串内容
          }
          return res
        }
      },
      legend: {
        data: [{name: '收入预算', textStyle: {color: '#1D8FF7'}}, {name: '支出预算', textStyle: {color: '#ff6600'}}],
        icon: 'rect',
        itemWidth: 12,
        itemHeight: 12,
        x: 'center',
        y: 'bottom',
        padding: [0, 0, 20, 0]
      },
      grid: {
        top: 70,
        left: 0,
        right: '3%',
        bottom: 40,
        containLabel: true
      },
      toolbox: {
        // feature: {
        //   saveAsImage: {}
        // }
      },
      yAxis: {
        type: 'value',
        axisLine: {
          show: false
        },
        axisLabel: {
          color: '#999',
          formatter: '{value} %'
        },
        axisTick: {
          show: false
        },
        splitLine: {
          lineStyle: {
            type: 'dashed',
            color: '#E7E7E7'
          }
        },
      },
      noDataLoadingOption: {
        text: '暂无数据',
        effect: 'bubble',
        effectOption: {
          effect: {
            n: 0
          }
        }
      },
      xAxis: {
        type: 'category',
        boundaryGap: false,
        splitLine: {show: false},
        axisLine: {
          show: false
        },
        axisLabel: {
          color: '#999'
        },
        axisTick: {
          show: false
        },
      },
      series: [
        {
          name: '收入预算',
          type: 'line',
          showSymbol: true,
          label: {
            show: true,
            position: 'top',
            color: '#fff',
            backgroundColor: '#1D8FF7',
            padding: [3, 8],
            borderRadius: 10,
            formatter: '{c} %'
          },
          itemStyle: {
            normal: {
              color: '#1D8FF7',
              lineStyle: {
                color: '#1D8FF7'
              }
            }
          },
        },
        {
          name: '支出预算',
          type: 'line',
          showSymbol: true,
          label: {
            show: true,
            position: 'top',
            color: '#fff',
            backgroundColor: '#ff6600',
            padding: [3, 8],
            borderRadius: 10,
            formatter: '{c} %'
          },
          itemStyle: {
            normal: {
              color: '#ff6600',
              lineStyle: {
                color: '#ff6600'
              }
            }
          }
        },
      ]
    }
    this.charts.setOption(this.option)
  },
  updated () {
    this.budgetAchievementRate()
  },
  methods: {
    budgetAchievementRate () {
      const {mainId, assetId, stagesId, assetLayout, year} = this
      if (!utils.isEmpty(mainId)) {
        budgetAchievementRate({mainId, assetId, stagesId, assetLayout, year}).then(res => {
          const data = res.data || []
          this.incomeBudgetDesc = data.incomeBudgetDesc
          this.outcomeBudgetDesc = data.outcomeBudgetDesc
          if (data.incomeBudgetList.length === 0 && data.outcomeBudgetList.length === 0) {
            // 无数据填0 处理
            let month = new Date().getMonth() + 1
            let year = new Date().getFullYear()
            while (month > 0) {
              data.incomeBudgetList.unshift({year: year, month: month < 10 ? `0${month}` : month, actualAmt: 0, budgetAmt: 0, achievementRate: 0})
              data.outcomeBudgetList.unshift({year: year, month: month, actualAmt: 0, budgetAmt: 0, achievementRate: 0})
              month--
            }
          }
          this.charts.setOption({
            xAxis: {
              data: map(data.incomeBudgetList, ({ year, month }) => `${year}-${month}`)
            },
            series: [
              {
                data: map(data.incomeBudgetList, ({ achievementRate }) => achievementRate)
              },
              {
                data: map(data.outcomeBudgetList, ({ achievementRate }) => achievementRate)
              },
            ]
          })
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.budget-charts {
  margin-left: 10px;
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
  .notice {
    float: right;
    margin-top: 10px;
    margin-right: 5%;
    .notice-tip{
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

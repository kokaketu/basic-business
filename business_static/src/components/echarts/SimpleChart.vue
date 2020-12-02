<template>
  <div ref="line-area" :option="option" :style="{width, height}" />
</template>

<script>
import echarts from 'echarts'

export default {
  name: 'SimpleChart',
  props: {
    width: {
      type: String,
      default: '100%',
      required: false
    },
    height: {
      type: String,
      default: '100%',
      required: true
    },
    option: {
      type: Object,
      required: true
    }
  },
  mounted () {
    this.charts = echarts.init(this.$refs['line-area'])

    const option = {
      color: ['#5E0EFF', '#FCB644', '#00DAD9'],
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          // type: 'shadow'
        },
        // formatter: '{b}<br />{a}: {c}',
        formatter: function (params) {
          let seriesName = params[0].seriesName
          let len = seriesName.length
          let start = len - 3
          let text = `<div>${params[0].axisValue}</div><div>${seriesName.substr(0, start)}：${params[0].value}${seriesName.substr(len-2, 1)}</div>`
          return text
        }
      },
      grid: {
        top: 20,
        left: 0,
        right: '3%',
        bottom: 40,
        containLabel: true
      },
      legend: {
        bottom: 10,
        icon: 'circle',
        itemWidth: 12,
        data: []
      },
      xAxis: {
        type: 'category',
        // boundaryGap: false,
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
        data: []
      },
      yAxis: {
        type: 'value',
        axisLine: {
          show: false
        },
        axisLabel: {
          color: '#999'
        },
        axisTick: {
          show: false
        },
        splitLine: {
          lineStyle: {
            type: 'dashed',
            color: '#E7E7E7'
          }
        }
      },
      // 这里预准备了两个，更多线条需在使用时第三条后面需与下面相似
      series: [
        {
          name: '?',
          data: [],
          type: 'line',
          showSymbol: false,
        },
      ]
    }

    this.charts.setOption(option)
    this.charts.setOption(this.option)
  },
  updated () {
    this.charts.setOption(this.option)
  }
}
</script>

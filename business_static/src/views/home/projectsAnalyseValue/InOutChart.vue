<template>
  <div ref="in-out" :option="option" :style="{width, height}" />
</template>

<script>
import echarts from 'echarts'

export default {
  name: 'InOutChart',
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
    this.charts = echarts.init(this.$refs['in-out'])
    const option = {
      color: ['#00DAD9', '#FCB644', '#5F00FF'],
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      grid: {
        top: 20,
        left: 0,
        right: 0,
        bottom: 40,
        containLabel: true
      },
      legend: {
        bottom: 10,
        icon: 'circle',
        itemWidth: 12,
        data: ['收入', '支出', 'NOI']
      },
      xAxis: {
        type: 'category',
        data: [],
        splitLine: {show: false},
        axisLine: {
          show: false
        },
        axisLabel: {
          color: '#999'
        },
        axisTick: {
          show: false
        }
      },
      yAxis: [
        {
          type: 'value',
          axisLine: {
            show: false
          },
          axisLabel: {
            // show: false
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
        }
      ],
      series: [
        {
          name: '收入',
          type: 'line',
          showSymbol: false,
          data: []
        },
        {
          name: '支出',
          type: 'line',
          showSymbol: false,
          data: []
        },
        {
          name: 'NOI',
          type: 'bar',
          barWidth: 25,
          data: []
        }
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

<style scoped>

</style>

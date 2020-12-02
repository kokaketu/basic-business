<template>
  <div ref="line-area" :option="option" :style="{width, height}" />
</template>

<script>
import echarts from 'echarts'

export default {
  name: 'LineArea',
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
  data() {
    return {
      optionInit: {
        color: ['#5E0EFF', '#FCB644', '#00DAD9', '#F94B7E', '#00E4A5', '#4D7BFE', '#8065FF', '#F5A623', '#00A4FF', '#C4DA00', '#00CCCB'],
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            // type: 'shadow'
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
          itemHeight: 12,
          data: []
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
          
        ]
      }
    }
  },
  mounted () {
    this.charts = echarts.init(this.$refs['line-area'])

    this.renderChart()
  },
  methods: {
    renderChart() {
      for(let i = 0; i < 20; i++) {
        this.optionInit.series.push({
          name: 1,
          data: [],
          type: 'line',
          showSymbol: false,
        })
      }
      this.charts.setOption(this.optionInit)
      this.charts.setOption(this.option)
    }
  },
  updated () {
    this.renderChart()
  }
}
</script>

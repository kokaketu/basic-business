<!--
 * @Author: your name
 * @Date: 2020-05-27 15:39:34
 * @LastEditTime: 2020-05-27 17:12:52
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\echarts\zoom-chart.vue
-->
<template>
  <div class="zoomChart"></div>
</template>
<script>
import echarts from 'echarts'
export default {
  name: 'zoomChart',
  props: ['datas'],
  data () {
    return {}
  },
  methods: {
    drawBar: function () {
      let id = this.datas.id
      var charts = echarts.init(
        document.getElementsByClassName('zoomChart')[id || 0]
      )
      let option = {
        color: this.datas.colors,
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow',
            label: {
              show: true
            }
          },
          formatter: function (params) {
            return params[0].axisValue + ': ' + params[0].data + '%'
          }
        },
        calculable: true,
        grid: {
          top: '10%',
          left: '20px',
          right: '20px',
          bottom: '50px',
          containLabel: true
        },
        xAxis: [{
          type: 'category',
          axisTick: false,
          axisLine: {
            lineStyle: {
              type: 'dashed',
              color: '#666666'
            }
          },
          data: this.datas.names
        }],
        yAxis: [{
          type: 'value',
          name: '单位：万元',
          axisTick: false,
          axisLine: {
            show: false,
            lineStyle: {
              color: '#999999'
            }
          }
        }],
        dataZoom: [{
          show: true,
          fillerColor: this.datas.colors[0],
          backgroundColor: '#EDEDED',
          handleStyle: {
            borderColor: this.datas.colors[0]
          }
        }],
        series: [{
          name: '收入',
          type: 'bar',
          barMaxWidth: '22',
          data: this.datas.barData
        }, {
          name: '同比',
          type: 'line',
          symbol: 'none',
          lineStyle: {
            width: 3
          },
          data: this.datas.lineData
        }]
      }
      charts.setOption(option)
    }
  },
  activated () {
    this.drawBar()
  }
}
</script>
<style lang="scss" scoped>
  .zoomChart {
    height: 100%;
    width: 100%;
  }
</style>

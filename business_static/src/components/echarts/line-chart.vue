<!--
 * @Author: your name
 * @Date: 2020-05-27 10:40:29
 * @LastEditTime: 2020-05-27 11:28:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\echarts\line-chart.vue
-->
<template>
  <div class="lineChart"></div>
</template>
<script>
import echarts from 'echarts'
export default {
  name: 'lineChart',
  props: ['datas'],
  data () {
    return {

    }
  },
  activated () {
    let id = this.datas.id
    let div = document.getElementsByClassName('lineChart')[id || 0]
    let myChart = echarts.init(div)
    myChart.setOption({
      color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [
        { offset: 0, color: this.datas.color[1] },
        { offset: 1, color: this.datas.color[0] }
      ]),
      grid: {
        top: 0,
        left: 0,
        right: 0,
        bottom: 0
      },
      xAxis: {
        boundaryGap: false,
        data: []
      },
      yAxis: {
        splitLine: false,
        axisLine: {
          lineStyle: {
            color: '#fff'
          }
        }
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line',
        lineStyle: {
          color: this.datas.color[0]
        },
        symbol: 'none',
        label: {
          show: false
        },
        areaStyle: {}
      }]
    })
  }
}
</script>
<style lang="sass" scoped>

</style>

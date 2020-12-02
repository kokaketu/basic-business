<!--
 * @Author: your name
 * @Date: 2020-05-27 18:01:57
 * @LastEditTime: 2020-05-27 18:08:44
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\echarts\pie-chart.vue
-->
<template>
  <div class="pieChart"></div>
</template>
<script>
import echarts from 'echarts'
export default {
  name: 'pieChart',
  props: ['datas'],
  data () {
    return {
    }
  },
  methods: {
    drawPie: function () {
      var charts = echarts.init(document.getElementsByClassName('pieChart')[this.datas.id || 0])
      charts.setOption({
        legend: {
          orient: 'left',
          x: '70%',
          y: 'center',
          data: this.datas.legendData
        },
        tooltip: {
          trigger: 'item',
          borderColor: '#ebebeb',
          borderWidth: 1,
          padding: 10,
          backgroundColor: '#fff',
          formatter: this.datas.tooltip || function (params) {
            return params.data.name + ': ' + params.data.rate
          },
          textStyle: {
            color: '#999'
          }
        },
        series: [
          {
            type: 'pie',
            radius: this.datas.radiusData,
            color: ['#F94B7E', '#00E4A5', '#4D7BFE', '#8065FF', '#F5A623', '#00A4FF', '#5E0EFF', '#C4DA00', '#00CCCB'],
            center: ['35%', '50%'],
            label: {
              normal: {
                position: 'inner',
                formatter: function (params) {
                  return params.data.rate
                }
              },
              emphasis: {
                textStyle: {
                  fontSize: '18'
                }
              }
            },
            data: this.datas.data
          }
        ]
      })
    }
  },
  activated () {
  }
}
</script>
<style scoped lang="scss">
.pieChart {
  height: 100%;
  width: 100%;
}
</style>

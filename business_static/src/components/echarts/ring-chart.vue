<!--
 * @Author: your name
 * @Date: 2020-05-27 17:14:33
 * @LastEditTime: 2020-05-27 17:34:28
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\echarts\ring-chart.vue
-->
<template>
  <div class="ringChart"></div>
</template>
<script>
import echarts from 'echarts'
export default {
  props: ['datas'],
  data () {
    return {

    }
  },
  methods: {
    drawRing: function () {
      let id = this.datas.id
      var charts = echarts.init(
        document.getElementsByClassName('ringChart')[id || 0]
      )
      let option = {
        animation: false,
        grid: {
          top: 0,
          left: 0,
          right: 0,
          bottom: 0
        },
        color: ['#ECECEC', this.datas.color],
        series: [
          {
            type: 'pie',
            radius: ['80%', '60%'],
            labelLine: {
              show: false
            },
            data: [100 - this.datas.value, this.datas.value]
          }
        ]
      }
      charts.setOption(option)
    }
  },
  activated () {
    this.drawRing()
  }
}
</script>
<style lang="scss" scoped>

</style>

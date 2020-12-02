<template>
  <el-row :gutter="50">
    <el-col :span="24">
      <h3 class="sub-title">租约到期</h3>
      <div ref="bar" style="width: 100%;height: 380px;" />
    </el-col>
    <el-col :span="24" style="margin-top:40px">
      <h3 class="sub-title">{{Number(status) === 2 ? '业态分析': '行业分析'}}</h3>
      <el-row :gutter="40" :data="data">
        <el-col :span="12">
          <div class="pie-container">
            <div class="pie-title">
              <h3 class="title">租金收入按{{Number(status) === 2 ? '业态': '行业'}}</h3>
              <!-- <div>(租金收入)</div> -->
            </div>
            <div ref="pieLeft" style="width: 100%;height: 380px;" />
          </div>
        </el-col>
        <el-col :span="12">
          <div class="pie-container">
            <div class="pie-title">
              <h3 class="title">计租面积按{{Number(status) === 2 ? '业态': '行业'}}</h3>
              <!-- <div>(计租面积)</div> -->
            </div>
            <div ref="pieRight" style="width: 100%;height: 380px;" />
          </div>
        </el-col>
      </el-row>
    </el-col>
  </el-row>
</template>

<script>
import echarts from 'echarts'
import { map } from 'lodash-es'

export default {
  name: 'RentCharts',
  props: ['data', 'status'],
  mounted () {
    this.barChart = echarts.init(this.$refs.bar)
    this.pieChartLeft = echarts.init(this.$refs.pieLeft)
    this.pieChartRight = echarts.init(this.$refs.pieRight)

    this.barOption = {
      color: ['#5F00FF', '#00CCCB'],
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow',
        },
        formatter: function (params) {
          let text = ''
          if (params.length === 2) {
            if (params[0].value === 0 && params[1].value !== 0) {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}</div><div>${params[1].seriesName}：${params[1].value}㎡</div></div>`
            } else if (params[0].value !== 0 && params[1].value === 0) {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}元</div><div>${params[1].seriesName}：${params[1].value}</div></div>`
            } else if (params[0].value === 0 && params[1].value === 0) {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}</div><div>${params[1].seriesName}：${params[1].value}</div></div>`
            } else {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}元</div><div>${params[1].seriesName}：${params[1].value}㎡</div></div>`
            }
          } else if (params.length === 1) {
            if (params[0].seriesName === '面积') {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}㎡</div></div>`
            } else if (params[0].seriesName === '租金') {
              text = `<div><div>${params[0].name}</div> <div>${params[0].seriesName}：${params[0].value}元</div></div>`
            }
          }
          return text
        },
      },
      legend: {
        bottom: 10,
        icon: 'rect',
        itemWidth: 16,
        itemHeight: 8,
        textStyle: {
          fontSize: 14,
          color: '#666',
        },
        data: ['租金', '面积'],
      },
      grid: {
        top: 20,
        left: '3%',
        right: '4%',
        bottom: 50,
        containLabel: true,
      },
      xAxis: {
        type: 'category',
        splitLine: { show: false },
        axisLine: {
          show: false,
        },
        axisTick: {
          show: false,
        },
        data: [],
      },
      yAxis: {
        type: 'value',
        axisLine: {
          show: false,
        },
        axisLabel: {
          show: false,
        },
        axisTick: {
          show: false,
        },
        splitLine: {
          lineStyle: {
            type: 'dashed',
            color: '#E7E7E7',
          },
        },
      },
      series: [
        {
          name: '租金',
          type: 'bar',
          barWidth: 25,
          label: {
            show: true,
            position: 'top',
            color: '#333',
            fontSize: 14,
          },
          data: [],
        },
        {
          name: '面积',
          type: 'bar',
          barWidth: 25,
          barGap: '100%',
          label: {
            show: true,
            position: 'top',
            color: '#333',
            fontSize: 14,
          },
          data: [],
        },
      ],
    }

    this.pieLeftOption = {
      color: [
        '#8d9ee6',
        '#dfc392',
        '#75aef2',
        '#5E0EFF',
        '#C4DA00',
        '#FF7A45',
        '#F94B7E',
        '#00CCCB',
        '#00A4FF',
        '',
      ],
      tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c} ({d}%)',
      },
      legend: {
        orient: 'horizontal',
        bottom: 10,
        icon: 'circle',
        itemWidth: 10,
        itemHeight: 10,
        // itemGap: 20,
        textStyle: {
          fontSize: 14,
          color: '#666',
        },
        data: ['q'],
      },
      series: [
        {
          name: '租金收入',
          type: 'pie',
          radius: ['50%', '65%'],
          center: ['50%', '35%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center',
          },
          labelLine: {
            show: false,
          },
          data: [{ value: 1, name: 'q' }],
        },
      ],
    }

    this.pieRightOption = {
      color: [
        '#8d9ee6',
        '#dfc392',
        '#75aef2',
        '#5E0EFF',
        '#C4DA00',
        '#FF7A45',
        '#F94B7E',
        '#00CCCB',
        '#00A4FF',
        '',
      ],
      tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c} ({d}%)',
      },
      legend: {
        orient: 'horizontal',
        bottom: 10,
        icon: 'circle',
        itemWidth: 10,
        itemHeight: 10,
        // itemGap: 20,
        textStyle: {
          fontSize: 14,
          color: '#666',
        },
        data: ['q'],
      },
      series: [
        {
          name: '计租面积',
          type: 'pie',
          radius: ['50%', '65%'],
          center: ['50%', '35%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center',
          },
          labelLine: {
            show: false,
          },
          data: [{ value: 1, name: 'q' }],
        },
      ],
    }

    this.barChart.setOption(this.barOption)
    this.pieChartLeft.setOption(this.pieLeftOption)
    this.pieChartRight.setOption(this.pieRightOption)

    // this.update()
  },
  updated () {
    this.update()
  },
  methods: {
    update () {
      const { data } = this
      const barOption = {
        xAxis: {
          data: map(data.histogram, (item) => {
            const [year] = Object.keys(item)
            return year
          }),
        },
        series: [
          {
            data: map(data.histogram, (item) => {
              const [year] = Object.keys(item)
              const { rent } = item[year]
              return rent
            }),
          },
          {
            data: map(data.histogram, (item) => {
              const [year] = Object.keys(item)
              const { area } = item[year]
              return area
            }),
          },
        ],
      }

      const leftPieOption = {
        legend: {
          data: Object.keys(data.layoutRentInfo || {}),
        },
        series: [
          {
            data: map(data.layoutRentInfo, (value, name) => ({ value, name })),
          },
        ],
      }

      const rightPieOption = {
        legend: {
          data: Object.keys(data.layoutAreaInfo || {}),
        },
        series: [
          {
            data: map(data.layoutAreaInfo, (value, name) => ({ value, name })),
          },
        ],
      }

      this.barChart.setOption(barOption)
      this.pieChartLeft.setOption(leftPieOption)
      this.pieChartRight.setOption(rightPieOption)
    },
  },
}
</script>

<style scoped>
.pie-container {
  position: relative;
}
.pie-title {
  position: absolute;
  left: 50%;
  top: 30%;
  font-size: 14px;
  font-weight: 400;
  color: #666;
  line-height: 20px;
  text-align: center;
  transform: translateX(-65px);
}
.pie-title .title {
  font-size: 18px;
  font-weight: 400;
  color: #1f242d;
  line-height: 25px;
}

.sub-title {
  font-size: 16px;
  font-weight: 400;
  color: #333;
  margin-bottom: 30px;
}
</style>

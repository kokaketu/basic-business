<template>
  <div id="passengerFlowInsert">
    <div class="clearfix">
      <el-date-picker
        class="pull-left"
        type="month"
        format="yyyy-MM"
        v-model="selectDate"
        :clearable="false"
        :picker-options="{
          disabledDate(time) {
            return time.getTime() > Date.now();
          },
        }"
        />
      <el-button class="btn pull-right" style="margin-left: 10px" @click="open2" icon="el-icon-s-data">录入客流指标</el-button>
      <el-button class="btn pull-right" @click="open1" icon="el-icon-data-line">录入月客流</el-button>
      <!-- <el-upload class="pull-right" style="margin-left: 10px"
        :action='uploadUrl'
        name='filename'
        :on-success="uploadSeccess"
        :data='getUplodData()'
        :show-file-list="false">
        <el-button class="btn" size="small" type="primary" icon="el-icon-upload2">导入日客流</el-button>
      </el-upload>
      <el-button class="btn pull-right" @click="downloadTemplate" icon="el-icon-download">下载模板</el-button> -->
    </div>
    <el-alert
      v-if="info.show"
      type="warning"
      :closable="false"
      show-icon>
      <template slot="title">{{info.name}}<span style="color: black;margin-left: 10px">客流指标：<el-link @click="open2">{{info.z1}}</el-link>人，本月按天累计客流：{{passengerAllCount}}人，按月录入客流：{{info.z2 ? info.z2 : 0 }}人</span></template>
    </el-alert>

    <div class="clearfix">
      <div ref="echartsA" class="echarts pull-left"></div>
      <div ref="echartsB" class="echarts pull-right"></div>
    </div>

    <div class="insert">
      <el-calendar v-model="calendarSelect">
        <template
          slot="dateCell"
          slot-scope="{date, data}">
          <div class="calendar">
            <div class="p-edit"><i class="el-icon-edit"></i></div>
            <div class="date" v-if="date.getDate() === 1">{{date.getMonth() + 1}}月{{date.getDate()}}日</div>
            <div class="date" v-else><span class="present">{{date.getDate()}}</span></div>
            <div style="color: #5E0EFF" v-if="date.getFullYear() === selectDate.getFullYear() && date.getMonth() === selectDate.getMonth()" class="value">
              <div @click.stop v-if="data.isSelected && update">
                <!-- <el-input-number
                  controls-position="right"
                  placeholder="请输入内容"
                  :controls="false"
                  :min="0"
                  :style="1"
                  :step-strictly="true"
                  @focus="focus($event, dateData[date.getDate()])"
                  @blur="blur(date.getDate(), date, data.day)"
                  v-model="dateData[date.getDate()]">
                </el-input-number> -->
                <el-input
                  placeholder="请输入客流"
                  @focus="focus($event, dateData[date.getDate()])"
                  @blur="blur(date.getDate(), date, data.day)"
                  @input="dateData[date.getDate()] = dateData[date.getDate()].replace(/[^0-9]/g, '')"
                  v-model="dateData[date.getDate()]">
                </el-input>
              </div>
              <div v-else>{{dateData[date.getDate()]}}</div>
            </div>
          </div>
        </template>
      </el-calendar>
    </div>
    <iframe ref="iframe" style="display: none"/>
  </div>
</template>
<script>
import { addPassFlow, getPassFlowInfoByAssetId, getPassFlowCompletionRateByAssetId, getPassFlowDetailInfoByAssetId, addPassFlowDetail } from '@/http/operation'
import echarts from 'echarts'
import { mapState } from 'vuex'
import { parse } from '@/utils'
import { origin } from '@/http/index'
export default {
  components: {},
  computed: mapState(['merchant']),
  data () {
    return {
      calendarSelect: new Date(),
      selectDate: new Date(),
      dateData: [],
      dateDataIds: [],
      update: false,
      passId: null,
      assetId: 0,
      tempPassFlow: 0,
      uploadUrl: origin + '/asset-operation-web/bsPassFlow/uploadExcl',
      info: {
        show: false,
        name: '',
        z1: 0,
        z2: 0,
        z3: 0
      },
      echartsAObj: null,
      echartsBObj: null,
      passengerAllCount: void 0
    }
  },
  watch: {
    selectDate (newValue, oldValue) {
      this.calendarSelect = newValue
      this.updateEchartsB()
    },
    calendarSelect (newValue, oldValue) {
      if (newValue.getFullYear() !== oldValue.getFullYear() || newValue.getMonth() !== oldValue.getMonth()) {
        // 新的月份
        let now = new Date()
        // 如果大于当前年月则返回
        if (newValue.getFullYear() === now.getFullYear() && newValue.getMonth() > now.getMonth()) {
          this.$message.warning(`超过${now.getMonth() + 1}月份的数据暂时还没有呢`)
          this.calendarSelect = oldValue
          return
        }

        this.selectDate = newValue
        this.resetSelectDate()
        this.update = false
        return
      }

      if (newValue.getTime() === oldValue.getTime()) {
        // 选中后再次单击
        this.update = true
      } else if (this.update) {
        // 结束编辑
        this.update = false
      }
    }
  },
  beforeRouteUpdate (to, from, next) {
    this.assetId = parseInt(to.params.id)
    this.resetSelectDate()
    next()
  },
  beforeMount () {
    this.resetDateData()
  },
  activated () {
    this.assetId = parseInt(this.$route.params.id)
    this.init()
    this.resetSelectDate()
    this.updateEchartsB()
  },
  methods: {
    uploadSeccess (res) {
      if (res.code === '0') {
        this.$message.success('上传成功')
        this.resetSelectDate()
      }
    },
    getUplodData () {
      return {
        mainId: this.merchant.id,
        assetId: this.assetId,
        yearValue: this.selectDate.getFullYear(),
        monthValue: this.selectDate.getMonth() + 1
      }
    },
    downloadTemplate () {
      this.$refs.iframe.src = '/static/file/PassengerFlowImportTemplate.xlsx?t=' + new Date().getTime()
    },
    init () {
      let year1 = this.selectDate.getFullYear()
      let year2 = this.selectDate.getFullYear() - 1
      let optionA = {
        color: ['#6293f9', '#5ad8a6'],
        title: {
          text: '月总客流',
          subtext: '当前年度月总客流与同比客流'
        },
        legend: {
          top: 25,
          right: 0,
          icon: 'rect'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          top: '20%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          axisLine: {
            show: false
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
          axisTick: {
            show: false
          }
        },
        series: [
          {
            name: year1 + '年',
            type: 'line',
            symbolSize: 8,
            hoverAnimation: false,
            cursor: 'default',
            label: {
              show: true
            },
            data: []
          },
          {
            name: year2 + '年',
            type: 'line',
            symbolSize: 8,
            hoverAnimation: false,
            cursor: 'default',
            label: {
              show: true
            },
            data: []
          }
        ]
      }
      this.echartsAObj = echarts.init(this.$refs['echartsA'])
      this.echartsAObj.setOption(optionA, true)

      let optionB = {
        color: ['#6293f9', '#5ad8a6'],
        title: {
          text: '日总客流同比',
          subtext: '本月每天总客流与同比客流'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {
          top: 25,
          right: 0,
          icon: 'rect'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          top: '20%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: []
        },
        yAxis: {
          type: 'value',
          axisLine: {
            show: false
          },
          axisTick: {
            show: false
          }
        },
        series: [
          {
            name: year1 + '年',
            type: 'bar',
            data: []
          },
          {
            name: year2 + '年',
            type: 'bar',
            data: []
          }
        ]
      }
      this.echartsBObj = echarts.init(this.$refs['echartsB'])
      this.echartsBObj.setOption(optionB, true)
    },
    resetDateData () {
      for (let i = 0; i <= 31; ++i) {
        this.dateData[i] = ''
        this.dateDataIds[i] = null
      }
    },
    resetSelectDate () {
      this.setInfo()
      this.echartsA()
      this.echartsB()
    },
    focus (event, passFlow) {
      this.tempPassFlow = passFlow
      event.target.select()
    },
    blur (dateValue, date, passDate) {
      this.update = false
      console.log(dateValue, date, passDate)
      if (!parseInt(this.dateData[dateValue])) {
        this.$message.warning('数据不能为空')
        return
      }
      if (this.dateData[dateValue] === this.tempPassFlow) {
        return
      }
      addPassFlowDetail(this.dateDataIds[dateValue], this.merchant.id, this.assetId, passDate, parseInt(this.dateData[dateValue]), date.getFullYear(), date.getMonth() + 1)
        .then(res => {
          this.updateEchartsB()
        })
        .catch(error => {
          console.log(error)
          this.dateData[dateValue] = this.tempPassFlow
        })
    },
    setInfo () {
      getPassFlowCompletionRateByAssetId(this.merchant.id, this.assetId, this.selectDate.getFullYear(), this.selectDate.getMonth() + 1).then(res => {
        this.info.z1 = res.passengerFlowTarget
        this.info.z2 = res.passengerFlow
        this.info.z3 = res.completionRate
        this.info.name = res.assetName
        this.passId = res.id
        this.info.show = true
      })
      getPassFlowInfoByAssetId(this.assetId, this.selectDate.getFullYear())
        .then(res => {
          let option = this.echartsAObj.getOption()
          option.series[0].data.length = 0
          for (let ojb of res) {
            option.series[0].data.push(ojb.passengerFlow)
          }
          this.echartsAObj.setOption(option, true)
        })
    },
    echartsA () {
      let year1 = this.selectDate.getFullYear()
      let year2 = this.selectDate.getFullYear() - 1
      Promise.all([getPassFlowInfoByAssetId(this.assetId, year1), getPassFlowInfoByAssetId(this.assetId, year2)])
        .then((result) => {
          let option = this.echartsAObj.getOption()
          option.series[0].data.length = 0
          option.series[1].data.length = 0
          option.xAxis[0].data = []
          option.legend[0].data = [year1 + '年', year2 + '年']
          option.series[0].name = year1 + '年'
          option.series[1].name = year2 + '年'

          for (let ojb of result[0]) {
            option.xAxis[0].data.push(ojb.yearValue + '-' + ojb.monthValue)
            option.series[0].data.push(ojb.passengerFlow)
          }

          for (let ojb of result[1]) {
            option.series[1].data.push(ojb.passengerFlow)
          }
          this.echartsAObj.getOption()
          this.echartsAObj.setOption(option, true)
        })
    },
    updateEchartsB () {
      getPassFlowDetailInfoByAssetId(this.assetId, this.selectDate.getFullYear(), this.selectDate.getMonth() + 1)
        .then(res => {
          let option = this.echartsBObj.getOption()
          option.series[0].data.length = 0
          for (let ojb of res) {
            let d = parse(ojb.passDateStr)
            option.series[0].data.push(ojb.passFlow)
            this.dateDataIds[d.getDate()] = ojb.id
          }
          this.echartsBObj.setOption(option, true)

          let passengerAllCount = 0
          res.forEach(item => {
            if (item.passFlow) {
              passengerAllCount += item.passFlow
            }
          })
          this.passengerAllCount = passengerAllCount
          if (this.passengerAllCount > this.info.z2) {
            this.info.z2 = this.passengerAllCount
          }
        })
      getPassFlowInfoByAssetId(this.assetId, this.selectDate.getFullYear())
        .then(res => {
          let option = this.echartsAObj.getOption()
          option.series[0].data.length = 0
          for (let ojb of res) {
            option.series[0].data.push(ojb.passengerFlow)
          }
          this.echartsAObj.setOption(option, true)
        })
    },
    echartsB () {
      let year1 = this.selectDate.getFullYear()
      let year2 = this.selectDate.getFullYear() - 1
      let month = this.selectDate.getMonth() + 1
      Promise.all([getPassFlowDetailInfoByAssetId(this.assetId, year1, month), getPassFlowDetailInfoByAssetId(this.assetId, year2, month)])
        .then((result) => {
          let option = this.echartsBObj.getOption()
          option.series[0].data.length = 0
          option.series[1].data.length = 0
          option.xAxis[0].data = []
          option.legend[0].data = [year1 + '年', year2 + '年']
          option.series[0].name = year1 + '年'
          option.series[1].name = year2 + '年'
          this.resetDateData()

          for (let ojb of result[0]) {
            let d = parse(ojb.passDateStr)
            option.xAxis[0].data.push((d.getMonth() + 1) + '-' + d.getDate())
            option.series[0].data.push(ojb.passFlow)
            this.dateData[d.getDate()] = ojb.passFlow || ''
            this.dateDataIds[d.getDate()] = ojb.id
          }

          for (let ojb of result[1]) {
            option.series[1].data.push(ojb.passFlow)
          }

          this.dateData.push(0)
          this.echartsBObj.setOption(option, true)
        })
    },
    open1 () {
      this.$prompt(null, '请输入' + this.selectDate.getFullYear() + '-' + (this.selectDate.getMonth() + 1) + '月客流', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputValue: '',
        inputPattern: /^[0-9]*$/,
        inputErrorMessage: '请输入数字'
      }).then(({ value }) => {
        if (!value) {
          this.$message.warning('数据不能为空')
          return
        }
        let year = this.selectDate.getFullYear()
        let month = this.selectDate.getMonth() + 1
        addPassFlow(this.passId, this.merchant.id, this.assetId, year, month, null, value)
          .then(res => {
            this.setInfo()
          })
      })
    },
    open2 () {
      this.$prompt(null, '请输入' + this.selectDate.getFullYear() + '-' + (this.selectDate.getMonth() + 1) + '月客流指标', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputValue: '',
        inputPattern: /^[0-9]*$/,
        inputErrorMessage: '请输入数字'
      }).then(({ value }) => {
        if (!value) {
          this.$message.warning('数据不能为空')
          return
        }
        let year = this.selectDate.getFullYear()
        let month = this.selectDate.getMonth() + 1
        addPassFlow(this.passId, this.merchant.id, this.assetId, year, month, value, null)
          .then(res => {
            this.setInfo()
          })
      })
    }
  },
}
</script>
<style lang="scss" scoped>

.el-calendar {
  user-select: none;
}

#passengerFlowInsert {
  background-color: white;
  padding: 20px;

  > div {
    margin-bottom: 10px;
  }
}

.el-alert--warning.is-light {
  background-color: #e6f3fc;
  color: #108ee9;
}

.calendar {
  position: relative;
  height: 100%;
  .date {
    position: absolute;
    top: 5px;
    right: 5px;
  }

  .value {
    position: absolute;
    bottom: -2px;
    right: 5px;
  }

  .p-edit {
    position: absolute;
    top: 5px;
    left: 5px;
    color: #ccc;
    display: none;
  }
}

.echarts {
  height: 400px;
  width: 48%;
}

.el-calendar .is-selected .p-edit {
  display: inline;
}

</style>

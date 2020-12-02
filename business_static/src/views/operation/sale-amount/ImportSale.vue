<template>
  <el-card class="box-card">
    <el-row>
      <el-col :span="6">
        <el-date-picker
          v-model="date"
          type="month"
          placeholder="选择月"
          :clearable="false"
          @change="dateChange"
          :picker-options="{
            disabledDate(time) {
              return time.getTime() > Date.now();
            },
          }"
        />
      </el-col>
      <el-col :span="18" class="text-right">
        <el-button type="primary" icon="el-icon-data-line" @click="importMonthSure">整月录入</el-button>
        <!-- <el-upload
          class="sale-amount-upload"
          style="margin: 0 10px"
          action="/asset-fileservice-web/filesystem/upload"
          name="multipartFile"
          accept=".xlsx,.xls"
          :file-list="fileList"
          :on-success="uploadChange"
        >
          <el-button type="primary">导入月/天销售额</el-button>
        </el-upload> -->
        <!-- <a href="/asset-analysis-web/salesAnalysis/downloadExcel" target="_blank">
          <el-button>下载模版</el-button>
        </a> -->
      </el-col>
    </el-row>
    <el-dialog
      title="销售额录入"
      width="320px"
      class="sale-import-dialog"
      :visible.sync="dialogVisible"
      :show-close="false"
      :destroy-on-close="true"
      @close="closeImportDialog"
    >
      <el-form :model="form" :rules="rules" ref="form" @submit.native.prevent>
        <div class="dialog-title">请输入 {{saleDate}} 销售额</div>
        <el-form-item prop="saleAmount">
          <el-input type="number" min="0" v-model="saleAmount" @input="verify" placeholder="请输入销售额"/>
        </el-form-item>
        <div class="text-center" style="margin-top: 20px">
          <el-button type="primary" @click="importSale">确定</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </div>
      </el-form>
    </el-dialog>
    <header class="asset-total">
      <div class="asset-title">{{$route.query.companyName}}</div>
      <span>本月按天累计销售额：{{newDayData | currency}}元</span>
      <span style="margin-left: 20px;">按月录入销售额：{{showSaleAmount | currency}}元</span>
      <!-- <span style="margin-left: 20px">{{allSales.count}}笔</span> -->
    </header>
    <div class="sale-chart">
      <line-area height="380px" :option="saleChartOption"/>
    </div>
    <section class="import-sale">
      <el-calendar v-model="date" :first-day-of-week="7">
        <template
          slot="dateCell"
          slot-scope="{date, data}">
          <div class="date-cell" @click="importDaySure(data)">
            <div class="text-right"><span class="present">{{date.getDate()}}</span></div>
            <div class="text-right setColor" style="margin-top: 35px;">{{(monthSales[data.day] || {}).daySalesMoney |
              currency}}
            </div>
          </div>
        </template>
      </el-calendar>
    </section>
  </el-card>
</template>

<script>
import dayjs from 'dayjs'
import { reduce } from 'lodash-es'
import LineArea from '../../../components/echarts/LineArea'
import {
  queryAllSales,
  queryMonthSales,
  salesAnalysisImport,
  saveSalesByDay,
  saveSalesByMonth,
  updateDaySales
} from '../../../http/sale'

const chartOption = {
  title: {
    text: '销售额同比',
    subtext: '',
    textStyle: {
      fontSize: 16,
      color: '#1F242D',
    },
    subtextStyle: {
      fontSize: 14,
      color: '#999',
    },
  },
  grid: {
    top: 65,
  },
}
export default {
  name: 'ImportSale',
  components: { LineArea },
  data () {
    const validateSale = (rule, value, callback) => {
      const { saleAmount } = this
      // if (!/^\d+$/.test(saleAmount)) {
      //   callback(new Error('请输入正确销售额'))
      // } else if (saleAmount < 0) {
      //   callback(new Error('请输入正确销售额'))
      // } else {
      //   callback()
      // }
      if (saleAmount < 0) {
        callback(new Error('请输入正确销售额'))
      } else {
        callback()
      }
    }
    return {
      date: new Date(),
      allSales: {},
      monthSales: {},
      dialogVisible: false,
      saleDate: void 0,
      saleAmount: void 0,
      saleType: void 0, // oneOf ['month', 'day']
      form: {},
      rules: {
        saleAmount: [
          { validator: validateSale, message: '请输入正确销售额', }
        ]
      },
      saleChartOption: { ...chartOption, },
      fileList: [],
      showSaleAmount: 0,
      newDayData: 0
    }
  },
  watch: {
    date (newValue, oldValue) {
      if (newValue.getFullYear() !== oldValue.getFullYear() || newValue.getMonth() !== oldValue.getMonth()) {
        let now = new Date()
        // 如果大于当前年月则返回
        if (newValue.getFullYear() === now.getFullYear() && newValue.getMonth() > now.getMonth()) {
          this.$message.warning(`超过${now.getMonth() + 1}月份的数据暂时还没有呢`)
          this.date = oldValue
          return
        }
        this.dateChange()
      }
    }
  },
  computed: {
    year () {
      return this.date.getFullYear()
    },
    month () {
      return this.date.getMonth() + 1
    }
  },
  activated () {
    this.queryAllSales()
    this.queryMonthSales()
  },
  methods: {
    verify () {
      if (this.saleAmount !== undefined) {
        const isNegative = this.saleAmount.toString().slice(0, 1) === '-'
        const value = isNegative ? this.saleAmount.toString().slice(1) : this.saleAmount.toString()
        let result = (isNegative ? '-' : '') + value.toString()
          .replace(/[^\d.]/g, '')
          .replace(/\.{2,}/g, '.')
          .replace(/^\./g, '')
          .replace('.', '$#$').replace(/\./g, '').replace('$#$', '.')
          .replace(/^(-)*(\d+)\.(\d\d).*$/, '$1$2.$3')
        this.saleAmount = result
      }
    },
    dateChange () {
      this.queryAllSales()
      this.queryMonthSales()
    },
    queryAllSales () {
      const { year, month } = this
      const { contId, assetId, companyId, } = this.$route.query

      queryAllSales({ contId, assetId, companyId, year })
        .then((res) => {
          this.allSales = res
          if (!res.nowData) {
            this.showSaleAmount = 0
            const months = Array.from({ length: month }, (_, index) => index + 1 + '')
            const nowSeriesData = months.map((month) => [][month] || 0)
            const lastSeriesData = months.map((month) => [][month] || 0)
            this.renderLine(year, months, nowSeriesData, lastSeriesData)
          } else {
            // res.nowData.forEach(item => {
            //   if (item.time == this.month) {
            //     this.showSaleAmount = item.daySalesMoney
            //   }
            // })
            let result = res.nowData.filter(item => Number(item.time) === Number(this.month))
            result.length > 0 ? this.showSaleAmount = result[0].daySalesMoney : this.showSaleAmount = 0
            // 生成月份
            const months = Array.from({ length: month }, (_, index) => index + 1 + '')
            const nowValue = reduce(res.nowData, (prev, { daySalesMoney, time }) => {
              prev[time] = daySalesMoney
              return prev
            }, {})
            const lastValue = reduce(res.lastData, (prev, { daySalesMoney, time }) => {
              prev[time] = daySalesMoney
              return prev
            }, {})

            const nowSeriesData = months.map((month) => nowValue[month] || 0)
            const lastSeriesData = months.map((month) => lastValue[month] || 0)
            this.renderLine(year, months, nowSeriesData, lastSeriesData)
          }
        })
    },
    renderLine (year, months, nowSeriesData, lastSeriesData) {
      const nowYear = year + ''
      const lastYear = year - 1 + ''

      this.saleChartOption = {
        ...chartOption,
        legend: {
          icon: 'rect',
          data: [lastYear, nowYear],
        },
        xAxis: { data: months.map((month) => month + '月') },
        series: [
          {
            name: lastYear,
            data: lastSeriesData,
            showSymbol: true,
            label: {
              show: true,
              position: 'top',
              color: '#fff',
              backgroundColor: '#6D1EEC',
              padding: [3, 8],
              borderRadius: 10,
            },
          },
          {
            name: nowYear,
            data: nowSeriesData,
            showSymbol: true,
            label: {
              show: true,
              position: 'top',
              color: '#fff',
              backgroundColor: '#FCB644',
              padding: [3, 8],
              borderRadius: 10,
            },
          },
        ],
      }
    },
    queryMonthSales () {
      const query = this.$route.query
      const { year, month } = this
      queryMonthSales({ ...query, year, month })
        .then((res) => {
          this.monthSales = reduce(res, (prev, sale) => {
            const { time } = sale
            prev[time] = sale
            return prev
          }, {})

          let newDayData = 0
          res.forEach(item => {
            newDayData += item.daySalesMoney
          })
          if (newDayData > this.showSaleAmount) {
            this.showSaleAmount = newDayData
          }
          this.newDayData = newDayData
        })
    },
    importMonthSure () {
      this.saleDate = dayjs(this.date).format('YYYY-MM')
      this.dialogVisible = true
    },
    importDaySure ({ day }) {
      this.saleDate = day
      this.dialogVisible = true
    },
    importSale () {
      this.$refs.form.validate((valid) => {
        const { saleDate, saleAmount, year, month, $route: { query } } = this
        const { storeIds: storeId } = query
        if (!saleAmount) {
          this.$message.warning('数据不能为空')
          return false
        }
        if (valid) {
          if (/^\d{4}-\d{2}$/.test(saleDate)) {
            saveSalesByMonth({ ...query, year, month, storeId, salesMoney: saleAmount }).then((res) => {
              const { data } = res
              if (/^\d+$/.test(data)) {
                this.$message.success('添加月份销售额成功')
                this.dialogVisible = false
                this.dateChange()
                this.showSaleAmount = this.saleAmount
              }
            })
          } else {
            let statu = Object.keys(this.monthSales).includes(saleDate)
            if (!statu) { // 新增
              saveSalesByDay({
                ...query,
                year,
                month,
                storeId,
                salesMoney: saleAmount,
                dayData: [
                  { time: saleDate, daySalesMoney: saleAmount },
                ],
              }).then((res) => {
                const { data, msg } = res
                if (/^\d+$/.test(data)) {
                  this.$message.success('添加当日销售额成功')

                  this.dialogVisible = false
                  this.dateChange()
                } else {
                  this.$message.error(msg || '添加当日销售额失败，请稍后重试')
                }
              })
            } else { // 修改
              let id = this.monthSales[saleDate].id
              updateDaySales({ id, time: saleDate, daySalesMoney: saleAmount }).then(res => {
                if (res.code === '0') {
                  this.$message.success('更新当日销售额成功')
                  this.dialogVisible = false
                  this.dateChange()
                } else {
                  this.$message.error(res.msg || '添加当日销售额失败，请稍后重试')
                }
              })
            }
          }
        } else {
          return false
        }
      })
    },
    closeImportDialog () {
      this.saleAmount = void 0
    },
    uploadChange (response) {
      const { data: fileUrl } = response
      if (/^https?:\/\//.test(fileUrl)) {
        salesAnalysisImport(fileUrl).then((res) => {
          if (res.code === '0') {
            this.$message.success('导入成功')
          }
        })
      }
    },
  },
}
</script>

<style lang="scss" scoped>
  .el-form-item__content{
    width: inherit !important;
  }
  .asset-total {
    height: 40px;
    line-height: 40px;
    margin: 20px 0;
    font-size: 14px;
    color: #333;
    background-color: #F7F3FE;
    border-left: 4px solid #5E0EFF;
  }

  .asset-title {
    display: inline-block;
    margin: 0 20px 0 30px;
    padding-left: 18px;
    color: #5E0EFF;
    background: url("./assets/warn.svg") left center no-repeat;

    &:after {
      content: '';
      height: 16px;
      margin-left: 20px;
      border-right: 1px solid #E1D3FF;
    }
  }

  .date-cell {
    height: 100%;
  }

  .dialog-title {
    margin: 20px 0 10px;
    text-align: center;
    font-size: 15px;
    color: #333;
  }

  .sale-amount-upload {
    display: inline-block;
    position: relative;
    z-index: 1;
  }

  .setColor {
    color: #5E0EFF
  }
</style>

<style lang="scss">
  .sale-import-dialog {
    .el-dialog__header {
      padding: 8px 15px;
      background-color: #141414;

      .el-dialog__title {
        color: white;
        font-size: 15px;
      }
    }

    .el-dialog__body {
      padding: 0 30px 30px;
    }
  }
</style>

<template>
  <div id="print" class="page">
    <div v-show="!showDetail">
      <div class="filter-wrapper">
        <el-form :inline="true" size="small" label-width="120px">

          <project-auto-complete @select="selectProject" :projectId="query.projectId"/>

          <payer-auto-complete @select="selectPayer" label="租户：" :id="query.companyId" />

          <rental-unit-auto-complete autoClear @select="selectRentalUnit" :asset-id="query.projectId" :id="query.roomId"/>

          <el-form-item label="合同编号：">
            <el-input
              v-model="query.contNo"
              placeholder="输入合同编号"
              clearable
              @input="search(1)"/>
          </el-form-item>

          <el-form-item label="应收月：">
            <el-date-picker
              type="month"
              placeholder="请选择应收月"
              :clearable="false"
              v-model="query.receivableMonth"
              value-format="yyyy-MM"
              format="yyyy-MM"
              @change="search(1)">
            </el-date-picker>
          </el-form-item>

          <el-form-item label="打印日期：">
            <el-date-picker
              type="date"
              placeholder="请选择打印日期"
              v-model="query.printDate"
              value-format="yyyy-MM-dd"
              format="yyyy-MM-dd"
              @change="search(1)">
            </el-date-picker>
          </el-form-item>

          <el-form-item label="打印状态：">
            <el-select
              v-model="query.includePrinted"
              placeholder="请选择打印状态"
              :clearable="false"
              @change="search(1)">
              <el-option class='select-option-selected' label="未打印" :value="false"></el-option>
              <el-option class='select-option-selected' label="已打印" :value="true"></el-option>
              <el-option class='select-option-selected' label="不限" :value="null"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="是否包含欠费：">
            <el-select
              v-model="query.includeOverdue"
              placeholder="请选择是否包含欠费"
              :clearable="false"
              @change="search(1)">
              <el-option class='select-option-selected' label="包含欠费" :value="true"></el-option>
              <el-option class='select-option-selected' label="不包含欠费" :value="false"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
          <div class="search-reset">
            <el-button class="btn" @click="search(1)">搜索</el-button>
            <el-button class="btn btn-default" @click="reset()">重置</el-button>
          </div>
      </div>

      <div class="table-wrapper">
        <el-table :data="data" @row-click="rowClick">
          <el-table-column
            fixed
            prop="project.name"
            label="项目"
            show-overflow-tooltip
            :resizable="false">
            <template slot-scope="scope">{{scope.row.project.name || '-'}}</template>
          </el-table-column>
          <el-table-column
            fixed
            prop="company.name"
            label="租户"
            show-overflow-tooltip
            :resizable="false">
            <template slot-scope="scope">{{scope.row.project.name || '-'}}</template>
          </el-table-column>
          <el-table-column
            label="租赁单元"
            :resizable="false">
            <template slot-scope="scope">
              <span v-for="room in scope.row.rooms" :key="room">{{room}} </span>
            </template>
          </el-table-column>
          <el-table-column
            prop="cont.code"
            label="合同编号"
            :resizable="false">
            <template slot-scope="scope">{{scope.row.cont.code || '-'}}</template>
          </el-table-column>
          <el-table-column
            prop="receivableMonth"
            label="应收月"
            :resizable="false"/>
          <el-table-column
            prop="receivableMoney"
            label="应收汇总金额(元)"
            :formatter="numberFormat"
            align="right"
            :resizable="false"/>
          <el-table-column
            label="打印状态"
            :resizable="false">
            <template slot-scope="scope">
              <span v-if="scope.row.printDate">已打印</span>
              <span v-else>未打印</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="printDate"
            label="打印日期"
            :resizable="false">
            <template slot-scope="scope">{{scope.row.printDate || '-'}}</template>
          </el-table-column>
          <el-table-column
            prop="printBy"
            label="打印人"
            :resizable="false">
            <template slot-scope="scope">{{scope.row.printBy || '-'}}</template>
          </el-table-column>
        </el-table>
        <div class="pagination">
          <el-pagination
            :page-size="10"
            layout="prev, pager, next, jumper"
            :total="total"
            :current-page.sync="query.pageNum"
            @current-change="search"
          />
        </div>
      </div>
    </div>

    <div v-show="showDetail" class="detail">
      <div class="clearfix">
        <div class="pull-right">
          <el-button :disabled="permission" class="btn" @click="print">打印</el-button>
          <el-button :disabled="permission" class="btn btn-default" @click="showDetail = false">关闭</el-button>
          <el-button :disabled="permission" class="btn btn-default" @click="selectPrint(2)">全选</el-button>
          <el-button :disabled="permission" class="btn btn-default" @click="selectPrint(1)">选择已打印</el-button>
          <el-button :disabled="permission" class="btn btn-default" @click="selectPrint(0)">选择未打印</el-button>
        </div>
      </div>
      <div ref="print">
        <h2 class="print-title">租户结算通知单</h2>

        <table class="title" style="width: 100%;">
          <tr>
            <td align="right">项目名称：</td>
            <td align="left" class="underline">{{detail.projectName}}</td>
          </tr>
          <tr>
            <td width="100px" align="right">租户名称：</td>
            <td width="150px" align="left" class="underline">{{detail.companyName}}</td>
            <td></td>
            <td width="100px" align="right">应付总金额：</td>
            <td width="150px" align="left" class="underline">¥{{detail.receivableMoney}}</td>
          </tr>
          <tr>
            <td align="right">合同编号：</td>
            <td align="left" class="underline">{{detail.contNo}}</td>
            <td></td>
            <td align="right">打印日期：</td>
            <td align="left" class="underline">{{detail.printDate}}</td>
          </tr>
          <tr>
            <td align="right">租赁单元：</td>
            <td align="left" class="underline"><span v-for="room in detail.roomNo" :key="room">{{room}} </span></td>
            <td></td>
            <td align="right">打印人：</td>
            <td align="left" class="underline">{{userInfo.name}}</td>
          </tr>
        </table>
        <table class="table">
          <tr>
            <th class="no-print"></th>
            <th>款项名称</th>
            <th>单据流水号</th>
            <th>账期</th>
            <th class="right">应付金额(含税)</th>
            <th class="right">税率(%)</th>
            <th class="right">增值税额</th>
            <th>最后缴款日</th>
            <th :class="{'no-print': !detail.printRemark}"><input type="checkbox" v-model="detail.printRemark" class="no-print">备注</th>
            <th class="no-print">是否打印</th>
          </tr>
          <tr v-for="d in detail.data" :key="d.id" :class="{'no-print': !d.select}" @click="onClick(d)">
            <td class="no-print"><input type="checkbox" v-model="d.select"></td>
            <td style="min-width: 60px">{{d.subjectName}}</td>
            <td>{{d.receivableNo}}</td>
            <td style="min-width: 150px">{{d.accountDateStart}}-{{d.accountDateEnd}}</td>
            <td style="min-width: 90px" class="right">¥{{numberFormat3(d.receivableMoney)}}</td>
            <td class="right">{{d.taxRate}}</td>
            <td class="right">¥{{numberFormat3(d.taxMoney)}}</td>
            <td>{{d.receivableDate}}</td>
            <td style="max-width: 200px" :class="{'no-print': !detail.printRemark}" class="overflow">{{d.remark}}</td>
            <td class="no-print"><span v-if="d.hasPrint">已打印</span><span v-else>未打印</span></td>
          </tr>
          <tr>
            <td class="no-print"></td>
            <td colspan="3">应付合计</td>
            <td class="right">¥{{detail.receivableMoney = numberFormat2(detail)}}</td>
            <td></td>
            <td></td>
            <td></td>
            <td :class="{'no-print': !detail.printRemark}"></td>
            <td class="no-print"></td>
          </tr>
        </table>
      </div>

      <iframe ref="iframe" class="iframe" style="display:none"></iframe>
    </div>
  </div>
</template>
<script>
import { format } from '@/utils'
import { logPrint, getPrintDetailReceivable, getPrintReceivable, deviceManageOperation2 } from '@/http/financial'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import RentalUnitAutoComplete from '@/components/RentalUnitAutoComplete'
import { mapState } from 'vuex'

const iframeCss = '<style media="print">\
             @page{size:auto;margin: 0mm;}\
             .no-print{display: none;}\
             body{margin: 20px}\
             <\/style>\
             <style>\
             .underline{border-bottom:1px solid black}\
             .table{border-collapse:collapse;border:none;margin-top:10px;width: 100%;}\
             .table td,.table th{border:solid #000 1px;text-align: center;font-size: 12px;}\
             .table .right{text-align: right;padding-right: 10px;}\
             .table .overflow{overflow:hidden;text-overflow:ellipsis;}\
             <\/style>'
const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}
export default {
  components: {ProjectAutoComplete, PayerAutoComplete, RentalUnitAutoComplete},
  data () {
    return {
      permission: '',
      page: 1,
      total: 10,
      showDetail: false,
      data: [],
      query: {
        pageNum: 1,
        projectId: null,
        companyId: null,
        roomId: null,
        contNo: null,
        receivableMonth: format(new Date(), 'YYYY-MM'),
        printDate: null,
        includePrinted: null,
        includeOverdue: false
      },
      detail: {
        row: {},
        printRemark: true,
        data: [],
        projectName: '',
        companyName: '',
        contNo: '',
        roomNo: [],
        receivableMoney: 0,
        printDate: format(new Date(), 'YYYY/MM/DD')
      }
    }
  },
  computed: mapState(['userInfo', 'permissionList']),
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.search()
  },
  methods: {
    search (page = this.query.pageNum) {
      this.query.pageNum = page
      getPrintReceivable(this.query).then(res => {
        this.data = res.data.list
        this.total = res.data.total
      })
    },
    print () {
      let ids = this.detail.data.filter(o => o.select).map(o => o.id)
      if (ids.length === 0) {
        this.$message.error('请选择需要打印的账单')
        return
      }
      let iframe = this.$refs.iframe
      iframe.srcdoc = this.$refs.print.innerHTML + iframeCss
      logPrint(ids)
      setTimeout(() => {
        this.search()
        this.rowClick(this.detail.row)
        iframe.contentWindow.print()
      }, 100)
    },
    numberFormat (row, column, cellValue, index) {
      let money = comdify(cellValue)
      return money || '0.00'
    },
    numberFormat2 (detail) {
      let money = detail.data.filter(o => o.select).map(o => parseFloat(o.receivableMoney)).reduce((s, v) => s + v, 0).toFixed(2)
      return money ? comdify(money) : '0.00'
    },
    numberFormat3 (receivableMoney) {
      return receivableMoney ? comdify(receivableMoney) : '0.00'
    },
    selectProject ({ id }) {
      this.query.projectId = id
    },
    selectPayer (payerName, { companyId }) {
      this.query.companyId = companyId
      this.search(1)
    },
    selectRentalUnit ({ id }) {
      this.query.roomId = id
      this.search(1)
    },
    rowClick (row) {
      getPrintDetailReceivable({
        projectId: row.project.id,
        companyId: row.company.id,
        contId: row.cont.id,
        receivableMonth: row.receivableMonth}).then(res => {
        if (!res.data) {
          return
        }
        this.detail.row = row
        this.detail.printRemark = true
        this.detail.receivableMoney = row.receivableMoney
        this.detail.roomNo = row.rooms
        this.detail.contNo = row.cont.code
        this.detail.companyName = row.company.name
        this.detail.projectName = row.project.name
        this.detail.data.length = 0
        for (let d of res.data) {
          d.select = !d.hasPrint
          this.detail.data.push(d)
        }
        this.showDetail = true
      })
    },
    onClick (d) {
      d.select = !d.select
    },
    selectPrint (type) {
      for (let d of this.detail.data) {
        switch (type) {
          case 1:
            d.select = d.hasPrint
            break
          case 0:
            d.select = !d.hasPrint
            break
          case 2:
            d.select = true
            break
        }
      }
    },
    reset () {
      this.query.pageNum = 1
      this.query.projectId = null
      this.query.companyId = null
      this.query.roomId = null
      this.query.contNo = null
      this.query.receivableMonth = format(new Date(), 'YYYY-MM')
      this.query.printDate = null
      this.query.includePrinted = null
      this.query.includeOverdue = false
      this.search(1)
    }
  }
}
</script>
<style lang="scss" scoped>
.iframe {
  height: 1000px;
  width: 100%;
  // display: none;
}
.detail {
  padding: 20px;
  background-color: white;
  cursor: default;

  .underline {
    border-bottom: 1px solid #333;
  }

  .title {
    td {
      padding-top: 5px;
      font-size: 15px;
      color: #333;
      height: 30px;
      vertical-align: bottom;
    }
  }

  .table {
    border-collapse: collapse;
    border: none;
    margin-top: 40px;
    width: 100%;

    td,th {
      border: 1px solid #333;
      text-align: center;
      height: 22px;
      font-size: 15px;
      color: #333;
      font-weight: 400;
      padding: 10px 0;
      box-sizing: border-box;
      vertical-align: middle;
    }

    .overflow {
      overflow:hidden;
      text-overflow:ellipsis;
    }
    .right {
      text-align: right;
      padding-right: 5px;
    }

  }

}

.print-title {
  text-align: center;
  font-size: 18px;
  font-weight: 500;
  color: #333333;
  margin: 30px 0 50px;
}
</style>

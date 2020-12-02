<template>
  <div id="energy" class="page">
    <div class="filter-wrapper default-form">
        <el-form :inline="true" size="small" label-width="100px">
          <el-form-item label="项目名称：">
            <el-select
              v-model="query.projectId"
              placeholder="请选择项目"
              @change="search(1)">
              <el-option class='select-option-selected'
                v-for="project in projects"
                :key="project.id"
                :label="project.assetName"
                :value="project.id"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="编号/租户：">
            <el-input
              v-model="query.identifier"
              placeholder="输入设备编号/租户名称"
              clearable
              @input="search(1)" />
          </el-form-item>
          <el-form-item label="月份：">
            <el-date-picker
              type="month"
              placeholder="请选择月份"
              :clearable="false"
              v-model="query.date"
              value-format="yyyy-MM"
              @change="search(1)"
              format="yyyy-MM">
            </el-date-picker>
          </el-form-item>
        </el-form>
        <div class="search-reset">
          <el-button class="btn" @click="search(1)">搜索</el-button>
          <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <div class="table-header clearfix">
        <div class="pull-left tabs">
          <ul>
            <li @click="search(1,0)" :class="{'active': assetLayout == 0}" class="pull-left">全部</li>
            <li @click="search(1,1)" :class="{'active': assetLayout == 1}" class="pull-left">电费</li>
            <li @click="search(1,2)" :class="{'active': assetLayout == 2}" class="pull-left">水费</li>
            <li @click="search(1,3)" :class="{'active': assetLayout == 3}"  class="pull-left">燃气费</li>
          </ul>
        </div>
      </div>
      <el-table
        :data="data"
        row-key="key"
        @row-click="drawerOpenDetail"
        >
        <el-table-column
          fixed
          prop="deviceNo"
          label="设备编号"
          :resizable="false"
        />
        <el-table-column
          fixed
          prop="contNo"
          label="合同编号"
          :resizable="false">
          <template slot-scope="scope">
            <el-link @click="forwardToContract(scope.row)" :underline="false">
              {{scope.row.contNo}}
            </el-link>
          </template>
        </el-table-column>
        <el-table-column
          prop="deviceName"
          label="设备名称"
          :resizable="false">
          <template slot-scope="scope">{{scope.row.deviceName || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="storeId"
          label="商铺号"
          :resizable="false"
        />
        <el-table-column
          prop="companyName"
          label="租户名称"
          show-overflow-tooltip
          :resizable="false"
        />
        <el-table-column
          prop="rightDate"
          label="权责月"
          :resizable="false">
          <template slot-scope="scope">{{scope.row.rightDate || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="amount"
          label="费用金额(元)"
          :resizable="false"
          class-name="set-last-cell"
          align="right">
          <template slot-scope="scope">{{scope.row.amount | comdify}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="query.total"
          :current-page.sync="query.page"
          @current-change="search"
        />
      </div>
    </div>
  </div>
</template>
<script>
import { format } from '@/utils'
import {
  deviceManageQueryList,
  deviceManageEditConsumption,
  deviceManageOperation1,
  deviceManageOperation2 } from '@/http/engineering'
import { getAssetName } from '@/http/assets'
import { mapState } from 'vuex'

export default {
  computed: mapState(['merchant']),
  data () {
    return {
      projects: [],
      tempId: 0,
      notAutoClose: false,
      loading: true,
      assetLayout: 0,
      query: {
        identifier: '',
        date: format(new Date(), 'YYYY-MM'),
        projectId: null,
        type: 0,
        page: 1,
        total: 0
      },
      data: []
    }
  },
  mounted () {
    getAssetName({mainId: this.merchant.id}).then(res => {
      if (!res || res.length === 0) {
        this.loading = false
        return
      }
      for (let d of res) {
        this.projects.push(d)
      }
      this.query.projectId = this.projects[0].id
      this.search(1)
    })
  },
  methods: {
    // forwardToContract(e){
    // },
    save (row) {
      if (!row.meterDate) {
        this.$message.error('请输入抄表日期')
        return
      }
      if (!row.costCycleDateArr || row.costCycleDateArr.length !== 2) {
        this.$message.error('请输入费用周期')
        return
      }
      if (!row.lastPayDate) {
        this.$message.error('请输入应收日期')
        return
      }
      if (!row.rightDate) {
        this.$message.error('请输入权责月')
        return
      }
      if (!row.thisDegrees) {
        this.$message.error('请输入本期读数')
        return
      }

      let param = {
        deviceId: row.deviceId,
        deviceConsId: row.deviceConsId,
        roomId: row.roomId,
        companyId: row.companyId,
        meterDate: row.meterDate,
        costCycleStart: row.costCycleDateArr[0],
        costCycleEnd: row.costCycleDateArr[1],
        lastPayDate: row.lastPayDate,
        rightDate: row.rightDate.length === 7 ? row.rightDate + '-01' : row.rightDate,
        lastDegrees: row.lastDegrees,
        thisDegrees: row.thisDegrees,
        usage: row.thisDegrees - row.lastDegrees,
        unitPrice: row.unitPrice,
        amount: (row.thisDegrees - row.lastDegrees) * row.unitPrice,
        isReceivable: 0,
        isLadder: row.detail.length === 0 ? 0 : 1
      }
      if (row.detail.length !== 0) {
        param.detail = []
        let total = 0
        for (let d of row.detail) {
          let amount = d.usage * d.unitPrice
          param.detail.push({
            usage: d.usage,
            unitPrice: d.unitPrice,
            amount: amount
          })
          total += amount
        }
        param.amount = total

        let usage = param.detail.map(o => o.usage).reduce((s, v) => parseInt(s) + parseInt(v), 0)
        console.log(usage, param.usage)
        if (usage !== param.usage) {
          this.$message.error('阶梯使用量总和需等于' + param.usage)
          return
        }
      }
      deviceManageEditConsumption(param).then(res => {
        this.$message.info('保存成功')
        // this.query.identifier = row.deviceNo
        this.search()
      })
    },
    drawerOpenDetail (row) {
      this.query.deviceNo = row.deviceNo
      this.$router.push({path: '/engineering/energy/detail/', query: this.query})
    },
    search (page = this.query.page, tabType) {
      this.assetLayout = tabType || 0
      this.query.type = tabType
      this.query.page = page
      let param = {
        mainId: this.merchant.id,
        assetId: this.query.projectId,
        yearMonth: this.query.date,
        limit: 10,
        page
      }
      if (this.query.type !== 0) {
        param.type = this.query.type
      }
      if (this.query.identifier.length > 0) {
        param.identifier = this.query.identifier
      }
      deviceManageQueryList(param).then(res => {
        this.query.total = res.total
        this.data = []
        for (let d of res.list) {
          d.key = this.tempId++
          d.updated = false
          d.isEnergy = true
          d.update_meterDate = false
          if (d.costCycleDate && d.costCycleDate.length === 21) {
            d.costCycleDateArr = [d.costCycleDate.substring(0, 10), d.costCycleDate.substring(11, 21)]
          } else {
            d.costCycleDateArr = []
          }
          if (!d.detail) {
            d.detail = []
          }
          for (let dd of d.detail) {
            dd.p = d
            dd.temp = false
            dd.isReceivable = d.isReceivable
            dd.isEnergy = false
            dd.key = d.key + '-' + this.tempId++
          }
          this.data.push(d)
        }
        this.loading = false
      })
    },
    reset () {
      this.query = {
        identifier: '',
        date: format(new Date(), 'YYYY-MM'),
        projectId: this.projects[0].id,
        type: 0,
        page: 1,
        total: 0
      }
      this.search()
    },
    add (row) {
      row.updated = true
      row.detail.push({
        key: row.deviceConsId + '-temp' + this.tempId++,
        p: row,
        temp: true,
        usage: 0,
        unitPrice: 0,
        amount: 0
      })
    },
    deletea (row) {
      if (!row.id) {
        let detail = row.p.detail
        for (let i = 0; i < detail.length; ++i) {
          if (row.key === detail[i].key) {
            detail.splice(i, 1)
            break
          }
        }
      } else {
        deviceManageOperation1(row.id).then(res => {
          this.$message.info('删除成功')
          // this.query.identifier = row.p.deviceNo
          this.search(1)
        })
      }
    },
    genYs (row) {
      deviceManageOperation2(row.deviceConsId).then(res => {
        this.$message.info('生成成功')
        // this.query.identifier = row.deviceNo
        this.search(1)
      })
    }
  }
}
</script>

<style lang="scss">

.el-popconfirm__main {
  margin: 10px 0;
}
.table-header{
  height: 60px;
  box-sizing: border-box;
  .tabs {
    line-height: 36px;
  }
  li{
    text-align: center;
    box-sizing: border-box;
    margin-right: 20px;
    font-size:15px;
    font-weight:400;
    color:rgba(102,102,102,1);
    cursor: pointer;
  }
  li.active{
    font-weight:500;
    color:rgba(51,51,51,1);
    border-bottom: 3px solid #5E0EFF;
  }
}
#energy {
  .el-radio-group {
    line-height: 36px;
  }
  .el-radio-button__inner {
    height: 36px;
  }

  .left-15 {
    margin-left: 15px;
  }

  .table-input {
    padding: 0;

    .el-table__row {
      .el-table__expand-icon {
        display: none;
      }

      td {
        padding: 0;
        .el-input {
          width: 100%;

          .el-input__prefix {
            left: 0;
            .el-input__icon {
              width: 15px;
            }
          }
        }

        .el-range-editor {
          width: 230px;
        }

        .el-date-editor {
          .el-range-separator {
            line-height: 40px;
          }
        }

        .el-range-editor.is-disabled,
        .el-range-editor.is-disabled input,
        .el-input.is-disabled .el-input__inner {
          background-color: white;
        }

        .el-date-editor--date {
          padding-left: 25px;
        }
        .el-date-editor--month {
          padding-left: 25px;
        }
        .el-date-editor--daterange {
          .el-input__icon {
            line-height: 40px;
          }
        }

        .cell {
          height: 100%;
          line-height: 45px;

          .table-cell-disable {
            padding: 0 10px;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            background: rgba(247,247,247,1);
            color: #333;
          }
        }
      }
    }

    .hover-row td {
      background: none;
    }
  }
}
</style>

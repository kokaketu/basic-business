<template>
  <div id="energy" class="page">
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>设备编号</div>
          <div class='value-label'>{{detailInfo.deviceNo}}</div>
        </div>
        <div class="state">
          <div class='key-label'>合同编号</div>
          <div class='value-label'>{{detailInfo.contNo}}</div>
        </div>
        <div class="state">
          <div class='key-label'>设备名称</div>
          <div class='value-label'>{{detailInfo.deviceName}}</div>
        </div>
        <div class="state">
          <div class='key-label'>商铺号</div>
          <div class='value-label'>{{detailInfo.storeId}}</div>
        </div>
        <div class="state">
          <div class='key-label'>租户名称</div>
          <div class='value-label'>{{detailInfo.companyName}}</div>
        </div>
      </div>
      <div class="new-block-title">费用周期</div>
      <div class="detailInfo" style="padding-top: 20px;">
        <el-form
          :inline="true"
          :model="detailInfo"
          size="small"
          label-width="110px">
          <el-form-item label="抄表日期" prop="meterDate" >
            <div v-if="detailInfo.isEnergy">
              <el-date-picker
                :disabled="detailInfo.isReceivable === 1"
                v-model="detailInfo.meterDate"
                value-format="yyyy-MM-dd"
                type="date"
                @change="detailInfo.updated = true"
                :clearable="false"
                :editable="false"
                placeholder="抄表日期">
              </el-date-picker>
            </div>
          </el-form-item>
          <el-form-item label="费用周期" prop="costCycleDateArr" >
            <div v-if="detailInfo.isEnergy">
              <el-date-picker
                :disabled="detailInfo.isReceivable === 1"
                v-model="detailInfo.costCycleDateArr"
                value-format="yyyy-MM-dd"
                type="daterange"
                @change="detailInfo.updated = true"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                :clearable="false"
                :editable="false">
              </el-date-picker>
            </div>
          </el-form-item>
          <br>
          <el-form-item label="应收日期" prop="lastPayDate" >
            <div v-if="detailInfo.isEnergy">
              <el-date-picker
                :disabled="detailInfo.isReceivable === 1"
                v-model="detailInfo.lastPayDate"
                value-format="yyyy-MM-dd"
                type="date"
                @change="detailInfo.updated = true"
                :clearable="false"
                :editable="false"
                placeholder="应收日期">
              </el-date-picker>
            </div>
          </el-form-item>
          <el-form-item label="权责月" prop="rightDate" >
            <div v-if="detailInfo.isEnergy" class="rightDate">
              <el-date-picker
                :disabled="detailInfo.isReceivable === 1"
                v-model="detailInfo.rightDate"
                value-format="yyyy-MM"
                type="month"
                @change="detailInfo.updated = true"
                :clearable="false"
                :editable="false"
                placeholder="权责月">
              </el-date-picker>
            </div>
          </el-form-item>
        </el-form>
      </div>
      <div class="new-block-title">金额</div>
      <div class="table-wrapper">
        <el-table
          v-loading="loading"
          border
          class="table-input"
          :data="tableData"
          row-key="key"
          default-expand-all
          :tree-props="{children: 'detail'}">
          <el-table-column
            prop="lastDegrees"
            label="上期读数"
            :resizable="false">
              <template slot-scope="scope">
                <div v-if="scope.row.isEnergy">
                  <span class="table-cell-disable">{{scope.row.lastDegrees}}</span>
                </div>
              </template>
          </el-table-column>
          <el-table-column
            prop="thisDegrees"
            label="本期读数"
            :resizable="false">
              <template slot-scope="scope">
                <div v-if="scope.row.isEnergy">
                  <el-input
                    v-if="scope.row.isReceivable !== 1"
                    type="number"
                    @input="scope.row.updated = true"
                    :min="scope.row.lastDegrees"
                    v-model="scope.row.thisDegrees"
                    placeholder="本期读数"/>
                  <span v-else class="table-cell-disable">{{scope.row.thisDegrees}}</span>
                </div>
              </template>
          </el-table-column>
          <el-table-column
            prop="usage"
            label="使用量"
            :resizable="false">
              <template slot-scope="scope">
                <div v-if="scope.row.isEnergy">
                  <span class="table-cell-disable" v-if="scope.row.isReceivable !== 1">{{scope.row.thisDegrees - scope.row.lastDegrees}}</span>
                  <span class="table-cell-disable" v-else>{{scope.row.usage}}</span>
                </div>
                <el-input
                  type="number"
                  @input="scope.row.p.updated = true"
                  min="0"
                  v-else
                  v-model="scope.row.usage"
                  placeholder="使用量"/>
              </template>
          </el-table-column>
          <el-table-column
            prop="unitPrice"
            label="单价"
            :resizable="false">
              <template slot-scope="scope">
                <div v-if="scope.row.isEnergy">
                  <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.unitPrice}}</span>
                  <span v-else-if="scope.row.detail.length != 0" class="table-cell-disable">-</span>
                  <el-input
                    v-else
                    type="number"
                    @input="scope.row.updated = true"
                    min="0"
                    v-model="scope.row.unitPrice"
                    placeholder="单价"/>
                </div>
                <div v-else>
                  <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.unitPrice}}</span>
                  <el-input
                    v-else
                    type="number"
                    @input="scope.row.p.updated = true"
                    min="0"
                    v-model="scope.row.unitPrice"
                    placeholder="单价"/>
                </div>
              </template>
          </el-table-column>
          <el-table-column
            prop="amount"
            label="费用金额"
            :resizable="false">
              <template slot-scope="scope">
                <div v-if="scope.row.isEnergy">
                  <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.amount}}</span>
                  <span v-else-if="scope.row.detail.length !== 0"
                    class="table-cell-disable">{{scope.row.detail.map(o => o.usage * o.unitPrice).reduce((s, v) => s + v, 0).toFixed(2)}}</span>
                  <span v-else class="table-cell-disable">{{((scope.row.thisDegrees - scope.row.lastDegrees) * scope.row.unitPrice).toFixed(2)}}</span>
                </div>
                <div v-else>
                  <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.amount}}</span>
                  <span v-else class="table-cell-disable">{{(scope.row.usage * scope.row.unitPrice).toFixed(2)}}</span>
                </div>
              </template>
          </el-table-column>
          <el-table-column
            label="操作"
            :resizable="false">
              <template slot-scope="scope">
                <el-button v-if="scope.row.isEnergy && scope.row.isReceivable !== 1"
                  type="text"
                  size="small"
                  @click="add(scope.row)">添加 <i class="el-icon-circle-plus-outline"></i></el-button>
                <el-button v-else-if="!scope.row.isEnergy && scope.row.isReceivable !== 1"
                  type="text"
                  size="small"
                  @click="deletea(scope.row)">删除 <i class="el-icon-remove-outline"></i></el-button>
              </template>
          </el-table-column>
          <el-table-column
            label="处理"
            :resizable="false"
            width="90">
            <template slot-scope="scope">
              <el-button v-if="scope.row.updated" type="text" size="small" @click="save(scope.row)">保存</el-button>
              <el-popconfirm class="a" v-else-if="scope.row.deviceConsId && scope.row.isEnergy && scope.row.isReceivable !== 1"
                confirmButtonText='生成'
                cancelButtonText='我再想想'
                @onConfirm="genYs(scope.row)"
                title="生成后将无法编辑，确认生成吗？">
                <el-button slot="reference" type="text" size="small">生成应收</el-button>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>

    <!-- <div class="table-wrapper">
      <el-table
        v-loading="loading"
        border
        class="table-input"
        :data="data"
        row-key="key"
        default-expand-all
        :tree-props="{children: 'detail'}">
        <el-table-column
          fixed
          prop="deviceNo"
          label="设备编号"
          :resizable="false"
          width="140"/>
        <el-table-column
          fixed
          prop="contNo"
          label="合同编号"
          :resizable="false"
          width="140"/>
        <el-table-column
          prop="deviceName"
          label="设备名称"
          :resizable="false"
          width="84"/>
        <el-table-column
          prop="storeId"
          label="商铺号"
          :resizable="false"
          width="100"/>
        <el-table-column
          prop="companyName"
          label="租户名称"
          show-overflow-tooltip
          :resizable="false"
          width="150"/>
        <el-table-column
          prop="meterDate"
          label="抄表日期"
          :resizable="false"
          width="130">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <el-date-picker
                  v-if="scope.row.isReceivable !== 1"
                  v-model="scope.row.meterDate"
                  value-format="yyyy-MM-dd"
                  type="date"
                  @change="scope.row.updated = true"
                  :clearable="false"
                  :editable="false"
                  placeholder="抄表日期">
                </el-date-picker>
                <span v-else class="table-cell-disable">{{scope.row.meterDate}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="costCycleDateArr"
          label="费用周期"
          :resizable="false"
          width="220">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <el-date-picker
                  v-if="scope.row.isReceivable !== 1"
                  v-model="scope.row.costCycleDateArr"
                  value-format="yyyy-MM-dd"
                  type="daterange"
                  @change="scope.row.updated = true"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期"
                  :clearable="false"
                  :editable="false">
                </el-date-picker>
                <span v-else-if="scope.row.costCycleDateArr.length === 2" class="table-cell-disable">{{scope.row.costCycleDateArr[0]}} 至 {{scope.row.costCycleDateArr[1]}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="lastPayDate"
          label="应收日期"
          :resizable="false"
          width="130">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <el-date-picker
                  v-if="scope.row.isReceivable !== 1"
                  v-model="scope.row.lastPayDate"
                  value-format="yyyy-MM-dd"
                  type="date"
                  @change="scope.row.updated = true"
                  :clearable="false"
                  :editable="false"
                  placeholder="应收日期">
                </el-date-picker>
                <span v-else class="table-cell-disable">{{scope.row.lastPayDate}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="rightDate"
          label="权责月"
          :resizable="false"
          width="110">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <el-date-picker
                  v-if="scope.row.isReceivable !== 1"
                  v-model="scope.row.rightDate"
                  value-format="yyyy-MM"
                  type="month"
                  @change="scope.row.updated = true"
                  :clearable="false"
                  :editable="false"
                  placeholder="权责月">
                </el-date-picker>
                <span v-else class="table-cell-disable">{{scope.row.rightDate}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="lastDegrees"
          label="上期读数"
          :resizable="false"
          width="100">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <span class="table-cell-disable">{{scope.row.lastDegrees}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="thisDegrees"
          label="本期读数"
          :resizable="false"
          width="100">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <el-input
                  v-if="scope.row.isReceivable !== 1"
                  type="number"
                  @input="scope.row.updated = true"
                  :min="scope.row.lastDegrees"
                  v-model="scope.row.thisDegrees"
                  placeholder="本期读数"/>
                <span v-else class="table-cell-disable">{{scope.row.thisDegrees}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="usage"
          label="使用量"
          :resizable="false"
          width="100">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <span class="table-cell-disable" v-if="scope.row.isReceivable !== 1">{{scope.row.thisDegrees - scope.row.lastDegrees}}</span>
                <span class="table-cell-disable" v-else>{{scope.row.usage}}</span>
              </div>
              <el-input
                type="number"
                @input="scope.row.p.updated = true"
                min="0"
                v-else
                v-model="scope.row.usage"
                placeholder="使用量"/>
            </template>
        </el-table-column>
        <el-table-column
          prop="unitPrice"
          label="单价"
          :resizable="false"
          width="100">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.unitPrice}}</span>
                <span v-else-if="scope.row.detail.length != 0" class="table-cell-disable">-</span>
                <el-input
                  v-else
                  type="number"
                  @input="scope.row.updated = true"
                  min="0"
                  v-model="scope.row.unitPrice"
                  placeholder="单价"/>
              </div>
              <div v-else>
                <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.unitPrice}}</span>
                <el-input
                  v-else
                  type="number"
                  @input="scope.row.p.updated = true"
                  min="0"
                  v-model="scope.row.unitPrice"
                  placeholder="单价"/>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          prop="amount"
          label="费用金额"
          :resizable="false"
          width="100">
            <template slot-scope="scope">
              <div v-if="scope.row.isEnergy">
                <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.amount}}</span>
                <span v-else-if="scope.row.detail.length !== 0" class="table-cell-disable">{{scope.row.detail.map(o => o.usage * o.unitPrice).reduce((s, v) => s + v, 0).toFixed(2)}}</span>
                <span v-else class="table-cell-disable">{{((scope.row.thisDegrees - scope.row.lastDegrees) * scope.row.unitPrice).toFixed(2)}}</span>
              </div>
              <div v-else>
                <span v-if="scope.row.isReceivable === 1" class="table-cell-disable">{{scope.row.amount}}</span>
                <span v-else class="table-cell-disable">{{(scope.row.usage * scope.row.unitPrice).toFixed(2)}}</span>
              </div>
            </template>
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          :resizable="false">
            <template slot-scope="scope">
              <el-button v-if="scope.row.isEnergy && scope.row.isReceivable !== 1" type="text" size="small" @click="add(scope.row)">添加 <i class="el-icon-circle-plus-outline"></i></el-button>
              <el-button v-else-if="!scope.row.isEnergy && scope.row.isReceivable !== 1" type="text" size="small" @click="deletea(scope.row)">删除 <i class="el-icon-remove-outline"></i></el-button>
            </template>
        </el-table-column>
        <el-table-column
          fixed="right"
          label="处理"
          :resizable="false"
          width="90">
          <template slot-scope="scope">
            <el-button v-if="scope.row.updated" type="text" size="small" @click="save(scope.row)">保存</el-button>
            <el-popconfirm class="a" v-else-if="scope.row.deviceConsId && scope.row.isEnergy && scope.row.isReceivable !== 1"
              confirmButtonText='生成'
              cancelButtonText='我再想想'
              @onConfirm="genYs(scope.row)"
              title="生成后将无法编辑，确认生成吗？">
              <el-button slot="reference" type="text" size="small">生成应收</el-button>
            </el-popconfirm>
          </template>
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
    </div> -->
  </div>
</template>
<script>
import { format } from '@/utils'
import { deviceManageQueryList, deviceManageEditConsumption, deviceManageOperation1, deviceManageOperation2 } from '@/http/engineering'
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
      query: {
        identifier: '',
        date: format(new Date(), 'YYYY-MM'),
        projectId: null,
        type: 0,
        page: 1,
        total: 0
      },
      data: [],
      detailInfo: {},
      tableData: []
    }
  },
  mounted () {
    this.query = this.$route.query
    getAssetName({mainId: this.merchant.id}).then(res => {
      if (!res || res.length === 0) {
        this.loading = false
        return
      }
      for (let d of res) {
        this.projects.push(d)
      }
      this.search(1)
    })
  },
  methods: {
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
    search (page = this.query.page) {
      this.query.page = page
      let param = {
        mainId: this.merchant.id,
        assetId: this.query.projectId,
        companyName: this.query.rentName,
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
        this.tableData = this.data.filter(item => item.deviceNo === this.$route.query.deviceNo)
        this.detailInfo = this.tableData[0]
        this.loading = false
      })
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
      if (row.detail && row.detail.length !== 0) {
        let usage = row.detail.map(o => o.usage).reduce((s, v) => parseInt(s) + parseInt(v), 0)
        if (row.usage !== usage) {
          this.$message.error('阶梯使用量总和需等于' + row.usage)
          return
        }
      }
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
  .el-table tbody tr:hover>td {
    background-color:#ffffff!important
  }

  .table-wrapper {
    padding: 20px;
  }

  .rightDate .el-date-editor {
    width: 350px;
  }
}
</style>

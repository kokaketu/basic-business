<!-- 保证金查看退款的template -->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)" width="60%">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">退款详情</span>
      </div>
      <el-table :data="depositRefundDetails" class="update-table" style="margin-top: 10px;">
        <el-table-column
          prop="assetName"
          label="项目名称"
        />
        <el-table-column
          prop="payerName"
          label="退款人"
        />
        <el-table-column
          prop="subjectName"
          label="款项"
        />
        <el-table-column
          prop="taxRate"
          label="税率(%)"
        />
        <el-table-column
          prop="noTaxMoney"
          label="不含税金额(元)"
        />
        <el-table-column
          prop="taxMoney"
          label="税额(元)"
        />
        <el-table-column
          prop="receivedMoney"
          label="含税金额(元)"
        />
        <el-table-column
          prop="paymentMethodName"
          label="支付方式"
        />
        <el-table-column
          label="退款时间"
        >
          <template slot-scope="scope">
            <span>{{scope.row.createdDate | format()}}</span>
          </template>
        </el-table-column>
      </el-table>
      <div style="padding-top: 20px;" class="text-right">
        <el-button type="default"  @click="close">取消</el-button>
      </div>
    </el-card>
  </el-dialog>
</template>
<script>
import { PAY_WAYs } from '@/components/const'
import * as utils from '@/utils/index'

export default {
  name: 'DepositRefundDetail',
  components: {},
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    details: Array,
  },
  data () {
    return {
      form: {},
      depositRefundDetails: [],
      rules: {
        receiveDate: [
          { required: true, message: '退款日期不能为空', },
        ],
        paymentMethod: [
          { required: true, message: '支付方式不能为空', },
        ],
      }
    }
  },
  watch: {
    details (depositRefundDetails) {
      this.depositRefundDetails = depositRefundDetails
      this.depositRefundDetails.forEach(item => {
        item.paymentMethodName = this.PAY_WAYs[item.paymentMethod]
      })
    },
  },
  created () {
    this.PAY_WAYs = PAY_WAYs
  },
  methods: {
    close (fresh) {
      this.$emit('close', fresh)
    }
  },
  filters: {
    format (value, template = 'YYYY-MM-DD') {
      return utils.format(value, template)
    }
  }
}
</script>

<style scoped>
  .title {
    font-size: 16px;
    font-weight: bold;
    color: #333;
  }

  .box-card {
    margin: -60px -20px -30px;
  }

  .update-table .el-form-item {
    margin-bottom: 0;
  }
</style>

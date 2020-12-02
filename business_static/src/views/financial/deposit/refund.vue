<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">退款</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目">{{row.assetName}}</el-form-item>
            <el-form-item label="退款日期" prop="receiveDate">
              <el-date-picker
                type="date"
                placeholder="选择日期"
                v-model="form.receiveDate"
                value-format="yyyy-MM-dd"
                style="width: 100%"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="租户">{{row.companyName}}</el-form-item>
            <el-form-item label="支付方式" prop="paymentMethod">
              <el-select v-model="form.paymentMethod" placeholder="请选择支付方式" class="select-width-100">
                <el-option
                  v-for="(payWay, key) in PAY_WAYs"
                  class='select-option-selected'
                  :key="key"
                  :label="payWay"
                  :value="key"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="deposits" class="update-table" style="margin-top: 10px;">
          <el-table-column
            prop="subjectName"
            label="款项名称"
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
            prop="contNo"
            label="合同编号"
          />
        </el-table>
        <div style="padding-top: 20px;" class="text-right">
          <el-button type="primary" @click="submit">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import { PAY_WAYs } from '@/components/const'
import { depositRefund } from '@/http/financial'

export default {
  name: 'DepositRefund',
  components: {},
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    row: Object,
  },
  data () {
    return {
      form: {},
      deposits: [],
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
    row (refund) {
      this.deposits = [refund]
    },
  },
  created () {
    this.PAY_WAYs = PAY_WAYs
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = {}

      this.$emit('close', fresh)
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { id, receivedId, assetId, } = this.row
        if (valid) {
          depositRefund({ ...this.form, id, receivedId, assetId, type: 1 }).then((res) => {
            this.close()
            this.$message({
              message: '退款成功',
              type: 'success'
            })
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
  },
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

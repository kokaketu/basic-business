<!--应收收款template-->
<template>
  <div id="receivables_received">
    <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)" width="65%">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span class="title">收款</span>
        </div>
        <el-form :model="form" :rules="rules" ref="form" label-width="120px">
<!--          <el-row>-->
<!--            <el-col>-->
<!--              <el-form-item label="流水号">-->
<!--                <el-input placeholder="系统自动生成" disabled></el-input>-->
<!--              </el-form-item>-->
<!--            </el-col>-->
<!--          </el-row>-->
          <el-row>
            <el-col :span="12">
              <el-form-item label="项目">
                <el-input v-model="form.assetName" disabled></el-input>
              </el-form-item>
  <!--            <payer-auto-complete prop="companyId" @select="selectPayer" :name="form.companyName"/>-->
              <el-form-item label="付款方">
                <el-input v-model="form.payerName" disabled></el-input>
              </el-form-item>
              <el-form-item label="备注">
                <el-input v-model="form.remark" placeholder="请输入备注"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="实收流水号">
                <el-input placeholder="系统自动生成" disabled></el-input>
              </el-form-item>
              <el-form-item label="实收日期" prop="receiveDate">
                <el-date-picker v-model="form.receiveDate" placeholder="请选择"
                  type="date"
                  value-format="yyyy-MM-dd">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="支付方式" prop="paymentMethod">
                <el-select v-model="form.paymentMethod">
                  <el-option
                    v-for="(name, key) in PAY_WAYs"
                    class='select-option-selected'
                    :key="key"
                    :label="name"
                    :value="key"
                  ></el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-table :data="dataList" class="update-table">
            <el-table-column label="序号" type="index" width="50"></el-table-column>
            <el-table-column label="应收流水号" prop="receivableNo" width="240">
            </el-table-column>
            <el-table-column label="款项" prop="subjectName"></el-table-column>
            <el-table-column
              label="税率(%)">
              <template slot-scope="scope">
                <el-form-item prop="taxRate" label-width="0">
                  <input-number :value="scope.row.taxRate" @input="(v)=>{scope.row.taxRate = v;}" placeholder="请输入"/>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column prop="noTaxMoney" label="不含税金额(元)">
            </el-table-column>
            <el-table-column prop="taxMoney" label="税额(元)">
            </el-table-column>
            <el-table-column label="含税金额(元)">
              <template slot-scope="scope">
                <el-form-item label-width="0">
                  <input-number :value="scope.row.receivedMoney" @input="(v)=>{scope.row.receivedMoney = v;}" placeholder="请输入"/>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column label="备注">
              <template slot-scope="scope">
                <el-form-item prop="remark" label-width="0">
                  <el-input v-model="scope.row.remark" placeholder="请输入"></el-input>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="50">
              <template slot-scope="scope">
                <el-link type="primary" v-show="scope.$index > 0" @click="del(scope.$index)">删除</el-link>
              </template>
            </el-table-column>
          </el-table>
          <div style="padding-top: 20px;">
            <el-button type="default" @click="close" class="fr" style="margin-left: 20px;margin-bottom: 20px">取消</el-button>
            <el-button type="primary" @click="submit" class="fr">保存</el-button>
          </div>
        </el-form>
      </el-card>
    </el-dialog>
  </div>
</template>
<script>
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import { addReceived } from '@/http/financial'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import * as utils from '@/utils'
import { PAY_WAYs } from '@/components/const'
import { getList } from '@/http/contract'
import {mapState} from 'vuex'
import InputNumber from '@/components/InputNumber'

export default {
  name: 'ReceivablesUpdate',
  components: { ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete, InputNumber },
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    dataList: Array,
  },
  data () {
    return {
      contracts: [],
      form: {},
      fisrtWatch: true,
      rules: {
        companyId: [
          { required: true, validator: utils.validateCompanyId.bind(this), },
        ],
        receiveDate: [
          { required: true, message: '实收日期不能为空', },
        ],
        paymentMethod: [
          { required: true, message: '支付方式不能为空', },
        ],
      }
    }
  },
  created () {
    this.PAY_WAYs = PAY_WAYs
  },
  computed: {
    ...mapState(['merchant']),
    subjectName () {
      return this.form.subjectName
    },
    // 税额
    taxMoney () {
      return utils.tax(this.form.receivableMoney, this.form.taxRate)
    },
    // 不含税金额
    noTaxMoney () {
      return (this.form.receivableMoney - utils.tax(this.form.receivableMoney, this.form.taxRate)).toFixed(2)
    },
    subjectNames () {
      return this.$store.state.subjectNames
    }
  },
  watch: {
    dataList: {
      handler: function (receivables) {
        if (receivables && receivables.length > 0) {
          this.dataList = receivables
          this.form.stagesId = receivables[0].stagesId
          this.form.assetId = receivables[0].assetId
          this.form.assetName = receivables[0].assetName
          this.form.companyId = receivables[0].companyId
          this.form.payerName = receivables[0].companyName
          this.dataList.forEach(item => {
            if (this.fisrtWatch) {
              this.fisrtWatch = false
              item.receivedMoney = item.receivableMoney
            }
            item.receivableId = item.id
            item.id = ''
            item.taxMoney = utils.tax(item.receivedMoney, item.taxRate)
            item.noTaxMoney = (item.receivedMoney - item.taxMoney).toFixed(2)
          })
        }
      },
      deep: true
    }
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = {
        mainId: this.merchant.id
      }
      this.fisrtWatch = true
      this.$emit('close', fresh)
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { form, dataList } = this
        if (valid) {
          dataList.forEach(item => {
            const {id, subjectName, subjectCode, subjectType} = this.subjectNames.find(res => { return res.subjectCode === item.subjectCode }) || {}
            if (utils.isEmpty(id)) {
              this.$message.error(`款项【${item.subjectName}】不可用，请检查是否被禁用。`)
              valid = false
              return false
            } else {
              item.subjectId = id
              item.subjectName = subjectName
              item.subjectCode = subjectCode
              item.subjectType = subjectType
            }
            if (item.receivedMoney > item.receivableMoney) {
              this.$message.error(`实收金额不能大于应收金额`)
              valid = false
              return false
            }
          })
          if (valid) {
            let receivedMoney = dataList.map(item => item.receivedMoney).reduce((prev, curr) => { return prev * 1 + curr * 1 }, 0)
            let params = {...form, mainId: this.merchant.id, receivedMoney, receivedDetailList: dataList}
            addReceived(params).then(res => {
              if (res.code === '0') {
                this.$message.success(res.msg)
                this.close()
              }
            })
          }
        } else {
          return false
        }
      })
    },
    add () {
      // const { subjectId, subjectName, subjectCode, subjectType } = this.form
      // this.receivableRightList = [...this.receivableRightList, { subjectId, subjectName, subjectCode, subjectType, rightDate: this.form.receivableDate, receivableMoney: this.form.receivableMoney }]
    },
    del (index) {
      this.dataList.splice(index, 1)
    },
    selectSubject ({ id, subjectName, subjectCode, subjectType, taxRate }) {
      this.form.subjectId = id
      this.form.subjectName = subjectName
      this.form.subjectCode = subjectCode
      this.form.subjectType = subjectType
      this.form.taxRate = taxRate

      this.receivableRightList.forEach((item, index) => {
        if (utils.isEmpty(this.receivableRightList[index].subjectCode)) {
          this.$set(this.receivableRightList[index], 'subjectId', id)
          this.$set(this.receivableRightList[index], 'subjectName', subjectName)
          this.$set(this.receivableRightList[index], 'subjectCode', subjectCode)
          this.$set(this.receivableRightList[index], 'subjectType', subjectType)
        }
      })
    },
    selectProject ({ id, assetName }) {
      this.form.assetId = id
      this.form.assetName = assetName
    },
    selectPayer (name, { companyId, companyName }) {
      this.form.companyId = companyId
      this.form.companyName = companyName
      this.form.payerName = companyName
    },
    searchContract (keyword) {
      getList({assetId: this.form.assetId, contNo: keyword}).then(res => {
        this.contracts = res.list
      })
    },
    selectContract (contNo) {
      let selectedCont = this.contracts.find(item => { return item.contNo === contNo }) || {}
      this.form.contId = selectedCont.id
    }
  },
  activated () {
    this.$store.dispatch('setSubjectNames', {mainId: this.merchant.id})
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

<style lang="scss">
  #receivables_received{
    .el-input{
      width: 80%;
    }
    .el-select{
      width: 100%;
    }
  }

</style>

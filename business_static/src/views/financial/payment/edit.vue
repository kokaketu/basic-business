<!--实付编辑-->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">编辑实付</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="实付流水号">
              <el-input v-model="form.serialNo" placeholder="系统自动生成" disabled></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <project-auto-complete label="项目名称" @select="selectProject" prop="assetId" :projectId="form.assetId" class="is-required"/>
            <el-form-item label="实付日期" prop="paymentDate">
              <el-date-picker
                type="date"
                placeholder="选择日期"
                v-model="form.paymentDate"
                value-format="yyyy-MM-dd"
                style="width: 100%"
              />
            </el-form-item>
            <el-form-item label="含税金额(元)" prop="totalAmount">
              <input-number :value="form.totalAmount" @input="(v)=>{form.totalAmount = v}" :max="99999999" :min="0" placeholder="请输入含税金额"/>
            </el-form-item>
            <el-form-item label="不含税金额(元)" prop="notaxAmount">
              <el-input v-model="form.notaxAmount" disabled placeholder="自动计算">{{ notaxAmount }}</el-input>
            </el-form-item>
            <el-form-item label="支付方式" prop="payPattern">
              <el-select v-model="form.payPattern" placeholder="请选择支付方式" class="select-width-100">
                <el-option
                  v-for="payWay in PAY_WAY"
                  class='select-option-selected'
                  :key="payWay"
                  :label="payWay"
                  :value="payWay"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="assetLayout == 3" label="所属分期" prop="stagesId">
              <el-select
                style="width: 336px;"
                v-model="stagesId"
                placeholder="请选择所属分期">
                <el-option
                  v-for="item in stageList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.stagesName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <div v-else style="width: 336px;height: 60px;"></div>
            <el-form-item label="款项名称" prop="subjectId">
              <el-select v-model="form.subjectId" class="select-width-100" @change="selectSubject">
                <el-option v-for="{id, subjectName} in subjectNames"
                   class='select-option-selected'
                   :key="id"
                   :value="id"
                   :label="subjectName">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="税率(%)" prop="taxRate">
              <input-number :value="form.taxRate" @input="(v)=>{form.taxRate = v}" :max="100" :min="0" placeholder="请输入税率"/>
            </el-form-item>
            <el-form-item label="税额(元)" prop="taxAmount">
              <el-input v-model="form.taxAmount" disabled placeholder="自动计算">{{ taxAmountA }}</el-input>
            </el-form-item>
            <el-form-item label="收款方" prop="payeeName">
              <el-input v-model="form.payeeName" placeholder="请输入收款方"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="subItemList" class="update-table">
          <el-table-column>
            <template slot="header">
              <span style="color: #F56C6C">*&nbsp;&nbsp;</span>款项名称
            </template>
            <template slot-scope="scope">
              <el-select v-model="scope.row.subjectCode">
                <el-option v-for="{subjectCode, subjectName} in subjectNames"
                           class='select-option-selected'
                           :key="subjectCode"
                           :value="subjectCode"
                           :label="subjectName">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
            prop="apportionMonth"
            label="分摊月份"
          >
            <template slot-scope="scope">
              <el-form-item prop="apportionMonth" label-width="0">
                <el-date-picker
                  type="month"
                  placeholder="选择日期"
                  v-model="subItemList[scope.$index].apportionMonth"
                  value-format="yyyy-MM"
                  style="width: 100%"
                />
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="apportionAmount"
            label="分摊金额"
          >
            <template slot-scope="scope">
              <el-form-item prop="apportionAmount" label-width="0">
                <input-number :value="subItemList[scope.$index].apportionAmount" @input="(v)=>{subItemList[scope.$index].apportionAmount = v}" :max="99999999" :min="0" placeholder="分摊金额"/>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="remark"
            label="备注">
            <template slot-scope="scope">
              <el-form-item prop="remark_" label-width="0">
                <el-input v-model="subItemList[scope.$index].remark" placeholder="备注"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column width="50">
            <template slot="header">
              <el-link type="primary" @click="add">增加</el-link>
            </template>
            <template slot-scope="scope">
              <el-link type="primary" @click="del(scope.$index)">删除</el-link>
            </template>
          </el-table-column>
        </el-table>
        <div class="clearfix" style="padding-top: 20px;">
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建人：{{form.createdName}}</el-button>
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建时间：{{form.createdDate | dateFormat('YYYY-MM-DD HH:mm:ss')}}</el-button>
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px;">取消</el-button>
          <el-button type="primary" @click="submit" class="fr">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import { PAY_WAY } from '../../../components/const'
import { fetchRealPayDetail, realPaySave } from '../../../http/financial'
import ProjectAutoComplete from '../../../components/ProjectAutoComplete'
import * as utils from '../../../utils'
import InputNumber from '../../../components/InputNumber'
import {queryFQByAssetId} from '@/http/assets'

export default {
  name: 'payment_edit',
  components: { ProjectAutoComplete, InputNumber },
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    id: Number,
  },
  data () {
    return {
      assetLayout: null,
      stageList: [],
      stagesId: null,
      form: {
        taxRate: void 0,
        taxAmount: 0,
        totalAmount: 0
      },
      subItemList: [],
      rules: {
        assetId: [
          { validator: utils.validateAssetId.bind(this), },
        ],
        subjectId: [
          { required: true, validator: utils.validateSubjectId.bind(this), },
        ],
        payeeName: [
          { required: true, message: '收款方不能为空', },
        ],
        paymentDate: [
          { required: true, message: '实付日期不能为空', },
        ],
        totalAmount: [
          { required: true, message: '含税金额不能为空', },
        ],
        taxRate: [
          { required: true, message: '税率不能为空', },
          { validator: utils.validateTaxRate.bind(this), },
        ],
        payPattern: [
          { required: true, message: '支付方式不能为空', },
        ],
      }
    }
  },
  computed: {
    // 税额
    taxAmountA () {
      let taxRate = this.form.taxRate / 100
      let mount = this.form.totalAmount * taxRate / (1 + taxRate)
      this.form.taxAmount = isNaN(mount) ? '' : mount.toFixed(2)
      return this.form.taxAmount
    },
    // 不含税金额
    notaxAmount () {
      const mount = this.form.totalAmount - this.form.taxAmount
      this.form.notaxAmount = isNaN(mount) ? '' : mount.toFixed(2)
      return this.form.notaxAmount
    },
    subjectNames () {
      return this.$store.state.subjectNames
    },
    merchant () {
      return this.$store.state.merchant
    },
    projectNameList () {
      return this.$store.state.projectNameList
    }
  },
  activated () {
    this.$store.dispatch('setSubjectNames', {mainId: this.merchant.id})
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
  },
  watch: {
    visible (val) {
      if (val) {
        fetchRealPayDetail(this.id).then((res) => {
          const { subItemList, ...form } = res
          this.subItemList = subItemList || []
          this.form = form
          this.stagesId = res.stagesId
          this.assetLayout = this.projectNameList.filter(item =>
            Number(item.id) === Number(this.form.assetId)
          )[0].assetLayout
          this.queryFQ()
        })
      }
    }
  },
  created () {
    this.PAY_WAY = PAY_WAY
  },
  filters: {
    dateFormat: function (value, template) {
      return utils.format(value, template)
    }
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = { assetId: undefined, subjectId: undefined }
      this.subItemList = []
      this.$emit('close', fresh)
    },
    queryFQ () {
      this.assetLayout = this.projectNameList.filter(item =>
        Number(item.id) === Number(this.form.assetId)
      )[0].assetLayout
      if (Number(this.assetLayout) !== 3) return
      queryFQByAssetId({assetId: this.form.assetId}).then(res => {
        this.stageList = res.data
      })
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { form, subItemList } = this
        if (valid) {
          if (utils.isEmpty(subItemList) || subItemList.length < 1) {
            this.$message.error('实付明细不能为空')
            return false
          }
          if (subItemList.some(res => { return utils.isEmpty(res.subjectName) })) {
            this.$message.error('款项名称不能为空')
            return false
          }
          realPaySave({
            ...form,
            stagesId: this.stagesId,
            mainId: this.merchant.id,
            subItemList,
          }).then((res) => {
            if (res) {
              this.close()
              this.$message.success('更新实付订单成功')
            }
          })
        } else {
          return false
        }
      })
    },
    add () {
      let selectedSubject = this.subjectNames.find(res => res.id === this.form.subjectId) || {}
      this.subItemList = [...this.subItemList, {
        subjectId: selectedSubject.id,
        subjectCode: selectedSubject.subjectCode,
        subjectName: selectedSubject.subjectName,
        apportionAmount: this.form.totalAmount,
        apportionMonth: utils.format(this.form.paymentDate, 'YYYY-MM')}
      ]
    },
    del (index) {
      this.subItemList.splice(index, 1)
    },
    selectSubject (subjectId) {
      let selectedSubject = this.subjectNames.find(res => res.id === subjectId) || {}
      this.form.subjectId = selectedSubject.id
      this.form.subjectCode = selectedSubject.subjectCode
      this.form.subjectName = selectedSubject.subjectName
      this.form.taxRate = selectedSubject.taxRate
      this.subItemList.forEach((subItem, index) => {
        this.subItemList[index].subjectId = selectedSubject.id
      })
    },
    selectProject ({ id, assetName }) {
      this.form.assetId = id
      this.form.assetName = assetName
    },
    tax () {

    }
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

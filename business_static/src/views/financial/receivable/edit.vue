<!--应收编辑-->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">编辑应收</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="应收流水号">
              <el-input :value="form.receivableNo" placeholder="系统自动生成" disabled></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目名称" prop="assetId">
              <el-select @change="queryFQ" v-model="form.assetId" class="select-width-100">
                <el-option v-for="{id, assetName} in projectNameList" :key="id" :label="assetName" :value="id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="应收日期" prop="receivableDate">
              <el-date-picker
                type="date"
                placeholder="选择日期"
                v-model="form.receivableDate"
                value-format="yyyy-MM-dd"
                style="width: 100%"
              />
            </el-form-item>
            <el-form-item label="含税金额(元)" prop="receivableMoney">
              <input-number :value="form.receivableMoney" @input="(v)=>{form.receivableMoney = v; taxComputed()}" placeholder="请输入含税金额"/>
            </el-form-item>
            <el-form-item label="不含税金额(元)" prop="noTaxMoney">
              {{ form.noTaxMoney }}
            </el-form-item>
            <el-form-item label="合同编号" prop="contNo">
              <!-- <el-input v-model="form.contNo" placeholder="请输入合同编号"></el-input> -->
              <el-select
                class="select-width-100"
                v-model="form.contNo"
                clearable
                filterable
                remote
                reserve-keyword
                placeholder="请输入合同编号搜索"
                @change="selectContract"
                :remote-method="searchContract"
                :loading="false">
                <el-option
                  v-for="{id,contNo,companyName} in contracts"
                  class='select-option-selected'
                  :key="id"
                  :label="`${companyName} / ${contNo}`"
                  :value="contNo">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="应收帐期" prop="accountDate">
              <el-date-picker
                v-model="accountDate"
                type="daterange"
                value-format="yyyy-MM-dd"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                style="width: 100%"
              />
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
            <el-form-item label="款项名称" prop="subjectId" required>
              <el-select v-model="form.subjectCode" class="select-width-100" @change="selectSubject">
                <el-option v-for="{subjectCode, subjectName} in subjectNames" :key="subjectCode" :label="subjectName" :value="subjectCode"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="税率(%)" prop="taxRate">
              <input-number :value="form.taxRate" @input="(v)=>{form.taxRate = v; taxComputed()}" placeholder="请输入税率"/>
            </el-form-item>
            <el-form-item label="税额(元)" prop="taxMoney">
              {{ form.taxMoney }}
            </el-form-item>
            <payer-auto-complete required prop="companyId" @select="selectPayer" :id="form.companyId"/>
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="receivableRightList" class="update-table">
          <el-table-column>
            <template slot="header">
              <span style="color: #F56C6C">*&nbsp;&nbsp;</span>款项名称
            </template>
            <template slot-scope="scope">
              <el-select v-model="scope.row.subjectCode" @change="(subjectCode) => {return selectDetailSubject(subjectCode, scope.row)}">
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
            label="权责月份"
          >
            <template slot="header">
              <span style="color: #F56C6C">*&nbsp;&nbsp;</span>权责月份
            </template>
            <template slot-scope="scope">
              <el-form-item prop="apportionMonth" label-width="0">
                <el-date-picker
                  type="month"
                  placeholder="选择日期"
                  v-model="receivableRightList[scope.$index].rightDate"
                  style="width: 100%"
                />
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="apportionAmount"
            label="金额(元)"
          >
            <template slot="header">
              <span style="color: #F56C6C">*&nbsp;&nbsp;</span>金额(元)
            </template>
            <template slot-scope="scope">
              <el-form-item prop="apportionAmount" label-width="0">
                <input-number :value="receivableRightList[scope.$index].receivableMoney" @input="(v)=>{receivableRightList[scope.$index].receivableMoney = v;}" placeholder="请输入金额"/>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="remark"
            label="备注"
          >
            <template slot-scope="scope">
              <el-form-item prop="remark_" label-width="0">
                <el-input v-model="receivableRightList[scope.$index].remark" placeholder="请输入备注"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="60">
            <template slot="header">
              <el-link type="primary" @click="add">增加</el-link>
            </template>
            <template slot-scope="scope">
              <el-link type="primary" @click="del(scope.$index)">删除</el-link>
            </template>
          </el-table-column>
        </el-table>
        <div class="clearfix" style="margin-top: 20px">
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建人：{{form.createdName}}</el-button>
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建时间：{{form.createdDate | dateFormat('YYYY-MM-DD HH:mm:ss')}}</el-button>
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px">取消</el-button>
          <el-button type="primary" @click="submit" class="fr">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import { getReceivable, updateReceivable } from '@/http/financial'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import * as utils from '@/utils'
import InputNumber from '@/components/InputNumber'
import { getList } from '@/http/contract'
import {queryFQByAssetId} from '@/http/assets'

export default {
  name: 'ReceivablesEdit',
  components: { ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete, InputNumber },
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    id: Number,
    create: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      accountDate: [],
      assetLayout: null,
      contracts: [],
      stageList: [],
      stagesId: null,
      form: {
        contId: '',
        contNo: '',
        contType: '',
        taxRate: 0,
        taxMoney: void 0,
        noTaxMoney: void 0
      },
      receivableRightList: [],
      rules: {
        assetId: [
          { required: true, validator: utils.validateAssetId.bind(this), },
        ],
        subjectId: [
          { validator: utils.validateSubjectId.bind(this), },
        ],
        companyId: [
          { validator: utils.validateCompanyId.bind(this), },
        ],
        payeeName: [
          { required: true, message: '收款方不能为空', },
        ],
        receivableDate: [
          { required: true, message: '应收日期不能为空', },
        ],
        receivableMoney: [
          { required: true, message: '含税金额不能为空', },
        ],
        taxRate: [
          { required: true, message: '税率不能为空', },
          { validator: utils.validateTaxRate.bind(this), },
        ],
        taxAmount: [
          { required: true, message: '税额不能为空', },
        ],
        /* noTaxMoney: [
          { required: true, message: '不含税金额不能为空', },
        ], */
        payPattern: [
          { required: true, message: '支付方式不能为空', },
        ],
      }
    }
  },
  computed: {
    subjectName () {
      return this.form.subjectName
    },
    // 税额
    taxMoney () {
      return utils.tax(this.form.receivableMoney, this.form.taxRate)
    },
    // 不含税金额
    noTaxMoney () {
      return ((this.form.receivableMoney || 0) - utils.tax(this.form.receivableMoney, this.form.taxRate)).toFixed(2)
    },
    subjectNames () {
      return this.$store.state.subjectNames
    },
    merchant () {
      return this.$store.state.merchant
    },
    projectNameList () {
      return this.$store.state.projectNameList
    },
    payerNames () {
      return this.$store.state.payerNames
    }
  },
  watch: {
    visible (val, oldVal) {
      if (val && this.create) {
        this.form = {taxRate: 0}
        this.receivableRightList = []
      } else {
        getReceivable(this.id).then((res) => {
          const { receivableRightList, ...form } = res
          this.receivableRightList = receivableRightList || []
          this.form = form
          this.stagesId = res.stagesId
          this.assetLayout = this.projectNameList.filter(item =>
            Number(item.id) === Number(this.form.assetId)
          )[0].assetLayout
          // this.queryFQ()
          if (!this.form.taxRate) {
            this.form.taxRate = 0
          }
          this.accountDate = [res.accountDateStart, res.accountDateEnd]
        })
      }
    }
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = {assetId: undefined, subjectId: undefined, companyId: undefined, taxRate: 0}
      this.receivableRightList = []
      this.$emit('close', fresh)
    },
    queryFQ () {
      this.form.companyId = null
      this.form.contId = null
      this.form.contNo = ''
      this.form.contType = ''
      this.contracts = []
      let assetInfo = this.projectNameList.filter(item =>
        Number(item.id) === Number(this.form.assetId)
      )[0]
      this.form.assetName = assetInfo.assetName
      this.form.assetLayout = assetInfo.assetLayout
      this.assetLayout = assetInfo.assetLayout
      if (Number(this.assetLayout) !== 3) return
      queryFQByAssetId({assetId: this.form.assetId}).then(res => {
        this.stageList = res.data
      })
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { form, receivableRightList } = this
        if (valid) {
          if (!receivableRightList || receivableRightList.length < 1) {
            this.$message.error('应收权责明细不能为空')
            return false
          }
          if (receivableRightList.some(res => { return utils.isEmpty(res.subjectCode) })) {
            this.$message.error('款项不能为空')
            return false
          }
          if (receivableRightList.some(res => { return utils.isEmpty(res.rightDate) })) {
            this.$message.error('权责月份不能为空')
            return false
          }
          if (receivableRightList.some(res => { return utils.isEmpty(res.receivableMoney) })) {
            this.$message.error('金额不能为空')
            return false
          }
          updateReceivable({
            ...form,
            stagesId: this.stagesId,
            mainId: this.merchant.id,
            accountDateStart: this.accountDate[0],
            accountDateEnd: this.accountDate[1],
            receivableRightList,
          }).then((res) => {
            if (res.code === '0') {
              this.close(true)
              this.$message.success('更新应收订单成功')
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    add () {
      const { subjectId, subjectName, subjectCode, subjectType } = this.form
      this.receivableRightList = [
        ...this.receivableRightList,
        { subjectId,
          subjectName,
          subjectCode,
          subjectType,
          rightDate: this.form.receivableDate,
          receivableMoney: this.form.receivableMoney,
          receivableStatus: '1'
        }]
    },
    del (index) {
      this.receivableRightList.splice(index, 1)
    },
    selectSubject (val) {
      const {id, subjectName, subjectCode, subjectType, taxRate} = this.subjectNames.find(res => res.subjectCode === val) || {}

      this.form.subjectId = id
      this.form.subjectName = subjectName
      this.form.subjectCode = subjectCode
      this.form.subjectType = subjectType
      this.form.taxRate = taxRate || 0

      this.receivableRightList.forEach((item, index) => {
        if (utils.isEmpty(this.receivableRightList[index].subjectCode)) {
          this.$set(this.receivableRightList[index], 'subjectId', id)
          this.$set(this.receivableRightList[index], 'subjectName', subjectName)
          this.$set(this.receivableRightList[index], 'subjectCode', subjectCode)
          this.$set(this.receivableRightList[index], 'subjectType', subjectType)
        }
      })
    },
    selectDetailSubject (subjectCode, row) {
      const {id, subjectName, subjectType} = this.subjectNames.find(res => res.subjectCode === subjectCode) || {}
      row.subjectId = id
      row.subjectName = subjectName
      row.subjectCode = subjectCode
      row.subjectType = subjectType
    },
    selectProject ({ id, assetName }) {
      this.form.assetId = id
      this.form.assetName = assetName
      if (this.form.contId) {
        this.form.contId = ''
      }
      if (this.form.contNo) {
        this.form.contNo = ''
      }
      if (this.form.contType) {
        this.form.contType = ''
      }
      this.contracts = []
    },
    selectPayer (name, { companyId, companyName }) {
      debugger
      this.form.companyId = companyId
      this.form.companyName = companyName
    },
    searchContract (keyword) {
      if (utils.isEmpty(this.form.assetId)) {
        this.$message.warning('请先选择项目')
        return false
      }
      getList({assetId: this.form.assetId, contNo: keyword}).then(res => {
        this.contracts = res.list
      })
    },
    selectContract (contNo) {
      let selectedCont = this.contracts.find(item => { return item.contNo === contNo }) || {}
      this.form.contId = selectedCont.id
      this.form.companyId = selectedCont.company.id
      this.form.companyName = this.payerNames.find(item => { return item.companyId === selectedCont.company.id }).companyName
      this.form.contType = selectedCont.contType
    },
    taxComputed () {
      let receivableMoney = this.form.receivableMoney || 0
      this.form.taxMoney = utils.tax(receivableMoney, this.form.taxRate)
      this.form.noTaxMoney = (receivableMoney - utils.tax(receivableMoney, this.form.taxRate)).toFixed(2)
    }
  },
  filters: {
    dateFormat: function (value, template) {
      return utils.format(value, template)
    }
  },
  activated () {
    this.$store.dispatch('setSubjectNames', {mainId: this.merchant.id})
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
  }
}
</script>

<style lang="scss" scoped>
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
  .btn-group{
    margin-top: 20px;
    margin-bottom: 60px;
    .el-button{
      margin-left: 10px;
    }
  }
</style>

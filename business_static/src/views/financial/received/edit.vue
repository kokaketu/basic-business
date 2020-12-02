<!--实收编辑-->
<template>
  <el-dialog width="1100px" :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">编辑实收</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="实收流水号">
              <el-input v-model="form.receivedNo" placeholder="系统自动生成" disabled/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="10">
          <el-col :span="12">
            <project-auto-complete
              @select="selectProject"
              prop="assetId"
              :projectId="form.assetId"
              class="is-required"
            />
            <el-form-item label="实收日期" prop="receiveDate">
              <el-date-picker
                type="date"
                placeholder="选择日期"
                v-model="form.receiveDate"
                value-format="yyyy-MM-dd"
                style="width: 100%"
              />
            </el-form-item>
            <payer-auto-complete @select="selectPayer" prop="payerName" :id="form.companyId" class="is-required"/>
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
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
            </el-form-item>

          </el-col>
        </el-row>
        <el-table :data="receivedDetailList" class="update-table received-update-table">
          <el-table-column
            prop="apportionMonth"
            label="关联应收流水号"
            width="240">
            <template slot="header">
              <span style="color: #F56C6C">*</span>关联应收流水号
            </template>
            <template slot-scope="scope">
              <el-form-item prop="receivableNo" size="mini">
                <el-select
                  v-model="receivedDetailList[scope.$index].receivableNo"
                  clearable
                  filterable
                  remote
                  reserve-keyword
                  placeholder="输入以搜索"
                  @change="(query) => {receivableChange(query, scope.row)}"
                  :remote-method="(query) => {searchReceivable(query, scope.row)}"
                  :loading="false">
                  <el-option
                    v-for="item in receivedDetailList[scope.$index].receivables"
                    class='select-option-selected'
                    :key="item.id"
                    :label="item.receivableNo"
                    :value="item.receivableNo">
                  </el-option>
                </el-select>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="subjectName"
            label="款项名称">
          </el-table-column>
          <el-table-column

            prop="taxRate"
            label="税率(%)">
            <template slot-scope="scope">
              <el-form-item prop="taxRate">
                <input-number :value="receivedDetailList[scope.$index].taxRate" @input="(v)=>{receivedDetailList[scope.$index].taxRate = v; taxComputed(scope.row)}" size="mini" placeholder="税率"/>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="receivableMoney"
            label="含税金额(元)">
            <template slot-scope="scope">
              <el-form-item prop="receivedMoney">
                <input-number :value="receivedDetailList[scope.$index].receivedMoney" @input="(v)=>{receivedDetailList[scope.$index].receivedMoney = v; taxComputed(scope.row)}"  size="mini" placeholder="含税金额"/>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            size="mini"
            prop="noTaxMoney"
            label="不含税金额(元)">
          </el-table-column>
          <el-table-column
            size="mini"
            prop="taxMoney"
            label="税额(元)"
            width="80">
          </el-table-column>
          <el-table-column
            size="mini"
            prop="remark"
            label="备注">
            <template slot-scope="scope">
              <el-form-item prop="remark_" label-width="0">
                <el-input size="mini" v-model="receivedDetailList[scope.$index].remark" placeholder="备注"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column size="mini" width="50">
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
          <el-button type="default" @click="close" class="fr" style="margin-left: 20px;">取消</el-button>
          <el-button type="primary" @click="submit" class="fr">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import { getReceived, updateReceived, getReceivableList } from '@/http/financial'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import InputNumber from '@/components/InputNumber'
import { PAY_WAYs } from '@/components/const'
import * as utils from '@/utils'
import {queryFQByAssetId} from '@/http/assets'

export default {
  name: 'ReceivedUpdate',
  components: { ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete, InputNumber },
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    id: Number,
  },
  data () {
    function validatePayerName (rule, value, callback) {
      if (this.form.payerName == null || this.form.payerName === '') {
        callback(new Error('付款方不能为空'))
      }
      callback()
    }
    return {
      assetLayout: null,
      stageList: [],
      stagesId: null,
      form: {
        receivedMoney: 0
      },
      receivedDetailList: [],
      rules: {
        assetId: [
          { validator: utils.validateAssetId.bind(this), },
        ],
        subjectId: [
          { validator: utils.validateSubjectId.bind(this), },
        ],
        companyId: [
          { validator: utils.validateCompanyId.bind(this), },
        ],
        payerName: [
          { validator: validatePayerName.bind(this), },
        ],
        receiveDate: [
          { required: true, message: '实收日期不能为空', },
        ],
        paymentMethod: [
          { required: true, message: '支付方式不能为空', },
        ]
      }
    }
  },
  computed: {
    subjectName () {
      return this.form.subjectName
    },
    // 税额
    taxMoney () {
      const mount = this.form.receivableMoney * this.form.taxRate / 100
      return isNaN(mount) ? '' : mount.toFixed(2)
    },
    // 不含税金额
    noTaxMoney () {
      const mount = this.form.receivableMoney - this.form.receivableMoney * this.form.taxRate / 100
      return isNaN(mount) ? '' : mount.toFixed(2)
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
        getReceived(this.id).then((res) => {
          const { receivedDetailList, ...form } = res
          this.receivedDetailList = receivedDetailList || []
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
    this.PAY_WAYs = PAY_WAYs
  },
  filters: {
    dateFormat: function (value, template) {
      return utils.format(value, template)
    }
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = { assetId: undefined, subjectId: undefined, companyId: undefined }
      this.receivedDetailList = []
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
        const { form, receivedDetailList } = this
        if (valid) {
          if (receivedDetailList.some(item => { return utils.isEmpty(item.receivableNo) })) {
            this.$message.error('请选择关联应收流水号')
            return false
          }
          if (receivedDetailList.some(item => { return item.receivedMoney > item.receivableMoney })) {
            this.$message.error(`实收金额（含税金额）不能大于应收金额`)
            return false
          }
          // 累加实收金额
          let values = receivedDetailList.map(item => item.receivedMoney)
          form.receivedMoney = values.reduce((prev, curr) => { return prev * 1 + curr * 1 }, 0)

          updateReceived({...form, stagesId: this.stagesId, receivedDetailList}).then((res) => {
            const { code } = res || {}
            if (code === '0') {
              this.$message.success('更新实收订单成功')
              this.close(true)
            } else {
              // this.$message.error(msg)
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    add () {
      this.receivedDetailList = [...this.receivedDetailList, {taxRate: void 0, receivables: []}]
    },
    del (index) {
      this.receivedDetailList.splice(index, 1)
    },
    selectSubject ({ id, subjectName, subjectCode, subjectType, taxRate }, { $index }) {
      this.receivedDetailList[$index].subjectId = id
      this.receivedDetailList[$index].subjectName = subjectName
      this.receivedDetailList[$index].subjectCode = subjectCode
      this.receivedDetailList[$index].subjectType = subjectType
      this.receivedDetailList[$index].taxRate = taxRate
    },
    selectProject ({ id, assetName }) {
      this.form.assetId = id
      this.form.assetName = assetName
    },
    selectPayer (name, { companyId, companyName }) {
      this.form.payerName = companyName
      this.form.companyId = companyId
    },
    searchReceivable (keyword, row) {
      getReceivableList({
        assetId: this.form.assetId,
        companyId: this.form.companyId,
        receivableNo: keyword,
        receivableStatus: '1', // 查询应收状态为正常的 过滤坏账数据
        mainId: this.merchant.id
      }).then(res => {
        // 独立行的应收搜索结果
        this.$set(row, 'receivables', res.list)
      })
    },
    receivableChange (receiableNo, row) {
      let receobj = row.receivables.find(o => { return o.receivableNo === receiableNo })
      receobj = utils.isEmpty(receobj) ? {} : receobj
      let subject = this.subjectNames.find(o => { return o.subjectCode === receobj.subjectCode })
      subject = utils.isEmpty(subject) ? {} : subject

      this.$set(row, 'receivedMoney', receobj.receivableMoney)
      this.$set(row, 'receivableMoney', receobj.receivableMoney)
      this.$set(row, 'subjectCode', subject.subjectCode)
      this.$set(row, 'subjectName', subject.subjectName)
      this.$set(row, 'subjectType', subject.subjectType)
      this.$set(row, 'subjectId', subject.id)
      this.$set(row, 'taxRate', receobj.taxRate)
      this.$set(row, 'receivableId', receobj.id)
      this.taxComputed(row)
    },
    taxComputed (row) {
      let receivedMoney = row.receivedMoney || 0
      row.taxMoney = utils.tax(receivedMoney, row.taxRate)
      row.noTaxMoney = (receivedMoney - utils.tax(receivedMoney, row.taxRate)).toFixed(2)
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
  .btn-group {
    margin: 20px 0px;
  }
</style>

<style>
  .received-update-table .el-form-item__content {
    margin-left: 0 !important;
    margin-bottom: 0px;
  }

  .received-update-table .el-form-item__label {
    display: none;
  }

</style>

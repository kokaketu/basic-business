<!--实付编辑-->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">实付明细</span>
      </div>
      <el-form :model="form" ref="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="实付流水号">
              {{form.serialNo}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目名称" prop="taxRate">
              {{(projectNameList.find(res => res.id === form.assetId) || {}).assetName}}
            </el-form-item>
            <el-form-item label="实付日期" prop="paymentDate">
              {{form.paymentDate}}
            </el-form-item>
            <el-form-item label="含税金额(元)" prop="totalAmount">
              {{form.totalAmount}}
            </el-form-item>
            <el-form-item label="不含税金额(元)" prop="notaxAmount">
              {{form.notaxAmount}}
            </el-form-item>
            <el-form-item label="支付方式" prop="payPattern">
              {{form.payPattern}}
            </el-form-item>
            <el-form-item label="备注" prop="remark">
              {{form.remark}}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="assetLayout == 3" label="所属分期">
              {{form.stagesName || '-'}}
            </el-form-item>
            <div v-else style="width: 336px;height: 60px;"></div>
            <el-form-item label="款项名称" prop="subjectId">
              {{(subjectNames.find(res => res.id === form.subjectId) || {}).subjectName}}
            </el-form-item>
            <el-form-item label="税率(%)" prop="taxRate">
              {{form.taxRate}}
            </el-form-item>
            <el-form-item label="税额(元)" prop="taxAmount">
              {{form.taxAmount}}
            </el-form-item>
            <el-form-item label="收款方" prop="payeeName">
              {{form.payeeName}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="subItemList" class="update-table">
          <el-table-column>
            <template slot="header">
              款项名称
            </template>
            <template slot-scope="scope">
              {{(subjectNames.find(res => res.subjectCode === scope.row.subjectCode) || {}).subjectName}}
            </template>
          </el-table-column>
          <el-table-column
            prop="apportionMonth"
            label="分摊月份"
          >
            <template slot-scope="scope">
              {{subItemList[scope.$index].apportionMonth}}
            </template>
          </el-table-column>
          <el-table-column
            prop="apportionAmount"
            label="分摊金额"
          >
            <template slot-scope="scope">
              {{subItemList[scope.$index].apportionAmount}}
            </template>
          </el-table-column>
          <el-table-column
            prop="remark"
            label="备注">
            <template slot-scope="scope">
              {{subItemList[scope.$index].remark}}
            </template>
          </el-table-column>
        </el-table>
        <div class="clearfix" style="padding-top: 20px;">
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建人：{{form.createdName}}</el-button>
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建时间：{{form.createdDate | dateFormat('YYYY-MM-DD HH:mm:ss')}}</el-button>
          <el-button :disabled="permission" type="default" @click="close(false)" class="fr" style="margin-left: 20px;">取消</el-button>
          <el-button :disabled="permission" type="primary" @click="edit" class="fr">编辑</el-button>
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
import { mapState } from 'vuex'

export default {
  name: 'payment_detail',
  components: { ProjectAutoComplete },
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
      permission: '',
      form: {
        taxRate: void 0,
        taxAmount: 0,
        totalAmount: 0
      },
      subItemList: [],
    }
  },
  computed: {
    ...mapState(['permissionList']),
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
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
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
          this.assetLayout = this.projectNameList.filter(item =>
            Number(item.id) === Number(this.form.assetId)
          )[0].assetLayout
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
      this.form = { assetId: undefined, subjectId: undefined }
      this.subItemList = []
      this.$emit('close', fresh)
    },
    edit () {
      this.$emit('edit')
    },
    submit () {
      console.log(this.form)
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
            mainId: this.merchant.id,
            subItemList,
          }).then((res) => {
            if (res) {
              this.close()
              this.$message.success('更新实付订单成功')
            } else {
              this.$message.error('更新实付订单失败')
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    add () {
      this.subItemList = [...this.subItemList, {
        subjectId: this.form.subjectId,
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

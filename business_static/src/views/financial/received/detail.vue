<!--实收编辑-->
<template>
  <el-dialog width="1100px" :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">实收明细</span>
      </div>
      <el-form :model="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="实收流水号">
              {{form.receivedNo}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="10">
          <el-col :span="12">
            <el-form-item label="项目名称" >
              {{(projectNameList.find(res => res.id === form.assetId) || {} ).assetName}}
            </el-form-item>
            <el-form-item label="实收日期" prop="receiveDate">
              {{form.receiveDate}}
            </el-form-item>
            <el-form-item label="付款方" >
              {{form.payerName}}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="assetLayout == 3" label="所属分期">
              {{form.stagesName || '-'}}
            </el-form-item>
            <div v-else style="width: 336px;height: 60px;"></div>

            <el-form-item label="支付方式" prop="paymentMethod">
              {{PAY_WAYs[form.paymentMethod]}}
            </el-form-item>
            <el-form-item label="备注" prop="remark">
              {{form.remark}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="receivedDetailList" class="update-table received-update-table">
          <el-table-column
            prop="apportionMonth"
            label="关联应收流水号"
            width="200">
            <template slot="header">
              <span style="color: #F56C6C">*</span>关联应收流水号
            </template>
            <template slot-scope="scope">
              <el-form-item prop="receivableNo" size="mini">
                {{receivedDetailList[scope.$index].receivableNo}}
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
          </el-table-column>
          <el-table-column
            prop="receivedMoney"
            label="含税金额(元)">
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
          </el-table-column>
        </el-table>
        <div class="clearfix" style="margin-top: 20px">
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建人：{{form.createdName}}</el-button>
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建时间：{{form.createdDate | dateFormat('YYYY-MM-DD HH:mm:ss')}}</el-button>
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px;">取消</el-button>
          <el-button :disabled="permission" type="primary" @click="edit" class="fr" v-show="showEdit">编辑</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import { getReceived } from '@/http/financial'
import SubjectAutoComplete from '@/components/SubjectAutoComplete'
import ProjectAutoComplete from '@/components/ProjectAutoComplete'
import PayerAutoComplete from '@/components/PayerAutoComplete'
import { PAY_WAYs } from '@/components/const'
import { mapState } from 'vuex'
import * as utils from '@/utils'

export default {
  name: 'ReceivedDetail',
  components: { ProjectAutoComplete, SubjectAutoComplete, PayerAutoComplete },
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
      permission: '',
      form: {
        receivedMoney: 0
      },
      showEdit: true,
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
    // 税额
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
    visible (val, oldVal) {
      if (val) {
        getReceived(this.id).then((res) => {
          const { receivedDetailList, ...form } = res
          this.receivedDetailList = receivedDetailList || []
          this.form = form
          this.assetLayout = this.projectNameList.filter(item =>
            Number(item.id) === Number(this.form.assetId)
          )[0].assetLayout
          this.showEdit = this.form.receivedMoney > 0 || !this.form.receivedMoney
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
      this.form = { assetId: undefined, subjectId: undefined, companyId: undefined }
      this.receivedDetailList = []
      this.$emit('close', fresh)
    },
    edit () {
      this.$emit('edit', this.form.id)
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

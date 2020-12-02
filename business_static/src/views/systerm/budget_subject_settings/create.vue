<template>
  <el-dialog id="budgetSubjectSettings-create" :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">新增预算科目</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算科目名称" prop="budgetSubjectName">
              <el-input v-model="form.budgetSubjectName" :maxlength="32" placeholder="请输入预算科目名称"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="预算科目编码" prop="budgetSubjectCode">
              <el-input v-model="form.budgetSubjectCode" :maxlength="32" placeholder="请输入预算科目编码"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算类型" prop="budgetType" >
              <el-select v-model="form.budgetType" class="select-width-100">
                <el-option
                  v-for="{code, name} in budgetTypes"
                  class="select-option-selected"
                  :label="name"
                  :value="code"
                  :key="code"/>
              </el-select>
            </el-form-item>
          </el-col>
<!--          <el-col :span="12">-->
<!--            <el-form-item label="业态类型" prop="assetLayout">-->
<!--              <el-select v-model="form.assetLayout" class="select-width-100">-->
<!--                <el-option-->
<!--                  v-for="{code, name} in assetTypes"-->
<!--                  class="select-option-selected"-->
<!--                  :label="name"-->
<!--                  :value="code"-->
<!--                  :key="code"/>-->
<!--              </el-select>-->
<!--            </el-form-item>-->
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="关联款项" prop="selected">
            <div style="text-align: center">
              <el-transfer
                style="text-align: left; display: inline-block"
                :titles="['全选', '全选']"
                :props="{key: 'subjectCode', label: 'subjectName'}"
                v-model="selected"
                :data="subjectNames"
              >
              </el-transfer>
            </div>
            </el-form-item>
          </el-col>
        </el-row>
        <div class="clearfix" style="margin-top: 20px">
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px">取消</el-button>
          <el-button type="primary" @click="submit" class="fr">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>

import { ASSET_TYPEs, BUDGET_TYPEs } from '../../../components/const'
import * as utils from '../../../utils'
import { cloneDeep } from 'lodash-es'
import { addBudgetSubject } from '../../../http/budget_subject_setting'

export default {
  name: 'BudgetSubjectCreate',
  components: {},
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
  },
  data () {
    return {
      form: {
        finSubjectReqList: []
      },
      selected: [],
      loading: false,
      rules: {
        budgetSubjectName: [
          {required: true, message: '请输入预算科目名称', trigger: 'blur'},
        ],
        budgetSubjectCode: [
          {required: true, message: '请输入预算科目编码', trigger: 'blur'},
        ],
        budgetType: [
          {required: true, message: '请选择预算类型', trigger: 'blur'},
        ],
        assetLayout: [
          // {required: true, message: '请选择业态类型', trigger: 'blur'},
        ],
        selected: [
          {required: true, validator: this.validateSelected.bind(this)},
        ],
      }
    }
  },
  computed: {
    subjectNames () {
      return this.$store.state.subjectNames
    },
    merchant () {
      return this.$store.state.merchant
    },
  },
  watch: {

  },
  created () {
    this.assetTypes = ASSET_TYPEs
    this.budgetTypes = BUDGET_TYPEs
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = {assetId: undefined, subjectId: undefined, companyId: undefined, taxRate: 0}
      this.$emit('close', fresh)
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { form } = this
        if (valid) {
          form.finSubjectReqList = cloneDeep(
            this.subjectNames.filter(res => {
              return this.selected.includes(res.subjectCode)
            })
          )
          form.finSubjectReqList.forEach(res => {
            res.id = null
            res.finSubjectCode = res.subjectCode
            res.finSubjectName = res.subjectName
          })
          form.mainId = this.merchant.id
          this.loading = true
          addBudgetSubject(form).then(res => {
            if (res.code === '0') {
              this.$message.success(res.msg)
              this.close(1)
            } else {
              this.loading = false
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    validateSelected (rule, value, callback) {
      if (this.selected.length === 0) {
        callback(new Error('请选择关联款项'))
      }
      callback()
    }
  },
  filters: {
    dateFormat: function (value, template) {
      return utils.format(value, template)
    }
  },
  activated () {
    this.$store.dispatch('setSubjectNames', {mainId: this.merchant.id})
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
    min-width: 800px;
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
<style>
#budgetSubjectSettings-create .el-dialog{
  width: 960px;
}
#budgetSubjectSettings-create .el-button--primary.is-disabled{
  background-color: #fff !important;
  border-color: #DCDFE6 !important;
}
#budgetSubjectSettings-create .el-transfer__button i{
  color: #DCDFE6 !important;
}
#budgetSubjectSettings-create .el-transfer-panel{
  width: 304px;
}
</style>

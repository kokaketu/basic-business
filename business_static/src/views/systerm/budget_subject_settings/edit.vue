<template>
  <el-dialog id="budgetSubjectSettings-edit" :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">编辑预算科目</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算科目名称" prop="budgetSubjectName">
              <el-input v-model="form.budgetSubjectName" placeholder="请输入预算科目名称" disabled></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="预算科目编码" prop="budgetSubjectCode">
              <el-input v-model="form.budgetSubjectCode" placeholder="请输入预算科目编码" disabled></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算类型" prop="budgetType" >
              <el-select v-model="form.budgetType" class="select-width-100" disabled>
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
<!--          </el-col>-->
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="关联款项" prop="selected">
              <div style="text-align: center">
                <el-transfer
                  style="text-align: left; display: inline-block"
                  :titles="['待选款项', '已选款项']"
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

import { ASSET_TYPEs, BUDGET_TYPEs } from '@/components/const'
import * as utils from '@/utils'
import { cloneDeep } from 'lodash-es'
import { updateBudgetSubject } from '@/http/budget_subject_setting'

export default {
  name: 'BudgetSubjectEdit',
  components: {},
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    data: {}
  },
  data () {
    return {
      form: {
        budgetSubjectName: '',
        budgetSubjectCode: '',
        budgetType: void 0,
        assetLayout: void 0,
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
    visible: {
      handler: function (val) {
        if (val) {
          for (let key in this.data) {
            this.form[key] = this.data[key]
          }
          this.selected = this.data.finSubjectReqList.map(res => res.finSubjectCode)
        }
      }
    }
  },
  created () {
    this.assetTypes = ASSET_TYPEs
    this.budgetTypes = BUDGET_TYPEs
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.$emit('close', fresh)
    },
    submit () {
      this.$refs.form.validate((valid) => {
        const { form } = this
        if (valid) {
          let oldFinSubjectReqList = cloneDeep(form.finSubjectReqList)
          form.finSubjectReqList = cloneDeep(
            this.subjectNames.filter(res => {
              return this.selected.includes(res.subjectCode)
            })
          )
          form.finSubjectReqList.forEach(item => {
            item.finSubjectCode = item.subjectCode
            item.finSubjectName = item.subjectName
            item.id = (oldFinSubjectReqList.find(old => item.subjectCode === old.finSubjectCode) || {}).id
          })
          form.mainId = this.merchant.id

          this.loading = true
          updateBudgetSubject(form).then(res => {
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
#budgetSubjectSettings-edit .el-dialog{
  width: 960px;
}
#budgetSubjectSettings-edit .el-button--primary.is-disabled{
  background-color: #fff !important;
  border-color: #DCDFE6 !important;
}
#budgetSubjectSettings-edit .el-transfer__button i{
  color: #DCDFE6 !important;
}
#budgetSubjectSettings-edit .el-transfer-panel{
  width: 304px;
}
</style>

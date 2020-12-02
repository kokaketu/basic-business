<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">预算科目详情</span>
      </div>
      <el-form :model="form" ref="form" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算科目名称" prop="budgetSubjectName">
              {{form.budgetSubjectName}}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="预算科目编码" prop="budgetSubjectCode">
              {{form.budgetSubjectCode}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="预算类型" prop="budgetType" >
              {{(budgetTypes.find(res => res.code === form.budgetType) || {}).name}}
            </el-form-item>
          </el-col>
<!--          <el-col :span="12">-->
<!--            <el-form-item label="业态类型" prop="assetLayout">-->
<!--              {{(assetTypes.find(res => res.code === form.assetLayout) || {}).name}}-->
<!--            </el-form-item>-->
<!--          </el-col>-->
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="关联款项" prop="selected">
              {{selected}}
            </el-form-item>
          </el-col>
        </el-row>
        <div class="clearfix" style="margin-top: 20px">
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 10px">取消</el-button>
          <el-button type="default" @click="del" class="fr">删除</el-button>
          <el-button type="primary" @click="edit" class="fr">编辑</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>

import { ASSET_TYPEs, BUDGET_TYPEs } from '@/components/const'
import * as utils from '@/utils'
import { deleteBudgetSubject } from '@/http/budget_subject_setting'

export default {
  name: 'BudgetSubjectDetail',
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
        finSubjectReqList: []
      },
      selected: void 0,
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
          this.selected = this.data.finSubjectReqList.map(res => res.finSubjectName).join('; ')
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
    edit () {
      this.$emit('edit')
    },
    del () {
      this.$confirm('将删除该预算科目，是否继续？', '删除确认', {type: 'warning'}).then(() => {
        deleteBudgetSubject({id: this.form.id}).then(res => {
          if (res.code === '0') {
            this.$message.success('操作成功')
            this.close(true)
          }
        })
      }).catch(() => {})
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

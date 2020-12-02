<!--应收明细-->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">应收明细</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-row>
          <el-col>
            <el-form-item label="应收流水号">
              {{form.receivableNo}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目名称" >
              {{(projectNameList.find(res => res.id === form.assetId) || {} ).assetName}}
            </el-form-item>
            <el-form-item label="应收日期">
              {{form.receivableDate}}
            </el-form-item>
            <el-form-item label="含税金额(元)">
              {{form.receivableMoney}}
            </el-form-item>
            <el-form-item label="不含税金额(元)">
              {{ noTaxMoney }}
            </el-form-item>
            <el-form-item label="合同编号">
              {{form.contNo}}
            </el-form-item>
            <el-form-item label="应收帐期">
              {{form.accountDateStart}}~{{form.accountDateEnd}}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="assetLayout == 3" label="所属分期">
              {{form.stagesName || '-'}}
            </el-form-item>
            <div v-else style="width: 336px;height: 60px;"></div>
            <el-form-item label="款项名称">
              {{(subjectNames.find(res => res.subjectCode === form.subjectCode) || {} ).subjectName}}
            </el-form-item>
            <el-form-item label="税率(%)">
              {{form.taxRate}}
            </el-form-item>
            <el-form-item label="税额(元)">
              {{ taxMoney }}
            </el-form-item>
            <el-form-item label="付款方">
              {{form.companyName}}
            </el-form-item>
            <el-form-item label="备注">
              {{form.remark}}
            </el-form-item>
          </el-col>
        </el-row>
        <el-table :data="receivableRightList" class="update-table">
          <el-table-column label="款项名称" prop="subjectName">
            <template slot-scope="scope">
              {{(subjectNames.find(res => res.subjectCode === scope.row.subjectCode) || {} ).subjectName}}
            </template>
          </el-table-column>
          <el-table-column label="权责月份" >
            <template slot-scope="scope">
              <span>{{ scope.row.rightDate | FormatDateByType('yyyy-MM') }}</span>
            </template>
          </el-table-column>
          <el-table-column label="金额(元)" prop="receivableMoney"/>
          <el-table-column label="备注" prop="remark"/>
        </el-table>
        <div class="clearfix" style="margin-top: 20px">
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建人：{{form.createdName}}</el-button>
          <el-button v-if="form.id" type="text" style="cursor: auto; color: #606266">创建时间：{{form.createdDate | dateFormat('YYYY-MM-DD HH:mm:ss')}}</el-button>
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px">取消</el-button>
          <el-button :disabled="permission" type="primary" @click="edit" class="fr" v-show="form.receivableStatus === '1'">编辑</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import {getReceivable, } from '@/http/financial'
import { mapState } from 'vuex'
import * as utils from '@/utils'

export default {
  name: 'ReceivableDetail',
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
      contracts: [],
      form: {},
      receivableRightList: [],
      rules: {}
    }
  },
  computed: {
    // 税额
    ...mapState(['permissionList']),
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
    }

  },
  watch: {
    visible (val, oldVal) {
      if (val) {
        getReceivable(this.id).then((res) => {
          const { receivableRightList, ...form } = res
          this.receivableRightList = receivableRightList || []
          this.form = form
          this.assetLayout = this.projectNameList.filter(item =>
            Number(item.id) === Number(this.form.assetId)
          )[0].assetLayout
          if (!this.form.taxRate) {
            this.form.taxRate = 0
          }
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
    edit () {
      this.$emit('edit', this.form.id)
    }
  },
  filters: {
    dateFormat: function (value, template) {
      return utils.format(value, template)
    }
  },
  mounted () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
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

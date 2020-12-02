<template>
  <div id="project-detail" class="drawer-wrapper">
    <div class="header">
      <i class="el-icon-close" @click="close"></i>
      <p>编辑款项</p>
    </div>
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="filter-wrapper clearfix">
        <el-form
          :inline="true"
          :model="baseInfo"
          :rules="baseInfoRules"
          ref="baseInfo"
          size="small"
          label-width="100px">
          <el-form-item label="款项编码：" required prop="subjectCode">
            <el-input v-model="baseInfo.subjectCode" placeholder="请输入款项编码"></el-input>
          </el-form-item>
          <el-form-item label="款项类别：" required prop="subjectType">
            <el-select
              v-model="baseInfo.subjectType"
              placeholder="请选择款项类别">
              <el-option
                v-for="item in subjectType"
                class='select-option-selected'
                :key="item.code"
                :label="item.name"
                :value="item.code">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="款项名称：" required prop="subjectName">
            <el-input v-model="baseInfo.subjectName" placeholder="请输入款项名称"></el-input>
          </el-form-item>
          <el-form-item label="税率(%)：" required prop="taxRate">
            <el-input type="number" v-model="baseInfo.taxRate" placeholder="请输入税率">
            </el-input>
          </el-form-item>
          <el-form-item label="描述">
            <el-input
              type="textarea"
              :autosize="{ minRows: 2, maxRows: 4}"
              v-model="baseInfo.subjectDescription">
            </el-input>
          </el-form-item>
        </el-form>
      </div>
      <div class="btn-group">
        <el-button class="btn btn-default" @click.native="cancel">取消</el-button>
        <el-button class="btn" @click.native="save">保存</el-button>
      </div>
    </div>
  </div>
</template>
<script>
import { getSubjectById, updSubject } from '@/http/systerm'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      baseInfo: {
        id: '',
        subjectCode: '',
        subjectType: '',
        subjectName: '',
        taxRate: '',
        subjectDescription: ''
      },
      baseInfoRules: {
        subjectCode: [
          { required: true, message: '请输入款项编码', trigger: 'blur' },
          { required: true, message: '请输入款项编码', trigger: 'change' }
        ],
        subjectType: [
          { required: true, message: '请选择款项类别', trigger: 'blur' },
          { required: true, message: '请选择款项类别', trigger: 'change' }
        ],
        subjectName: [
          { required: true, message: '请输入款项名称', trigger: 'blur' },
          { required: true, message: '请输入款项名称', trigger: 'change' }
        ],
        taxRate: [
          { required: true, message: '请选择税率', trigger: 'blur' },
          { required: true, message: '请选择税率', trigger: 'change' }
        ]
      },
      subjectType: [
        {code: '1', name: '收入'},
        {code: '2', name: '支出'},
        {code: '3', name: '保证金'}]
    }
  },
  computed: mapState(['merchant']),
  methods: {
    getDetail (id) {
      getSubjectById({id: id}).then(res => {
        let data = res.data
        this.baseInfo.id = data.id
        this.baseInfo.subjectCode = data.subjectCode
        this.baseInfo.subjectType = data.subjectType
        this.baseInfo.subjectName = data.subjectName
        this.baseInfo.taxRate = data.taxRate
        this.baseInfo.subjectDescription = data.subjectDescription
      })
    },
    save () {
      let params = {
        mainId: this.merchant.id,
        id: this.baseInfo.id,
        subjectType: this.baseInfo.subjectType,
        subjectCode: this.baseInfo.subjectCode,
        subjectName: this.baseInfo.subjectName,
        taxRate: this.baseInfo.taxRate,
        subjectDescription: this.baseInfo.subjectDescription,
      }
      const checkKey = ['subjectType', 'subjectCode', 'subjectName', 'taxRate']
      const baseInfoArr = []
      checkKey.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.filter(item => item).length === 0
      if (!baseInfoBool) return false
      updSubject(params).then(res => {
        if (res.code === '0') {
          this.$message({
            message: res.msg,
            type: 'success'
          })
          setTimeout(() => {
            this.$parent.$parent.getList()
            this.$parent.drawerCreateStatus = false
            this.$parent.handleClose()
          }, 1000)
        }
      })
    },
    cancel () {
      this.$parent.$parent.drawerEditStatus = !this.$parent.$parent.drawerEditStatus
    },
    close () {
      this.$parent.handleClose()
    }
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
.filter-wrapper{
  box-shadow: none;
}
.drawer-wrapper{
  position: absolute;
  right: 0;
  top: 0;
  width: 100%;
  background: #fff;
  .header {
    position: relative;
    height: 50px;
    line-height: 50px;
    text-align: center;
    color: #fff;
    background: #141414;
    .el-icon-close{
      position: absolute;
      left: 25px;
      top: 17px;
    }
  }
  .block-title{
    height: 44px;
    line-height: 44px;
    padding: 0 25px;
    background:rgba(246,246,246,1)
  }
  .btn-group{
    float: right;
    padding: 20px;
  }
}
</style>
<style>
.input-unit .el-input__inner{
  padding-right: 30px;
}
.el-input-group__append{
  position: absolute;
  z-index: 999;
  top: 0;
  right: 0px;
  bottom: 0;
  width: 42px;
  padding: 0;
  line-height: 30px;
  text-align: center;
  background: none;
  border: none;
  color: #333;
  cursor: pointer;
}
.el-input.is-disabled .el-input__inner, .el-textarea.is-disabled .el-textarea__inner{
  cursor: inherit;
  background:rgba(247,247,247,1);
  border-color: rgba(203,203,203,1);
  color: #333;
}
#payment-settings .el-form-item__label {
    display: inline-block;
    height: 32px;
    line-height: 32px !important;
    text-align: right;
  }
</style>

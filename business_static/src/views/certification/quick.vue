<!--
 * @Author: your name
 * @Date: 2020-07-14 19:34:41
 * @LastEditTime: 2020-08-18 15:52:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\certification\quick.vue
-->
<template>
  <div>
    <div id="quick" class="clearfix page">
      <div class="content-wrapper">
        <el-col :span="12">
          <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="组织名称" prop="enterpriseName" required>
              <el-input v-model="ruleForm.enterpriseName"></el-input>
            </el-form-item>
            <el-form-item label="合同主体" prop="contactName" required>
              <el-input v-model="ruleForm.contactName"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitForm('ruleForm')">提交审核</el-button>
              <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </div>
    </div>
  </div>
</template>

<script>
import { personal2biz } from '@/http/certification'
import { memberMerchantList } from '@/http/authority'
export default {
  data () {
    return {
      ruleForm: {
        enterpriseName: '',
        contactName: ''
      },
      rules: {
        enterpriseName: [
          {required: true, message: '请输入组织名称', trigger: 'blur'},
          {min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur'}
        ],
        contactName: [
          {required: true, message: '请输入合同主体', trigger: 'blur'},
          {min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          personal2biz(this.buildParams(this.ruleForm)).then(res => {
            this.$router.push('/certification/processing')
          })
          // alert('submit!')
        } else {
          // console.log('error submit!!')
          return false
        }
      })
    },
    memberMerchantList() {
      let {memberId, mobile} = JSON.parse(sessionStorage.getItem('userInfo'))
      memberMerchantList({memberId, mobile}).then(res => {
        sessionStorage.setItem('merchant' + memberId, JSON.stringify(res.data[0]))
        this.$store.dispatch('setMerchant', res.data[0])
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    },
    buildParams (originParams) {
      let enterprise = {}
      enterprise.name = originParams.enterpriseName
      enterprise.contactName = originParams.contactName
      enterprise.bizLicenseNum = '000000000000000000'
      let newParams = {}
      newParams['enterprise'] = enterprise
      newParams['memberId'] = this.$store.getters.userInfo.memberId
      return newParams
    }
  },
  // beforeRouteEnter (to, from, next) { // 防止审核中与审核失败的进入到提交资料页面
  //   memberMerchantList({
  //     memberId: store.getters.userInfo.memberId,
  //     mobile: store.getters.userInfo.mobile
  //   }).then(res => {
  //     for (let i = 0; i < res.data.length; i++) {
  //       if (res.data[i].type === 1) {
  //         const personalMerchant = res.data[i]
  //         if (personalMerchant.verifyStatus === null && personalMerchant.uniqueNO) {
  //           next('/certification/processing')
  //         } else if (personalMerchant.verifyStatus === true) {
  //           next('/certification/success')
  //         } else if (personalMerchant.verifyStatus === false) {
  //           next('/certification/failure')
  //         }
  //       }
  //     }
  //     next()
  //   })
  // }
}
</script>
<style lang="scss" scoped>
@import './certification';
</style>

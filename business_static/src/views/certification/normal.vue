<template>
  <div>
    <div id="normal" class="clearfix page">
      <div class="content-wrapper">
        <el-col :span="12">
          <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="150px" class="demo-ruleForm">
            <el-form-item label="组织名称" prop="enterpriseName" required>
              <el-input v-model="ruleForm.enterpriseName"></el-input>
            </el-form-item>
            <el-form-item label="营业执照副本" prop="bizLicenseUrl" required>
              <el-upload
                class="avatar-uploader"
                action=""
                :show-file-list="false"
                :auto-upload="false"
                :before-upload="beforeAvatarUpload"
                :on-change="fileChange">
                <img style="width: 100px; height: 100px"
                  v-if="ruleForm.bizLicenseUrl"
                  :src="ruleForm.bizLicenseUrl"
                  class="avatar" alt="">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
            <el-form-item label="企业名称" prop="companyName" required>
              <el-input v-model="ruleForm.companyName"></el-input>
            </el-form-item>
            <el-form-item label="统一社会信用代码" prop="bizLicenseNum" required>
              <el-input v-model="ruleForm.bizLicenseNum"></el-input>
            </el-form-item>
            <el-form-item label="住所" prop="enterpriseAddress" required>
              <el-input v-model="ruleForm.enterpriseAddress"></el-input>
            </el-form-item>
            <el-form-item label="证件有效期" required>
              <el-col :span="9">
                <el-form-item prop="beginDate">
                  <el-date-picker
                    v-model="ruleForm.beginDate"
                    type="date"
                    placeholder="开始时间"
                    format="yyyy-MM-dd"
                    value-format="yyyy-MM-dd">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="2" style="text-align: center;">~</el-col>
              <el-col :span="9">
                <el-form-item prop="endDate">
                  <el-date-picker
                    v-model="ruleForm.endDate"
                    type="date"
                    placeholder="结束时间"
                    format="yyyy-MM-dd"
                    value-format="yyyy-MM-dd"
                    :disabled="endDateDisable">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="4" style="padding-left: 20px;">
                <el-form-item prop="permanent">
                  <el-checkbox v-model="ruleForm.permanent">永久有效</el-checkbox>
                </el-form-item>
              </el-col>
            </el-form-item>
            <el-form-item label="法人姓名" prop="legalPersonRealName" required>
              <el-input v-model="ruleForm.legalPersonRealName"></el-input>
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
import { personal2biz, getImageInfo } from '@/http/certification'
import { memberMerchantList } from '@/http/authority'
import { http } from '@/http/index'
// import store from '@/vuex'

export default {
  data () {
    const endDateValidator = (rule, value, callback) => {
      if (!this.beginDate) {
        this.ruleForm.beginDate = null
        this.ruleForm.endDate = null
        return callback(new Error('请选择开始时间'))
      }
      if (!this.endDateDisable && !value) {
        return callback(new Error('请选择结束时间'))
      }
      if (this.ruleForm && this.ruleForm.beginDate && this.ruleForm.endDate) {
        const beginDate = new Date(this.ruleForm.beginDate)
        const endDate = new Date(this.ruleForm.endDate)
        if (endDate.getTime() - beginDate.getTime() < 0) {
          return callback(new Error('结束时间不能小于开始时间'))
        }
      }
    }
    return {
      ruleForm: {
        companyName: '',
        bizLicenseUrl: '',
        enterpriseName: '',
        bizLicenseNum: '',
        enterpriseAddress: '',
        beginDate: '',
        endDate: '',
        permanent: false,
        legalPersonRealName: '',
      },
      rules: {
        bizLicenseUrl: [
          {required: true, message: '请上传营业执照', trigger: 'blur'},
        ],
        enterpriseName: [
          {required: true, message: '请输入组织名称', trigger: 'blur'},
          {min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur'}
        ],
        companyName: [
          {required: true, message: '请输入企业名称', trigger: 'blur'},
          {min: 3, max: 30, message: '长度在 3 到 30 个字符', trigger: 'blur'}
        ],
        bizLicenseNum: [
          {required: true, message: '请输入统一社会信用代码', trigger: 'blur'},
          {min: 18, max: 18, message: '18位，支持数字和字母', trigger: 'blur'}
        ],
        enterpriseAddress: [
          {required: true, message: '请输入住所', trigger: 'blur'},
          {min: 3, max: 50, message: '长度在 3 到 50 个字符', trigger: 'blur'}
        ],
        beginDate: [
          {
            type: 'string',
            required: true,
            message: '请选择开始日期',
            trigger: 'change'
          }
        ],
        endDate: [
          {
            validator: endDateValidator,
            trigger: 'change'
          }
        ],
        legalPersonRealName: [
          {required: true, message: '请选输入法人姓名', trigger: 'blur'},
          {min: 2, max: 8, message: '长度在 2 到 8 个字符', trigger: 'blur'}
        ]
      }
    }
  },
  created () {
  },
  computed: {
    // 计算属性的 getter
    endDateDisable (vm) {
      // `this` 指向 vm 实例
      const flag = vm.ruleForm.permanent
      if (flag) {
        vm.$refs['ruleForm'].clearValidate(['endDate'])
        vm.ruleForm.endDate = null
      }
      return flag
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
    memberMerchantList () {
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
      enterprise.bizLicenseUrl = originParams.bizLicenseUrl
      enterprise.name = originParams.enterpriseName
      enterprise.companyName = originParams.companyName
      enterprise.bizLicenseNum = originParams.bizLicenseNum
      enterprise.address = originParams.enterpriseAddress
      enterprise.beginDate = originParams.beginDate
      enterprise.endDate = originParams.endDate
      enterprise.legalPersonRealName = originParams.legalPersonRealName
      enterprise.contactName = originParams.legalPersonRealName
      let newParams = {}
      newParams['enterprise'] = enterprise
      newParams['memberId'] = this.$store.getters.userInfo.memberId
      return newParams
    },
    fileChange (file) {
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post('/asset-fileservice-web/filesystem/upload', data).then(res => {
        if (res.code === '0') {
          this.ruleForm.bizLicenseUrl = res.data
          this.getImageInfo(res.data)
        }
      })
    },
    getImageInfo (url) {
      let params = {
        type: 3,
        bizLicenseImageUrl: url
      }
      getImageInfo(params).then(res => {
        if (res.code === '0') {
          let result = res.data.enterprise.bizLicense
          this.ruleForm.companyName = result.bizLicenseCompanyName
          this.ruleForm.bizLicenseNum = result.bizLicenseCreditCode
          this.ruleForm.enterpriseAddress = result.bizLicenseAddress
          this.ruleForm.beginDate = result.bizLicenseStartTime.replace('年', '-').replace('月', '-').replace('日', '')
          this.ruleForm.legalPersonRealName = result.bizLicenseOwnerName
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    beforeAvatarUpload (file) {
      const isJPG = file.type === 'image/jpeg'
      const isLt500K = file.size / 1024 / 500

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!')
      }
      if (!isLt500K) {
        this.$message.error('上传头像图片大小不能超过 500KB!')
      }
      return isJPG && isLt500K
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
<style>
#normal .el-date-editor.el-input, .el-date-editor.el-input__inner{
  width: 100%;
}
#normal .avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  }
#normal .avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
#normal .avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  line-height: 100px;
  text-align: center;
}
#normal .avatar {
  width: 100px;
  height: 100px;
  display: block;
}
</style>

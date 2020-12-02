<!--
 * @Author: your name
 * @Date: 2020-06-19 11:07:18
 * @LastEditTime: 2020-09-04 09:34:57
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\tenant\create.vue
-->
<template>
  <div id="tenant-create">
    <!-- 基本信息 -->
    <div class="wrapper base-info">
      <div class="wrapper-title">基本信息</div>
      <div class="block">
        <el-form
          :inline="true"
          :model="baseInfo"
          :rules="baseInfoRules"
          ref="baseInfo"
          size="small"
          label-width="80px">
          <!-- <el-form-item label="租户编号" required prop="companyCode">
            <el-input v-model="baseInfo.companyCode" placeholder="请输入租户编号"></el-input>
          </el-form-item> -->
          <el-form-item label="租户全称" required prop="companyName">
            <el-input v-model="baseInfo.companyName" placeholder="请输入租户全称"></el-input>
          </el-form-item>
          <el-form-item label="租户简称" required  prop="companyShortName">
            <el-input v-model="baseInfo.companyShortName" placeholder="请输入租户简称"></el-input>
          </el-form-item>
          <el-form-item label="所属项目" required prop="assetId">
            <el-select disabled
              v-model="baseInfo.assetId"
              placeholder="请选择项目名称">
              <el-option
                v-for="item in projectNameList"
                class='select-option-selected'
                :key="item.id"
                :label="item.assetName"
                :value="item.id">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="所在区域">
            <city-select @upDateCity="upDateCityFn" :selectedCity="selectedCity"></city-select>
          </el-form-item>
          <el-form-item label="详细地址">
            <el-input v-model="baseInfo.companyAddress" placeholder="请输入详细地址"></el-input>
          </el-form-item>
          <el-form-item label="租户分类">
            <el-select
              disabled
              v-model="baseInfo.companySort"
              placeholder="请选择项目名称">
              <el-option
                v-for="item in companySort"
                class='select-option-selected'
                :key="item.code"
                :label="item.name"
                :value="item.code">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="租户类型" required prop="companyType">
            <el-select
              v-model="baseInfo.companyType"
              placeholder="请选择租户分类">
              <el-option
                v-for="item in companyType"
                class='select-option-selected'
                :key="item.code"
                :label="item.name"
                :value="item.code">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="经营类型" required v-show="baseInfo.companySort == 2" prop="operatingType">
            <el-select
              v-model="baseInfo.operatingType"
              placeholder="请选择经营类型">
              <el-option
                v-for="item in operatingType"
                class='select-option-selected'
                :key="item.code"
                :label="item.name"
                :value="item.code">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="行业" required v-show="baseInfo.companySort == 1 || baseInfo.companySort == 3" prop="companyIndustry">
            <el-select
              v-model="baseInfo.companyIndustry"
              placeholder="请选择行业">
              <el-option
                v-for="item in companyIndustry"
                class='select-option-selected'
                :key="item.code"
                :label="item.name"
                :value="item.code">
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <!-- 法人信息 -->
    <div class="wrapper corporate-info">
      <div class="wrapper-title">法人信息</div>
      <div class="block">
        <el-form :inline="true" ref="legalPerson" :model="companyInfo" size="small" label-width="90px">
          <el-form-item
            label="企业法人"
            prop="legalPerson"
            required
            :rules="[
              { required: true, message: '请输入企业法人姓名', trigger: 'blur' },
              { required: true, message: '请输入企业法人姓名', trigger: 'change' }
            ]"
          >
            <el-input v-model="companyInfo.legalPerson" placeholder="请输入企业法人姓名"></el-input>
          </el-form-item>
          <el-form-item label="法人身份证号" label-width="100px">
            <el-input v-model="companyInfo.identifyCard" placeholder="请输入法人身份证号"></el-input>
          </el-form-item>
          <br/>
          <el-form-item label="身份证图片">
            <p style="font-size: 13px;color: #666;">(请上传jpg,png...格式，建议不大于5M的图片)</p>
            <el-upload
              action="''"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview1"
              :on-remove="handleRemove1"
              :auto-upload="false"
              :on-change="fileChange1"
              :file-list="identifyAttachmentList">
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible1">
              <img width="100%" :src="dialogImageUrl1" alt="">
            </el-dialog>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <!-- 公司信息 -->
    <div class="wrapper company-info">
      <div class="wrapper-title">公司信息</div>
      <div class="block">
        <el-form :inline="true" ref="companyPhone" :model="companyInfo" size="small" label-width="100px">
          <el-form-item
            label="公司电话"
            prop="companyPhone"
            required
            :rules="[
              { required: true, message: '请输入公司电话', trigger: 'blur' },
              { required: true, message: '请输入公司电话', trigger: 'change' }
            ]"
          >
            <el-input v-model="companyInfo.companyPhone" placeholder="请输入公司电话"></el-input>
          </el-form-item>
          <el-form-item label="统一社会信用代码" label-width="130px">
            <el-input v-model="companyInfo.socialCreditCode" placeholder="请输入统一社会信用代码"></el-input>
          </el-form-item>
          <br/>
          <el-form-item label="备注">
            <el-input
              type="textarea"
              :autosize="{ minRows: 5, maxRows: 5}"
              v-model="companyInfo.remark">
            </el-input>
          </el-form-item>
          <br/>
          <el-form-item label="营业执照图片">
            <p style="font-size: 13px;color: #666;">(请上传jpg,png...格式，建议不大于5M的图片)</p>
            <el-upload
              action="''"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview2"
              :on-remove="handleRemove2"
              :auto-upload="false"
              :on-change="fileChange2"
              :file-list="licenseAttachmentList">
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible2">
              <img width="100%" :src="dialogImageUrl2" alt="">
            </el-dialog>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <!-- 品牌信息 -->
    <div class="wrapper brand-info" v-show="baseInfo.companySort == '2'">
      <div class="wrapper-title">品牌信息</div>
      <div class="block table-input">
        <el-table
          :data="brandList"
          border
          style="width: 1000px;">
           <el-table-column>
            <template  slot="header">
              <span style="color: #F56C6C">*</span>
              品牌名称(中)
            </template>
            <template slot-scope="scope">
              <el-input v-model="scope.row.brandName" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
           <el-table-column
            prop="brandEnglishName"
            label="品牌名称(英)">
            <template slot-scope="scope">
              <el-input v-model="scope.row.brandEnglishName" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column>
            <template  slot="header">
              <span style="color: #F56C6C">*</span>
              品牌业态
            </template>
            <template slot-scope="scope">
              <el-select
                v-model="scope.row.firstLayout"
                placeholder="请选择">
                <el-option
                  v-for="item in brandLayout"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
            prop="brandLevel"
            label="品牌级次">
            <template slot-scope="scope">
              <el-select
                v-model="scope.row.brandLevel"
                placeholder="请选择">
                <el-option
                  v-for="item in brandLevel"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
            width="60"
            label="操作">
            <template slot-scope="scope">
              <el-button @click.native="addRow('brandList')" v-show="scope.$index == 0" type="text">增加</el-button>
              <el-button @click.native="removeRow('brandList', scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
    <!-- 联系人信息 -->
    <div class="wrapper contact-info">
      <div class="wrapper-title">联系人信息</div>
      <div class="block table-input">
        <el-table
          :data="contactList"
          border
          style="width: 1000px;">
          <el-table-column>
            <template  slot="header">
              <span style="color: #F56C6C">*</span>
              姓名
            </template>
            <template slot-scope="scope">
              <el-input v-model="scope.row.contactName" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column>
            <template  slot="header">
              <span style="color: #F56C6C">*</span>
              职务
            </template>
            <template slot-scope="scope">
              <el-input v-model="scope.row.contactPosition" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column>
            <template  slot="header">
              <span style="color: #F56C6C">*</span>
              手机号
            </template>
            <template slot-scope="scope">
              <el-input v-model="scope.row.contactPhone" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            prop="contactMail"
            label="邮箱">
            <template slot-scope="scope">
              <el-input v-model="scope.row.contactMail" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            prop="contactAddress"
            label="通讯地址">
            <template slot-scope="scope">
              <el-input v-model="scope.row.contactAddress" placeholder="请输入"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            width="60"
            label="操作">
            <template slot-scope="scope">
              <el-button @click.native="addRow('contactList')" v-show="scope.$index == 0" type="text">增加</el-button>
              <el-button @click.native="removeRow('contactList', scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="clearfix btn-group">
          <el-button class="btn" @click.native="update">保存</el-button>
          <el-button class="btn btn-default" @click.native="cancel">取消</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { cloneDeep } from 'lodash-es'
import { initCompany, updCompany, getCompany } from '@/http/rentControl'
import { mapState } from 'vuex'
import CitySelect from '@/components/CitySelect'
import { http } from '@/http/index'

export default {
  data () {
    return {
      city: null,
      selectedCity: null,
      baseInfo: {
        companyName: '',
        companyShortName: '',
        assetId: '',
        region: '',
        provinceCode: '',
        provinceName: '',
        cityCode: '',
        cityName: '',
        districtCode: '',
        districtName: '',
        companyAddress: '',
        companySort: '',
        companyType: '',
        operatingType: '',
        operatingLayout: '',
        companyIndustry: ''
      },
      brandLevel: [],
      companySort: [],
      companyType: [],
      operatingType: [],
      brandLayout: [],
      companyIndustry: [],
      baseInfoRules: {
        companyName: [{ required: true, message: '请输入租户全称', trigger: 'blur' }],
        companyShortName: [{ required: true, message: '请输入租户简称', trigger: 'blur' }],
        assetId: [{ required: true, message: '请选择项目名称', trigger: 'change' }],
        companyType: [{ required: true, message: '请选择租户分类', trigger: 'change' }],
        operatingType: [{ required: true, message: '请选择经营类型', trigger: 'change' }],
        companyIndustry: [{ required: true, message: '请选择租户行业', trigger: 'change' }]
      },
      companyInfo: {
        legalPerson: '',
        identifyCard: '',
        companyPhone: '',
        socialCreditCode: '',
        remark: ''
      },
      dialogImageUrl1: '',
      dialogVisible1: false,
      dialogImageUrl2: '',
      dialogVisible2: false,
      brandList: [{
        id: '',
        companyId: '',
        brandName: '',
        brandEnglishName: '',
        firstLayout: '',
        firstLayoutName: '',
        brandLevel: ''
      }],
      contactList: [{
        id: '',
        companyId: '',
        contactName: '',
        contactPosition: '',
        contactPhone: '',
        contactMail: '',
        contactAddress: ''
      }],
      identifyAttachmentList: [],
      licenseAttachmentList: []
    }
  },
  watch: {
    'baseInfo.assetId': {
      handler () {
        let assetId = this.baseInfo.assetId
        let assetLayout = this.projectNameList.filter(item => item.id === assetId)[0].assetLayout
        this.baseInfo.companySort = assetLayout
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    initCompany () {
      initCompany().then(res => {
        this.companySort = res.companySort
        this.companyType = res.companyType
        this.operatingType = res.operatingType
        this.companyIndustry = res.companyIndustry
        this.brandLayout = res.brandLayout
        this.brandLevel = res.brandLevel
      })
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/rentcontrol/tenant')
    },
    upDateCityFn (city) {
      this.city = city
      this.baseInfo.provinceCode = city.provinceCode
      this.baseInfo.provinceName = city.provinceName
      this.baseInfo.cityCode = city.cityCode
      this.baseInfo.cityName = city.cityName
      this.baseInfo.districtCode = city.districtCode
      this.baseInfo.districtName = city.districtName
    },
    handlePictureCardPreview1 (file) {
      this.dialogImageUrl1 = file.url
      this.dialogVisible1 = true
    },
    handleRemove1 (file, identifyAttachmentList) {
      this.identifyAttachmentList = identifyAttachmentList
    },
    fileChange1 (file, identifyAttachmentList) {
      identifyAttachmentList.splice(identifyAttachmentList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('请上传图片')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          this.identifyAttachmentList.push({name: file.name, url: res.data, attachmentName: file.name, attachmentPath: res.data, attachmentType: 1})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    handlePictureCardPreview2 (file) {
      this.dialogImageUrl2 = file.url
      this.dialogVisible2 = true
    },
    handleRemove2 (file, licenseAttachmentList) {
      this.licenseAttachmentList = licenseAttachmentList
    },
    fileChange2 (file, licenseAttachmentList) {
      licenseAttachmentList.splice(licenseAttachmentList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('请上传图片')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          this.licenseAttachmentList.push({name: file.name, url: res.data, attachmentName: file.name, attachmentPath: res.data, attachmentType: 2})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    addRow (obj) {
      let addContent = cloneDeep(this[obj][0])
      for (const key in addContent) {
        if (addContent.hasOwnProperty(key)) {
          addContent[key] = ''
        }
      }
      this[obj].push(addContent)
    },
    removeRow (obj, index) {
      this[obj].splice(index, 1)
    },
    update () {
      const businessBaseInfoKey = ['companyName', 'companyShortName', 'assetId', 'companyType', 'operatingType']
      const officeBaseInfoKey = ['companyName', 'companyShortName', 'assetId', 'companyType', 'companyIndustry']
      const baseInfoKey = (this.baseInfo.companySort === '2') ? businessBaseInfoKey : officeBaseInfoKey
      const baseInfoArr = []
      baseInfoKey.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.filter(item => item).length === 0
      const companyArr = []
      if (Number(this.baseInfo.companyType) === 1) {
        this.$refs.legalPerson.validateField('legalPerson', valid => {
          companyArr.push(valid)
        })
      }
      this.$refs.companyPhone.validateField('companyPhone', valid => {
        companyArr.push(valid)
      })
      const companyBool = companyArr.filter(item => item).length === 0
      if (!baseInfoBool || !companyBool) return false
      if (Number(this.baseInfo.companySort) === 2) {
        const brandListBool = this.brandList.map(({brandName, firstLayout}) => !!brandName && !!firstLayout).filter(item => item === false).length === 0
        if (!brandListBool) {
          this.$message.error('请输入完整的品牌信息')
          return false
        }
        this.brandList.map(item => {
          item.firstLayoutName = this.brandLayout.filter(({code}) => Number(code) === Number(item.firstLayout))[0].name
          return item
        })
      }
      const contactListBool = this.contactList.map(({contactName, contactPosition, contactPhone}) => !!contactName && !!contactPosition && !!contactPhone).filter(item => item === false).length === 0
      if (!contactListBool) {
        this.$message.error('请输入完整的联系人信息')
        return false
      }

      let params = {
        'id': this.$route.params.id,
        'provinceCode': this.baseInfo.provinceCode,
        'provinceName': this.baseInfo.provinceName,
        'cityCode': this.baseInfo.cityCode,
        'cityName': this.baseInfo.cityName,
        'districtCode': this.baseInfo.districtCode,
        'districtName': this.baseInfo.districtName,
        'merchantsPrincipal': '',
        'merchantsPrincipalPhone': '',
        'operatingLayoutName': '',
        'brandList': this.brandList,
        'contactList': this.contactList,
        'identifyAttachmentList': this.identifyAttachmentList,
        'licenseAttachmentList': this.licenseAttachmentList
      }
      for (const key in this.baseInfo) {
        if (this.baseInfo.hasOwnProperty(key)) {
          params[key] = this.baseInfo[key]
        }
      }
      for (const key in this.companyInfo) {
        if (this.companyInfo.hasOwnProperty(key)) {
          params[key] = this.companyInfo[key]
        }
      }
      updCompany(params).then(res => {
        if (res.code === '0') {
          // 删除路由
          this.$destroy()
          this.$store.dispatch('setRouteList', {
            route: this.$route,
            type: 'delete'
          })
          this.$router.push('/rentcontrol/tenant')
        }
      })
    },
    getDetail () {
      const companyId = this.$route.params.id
      getCompany({companyId: companyId}).then(res => {
        this.selectedCity = {
          provinceCode: res.provinceCode,
          cityCode: res.cityCode,
          districtCode: res.districtCode
        }
        this.baseInfo = {
          companyName: res.companyName,
          companyShortName: res.companyShortName,
          assetId: res.assetId,
          operatingType: res.operatingType,
          provinceCode: res.provinceCode,
          provinceName: res.provinceName,
          cityCode: res.cityCode,
          cityName: res.cityName,
          districtCode: res.districtCode,
          districtName: res.districtName,
          companyAddress: res.companyAddress,
          companySort: res.companySort,
          companyType: res.companyType,
          operatingLayout: res.operatingLayout,
          companyIndustry: res.companyIndustry
        }
        this.companyInfo = {
          legalPerson: res.legalPerson,
          identifyCard: res.identifyCard,
          companyPhone: res.companyPhone,
          socialCreditCode: res.socialCreditCode,
          remark: res.remark
        }
        if (res.brandList) {
          this.brandList = res.brandList
        }
        if (res.contactList) {
          this.contactList = res.contactList
        }
        this.identifyAttachmentList = res.identifyAttachmentList.map(item => {
          item.url = item.attachmentPath
          item.name = item.attachmentName
          return item
        })
        this.licenseAttachmentList = res.licenseAttachmentList.map(item => {
          item.url = item.attachmentPath
          item.name = item.attachmentName
          return item
        })
      })
    },
  },
  components: {
    CitySelect
  },
  activated () {
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getDetail()
    this.initCompany()
  }
}
</script>
<style lang="scss" scoped>
#tenant-create{
  margin-bottom: 50px;
  $purple: #5E0EFF;
  .wrapper{
    background: #fff;
    .wrapper-title{
      background:#fbfbfb;
      position: relative;
      height: 44px;
      padding: 0 30px;
      line-height: 44px;
      &::before{
        position: absolute;
        top: 14px;
        left: 20px;
        content: '';
        display: block;
        width:5px;
        height:16px;
        background: $purple;
      }
    }
  }
}
#tenant-create .wrapper .el-input,
#tenant-create .wrapper .el-textarea,
#tenant-create .wrapper .el-select{
  width: 320px;
}
#tenant-create .el-table td{
  padding: 0;
}
#tenant-create .el-table .el-input,
#tenant-create .el-table .el-select{
  width: 100%;
  border: none;
}
.btn-group{
  margin-top: 20px;
}
</style>
<style lang="scss">
#tenant-create .table-input td {
  padding: 0;
  padding: 3px 0;
}
#tenant-create .table-input th {
  height: 46px;
  padding: 0;
  background:rgba(251,251,251,1);
  color: #808080;
}
</style>

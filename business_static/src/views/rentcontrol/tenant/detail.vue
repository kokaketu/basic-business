<!--
 * @Author: your name
 * @Date: 2020-06-18 19:51:05
 * @LastEditTime: 2020-09-04 16:02:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\tenant\detail.vue
-->
<template>
  <div id="tenant-detail">
    <div class="wrapper base-info">
      <!-- 顶部按钮 -->
      <div class="createInfo">
        <div class="headLeft">创建人：{{detail.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(new Date(detail.createdDate))}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" style="margin-right: 0px;" @click.native="edit">编辑</el-button>
          <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del">删除</el-button>
        </div>
      </div>
      <!-- 基本信息 -->
      <div class="wrapper-title">基本信息</div>
      <div class="detailInfo">
        <!-- <KeyValue keytag='租户编号' :valuetag="detail.companyCode" /> -->
        <KeyValue keytag='租户全称' :valuetag="detail.companyName" />
        <KeyValue keytag='租户简称' :valuetag="detail.companyShortName" />
        <KeyValue keytag='所属项目' :valuetag="detail.assetName" />
        <KeyValue keytag='所在区域' :valuetag="region" />
        <KeyValue keytag='详细地址' :valuetag="detail.companyAddress" />
        <KeyValue keytag='租户分类' :valuetag="getArrValue(companySort,detail.companySort)" />
        <KeyValue keytag='租户类型' :valuetag="getArrValue(companyType,detail.companyType)" />
        <KeyValue v-show="detail.companySort == '2'" keytag='经营类型' :valuetag="getArrValue(operatingType,detail.operatingType)" />
        <KeyValue v-show="detail.companySort == '1'" keytag='行业' :valuetag="getArrValue(companyIndustry,detail.companyIndustry)" />
      </div>
    </div>
    <!-- 法人信息 -->
    <div class="wrapper corporate-info">
      <div class="wrapper-title">法人信息</div>
      <div class="detailInfo">
        <KeyValue keytag='企业法人' :valuetag="detail.legalPerson" />
        <KeyValue keytag='法人身份证号' :valuetag="detail.identifyCard" />
        <!-- <div class="state">
          <div class='key-label'>身份证图片</div>
          <div class='value-label'>
            <el-image
            style="width: 100px; height: 100px"
            v-for="(item, index) in detail.identifyAttachmentList"
            :key="index"
            :src="item.attachmentPath"
            fit="fill">
          </el-image>
          </div>
        </div> -->
        <div class="img-wrapper">
          <p>身份证图片</p>
          <div class="img-list">
            <el-image
              v-for="item in detail.identifyAttachmentList" :key="item.id" :src="item.attachmentPath"
              :preview-src-list="identityPreview">
            </el-image>
          </div>
        </div>
      </div>
    </div>
    <!-- 公司信息 -->
    <div class="wrapper company-info">
      <div class="wrapper-title">公司信息</div>
      <div class="detailInfo">
        <KeyValue keytag='公司电话' :valuetag="detail.companyPhone" />
        <KeyValue keytag='统一社会信用代码' :valuetag="detail.socialCreditCode" />
        <!-- <div class="state" >
          <div class='key-label'>营业执照图片</div>
          <div class='value-label'>
            <el-image
              style="width: 100px; height: 100px"
              v-for="(item, index) in detail.licenseAttachmentList"
              :key="index"
              :src="item.attachmentPath"
              fit="fill">
            </el-image>
          </div>
        </div> -->
        <KeyValue keytag='备注' :valuetag="detail.remark" />
        <div class="img-wrapper">
          <p>营业执照图片</p>
          <div class="img-list">
            <el-image
              v-for="item in detail.licenseAttachmentList" :key="item.id" :src="item.attachmentPath"
              :preview-src-list="licensePreview">
            </el-image>
          </div>
        </div>
      </div>
    </div>
    <!-- 品牌信息 -->
    <div class="wrapper brand-info"  v-show="detail.companySort == '2'">
      <div class="wrapper-title">品牌信息</div>
      <div class="block">
        <el-table
          :data="detail.brandList"
          border
          style="width: 1000px;">
          <el-table-column
            prop="brandName"
            label="品牌名称(中)">
          </el-table-column>
          <el-table-column
            prop="brandEnglishName"
            label="品牌名称(英)">
          </el-table-column>
          <el-table-column
            prop="firstLayoutName"
            label="品牌业态">
          </el-table-column>
          <el-table-column
            prop="brandLevel"
            label="品牌级次">
            <template slot-scope="scope">
              {{getArrValue(brandLevel,scope.row.brandLevel)}}
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
    <!-- 联系人信息 -->
    <div class="wrapper contact-info">
      <div class="wrapper-title">联系人信息</div>
      <div class="block">
        <el-table
          :data="detail.contactList"
          border
          style="width: 1000px;">
          <el-table-column
            prop="contactName"
            label="姓名">
          </el-table-column>
          <el-table-column
            prop="contactPosition"
            label="职务">
          </el-table-column>
          <el-table-column
            prop="contactPhone"
            label="手机号">
          </el-table-column>
          <el-table-column
            prop="contactMail"
            label="邮箱">
          </el-table-column>
          <el-table-column
            prop="contactAddress"
            label="通讯地址">
          </el-table-column>
        </el-table>
      </div>
    </div>
    <!-- 历史合同 -->
    <div class="wrapper contact-info">
      <div class="wrapper-title">历史合同</div>
      <div class="block">
        <el-table
          :data="table"
          border
          style="width: 100%;">
          <el-table-column
            prop="assetName"
            label="项目">
          </el-table-column>
          <el-table-column label="合同编号">
            <template slot-scope="scope">
              <el-link @click="forwardToContract(scope.row,0)" :underline="false">
                {{scope.row.contNo}}
              </el-link>
            </template>
          </el-table-column>
          <el-table-column label="租赁单元">
            <template slot-scope="scope">
              <!-- <el-link @click="forwardToContract(scope.row,1)" :underline="false"> -->
                {{scope.row.unitNos}}
              <!-- </el-link> -->
            </template>
          </el-table-column>
          <el-table-column
            prop="contRange"
            label="合同期限">
          </el-table-column>
          <el-table-column
            prop="rentArea"
            label="计租面积(㎡)">
          </el-table-column>
          <el-table-column
            prop="contPriceMonthPerUnit"
            label="平均月单价（元/㎡/月）">
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
</template>
<script>
import {initCompany, getCompany, delCompany} from '@/http/rentControl'
import KeyValue from '../../../components/KeyValue'
import { mapState } from 'vuex'
export default {
  components: {
    KeyValue
  },
  data () {
    return {
      permission: '',
      city: null,
      region: '',
      brandLevel: [],
      companySort: [],
      companyType: [],
      operatingType: [],
      brandLayout: [],
      companyIndustry: [],
      detail: {},
      table: [],
      identityPreview: [],
      licensePreview: []
    }
  },
  computed: mapState(['permissionList']),
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
    getArrValue (arr, type) {
      let res = ''
      arr.map(item => {
        if (Number(item.code) === Number(type)) {
          res = item.name
        }
      })
      return res
    },
    getDetail () {
      const companyId = this.$route.params.id
      getCompany({companyId: companyId}).then(res => {
        this.detail = res
        this.identityPreview = res.identifyAttachmentList.map(item => item.attachmentPath)
        this.licensePreview = res.licenseAttachmentList.map(item => item.attachmentPath)
        this.region = res.provinceName + '/' + res.cityName + '/' + res.districtName
        this.table = res.historicalContractVOS
      })
    },
    forwardToContract (row, type) {
      const assetLayout = row.contSor
      const params = `${assetLayout}&${row.id}`
      this.$router.push(`/contract/detail/${params}`)
    },
    formatDate (e) {
      const year = e.getFullYear()
      const month = e.getMonth() + 1
      const day = e.getDate()
      return year + '-' + month + '-' + day
    },
    edit () {
      const companyId = this.$route.params.id
      this.$router.push('/rentcontrol/tenant/edit/' + companyId)
    },
    del () {
      const companyId = this.$route.params.id
      this.$confirm('是否确认删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '我再想想',
        type: 'warning'
      }).then(() => {
        delCompany({companyId: companyId}).then(res => {
          if (res.code === '0') {
            this.$message({
              type: 'success',
              message: '删除成功!'
            })
            setTimeout(() => {
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/rentcontrol/tenant')
            }, 500)
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getDetail()
    this.initCompany()
  }
}
</script>
<style lang="scss" scoped>
#tenant-detail{
  margin-bottom: 50px;
  $purple: #5E0EFF;
  .btn-group {
    padding: 10px 20px;
    background: #fff;
  }
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
#tenant-detail .wrapper .el-select, #tenant-detail .wrapper .el-input, #tenant-detail .wrapper .el-textarea{
  width: 320px;
}
.img-wrapper {
  width: 100%;
  display: flex;
  justify-content: space-around;
  p {
    width: 14%;
    text-align: right;
    color: #999;
    font-size: 15px;
  }
  .img-list {
    width: 79%;
    margin-top: 20px;
    .el-image {
      width: 100px;
      height: 100px;
      margin: 5px;
    }
  }
}
</style>

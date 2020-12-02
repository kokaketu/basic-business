<template>
  <div id="project-detail">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(new Date(ruleForm.createdDate))}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" @click.native="cochain" style="margin-right: 0">{{chainStatus ? '重新上链' : '上链'}}</el-button>
          <el-button class="btn pull-right" :disabled="permission" @click.native="edit" style="margin-right: 0">编辑</el-button>
          <el-button class="btn btn-default pull-right" :disabled="permission" @click.native="del" style="margin-right: 0">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息<span v-show="chainStatus" class="ebaas-tip">已上链</span></div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'text'+index"
          v-show="item.type == 'text' && item.name.indexOf('面积') == -1 &&  item.name.indexOf('年限') == -1"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'number'+index"
          v-show="item.hasUnit  && item.name.indexOf('面积') == -1 &&  item.name.indexOf('年限') == -1 "
          :keytag='item.name'
          :valuetag="item.value + ' ' +item.unit" />
        <div class="img-wrapper">
          <p>项目封面</p>
          <div class="img-list">
            <!-- <img v-for="item in bsAssetResource" :key="item.id" :src="item.resourceUrl" alt=""> -->
            <el-image
              v-for="item in bsAssetResource" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="srcList">
            </el-image>
          </div>
        </div>
      </div>
      <div class="new-block-title">建筑信息</div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'text'+index"
          v-show="item.type == 'text' && item.name.indexOf('面积') > 0"
          :keytag='item.name' :valuetag="item.value"/>
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'number'+index"
          v-show="item.hasUnit  && item.name.indexOf('面积') > 0"
          :keytag='item.name'
          :valuetag="item.value"
          :unit="item.unit"/>
      </div>
      <div class="new-block-title">产权信息</div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'text'+index"
          v-show="item.type == 'text' &&  item.name.indexOf('年限') > 0"
          :keytag='item.name'
          :valuetag="item.value"/>
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'number'+index"
          v-show="item.hasUnit  && item.name.indexOf('年限') > 0 "
          :keytag='item.name'
          :valuetag="item.value"
          :unit="item.unit"/>
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'date'+index"
          v-show="item.type == 'date' "
          :keytag='item.name'
          :valuetag="item.value"/>
      </div>
    </div>
    <!-- 企业信息 -->
    <div class="corporate-information">
      <div class="new-block-title">企业信息</div>
      <div class="detailInfo">
        <KeyValue
        v-for="(item, index) in developers"
        :key="'developers'+index"
        keytag='开发商'
        :valuetag="item.fieldValue"/>
        <KeyValue v-show="developers.length == 0" keytag='开发商' valuetag="-" />
        <KeyValue
          v-for="(item, index) in designCompany"
          :key="'designCompany'+index"
          keytag='设计公司'
          :valuetag="item.fieldValue"/>
        <KeyValue v-show="designCompany.length == 0" keytag='设计公司' valuetag="-" />
        <KeyValue
          v-for="(item, index) in ownerOfAssets"
          :key="'ownerOfAssets'+index"
          keytag='资产拥有方'
          :valuetag="item.fieldValue"/>
        <KeyValue v-show="ownerOfAssets.length == 0" keytag='资产拥有方' valuetag="-" />
      </div>
    </div>
    <!-- 负责人信息 -->
    <div class="responsible-information">
      <div class="new-block-title">经营公司</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="operatingCompany"
            border
            style="width: 100%;">
            <el-table-column
              prop="fieldValue"
              label="公司名称">
              <template slot-scope="scope">
                <el-input v-model="scope.row.fieldValue" disabled></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
              <template slot-scope="scope">
                <el-input v-model="scope.row.strartDate" disabled></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
              <template slot-scope="scope">
                <el-input v-model="scope.row.endDate" disabled></el-input>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <div class="responsible-information">
      <div class="new-block-title">物管公司</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="propertyCompany"
            border
            style="width: 100%;">
            <el-table-column
              prop="fieldValue"
              label="公司名称">
              <template slot-scope="scope">
                <el-input v-model="scope.row.fieldValue" disabled></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
              <template slot-scope="scope">
                <el-input v-model="scope.row.strartDate" disabled></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
              <template slot-scope="scope">
                <el-input v-model="scope.row.endDate" disabled></el-input>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { queryResultById, assetDelete } from '@/http/assets'
import {businessBaseInfo, officeBaseInfo, parkBaseInfo} from './project'
import KeyValue from '@/components/KeyValue'
import { mapState } from 'vuex'
import { ebaasProcess } from '@/utils/ebass/process'
export default {
  data () {
    return {
      permission: '',
      assetLayout: '', // 1办公、2商业、3园区
      businessBaseInfo: businessBaseInfo,
      officeBaseInfo: officeBaseInfo,
      parkBaseInfo: parkBaseInfo,
      baseInfo: [],
      bsAssetResource: [],
      developers: [],
      designCompany: [],
      ownerOfAssets: [],
      operatingCompany: [],
      propertyCompany: [],
      ruleForm: {},
      chainStatus: false,
      srcList: []
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  components: { KeyValue },
  methods: {
    cochain () {
      let params = {
        merchantId: this.merchant.id,
        id: this.$route.params.id,
        dataType: 'BS_ASSET'
      }
      ebaasProcess.init(params, () => {
        this.chainStatus = true
      })
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/project/edit/' + contractID)
    },
    formatDate (e) {
      const year = e.getFullYear()
      const month = e.getMonth() + 1
      const day = e.getDate()
      return year + '-' + month + '-' + day
    },
    del () {
      const projectId = this.$route.params.id
      this.$confirm('此操作将删除项目, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(
        () => {
          assetDelete({id: projectId, mainId: this.merchant.id}).then(res => {
            if (res.code === '0') {
              this.$message.success(res.msg)
              this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id, isUpdate: true})
              this.$store.dispatch('setProjects', {isUpdate: true})
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/asset/project')
            }
          })
        }
      )
    },
    getDetail () {
      const projectId = this.$route.params.id
      queryResultById({id: projectId}).then(res => {
        this.ruleForm = res
        if (res.chainStatus) {
          this.chainStatus = res.chainStatus
        }
        const provinceName = res.provinceName || ''
        const cityName = res.cityName || ''
        const areaName = res.areaName || ''
        res.areaName = provinceName + cityName + areaName
        this.assetLayout = res.assetLayout
        const assetLayoutArr = [officeBaseInfo, businessBaseInfo, parkBaseInfo]
        const assetLayout = Number(res.assetLayout) - 1
        const baseInfoTemp = assetLayoutArr[assetLayout]
        this.baseInfo = baseInfoTemp.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.bsAssetResource = res.bsAssetResourceDTOList
        this.srcList = res.bsAssetResourceDTOList.map(item => item.resourceUrl)
        this.developers = res.bsAssetEnterpriseDTOList.filter(item => item.name === '开发商')
        this.designCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '设计公司')
        this.ownerOfAssets = res.bsAssetEnterpriseDTOList.filter(item => item.name === '资产拥有方')
        this.operatingCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '经营公司')
        this.propertyCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '物管公司')
      })
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.getDetail()
  }
}
</script>
<style lang="scss" scoped>
.drawer-wrapper{
  position: absolute;
  right: 0;
  top: 0;
  width: 100%;
  height: 100vh;
  overflow-y: auto;
  overflow-x: hidden;
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
  .table-wrapper{
    border-left: 1px solid #EBEEF5;
  }
}
.btn-group{
  background: #fff;
  padding: 20px;
  overflow: hidden;
}
.ebaas-tip {
  float: right;
  color: #3f8ee2;
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
#project-detail .el-input.is-disabled .el-input__inner, .el-textarea.is-disabled .el-textarea__inner{
  cursor: inherit;
  background:#fff;
  border-color: rgba(203,203,203,1);
  color: #333;
}
</style>

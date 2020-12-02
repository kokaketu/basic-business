<template>
  <div id="floor-detail">
    <!-- <div class="header">
      <i class="el-icon-close"></i>
      <p>楼层详情</p>
    </div> -->
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(ruleForm.createdDate)}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" @click.native="cochain" style="margin-right: 0">{{chainStatus ? '重新上链' : '上链'}}</el-button>
          <el-button :disabled="permission" class="btn pull-right" @click.native="edit" style="margin-right: 0">编辑</el-button>
          <el-button :disabled="permission" class="btn pull-right" @click.native="del" style="margin-right: 0">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息<span v-show="chainStatus" class="ebaas-tip">已上链</span></div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index)
          in baseInfo"
          :key="'text'+index"
          v-show="item.type == 'text'"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'date'+index"
          v-show="item.type == 'date'"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'unit'+index"
          v-show="item.hasUnit"
          :keytag='item.name'
          :valuetag="item.value"
          :unit="item.unit" />
      </div>
    </div>
    <!-- 企业信息 -->
    <div class="corporate-information">
      <div class="new-block-title">附件</div>
      <div class="new-block">
        <div class="img-wrapper">
          <p>平面图</p>
          <div class="img-list">
            <el-image
              v-for="item in floorPlanList" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="floorPlanListPreview">
            </el-image>
          </div>
        </div>
        <div class="filter-wrapper remove-style">
          <el-form :inline="true" size="small" label-width="120px">
            <!-- <el-form-item label="平面图">
              <el-image
                v-for="(item,index) in floorPlanList"
                :key="index"
                style="width: 100px; height: 100px;margin-top:20px;margin-right: 20px;"
                :src="item.resourceUrl"
                fit="fill"></el-image>
                <p v-show="floorPlanList.length==0">-</p>
            </el-form-item>
            <br/> -->
            <el-form-item label="其他附件">
              <div class="files" v-for="(item,index) in attachmentList" :key="index">
                <a :href="item.resourceUrl" :download="item.resourceName"><i class="el-icon-paperclip">{{item.resourceName}}</i></a>
              </div>
              <p v-show="attachmentList.length==0">-</p>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import {getQueryById, delFloor} from '@/http/assets'
import {businessBaseInfo, officeBaseInfo} from './floor'
import KeyValue from '../../../components/KeyValue'
import { mapState } from 'vuex'
import { ebaasProcess } from '@/utils/ebass/process'
export default {
  components: { KeyValue },
  data () {
    return {
      permission: '',
      assetLayout: '', // 1办公、2商业
      businessBaseInfo: businessBaseInfo,
      officeBaseInfo: officeBaseInfo,
      baseInfo: [],
      floorPlanList: [],
      attachmentList: [],
      floorPlanListPreview: [],
      ruleForm: {},
      dialogVisible: false,
      chainStatus: false
    }
  },
  methods: {
    cochain () {
      let params = {
        merchantId: this.merchant.id,
        id: this.$route.params.id,
        dataType: 'BS_FLOOR'
      }
      ebaasProcess.init(params, () => {
        this.chainStatus = true
      })
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/floor/edit/' + contractID)

      // this.$parent.$parent.drawerDetailStatus = !this.$parent.$parent.drawerDetailStatus
      // this.$parent.$parent.drawerEditStatus = !this.$parent.$parent.drawerEditStatus
      // this.$nextTick(() => {
      //   this.$parent.$parent.$refs.edit.getDetail()
      // })
    },
    formatDate (date) {
      return date ? date.slice(0, 10) : '-'
    },
    getDetail () {
      const floorId = this.$route.params.id
      getQueryById({id: floorId}).then(res => {
        this.ruleForm = res
        if (res.chainStatus) {
          this.chainStatus = res.chainStatus
        }
        const assetLayout = res.floorLayout
        this.assetLayout = assetLayout
        const baseInfoTemp = assetLayout === '1'
          ? officeBaseInfo : businessBaseInfo
        this.baseInfo = baseInfoTemp.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        if (res.bsFloorResourceDTOList !== null) {
          this.attachmentList = res.bsFloorResourceDTOList.filter(item => item.resourceType === '3')
          this.floorPlanList = res.bsFloorResourceDTOList.filter(item => item.resourceType !== '3')
          this.floorPlanListPreview = this.floorPlanList.map(item => item.resourceUrl)
        }
      })
    },
    del () {
      const id = this.$route.params.id
      const fjlist = []
      this.ruleForm.bsFloorResourceDTOList && this.ruleForm.bsFloorResourceDTOList.map(item => {
        fjlist.push({id: item.id})
      })
      this.$confirm('此操作将删除楼层, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(
        () => {
          delFloor({id: id, bsFloorResourceDTOList: fjlist}).then(res => {
            if (res.code === '0') {
              this.$message.success('删除成功')
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/asset/floor')
            }
          })
        }
      )
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.getDetail()
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
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
}
.files {
  a {
    display: inline-block;
    height: 34px;
    width: 330px;
    padding: 0 10px;
    line-height: 34px;
    color: #333333;
    background: #fff;
    transition: all ease-in .4;
  }
  a:hover{
    box-sizing: border-box;
    background:rgba(248,245,255,1);
    border-radius:3px;
    color: #5E0EFF;
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
  p {
    width: 120px;
    text-align: right;
    color: #333;
    font-size: 15px;
    padding-right: 12px;
    box-sizing: border-box;
  }
  .img-list {
    flex: 1;
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
.el-input.is-disabled .el-input__inner, .el-textarea.is-disabled .el-textarea__inner{
  cursor: inherit;
  background:rgba(247,247,247,1);
  border-color: rgba(203,203,203,1);
  color: #333;
}
</style>

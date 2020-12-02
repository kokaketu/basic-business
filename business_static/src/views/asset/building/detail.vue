<!--
 * @Author: your name
 * @Date: 2020-06-12 14:54:38
 * @LastEditTime: 2020-09-04 09:30:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\building\detail.vue
-->
<template>
  <div id="building-detail">
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
          v-for="(item, index) in baseInfo"
          :key="'text'+index"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index)  in cyyInfo"
          v-show="assetLayout == 3"
          :key="'text1'+index"
          :keytag='item.name'
          :valuetag="item.value" />
      </div>
      <div class="new-block-title">建筑信息</div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in buildInfo"
          :key="'unit'+index"
          :keytag='item.name'
          :valuetag="item.value"
          :unit="item.unit"/>
      </div>
      <div class="new-block-title">产权信息</div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in CQInfo"
          :key="'date'+index"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index) in CQInfo1"
          v-show="assetLayout == 2 "
          :key="'date1'+index"
          :keytag='item.name'
          :valuetag="item.value" />
      </div>
      <div class="new-block-title" v-show="assetLayout == 3">企业信息</div>
      <div class="detailInfo" v-show="assetLayout == 3">
        <KeyValue
          v-for="(item, index) in ownerOfAssets"
          :key="'ownerOfAssets'+index"
          keytag='资产拥有方'
          :valuetag="item.fieldValue" />
        <KeyValue v-show="ownerOfAssets.length == 0" keytag='资产拥有方' valuetag="-" />
      </div>
      <div class="new-block-title" v-show="assetLayout == 3">经营公司</div>
      <div class="new-block" v-show="assetLayout == 3">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="operatingCompany"
            border
            style="width: 100%;">
            <el-table-column
              prop="fieldValue"
              label="公司名称">
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="new-block-title" v-show="assetLayout == 3">物管公司</div>
      <div class="new-block" v-show="assetLayout == 3">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="propertyCompany"
            border
            style="width: 100%;">
            <el-table-column
              prop="fieldValue"
              label="公司名称">
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import {queryById, delBsBuilding} from '@/http/assets'
import {baseInfo, buildInfo, CQInfo, QYInfo, JYGSInfo, WGGSInfo, cyyInfo, CQInfo1} from './building'
import KeyValue from '../../../components/KeyValue'
import { mapState } from 'vuex'
import { isEmpty } from 'lodash-es'
import { ebaasProcess } from '@/utils/ebass/process'
export default {
  components: { KeyValue },
  data () {
    return {
      permission: '',
      baseInfo: baseInfo,
      cyyInfo: cyyInfo,
      buildInfo: buildInfo,
      CQInfo: CQInfo,
      CQInfo1: CQInfo1,
      QYInfo: QYInfo,
      JYGSInfo: JYGSInfo,
      assetLayout: '',
      WGGSInfo: WGGSInfo,
      ruleForm: {},
      ownerOfAssets: [],
      operatingCompany: [],
      propertyCompany: [],
      chainStatus: false
    }
  },
  computed: mapState(['permissionList', 'projectNameList', 'merchant']),
  watch: {
    'ruleForm.assetId': {
      handler () {
        this.projectNameList.filter(item => {
          if (Number(item.id) === Number(this.ruleForm.assetId)) {
            this.assetLayout = item.assetLayout
          }
        })
      },
      immediate: true
    }
  },
  methods: {
    cochain () {
      let params = {
        merchantId: this.merchant.id,
        id: this.$route.params.id,
        dataType: 'BS_BUILDING'
      }
      ebaasProcess.init(params, () => {
        this.chainStatus = true
      })
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/building/edit/' + contractID)
    },
    del () {
      const buildId = this.$route.params.id
      this.$confirm('此操作将删除楼栋, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(
        () => {
          delBsBuilding({id: buildId}).then(res => {
            if (Number(res.code) === 0) {
              this.$message.success('删除成功')
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/asset/building')
            }
          })
        }
      )
    },
    getDetail () {
      const buildingId = this.$route.params.id
      queryById({id: buildingId}).then(res => {
        this.ruleForm = res
        if (res.chainStatus) {
          this.chainStatus = res.chainStatus
        }
        this.baseInfo = baseInfo.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.cyyInfo = cyyInfo.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.buildInfo = buildInfo.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.CQInfo = CQInfo.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.CQInfo1 = CQInfo1.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        this.ownerOfAssets = res.bsAssetEnterpriseDTOList.filter(item => item.name === '资产拥有方')
        this.operatingCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '经营公司')
        this.propertyCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '物管公司')
      })
    },
    formatDate (date) {
      return date ? date.slice(0, 10) : '-'
    },
  },
  activated () {
    isEmpty(this.projectNameList) && this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.getDetail()
  }
}
</script>
<style lang="scss" scoped>
  .detailInfo{
    padding: 20px 0 0;
  }
  .ebaas-tip {
    float: right;
    color: #3f8ee2;
  }
</style>

<template>
  <div id="asset-unit-detail">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(ruleForm.createdDate)}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" @click.native="cochain" style="margin-right: 0">{{chainStatus ? '重新上链' : '上链'}}</el-button>
          <el-button :disabled="permission" class="btn pull-right" @click.native="edit" style="margin-right: 0">编辑</el-button>
          <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息<span v-show="chainStatus" class="ebaas-tip">已上链</span></div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'text'+item.name+index+item.type"
          v-show="item.type == 'text'"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
          v-for="(item, index) in baseInfo"
          :key="'date'+item.name+index+item.type"
          v-show="item.type == 'date'"
          :keytag='item.name'
          :valuetag="item.value" />
        <KeyValue
        v-for="(item, index) in baseInfo"
        :key="'number'+item.name+index+item.type"
        v-show="item.type == 'number'"
        :keytag='item.name'
        :valuetag="item.value"
        :unit="item.unit" />
      </div>
    </div>
    <div>
      <div class="new-block-title">工程条件</div>
      <div class="detailInfo">
        <KeyValue
          v-for="(item, index) in engineeringArray"
          :key="'text'+item.name+index"
          :keytag='item.name'
          :valuetag="item.value" />
      </div>
    </div>
    <div>
      <div class="new-block-title">一铺一价</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="yearPriceData"
            border
            style="width: 100%;">
            <el-table-column
              prop="year"
              label="年份">
            </el-table-column>
            <el-table-column
              prop="price"
              label="单价（元/㎡/月）">
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <!-- 企业信息 -->
    <div class="corporate-information">
      <div class="new-block-title">历史合同</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="table"
            border
            style="width: 100%;">
            <el-table-column label="合同编号" prop="contNo">
              <template slot-scope="scope">
                <el-link @click="forwardToContract(scope.row)" :underline="false">
                  {{scope.row.contNo}}
                </el-link>
              </template>
            </el-table-column>
            <el-table-column label="租户">
              <template slot-scope="scope">
                <el-link @click="forwardToRentName(scope.row)" :underline="false">
                  {{scope.row.companyName}}
                </el-link>
              </template>
            </el-table-column>
            <el-table-column
              prop="contRange"
              label="合同期限"
              show-overflow-tooltip>
            </el-table-column>
            <el-table-column
              prop="contPriceMonthPerUnit"
              label="平均月单价（元/㎡/月）"
              show-overflow-tooltip>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import {queryStorePositioning, queryLayoutPositioning, bsRoomDetail, bsRoomDel} from '@/http/assets'
import {businessBaseInfo, officeBaseInfo, parkBaseInfo, engineeringArray} from './rentalUnit'
import KeyValue from '@/components/KeyValue'
import { mapState } from 'vuex'
import { ebaasProcess } from '@/utils/ebass/process'
export default {
  data () {
    return {
      permission: null,
      storePositioning: [],
      layoutPositioning: [],
      baseInfo: [],
      ruleForm: {},
      table: [],
      engineeringArray: engineeringArray,
      yearPriceData: [],
      chainStatus: false
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  components: { KeyValue },
  methods: {
    cochain () {
      let params = {
        merchantId: this.merchant.id,
        id: this.$route.params.id,
        dataType: 'BS_ROOM'
      }
      ebaasProcess.init(params, () => {
        this.chainStatus = true
      })
    },
    formatDate (date) {
      return date ? date.slice(0, 10) : '-'
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/rentalUnit/edit/' + contractID + '/' + this.$route.params.assetLayout)
    },
    del () {
      const projectId = this.$route.params.id
      bsRoomDel({id: projectId}).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/asset/rentalUnit')
          }, 2000)
        }
      })
    },
    forwardToContract (row) {
      const assetLayout = row.contSort
      const params = `${assetLayout}&${row.id}`
      this.$router.push(`/contract/detail/${params}`)
    },
    forwardToRentName (row) {
      this.$router.push('/rentcontrol/tenant/detail/' + row.companyId)
    },
    close () {
      this.$parent.handleClose()
    },
    getDetail () {
      const assetLayout = this.$route.params.assetLayout
      const id = this.$route.params.id
      bsRoomDetail({id: id}, assetLayout).then(res => {
        this.ruleForm = res
        if (res.chainStatus) {
          this.chainStatus = res.chainStatus
        }
        const baseInfoTemp = [officeBaseInfo, businessBaseInfo, parkBaseInfo][Number(assetLayout) - 1]
        this.baseInfo = baseInfoTemp.map(item => {
          if (res['storePositioning'] && item.key === 'storePositioning') {
            item.value = this.storePositioning.filter(item => Number(item.code) === Number(res['storePositioning']))[0].name
          } else if (res['layoutPositioning'] && item.key === 'layoutPositioning') {
            item.value = this.layoutPositioning.filter(item => Number(item.code) === Number(res['layoutPositioning']))[0].name
          } else {
            item.value = res[item.key] || '-'
          }
          return item
        })
        if (res.bsRoomConditionsDTO) {
          this.engineeringArray.forEach(item => {
            item.value = res.bsRoomConditionsDTO[item.key]
          })
        }
        this.yearPriceData = res.bsRoomYearPriceDTOS
        this.table = res.historicalConts
      })
    },
    getStorePositioning () {
      return new Promise((resolve, reject) => {
        queryStorePositioning().then(res => {
          this.storePositioning = res
          resolve()
        })
      })
    },
    getLayoutPositioning () {
      return new Promise((resolve, reject) => {
        queryLayoutPositioning().then(res => {
          this.layoutPositioning = res
          resolve()
        })
      })
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    Promise.all([this.getStorePositioning(), this.getLayoutPositioning()]).then(() => {
      this.getDetail()
    })
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
      cursor: pointer;
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
</style>
<style>
#asset-unit-detail .input-unit .el-input__inner{
  padding-right: 30px;
}
#asset-unit-detail  .el-input-group__append{
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
#asset-unit-detail  .el-input.is-disabled .el-input__inner, .el-textarea.is-disabled .el-textarea__inner{
  cursor: inherit;
  background:rgba(247,247,247,1);
  border-color: rgba(203,203,203,1);
  color: #333;
}

</style>

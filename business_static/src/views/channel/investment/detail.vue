<!--
 * @Author: your name
 * @Date: 2020-07-06 09:48:16
 * @LastEditTime: 2020-11-05 17:00:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\investment\detail.vue
-->
<template>
  <div id="investment-detail">
    <div class="wrapper detail-form-style-rest">
      <!-- 顶部按钮 -->
      <div class="createInfo">
        <div class="headLeft">创建人：{{detail.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(new Date(detail.createdDate))}}</div>
        <div class="headRight">
          <el-button :disabled="permission" v-if="detail.attractStage == 3" disabled class="btn pull-right">编辑</el-button>
          <el-button :disabled="permission" v-else class="btn pull-right" @click.native="edit">编辑</el-button>
          <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del">删除</el-button>
        </div>
      </div>
      <!-- 基本信息 -->
      <div class="wrapper-title">基本信息</div>
      <div class="detailInfo">
        <KeyValue keytag='租赁单元编号' :valuetag="detail.leaseNo" />
        <KeyValue keytag='租赁情况' :valuetag="detail.rentalStatus" />
        <KeyValue keytag='项目' :valuetag="detail.assetName" />
        <KeyValue keytag='楼栋' :valuetag="detail.buildingName" />
        <KeyValue keytag='楼层名称' :valuetag="detail.floorName" />
        <KeyValue
          keytag='总建筑面积'
          :valuetag="detail.buildingArea"
          unit="㎡"/>
        <KeyValue
          keytag='套内面积'
          :valuetag="detail.innerArea"
          unit="㎡"/>
        <KeyValue
          keytag='可出租面积'
          :valuetag="detail.rentableArea"
          unit="㎡"/>
        <KeyValue keytag='合同到期时间' :valuetag="detail.contEndDate" />
        <KeyValue v-show="assetLayout==2" keytag='店型定位' :valuetag="getArrValue(storePositioning,detail.storePositioning)" />
        <KeyValue v-show="assetLayout==2" keytag='业态定位' :valuetag="getArrValue(layoutPositioning,detail.layoutPositioning)" />
      </div>
    </div>
    <!-- 招商情况 -->
    <div class="wrapper detail-form-style-rest">
      <div class="wrapper-title">招商情况</div>
      <div class="detailInfo">
        <!-- 带重新分配的负责人 -->
        <KeyValue keytag='招商编号' :valuetag="detail.attractCode" />
        <div class="state">
          <div class='key-label'>负责人</div>
          <div  v-if="detail.memberName" class='value-label flexlayout'>
            {{detail.memberName}}
            <div  class='value-label changeHand'>
              <span v-if="detail.memberName && detail.attractStage != 3" @click="dispatchFn('reDispatch')" style="color: #5E0EFF">重新分配</span>
              <span v-else-if="detail.attractStage != 3" @click="dispatchFn" style="color: #5E0EFF">分配</span>
              <span v-else @click="dispatchFn"></span>
            </div>
          </div>
          <div  v-else class='value-label flexlayout'>
            -
            <div  class='value-label changeHand'>
              <span v-if="detail.memberName && detail.attractStage != 3" @click="dispatchFn('reDispatch')" style="color: #5E0EFF">重新分配</span>
              <span v-else-if="detail.attractStage != 3" @click="dispatchFn" style="color: #5E0EFF">分配</span>
              <span v-else @click="dispatchFn"></span>
            </div>
          </div>
        </div>
        <KeyValue keytag='招商进度' :valuetag="getArrValue(attractStage,detail.attractStage)" />
        <KeyValue keytag='计划完成时间' :valuetag="detail.plannedCompletionDate" />
      </div>
    </div>
    <!-- 招商要求 -->
    <div class="wrapper detail-form-style-rest">
      <div class="wrapper-title">招商要求</div>
      <div class="detailInfo">
        <KeyValue :keytag="detail.assetLayout == 2 ? '招商业态': '招商行业'" :valuetag="getArrValue(attractLayout,detail.attractLayout)" />
        <KeyValue v-if="detail.assetLayout == 2" keytag='招商品牌' :valuetag="detail.attractBrand" />
        <KeyValue keytag='招商底价'
          :valuetag="detail.attractPrice"
          unit="元/㎡/月" />
        <KeyValue keytag='需求描述' :valuetag="detail.demandDescribe" />
      </div>
    </div>
    <!-- 招商记录 -->
    <div class="wrapper detail-form-style-rest">
      <div class="wrapper-title">招商记录</div>
      <div class="block">
        <div class="time-line-wrapper">
          <div class="time-line-item"
            v-for="(item, index) in detail.monitorResList"
            :key="index">
            <div class="time-line-header">
              {{item.monitorDate?item.monitorDate.slice(0,10):'-'}}
              {{['现场接待','主动电访','邮件','短信', '上门拜访','客户来电'][item.monitorType - 1]}}
              {{item.typeChanage}}
              <span
                v-show="detail.attractStage != 3 && item.isGenerate == 0"
                @click="delMonitor(item.id)"
                style="cursor: pointer;font-size: 14px;color: #5E0EFF;">删除</span>
            </div>
            <div class="time-line-content">
              {{item.monitorPeople}}
              <span v-show="item.channelType">渠道：{{['中介公司', '独立经纪', '自主渠道', '政府推荐', '商会协会'][item.channelType - 1]}}</span>
              <span v-show="item.channelName">-</span>
              {{item.channelName}}
              <span v-show="item.agentName">-</span>
              {{item.agentName}}
            </div>
            <div class="time-line-footer">
              {{item.monitorRecord}}
            </div>
          </div>
        </div>
        <!-- 分配 -->
        <dispatch-component
          v-show="drawerDispatchStatus"
          ref="dispatchComponent">
        </dispatch-component>
        <!-- 跟进 -->
        <el-dialog
          :visible.sync="drawerFollowStatus"
          title="增加跟进"
          width="1000px"
          label-position="right"
          :before-close="handleClose">
          <el-form :inline="true" size="small" label-width="100px">
            <el-form-item label="跟进时间" required>
              <el-date-picker
                value-format="yyyy-MM-dd"
                v-model="monitor.monitorDate"
                type="date"
                placeholder="选择日期"></el-date-picker>
            </el-form-item>
            <el-form-item label="跟进人" required>
              <el-input v-model="monitor.monitorPeople"  placeholder="请输入跟进人"></el-input>
            </el-form-item>
            <el-form-item label="跟进方式" required>
              <el-select
                v-model="monitor.monitorType"
                placeholder="请选择跟进方式">
                <el-option
                  v-for="item in [{value: '1', name: '现场接待'},{value: '2', name: '主动电访'},{value: '3', name: '邮件'},{value: '4', name: '短信'},{value: '5', name: '上门拜访'},{value: '6', name: '客户来电'}]"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.name"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="渠道方式" required>
              <el-select
                v-model="monitor.channelType"
                placeholder="请选择渠道方式">
                <el-option
                  @click.native="getChannel(item.value)"
                  v-for="item in [{value: '1', name: '中介公司'},{value: '2', name: '独立经纪'},{value: '3', name: '自主渠道'},{value: '4', name: '政府推荐'},{value: '5', name: '商会协会'}]"
                  :key="item.value"
                  class='select-option-selected'
                  :label="item.name"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>

            <!--  -->
            <el-form-item label="渠道名称" required v-if="monitor.channelType == 1 || monitor.channelType == 2">
              <el-select v-model="monitor.channelId">
                <el-option
                  @click.native="getAgentList(item.id)"
                  v-for="item in channelLists"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.agencyName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="经纪人名称" required v-if="monitor.channelType == 1">
              <el-select v-model="monitor.agentId">
                <el-option
                  v-for="item in agentLists"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.agentName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="渠道名称" required v-if="monitor.channelType != 1 && monitor.channelType != 2">
              <el-input v-model="monitor.channelName" placeholder="请输入"></el-input>
            </el-form-item>
            <!--  -->
            <br>
            <el-form-item label="跟进记录" required>
              <el-input
                style="width: 515px;"
                type="textarea"
                maxlength="100"
                placeholder="请输入跟进记录（100字以内）"
                :autosize="{ minRows: 5, maxRows: 5}"
                v-model="monitor.monitorRecord"></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="cancel">取 消</el-button>
            <el-button type="primary" @click="addMonitor">保存</el-button>
          </div>
        </el-dialog>
        <el-button
          @click.native="drawerFollowStatus = !drawerFollowStatus"
          class="btn"
          v-show="detail.attractStage != 3"
          style="width: 160px; background:#fff;color: #5E0EFF;">
            <i class="el-icon-plus" style="margin-right: 10px;"></i>
            增加跟进
        </el-button>
      </div>
    </div>
  </div>
</template>
<script>
import { queryStorePositioning, queryLayoutPositioning } from '@/http/assets'
import { queryById, delAttract, delAttractMonitor, addAttractMonitor } from '@/http/rentControl'
import { queryContactsPage, queryContactsDetail } from '@/http/channel'
import DispatchComponent from './dispatch'
import KeyValue from '@/components/KeyValue'
import { mapState } from 'vuex'
import { cloneDeep } from 'lodash-es'

export default {
  data () {
    return {
      permission: '',
      assetLayout: null,
      // ruleForm:{},
      storePositioning: [],
      layoutPositioning: [],
      drawerDispatchStatus: false,
      drawerFollowStatus: false,
      attractStage: [{value: '1', name: '未开始'}, {value: '2', name: '进行中'}, {value: '3', name: '已完成'}],
      attractLayout: [],
      detail: {
        storePositioning: '',
        layoutPositioning: '',
        attractStage: '',
        attractLayout: ''
      },
      monitor: {
        monitorDate: '',
        monitorPeople: '',
        monitorType: '',
        channelType: '',
        channelId: '',
        agentId: '',
        channelName: '',
        monitorRecord: ''
      },
      channelLists: [],
      agentLists: []
    }
  },
  components: {
    DispatchComponent, KeyValue
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    getChannel (val) {
      const monitor = cloneDeep(this.monitor)
      monitor.channelId = null
      monitor.agentId = null
      monitor.channelName = null
      this.monitor = monitor
      if (Number(val) === 1 || Number(val) === 2) {
        queryContactsPage({mainId: this.merchant.id, agencyType: Number(val)}).then(res => {
          this.channelLists = res.list
        })
      }
    },
    getAgentList (agencyId) {
      this.monitor.agentId = null
      queryContactsDetail({
        mainId: this.merchant.id,
        id: agencyId
      }).then(res => {
        this.agentLists = res.contactAgentList
      })
    },
    getDetail () {
      const params = {
        mainId: this.merchant.id,
        id: this.$route.params.id.split('&')[0],
        type: this.$route.params.id.split('&')[1]
      }
      queryById(params).then(res => {
        this.detail = res.data
        // this.ruleForm = res
      })
    },
    getArrValue (arr, type) {
      if (!type) return '-'
      let res = ''
      arr.map(item => {
        if (item.code == type || item.value == type) {
          res = item.name || item.assetName || item.buildingName
        }
      })
      return res
    },
    formatDate (e) {
      const year = e.getFullYear()
      const month = e.getMonth() + 1
      const day = e.getDate()
      return year + '-' + month + '-' + day
    },
    delMonitor (id) {
      delAttractMonitor({id: id}).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
            this.getDetail()
          }, 1000)
        }
      })
    },
    cancel () {
      this.$confirm('立即关闭, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.drawerFollowStatus = false
        for (const key in this.monitor) {
          if (this.monitor.hasOwnProperty(key)) {
            this.monitor[key] = null
          }
        }
      })
    },
    addMonitor () {
      const attractId = this.$route.params.id.split('&')[0]
      const msgs = {
        monitorDate: '请填写跟进时间',
        monitorPeople: '请填写跟进人',
        monitorType: '请选择跟进方式',
        channelType: '请选择渠道方式',
        channelId: '请选择渠道名称',
        agentId: '请选择经纪人名称',
        channelName: '请填写渠道名称',
        monitorRecord: '请填写跟进记录',
      }
      const monitor = cloneDeep(this.monitor)
      for (const key in monitor) {
        const channelType = Number(monitor.channelType)
        if (channelType === 1) {
          delete monitor['channelName']
        } else if (channelType === 2) {
          delete monitor['agentId']
          delete monitor['channelName']
        } else {
          delete monitor['agentId']
          delete monitor['channelId']
        }
        const element = monitor[key]
        if (!element) {
          this.$message.error(msgs[key])
          return false
        }
      }
      const params = {
        'attractId': attractId,
        'monitorPeople': this.monitor.monitorPeople,
        'monitorType': this.monitor.monitorType,
        'channelType': this.monitor.channelType,
        'channelName': this.monitor.channelId ? this.channelLists.filter(item => item.id === this.monitor.channelId)[0].agencyName : this.monitor.channelName,
        'channelId': this.monitor.channelId,
        'agentId': this.monitor.agentId,
        'agentName': this.monitor.agentId ? this.agentLists.filter(item => item.id === this.monitor.agentId)[0].agentName : null,
        'monitorRecord': this.monitor.monitorRecord,
        'monitorDate': this.monitor.monitorDate
      }
      addAttractMonitor(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          this.drawerFollowStatus = false
          this.getDetail()
          for (const key in this.monitor) {
            if (this.monitor.hasOwnProperty(key)) {
              this.monitor[key] = null
            }
          }
        }
      })
    },
    edit () {
      const type = this.$route.params.id.split('&')[1]
      const id = this.$route.params.id.split('&')[0]
      this.$router.push('/channel/investment/edit/' + id + '&' + type)
    },
    dispatchFn (row) {
      const id = this.$route.params.id.split('&')[0]
      this.drawerDispatchStatus = !this.drawerDispatchStatus
      this.$nextTick(() => {
        this.$refs.dispatchComponent.getMemberList()
        this.$refs.dispatchComponent.id = id
        this.$refs.dispatchComponent.origin = 'edit'
        this.$refs.dispatchComponent.memberId = this.detail.memberId
      })
    },
    handleClose () {
      this.cancel()
    },
    del () {
      const id = this.$route.params.id.split('&')[0]
      this.$confirm('立即删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delAttract({id: id}).then(res => {
          if (res.code === '0') {
            this.$message.success(res.msg)
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/channel/investment')
          }
        })
      })
    },
    getStorePositioning () {
      queryStorePositioning().then(res => {
        this.storePositioning = res
      })
    },
    getLayoutPositioning () {
      queryLayoutPositioning().then(res => {
        this.layoutPositioning = res
      })
    },
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.assetLayout = this.$route.params.id.split('&')[1]
    this.attractLayout = Number(this.assetLayout) === 2
      ? [{'value': '1', 'name': '时装'}, {'value': '2', 'name': '餐饮'}, {'value': '3', 'name': '儿童'}, {'value': '4', 'name': '配套'}, {'value': '5', 'name': '超市'}, {'value': '6', 'name': '影院'}, {'value': '7', 'name': '娱乐'}, {'value': '8', 'name': '其它'}]
      : [{'value': '1', 'name': 'TMT'}, {'value': '2', 'name': '专业服务'}, {'value': '3', 'name': '房地产'}, {'value': '4', 'name': '零售'}, {'value': '5', 'name': '金融'}, {'value': '6', 'name': '能源'}, {'value': '7', 'name': '制造业'}, {'value': '8', 'name': '物流'}]

    this.getStorePositioning()
    this.getLayoutPositioning()
    this.getDetail()
  }
}
</script>
<style lang="scss" scoped>
$purple: #5E0EFF;
#investment-detail {
  margin-bottom: 50px;
  .btn-group{
    padding: 10px 20px;
    background: #fff;
  }
  .wrapper{
    .opreate-del{
      width: 1000px;
      text-align: right;
      color: #5E0EFF;
      i{
        cursor: pointer;
      }
    }
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
  .unit-content{
    position: relative;
    min-width: 320px;
    height: 32px;
    box-sizing: border-box;
    padding: 0 40px 0 15px;
    border:1px solid #DCDFE6;
    border-radius: 4px
  }
  .form-wrapper{
    padding: 0;
    background: #fff;
    .el-form-item{
      margin-bottom: 20px !important;
    }
    .el-date-editor {
      width: 320px !important;
    }
    .el-select{
      width: 320px;
    }
    .el-input{
      width: 320px;
    }
    .double-width{
      width: 654px;
    }
    .icon-opreate{
      line-height: 74px;
      font-weight: bold;
    }
    .el-icon-plus{
      color: #5E0EFF;
    }
    .el-icon-delete{
      color: #666666;
    }
  }
  .time-line-wrapper{
    .time-line-item{
      position: relative;
      height: 145px;
      padding-left: 30px;
      &::before{
        position: absolute;
        left: 0;
        top: 4px;
        content: ' ';
        height: 14px;
        width: 14px;
        border-radius: 50%;
        box-sizing: border-box;
        border:1px solid rgba(94,14,255,1);
      }
      &::after{
        position: absolute;
        left: 6px;
        top: 22px;
        content: ' ';
        width: 2px;
        height: 120px;
        background: #E6E6E6;
      }
      .time-line-header{
        line-height: 22px;
        font-weight:500;
        font-size: 16px;
        color: #333;
      }
      .time-line-content{
        margin-top: 15px;
        font-size:14px;
        font-weight:400;
        color:rgba(51,51,51,1);
        line-height:20px;
      }
      .time-line-footer{
        margin-top: 20px;
        font-size:14px;
        font-weight:400;
        color:rgba(102,102,102,1);
        line-height:20px;
      }
    }
    .time-line-item:nth-last-child(1){
      &::after{
        display: none;
      }
    }
  }
}
</style>
<style lang="scss">
#investment-detail .el-badge__content{
  cursor: pointer;
  width: 14px;
  height: 14px;
  margin: 0;
  padding: 0;
  line-height: 1;
  transform: scale(0.8);
  right: -10px;
  top: -2px;
}
#investment-detail .el-table--enable-row-hover .el-table__body tr:hover > td{
  background: none;
}
#investment-detail .el-form-item__label{
  display: block !important;
  line-height: 16px !important;
  margin-bottom: 5px;
  text-align: left !important;
  color: #333;
}
#investment-detail .input-unit .el-input__inner{
  padding-right: 30px;
}
#investment-detail .el-input-group__append{
  position: absolute;
  z-index: 999;
  top: 0;
  right: 0;
  bottom: 0;
  width: 60px;
  padding: 0;
  line-height: 30px;
  text-align: center;
  background: none;
  border: none;
  color: #333;
  cursor: pointer;
}
#investment-detail .el-input.is-disabled .el-input__inner, .el-textarea.is-disabled .el-textarea__inner{
  cursor: inherit;
  background:rgba(247,247,247,1);
  border-color: rgba(203,203,203,1);
  color: #333;
}
.flexlayout{
  display: flex;
  justify-content: space-between;
}
.changeHand{
  cursor: pointer;
}
#investment-detail .el-dialog .el-form-item__label {
  display: inline-block !important;
  line-height: 32px !important;
  margin-bottom: 5px;
  text-align: right !important;
  color: #333;
}
#investment-detail .el-dialog .el-input,
#investment-detail .el-dialog .el-select,
#investment-detail .el-dialog .el-textarea,
#investment-detail .el-dialog .el-date-picker{
    width: 200px;
  }
</style>

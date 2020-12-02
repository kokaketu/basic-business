<template>
  <div id="customer-detail">

    <div class="wrapper base-info">
      <!-- 顶部按钮 -->
      <div class="createInfo">
        <div class="headLeft">创建人：{{createInfo.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(createInfo.createdDate)}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" @click.native="edit">编辑</el-button>
          <el-button class="btn" @click.native="convertToCompany" v-if="ibClient.convertToCompany==='0'">转为租户</el-button>
          <el-button class="btn pull-right" @click.native="convertToCompany" v-if="ibClient.convertToCompany==='1'" disabled>已转租户</el-button>
          <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del">删除</el-button>
        </div>
      </div>
      <!-- 详细信息 -->
      <div class="wrapper-title">详细信息</div>
      <div class="detailInfo">
        <KeyValue keytag='客户全称' :valuetag="ibClient.fullName" />
        <KeyValue keytag='客户简称' :valuetag="ibClient.abbreviation" />
        <KeyValue keytag='客户状态' :valuetag="getArrValue([{name: '潜在客户', value: '1'}, {name: '意向客户', value: '2'}, {name: '成交客户', value: '3'}, {name: '流失客户', value: '4'}],ibClient.clientStatus)" />
        <KeyValue keytag='意向程度' :valuetag="getArrValue([{name: '一般', value: '1'}, {name: '中等', value: '2'}, {name: '强烈', value: '3'}, {name: '不感兴趣', value: '4'}],ibClient.intention)" />
        <KeyValue v-if="ibClient.clientStatus == 4" keytag='流失原因' :valuetag="ibClient.churnReason" />
        <KeyValue keytag='客户分类' :valuetag="getArrValue([{name: '办公', value: '1'}, {name: '商业', value: '2'}],ibClient.clientSort)" />
        <KeyValue keytag='客户类型' :valuetag="getArrValue([{name: '企业', value: '1'}, {name: '个人', value: '2'}],ibClient.clientType)" />
        <KeyValue v-if="ibClient.clientSort == '2'" keytag='品牌' :valuetag="ibClient.brand" />
        <KeyValue v-if="ibClient.clientSort == '1'" keytag='行业' :valuetag="getArrValue([{name: 'TMT', value: '1'}, {name: '专业服务', value: '2'} , {name: '房地产', value: '3'} , {name: '零售', value: '4'} , {name: '金融', value: '5'}, {name: '能源', value: '6'},{name: '制造业', value: '7'} , {name: '物流', value: '8'}, {name: '其他', value: '99'}],ibClient.industry)" />
        <KeyValue keytag='联系人姓名' :valuetag="ibClient.contactPerson" />
        <KeyValue keytag='手机号' :valuetag="ibClient.contactMobile" />
        <KeyValue
          keytag='所在区域'
          :valuetag="`${ibClient.provinceName}${ibClient.cityName}${ibClient.districtName}`" />
        <KeyValue keytag='详细地址' :valuetag="ibClient.address" />
      </div>
    </div>
    <!-- 客户需求 -->
    <div class="wrapper corporate-info">
      <div class="wrapper-title">客户需求</div>
      <div class="block">
        <el-form :inline="true" ref="ibClientNeeds" :model="ibClientNeeds" :rules="ibClientNeedsRules" size="small" label-width="120px">
          <div class="tabs" style="margin-bottom:20px">
            <ul class="clearfix">
              <li>客户现状</li>
            </ul>
          </div>
          <div class="detailInfo">
            <KeyValue keytag='当前地址' :valuetag="ibClientNeeds.currentAddress" />
            <KeyValue keytag='当前合同到期日' :valuetag="formatDate(ibClientNeeds.contEndDate)" />
            <KeyValue keytag='当前面积' :valuetag="ibClientNeeds.currentArea" />
            <KeyValue keytag='当前租金' :valuetag="ibClientNeeds.currentRental" />
          </div>
          <div class="tabs" style="margin-bottom:20px;margin-top:10px">
            <ul class="clearfix">
              <li>需求信息</li>
            </ul>
          </div>
          <div class="detailInfo">
            <KeyValue
              keytag='需求面积'
              :valuetag="`${ibClientNeeds.minNeedArea}~${ibClientNeeds.maxNeedArea}`"
              unit="㎡" />
            <KeyValue
              keytag='期望价格'
              :valuetag="`${ibClientNeeds.minExpectPrice}~${ibClientNeeds.maxExpectPrice}`"
              unit="元/㎡/月" />
            <KeyValue
              keytag='需求时间'
              :valuetag="`${formatDate(ibClientNeeds.needBeginDate)}~${formatDate(ibClientNeeds.needEndDate)}`" />
            <KeyValue keytag='意向项目' :valuetag="getArrValue(projectNameList,ibClientNeeds.expectAssetId)" />
            <KeyValue keytag='意向租赁单元' :valuetag="ibClientNeeds.needUnitIds" />
            <!-- <div class="state">
              <div class='key-label'>意向租赁单元</div>
              <div class='value-label'>
                <el-input disabled v-model="ibClientNeeds.needUnitIds" placeholder="请选择">
                  <el-button slot="append" icon="el-icon-search" @click.native="dialogUnitOpen"></el-button>
                </el-input>
              </div>
            </div> -->
            <KeyValue keytag='需求车位' :valuetag="ibClientNeeds.needParkingSpace" />
            <KeyValue keytag='备注' :valuetag="ibClientNeeds.remark" />
          </div>
          <el-dialog
              title="选择租赁单元"
              :visible.sync="dialogUnitVisible"
              :close-on-click-modal="false">
              <el-select v-model="ibClientNeeds.buildingId" placeholder="请选择楼栋">
                <el-option
                  v-for="item in buildings"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.buildingName"
                  :value="item.id">
                </el-option>
              </el-select>
              <el-select v-model="ibClientNeeds.floorId" placeholder="请选择楼层">
                <el-option
                  v-for="item in floors"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.floorName"
                  :value="item.id">
                </el-option>
              </el-select>
              <el-select v-model="ibClientNeeds.needUnitIds" placeholder="请选择租赁单元">
                <el-option
                  v-for="item in stores"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.unitNo"
                  :value="item.unitNo">
                </el-option>
              </el-select>
              <div slot="footer" class="dialog-footer">
                <el-button @click="dialogUnitVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogUnitVisible = false">确 定</el-button>
              </div>
            </el-dialog>
        </el-form>
      </div>
    </div>
    <!-- 客户跟进 -->
    <div class="wrapper company-info">
      <div class="wrapper-title">客户跟进</div>
      <div class="block left-lineBox">
        <div class="block">
          <div class="time-line-wrapper">
            <div class="time-line-item"
              v-for="(item, index) in followUps"
              :key="index">
              <div class="time-line-header">
                {{item.timeline}}
                {{['现场接待','主动电访','邮件','短信', '上门拜访','客户来电'][item.followUpType - 1]}}
                <span v-show="item.systemOperate == 1">{{item.record}}</span>
                <el-link
                  v-show="item.systemOperate == 0 || !item.systemOperate"
                  class="timeline-del"
                  @click="deleteFollowUp(item.id)">删除</el-link>
              </div>
              <div class="time-line-content">
                <span>{{item.followUpPerson}}</span>
                <span v-show="item.channelTypeName">渠道：{{['中介公司', '独立经纪', '自主渠道', '政府推荐', '商会协会'][item.channelType - 1]}}</span>
                <span v-show="item.channelName">-</span>
                {{item.channelName}}
                <span v-show="item.agentName">-</span>
                {{item.agentName}}
              </div>
              <div class="time-line-footer" v-show="item.systemOperate == 0 || !item.systemOperate">
                {{item.record}}
              </div>
            </div>
          </div>
        </div>
        <el-button class="btn btn-add" @click.native="dialogFollowOpen(null)">增加跟进</el-button>
        <el-dialog
          title="增加跟进"
          :visible.sync="dialogFollowFormVisible"
          width="1000px"
          :close-on-click-modal="false">
          <el-form
          :model="follow"
          :inline="true"
          :rules="followUpRules"
          ref="follow"
          size="mini"
          label-position="right"
          label-width="100px">
            <el-form-item label="跟进时间" prop="followUpDate">
              <el-date-picker
                v-model="follow.followUpDate"
                value-format="yyyy-MM-dd"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="跟进人" prop="followUpPerson">
              <el-input v-model="follow.followUpPerson" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="跟进方式" prop="followUpType">
              <el-select v-model="follow.followUpType">
                <el-option
                  v-for="item in followTypes"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="渠道方式" prop="channelType">
              <el-select v-model="follow.channelType">
                <el-option
                  @click.native="getChannel(item.value)"
                  v-for="item in channelTypes"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <!--  -->
            <el-form-item label="渠道名称" prop="channelId" v-if="follow.channelType == 1 || follow.channelType == 2">
              <el-select v-model="follow.channelId">
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
            <el-form-item label="经纪人名称" prop="agentId" v-if="follow.channelType == 1">
              <el-select v-model="follow.agentId">
                <el-option
                  v-for="item in agentLists"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.agentName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="渠道名称" prop="channelName" v-if="follow.channelType != 1 && follow.channelType != 2">
              <el-input v-model="follow.channelName" placeholder="请输入"></el-input>
            </el-form-item>
            <!--  -->
            <el-form-item label="跟进记录" style="width:100%" prop="record">
              <el-input
                style="width: 515px;"
                type="textarea"
                maxlength="100"
                placeholder="请输入跟进记录（100字以内）"
                :autosize="{ minRows: 5, maxRows: 5}"
                v-model="follow.record">
              </el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFollowFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="addFollowUps">确 定</el-button>
          </div>
        </el-dialog>
        <div class="clearfix btn-group">
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { getBuildingNameList, getFloorNameList, fetchRentalUnit } from '@/http/assets'
import { getDetail, updateCustomer, deleteCustomer, clientFollowUpAdd, clientFollowUpDelete } from '@/http/rentControl'
import { queryContactsPage, queryContactsDetail } from '@/http/channel'

import KeyValue from '@/components/KeyValue'
import { mapState } from 'vuex'
import { format } from '@/utils/index'
import { cloneDeep } from 'lodash-es'
import CitySelect from '@/components/CitySelect'

export default {
  data () {
    return {
      permission: '',
      ibClient: {
        id: this.$route.params.id
      },
      follow: {},
      followUps: [],
      delFollowUps: [],
      followTypes: [
        {value: '1', label: '现场接待'},
        {value: '2', label: '主动电访'},
        {value: '3', label: '邮件'},
        {value: '4', label: '短信'},
        {value: '5', label: '上门拜访'},
        {value: '6', label: '客户来电'}
      ],
      channelTypes: [
        {value: '1', label: '中介公司'},
        {value: '2', label: '独立经纪'},
        {value: '3', label: '自主渠道'},
        {value: '4', label: '政府推荐'},
        {value: '5', label: '商会协会'}
      ],
      companySort: ['办公', '商业'],
      companyType: ['经销商', '代理商', '加盟商', '品牌区域公司直营', '个体经营'],
      brandLayout: ['时装', '餐饮', '儿童', '配套', '超市', '影院', '娱乐', '其它'],
      companyIndustry: ['TMT', '专业服务', '房地产', '零售', '金融', '能源', '制造业', '物流'],
      ibClientRules: {
        clientStatus: [{ required: true, message: '请选择客户状态', trigger: 'blur' }],
        intention: [{ required: true, message: '请选择意向程度', trigger: 'blur' }],
        churnReason: [{ required: true, message: '请输入流失原因', trigger: 'blur' }],
        fullName: [{ required: true, message: '请输入客户全称', trigger: 'blur' }],
        clientSort: [{ required: true, message: '请选择客户分类', trigger: 'blur' }],
        clientType: [{ required: true, message: '请选择客户类型', trigger: 'blur' }],
        contactPerson: [{ required: true, message: '请输入联系人姓名', trigger: 'blur' }],
        contactMobile: [{ required: true, message: '请输入手机号', trigger: 'blur' }]
      },
      ibClientNeedsRules: {
        minNeedArea: [{required: true, message: '请输入需求面积', trigger: 'blur'}],
        maxNeedArea: [{required: true, message: '请输入需求面积', trigger: 'blur'}],
        minExpectPrice: [{required: true, message: '请输入期望价格', trigger: 'blur'}],
        maxExpectPrice: [{required: true, message: '请输入期望价格', trigger: 'blur'}],
        needBeginDate: [{required: true, message: '请选择需求时间', trigger: 'blur'}],
        needEndDate: [{required: true, message: '请选择需求时间', trigger: 'blur'}]
      },
      followUpRules: {
        followUpDate: [
          {required: true, trigger: 'blur', message: '请选择跟进时间'}
        ],
        followUpPerson: [
          {required: true, trigger: 'blur', message: '请输入跟进人'}
        ],
        followUpType: [
          {required: true, trigger: 'blur', message: '请选择跟进方式'}
        ],
        channelType: [
          {required: true, trigger: 'blur', message: '请选择渠道方式'}
        ],
        channelId: [
          {required: true, trigger: 'blur', message: '请选择渠道名称'}
        ],
        agentId: [
          {required: true, trigger: 'blur', message: '请选择经纪人名称'}
        ],
        channelName: [
          {required: true, trigger: 'blur', message: '请输入渠道名称'}
        ],
        record: [
          {required: true, trigger: 'blur', message: '请输入跟进记录'}
        ]
      },
      message: this.$message,
      selectedCity: null,
      ibClientNeeds: {},
      dialogImageUrl: '',
      dialogVisible: false,
      dialogFollowFormVisible: false,
      dialogUnitVisible: false,
      buildings: [],
      floors: [],
      stores: [],
      createInfo: {},
      channelLists: [],
      agentLists: []
    }
  },
  watch: {
    'ibClientNeeds.expectAssetId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          getBuildingNameList({assetId: newVal}).then(res => {
            if (res && res.length < 1) {
              this.message('该项目下无楼栋数据')
            }
            this.buildings = res
          })
        }
      }
    },
    'ibClientNeeds.buildingId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          getFloorNameList({buildingId: newVal}).then(res => {
            if (res && res.length < 1) {
              this.message('该楼栋下无楼层数据')
            }
            this.floors = res
          })
        }
      }
    },
    'ibClientNeeds.floorId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          fetchRentalUnit({mainId: this.merchant.id, assetId: this.ibClientNeeds.expectAssetId, floorId: newVal, limit: 999}).then(res => {
            if (res && res.length < 1) {
              this.message('该楼层下无租赁单元数据')
            }
            this.stores = res
          })
        }
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    getChannel (val) {
      const follow = cloneDeep(this.follow)
      follow.channelId = null
      follow.agentId = null
      follow.channelName = null
      this.follow = follow
      if (Number(val) === 1 || Number(val) === 2) {
        queryContactsPage({mainId: this.merchant.id, agencyType: Number(val)}).then(res => {
          this.channelLists = res.list
        })
      }
    },
    getAgentList (agencyId) {
      this.follow.agentId = null
      queryContactsDetail({
        mainId: this.merchant.id,
        id: agencyId
      }).then(res => {
        this.agentLists = res.contactAgentList
      })
    },
    churnReasonStatus () {
      const clientStatus = Number(this.ibClient.clientStatus)
      const churnReason = this.ibClientRules.churnReason
      this.ibClientRules.churnReason = churnReason.map(item => {
        item.required = clientStatus === 4
        return item
      })
    },
    edit () {
      this.$router.push('/channel/customer/edit/' + this.$route.params.id)
    },
    upDateCityFn (city) {
      this.ibClient.provinceCode = city.provinceCode
      this.ibClient.provinceName = city.provinceName
      this.ibClient.cityCode = city.cityCode
      this.ibClient.cityName = city.cityName
      this.ibClient.districtCode = city.districtCode
      this.ibClient.districtName = city.districtName
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    handleRemove (file, fileList) {
    },
    save () {
      const p1 = new Promise((resolve, reject) => {
        this.$refs['ibClient'].validate(valid => {
          if (valid) resolve()
        })
      })
      const p2 = new Promise((resolve, reject) => {
        this.$refs['ibClientNeeds'].validate(valid => {
          if (valid) resolve()
        })
      })
      Promise.all([p1, p2]).then(() => {
        this.ibClient.mainId = this.merchant.id
        this.followUps.push.apply(this.followUps, this.delFollowUps)
        let params = {
          ibClient: this.ibClient,
          ibClientNeeds: this.ibClientNeeds,
          ibClientFollowUpList: this.followUps
        }
        updateCustomer(params).then(res => {
          if (res.code === '0') {
            this.$message({message: '操作成功', type: 'success'})
            this.$router.push('/channel/customer')
          }
        })
      })
    },
    del () {
      if (this.ibClient.convertToCompany === '1') {
        this.$message.warning('您的客户还关联了租户，暂不支持删除')
        return false
      }
      this.$confirm('该操作将删除客户，是否继续？', '删除客户').then(() => {
        deleteCustomer({mainId: this.merchant.id, id: this.ibClient.id}).then(res => {
          if (res.code === '0') {
            this.$message({message: '操作成功', type: 'success'})
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/channel/customer')
          }
        })
      }).catch(() => {})
    },
    dialogFollowOpen (follow) {
      this.dialogFollowFormVisible = true
      if (follow) {
        follow.exist = true
        follow.edit = true
      }
      this.follow = follow || {}
    },
    addFollowUps () {
      this.$refs['follow'].validate((valid) => {
        if (valid) {
          if (this.follow.exist) {
            this.follow.operate = '2' // 操作分类 1:新增 2:修改 3:删除
          }
          if (this.follow.edit) {
            this.followUps.forEach(item => {
              if (item.edit) {
                this.follow.channelTypeName = (this.channelTypes.find(res => { return res.value === item.channelType }) || {}).label
                this.follow.timeline = format(item.followUpDate)
                item = cloneDeep(this.follow)
              }
            })
          } else {
            let temp = this.follow
            temp.channelTypeName = (this.channelTypes.find(res => { return res.value === temp.channelType }) || {}).label
            temp.timeline = format(temp.followUpDate)
            temp.clientId = this.ibClient.id
            temp.operate = '1' // 操作分类 1:新增 2:修改 3:删除
            this.followUps.push(temp)
          }
          this.followUps.forEach(item => {
            item.edit = false
          })
          this.sortFollowUps()
          this.dialogFollowFormVisible = false
        }
      })
      const params = {
        followUpDate: this.follow.followUpDate,
        followUpPerson: this.follow.followUpPerson,
        channelType: this.follow.channelType,
        followUpType: this.follow.followUpType,
        channelId: this.follow.channelId,
        channelName: this.follow.channelId ? this.channelLists.filter(item => item.id === this.follow.channelId)[0].agencyName : this.follow.channelName,
        agentId: this.follow.agentId,
        agentName: this.follow.agentId ? this.agentLists.filter(item => item.id === this.follow.agentId)[0].agentName : null,
        record: this.follow.record,
        clientId: this.follow.clientId
      }
      clientFollowUpAdd(params).then(res => {
        if (res.code === '0') {
          this.getDetail()
        }
      })
    },
    deleteFollowUp (id) {
      // console.log(follow)
      // this.followUps.splice(index, 1)
      // if (follow.id) {
      //   follow.operate = '3'
      //   this.delFollowUps.push(follow)
      // }
      clientFollowUpDelete({id: id}).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
            this.getDetail()
          }, 1000)
        }
      })
    },
    cancel () {
      this.$router.push('/channel/customer')
    },
    getArrValue (arr, type) {
      let res = ''
      if (type != null) {
        arr.map(item => {
          if (item.code == type || item.value == type || item.id == type) {
            res = item.name || item.assetName || item.buildingName
          }
        })
      }
      return res
    },
    formatDate (date) {
      return date ? date.slice(0, 10) : '-'
    },
    convertToCompany () {
      this.$confirm('是否确认转为租户？', '转为租户', {
        confirmButtonText: '确认',
        cancelButtonText: '我再想想'
      }).then(() => {
        this.$router.push({
          name: 'tenantCreate',
          params: {
            ...this.ibClient,
            assetId: this.ibClientNeeds.expectAssetId,
            source: 'ibClient'
          }
        })
      }).catch(() => {})
    },
    dialogUnitOpen () {
      if (this.ibClientNeeds.expectAssetId === '') {
        this.$message.error({message: '请先选择意向项目'})
      } else {
        this.dialogUnitVisible = true
      }
    },
    sortFollowUps () {
      this.followUps.sort((a, b) => {
        return new Date(b.followUpDate).getTime() - new Date(a.followUpDate).getTime()
      })
    },
    getDetail () {
      getDetail({mainId: this.merchant.id, id: this.ibClient.id}).then(res => {
        this.createInfo = res.data.ibClient
        this.ibClient = res.data.ibClient || {}
        this.ibClientNeeds = res.data.ibClientNeeds || {}
        this.followUps = res.data.ibClientFollowUpList || []
        this.selectedCity = {
          provinceCode: this.ibClient.provinceCode,
          cityCode: this.ibClient.cityCode,
          districtCode: this.ibClient.districtCode
        }
        this.followUps.forEach(item => {
          item.channelTypeName = (this.channelTypes.find(res => { return res.value === item.channelType }) || {label: ''}).label
          item.timeline = format(item.followUpDate)
        })
        this.sortFollowUps()
      })
    }
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getDetail()
  },
  components: {
    CitySelect, KeyValue
  },
}
</script>
<style lang="scss" scoped>
  #customer-detail{
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
  #customer-detail .wrapper .el-input,
  #customer-detail .wrapper .el-textarea,
  #customer-detail .wrapper .el-select,
  #customer-detail .wrapper .el-date-picker{
    width: 320px;
  }
  #customer-detail .wrapper .el-dialog .el-input,
  #customer-detail .wrapper .el-dialog .el-select,
  #customer-detail .wrapper .el-dialog .el-textarea,
  #customer-detail .wrapper .el-dialog .el-date-picker{
    width: 200px;
  }
  #customer-detail .el-table td{
    padding: 0;
  }
  #customer-detail .el-table .el-input,
  #customer-detail .el-table .el-select{
    width: 100%;
    border: none;
  }
</style>
<style lang="scss">
  #customer-detail .el-form--inline .el-form-item__label{
    display: block !important;
    line-height: 16px !important;
    margin-bottom: 5px;
    text-align: left !important;
    color: #333;
  }
  #customer-detail .form-wrapper .el-form-item{
    margin-bottom: 20px !important;
  }
  #customer-detail .table-input td {
    padding: 0;
    padding: 3px 0;
  }
  #customer-detail .table-input th {
    height: 46px;
    padding: 0;
    background:rgba(251,251,251,1);
    color: #808080;
  }

  #customer-detail {
    .left-lineBox {
      .el-timeline {
        .el-timeline-item {
          padding-bottom: 1px !important;
        }
      }
      .btn-add{
        width: 160px;
        background: rgb(255, 255, 255);
        color: rgb(94, 14, 255);
      }
      .btn-group{
        margin-top: 20px;
      }
      .el-timeline-item__node--normal {
        width: 7px;
        height: 7px;
        left: 2px;
      }
      .timeline-item{
        .timeline-del{
          font-size: 13px;
          color: rgba(0, 0, 0, 0.7);
          display: none;
        }
      }
      .timeline-item:hover{
        .timeline-del{
          font-size: 13px;
          color: rgba(0, 0, 0, 0.7);
          display: inline;
        }
      }
      .eltimelinefocus {
        .el-timeline-item__node {
          border: 2px solid hsla(0, 0%, 90%, 0.7);
          background-clip: content-box;
          background: rgba(78, 151, 255, 1);
        }
        .el-timeline-item__node--normal {
          left: 0px;
          width: 11px;
          height: 11px;
        }
      }
      .timeline-name {
        font-size: 13px;
        color: rgba(0, 0, 0, 0.7);
      }
      .timeline-content {
        color: rgba(0, 0, 0, 0.5);
        font-size: 12px;
        margin-top: 4px;
        .timeline-content__idea {
          color: rgba(0, 0, 0, 0.7);
        }
      }
    }
  }
#customer-detail .el-dialog .el-form-item__label {
  display: inline-block !important;
  line-height: 32px !important;
  margin-bottom: 5px;
  text-align: right !important;
  color: #333;
}
</style>

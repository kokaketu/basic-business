<template>
  <div id="customer-create">
    <!-- 基本信息 -->
    <div class="wrapper base-info">
      <div class="wrapper-title">详细信息</div>
      <div class="block">
        <el-form
          :inline="true"
          :model="ibClient"
          :rules="ibClientRules"
          ref="ibClient"
          size="small"
          label-position ="right"
          label-width="90px">
          <el-form-item label="客户全称"  prop="fullName">
            <el-input v-model="ibClient.fullName" placeholder="请输入"></el-input>
          </el-form-item>
          <el-form-item label="客户简称" prop="abbreviation">
            <el-input v-model="ibClient.abbreviation" placeholder="请输入"></el-input>
          </el-form-item>
          <el-form-item label="客户状态" prop="clientStatus">
            <el-select
              v-model="ibClient.clientStatus"
              @change="churnReasonStatus"
              placeholder="请选客户状态">
              <el-option
                v-for="item in [{label: '潜在客户', value: '1'}, {label: '意向客户', value: '2'}, {label: '成交客户', value: '3'}, {label: '流失客户', value: '4'}]"
                class='select-option-selected'
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="意向程度" prop="intention">
            <el-select
              v-model="ibClient.intention"
              placeholder="请选择">
              <el-option
                v-for="item in [{label: '一般', value: '1'}, {label: '中等', value: '2'}, {label: '强烈', value: '3'}, {label: '不感兴趣', value: '4'}]"
                class='select-option-selected'
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item  v-if="ibClient.clientStatus == 4"  label="流失原因"  prop="churnReason">
            <el-input v-model="ibClient.churnReason" placeholder="请输入"></el-input>
          </el-form-item>

          <el-form-item label="客户分类" prop="clientSort">
            <el-select
              v-model="ibClient.clientSort"
              placeholder="请选择">
              <el-option
                v-for="item in [{label: '办公', value: '1'}, {label: '商业', value: '2'}, {label: '产业园', value: '3'}]"
                class='select-option-selected'
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="客户类型" prop="clientType">
            <el-select
              v-model="ibClient.clientType"
              placeholder="请选择">
              <el-option
                v-for="item in [{label: '企业', value: '1'}, {label: '个人', value: '2'}]"
                class='select-option-selected'
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="品牌" v-if="ibClient.clientSort == '2'" prop="brand" :rules="[
              { required: true, message: '请输入品牌', trigger: 'blur' },
              { required: true, message: '请输入品牌', trigger: 'change' }
            ]">
            <el-input v-model="ibClient.brand" placeholder="请输入"></el-input>
          </el-form-item>
          <el-form-item label="行业" v-if="ibClient.clientSort == '1' || ibClient.clientSort == '3'" prop="industry" :rules="[
              { required: true, message: '请选择行业', trigger: 'blur' },
              { required: true, message: '请选择行业', trigger: 'change' }
            ]">
            <el-select
              v-model="ibClient.industry"
              placeholder="请选择">
              <el-option
                v-for="item in [{label: 'TMT', value: '1'}, {label: '专业服务', value: '2'} , {label: '房地产', value: '3'} , {label: '零售', value: '4'} , {label: '金融', value: '5'}, {label: '能源', value: '6'},
                {label: '制造业', value: '7'} , {label: '物流', value: '8'}, {label: '其他', value: '99'}]"
                class='select-option-selected'
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="联系人"  prop="contactPerson">
            <el-input v-model="ibClient.contactPerson" placeholder="请输入"></el-input>
          </el-form-item>
          <el-form-item label="手机号" prop="contactMobile">
            <el-input v-model="ibClient.contactMobile" placeholder="请输入"></el-input>
          </el-form-item>
          <br/>
          <el-form-item label="所在区域">
            <city-select @upDateCity="upDateCityFn"></city-select>
          </el-form-item>
          <el-form-item label="详细地址" prop="address">
            <el-input v-model="ibClient.address" placeholder="请输入"></el-input>
          </el-form-item>
        </el-form>
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
          <el-form-item label="当前地址" prop="currentAddress">
            <el-input v-model="ibClientNeeds.currentAddress" placeholder="请输入"></el-input>
          </el-form-item>
          <el-form-item label="当前合同到期日" >
            <el-date-picker
              v-model="ibClientNeeds.contEndDate"
              type="date"
              placeholder="选择日期">
            </el-date-picker>
          </el-form-item>
          <br/>
          <el-form-item label="当前面积" prop="contactMobile">
            <!-- <el-input v-model="ibClientNeeds.currentArea" placeholder="请输入">
              <template slot="suffix">㎡</template>
            </el-input> -->
            <InputNumber
              :value="ibClientNeeds.currentArea"
              placeholder="请输入"
              className="input-unit"
              unit="㎡"
              @input="result => ibClientNeeds.currentArea = result">
            </InputNumber>
          </el-form-item>
          <el-form-item label="当前租金" prop="contactMobile">
            <!-- <el-input v-model="ibClientNeeds.currentRental" placeholder="请输入">
              <template slot="suffix">（元/㎡/月）</template>
            </el-input> -->
            <InputNumber
              :value="ibClientNeeds.currentRental"
              placeholder="请输入"
              className="input-unit"
              unit="元/㎡/月"
              @input="result => ibClientNeeds.currentRental = result">
            </InputNumber>
          </el-form-item>
          <div class="tabs" style="margin-bottom:20px;margin-top:10px">
            <ul class="clearfix">
              <li>需求信息</li>
            </ul>
          </div>
          <el-form-item class="input-range" label="需求面积" prop="minNeedArea">
            <!-- <el-input placeholder="需求面积起" v-model="ibClientNeeds.minNeedArea">
              <template slot="suffix">㎡</template>
            </el-input>   ~
            <el-input placeholder="需求面积止" v-model="ibClientNeeds.maxNeedArea">
              <template slot="suffix">㎡</template>
            </el-input> -->
             <InputNumber
              :value="ibClientNeeds.minNeedArea"
              placeholder="需求面积起(㎡)"
              className="input-unit"
              @input="result => ibClientNeeds.minNeedArea = result">
            </InputNumber>   ~
             <InputNumber
              :value="ibClientNeeds.maxNeedArea"
              placeholder="需求面积止(㎡)"
              className="input-unit"
              @input="result => ibClientNeeds.maxNeedArea = result">
            </InputNumber>
          </el-form-item>
          <el-form-item  class="input-range" label="期望价格" prop="minExpectPrice">
            <!-- <el-input placeholder="期望价格起" v-model="ibClientNeeds.minExpectPrice">
              <template slot="suffix">元/㎡/月</template>
            </el-input> ~
            <el-input placeholder="期望价格止" v-model="ibClientNeeds.maxExpectPrice">
              <template slot="suffix">元/㎡/月</template>
            </el-input> -->
            <InputNumber
              :value="ibClientNeeds.minExpectPrice"
              placeholder="价格起(元/㎡/月)"
              className="input-unit"
              @input="result => ibClientNeeds.minExpectPrice = result">
            </InputNumber>   ~
             <InputNumber
              :value="ibClientNeeds.maxExpectPrice"
              placeholder="价格止(元/㎡/月)"
              className="input-unit"
              @input="result => ibClientNeeds.maxExpectPrice = result">
            </InputNumber>
          </el-form-item>
          <br/>
          <el-form-item class="input-range" label="需求时间" prop="needBeginDate">
            <el-date-picker
              v-model="ibClientNeeds.needBeginDate"
              value-format="yyyy-MM-dd"
              placeholder="需求时间起">
            </el-date-picker> ~
            <el-date-picker
              v-model="ibClientNeeds.needEndDate"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="需求时间止">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="意向项目" prop="expectAssetId">
            <el-select
              v-model="ibClientNeeds.expectAssetId"
              placeholder="请选意向程度">
              <el-option
                v-for="item in selectNameList"
                class='select-option-selected'
                :key="item.id"
                :label="item.assetName"
                :value="item.id">
              </el-option>
            </el-select>
          </el-form-item>
          <br/>
          <el-form-item label="意向租赁单元" prop="needUnitIds">
            <el-input v-model="ibClientNeeds.needUnitIds" placeholder="请选择">
              <el-button slot="append" icon="el-icon-search" @click.native="dialogUnitOpen"></el-button>
            </el-input>
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
          </el-form-item>
          <el-form-item label="需求车位" prop="needParkingSpace">
            <el-input
              v-model="ibClientNeeds.needParkingSpace" placeholder="请输入"
              @input="ibClientNeeds.needParkingSpace = ibClientNeeds.needParkingSpace.replace(/[^0-9]/g, '')">
            </el-input>
          </el-form-item>
          <br/>
          <el-form-item label="备注" prop="remark">
            <el-input type='textarea' :autosize="{ minRows: 5, maxRows: 5}" style='width:775px' v-model="ibClientNeeds.remark" placeholder="请输入"></el-input>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <!-- 客户跟进 -->
    <div class="wrapper company-info">
      <div class="wrapper-title">客户跟进</div>
      <div class="block left-lineBox">
        <div class="time-line-wrapper">
          <div div class="time-line-item"
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
          <el-button class="btn" @click.native="save">保存</el-button>
          <el-button class="btn" @click.native="convertToCompany" v-if="ibClient.convertToCompany==='0'">转为租户</el-button>
          <el-button class="btn btn-default" @click.native="cancel">取消</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { getBuildingNameList, getFloorNameList, fetchRentalUnit } from '@/http/assets'
import { queryContactsPage, queryContactsDetail } from '@/http/channel'
import { getDetail, addCustomer } from '@/http/rentControl'
import { mapState } from 'vuex'
import { format } from '@/utils/index'
import { cloneDeep } from 'lodash-es'
import CitySelect from '@/components/CitySelect'
import InputNumber from '@/components/InputNumber'

export default {
  data () {
    return {
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
        fullName: [{ required: true, message: '请输入客户全称', trigger: 'blur' }, { min: 1, max: 30, message: '长度在 30 个字符以内', trigger: 'blur' }],
        clientSort: [{ required: true, message: '请选择客户分类', trigger: 'blur' }],
        clientType: [{ required: true, message: '请选择客户类型', trigger: 'blur' }],
        contactPerson: [{ required: true, message: '请输入联系人姓名', trigger: 'blur' }, { min: 1, max: 6, message: '长度在 6 个字符以内', trigger: 'blur' }],
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
          {required: true, trigger: 'blur', message: '请输入渠道名称'},
          { min: 1, max: 20, message: '长度在 20 个字符以内', trigger: 'blur' }
        ],
        record: [
          {required: true, trigger: 'blur', message: '请输入跟进记录'},
          { min: 1, max: 100, message: '长度在 100 个字符以内', trigger: 'blur' }
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
      selectNameList: [],
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
    },
    'ibClient.clientSort': {
      handler: function (val) {
        this.selectNameList = this.projectNameList.filter(item => Number(item.assetLayout) === Number(val))
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
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
      console.log(file, fileList)
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
        addCustomer(params).then(res => {
          if (res.code === '0') {
            // console.log(res.data)
            this.$message({message: '操作成功', type: 'success'})
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/channel/customer/detail/' + res.data)
          } else {
            // this.$message.error({message: res.msg})
          }
        })
      })
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
                this.follow.channelName = this.follow.channelId ? this.channelLists.filter(item => item.id === this.follow.channelId)[0].agencyName : this.follow.channelName
                this.follow.agentName = this.follow.agentId ? this.agentLists.filter(item => item.id === this.follow.agentId)[0].agentName : null
                this.follow.channelTypeName = (this.channelTypes.find(res => { return res.value === item.channelType }) || {}).label
                let followType = this.followTypes.find(res => { return res.value === item.followUpType }) || {}
                this.follow.timeline = format(item.followUpDate) + ' ' + followType.label
                item = cloneDeep(this.follow)
              }
            })
          } else {
            let temp = this.follow
            this.follow.channelName = this.follow.channelId ? this.channelLists.filter(item => item.id === this.follow.channelId)[0].agencyName : this.follow.channelName
            this.follow.agentName = this.follow.agentId ? this.agentLists.filter(item => item.id === this.follow.agentId)[0].agentName : null
            temp.channelTypeName = (this.channelTypes.find(res => { return res.value === temp.channelType }) || {}).label
            let followType = this.followTypes.find(res => { return res.value === temp.followUpType }) || {}
            temp.timeline = format(temp.followUpDate) + ' ' + followType.label
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
    },
    deleteFollowUp (follow, index) {
      this.followUps.splice(index, 1)
      if (follow.id) {
        follow.operate = '3'
        this.delFollowUps.push(follow)
      }
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/channel/customer')
    },
    convertToCompany () {
      this.$confirm('是否确认转为租户？', '转为租户', {
        confirmButtonText: '确认',
        cancelButtonText: '我再想想'
      }).then(() => {
        console.log('convert to company')
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
        return new Date(a.followUpDate).getTime() - new Date(b.followUpDate).getTime()
      })
    }
  },
  activated () {
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    getDetail({mainId: this.merchant.id, id: this.ibClient.id}).then(res => {
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
        let followType = this.followTypes.find(res => { return res.value === item.followUpType }) || {label: ''}
        item.timeline = format(item.followUpDate) + ' ' + followType.label
      })
      this.sortFollowUps()
    })
  },
  components: {
    CitySelect,
    InputNumber
  },
}
</script>
<style lang="scss" scoped>
  #customer-create{
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
  #customer-create .wrapper .el-input,
  #customer-create .wrapper .el-textarea,
  #customer-create .wrapper .el-select,
  #customer-create .wrapper .el-date-picker{
    width: 320px;
  }
  #customer-create .wrapper .el-dialog .el-input,
  #customer-create .wrapper .el-dialog .el-select,
  #customer-create .wrapper .el-dialog .el-textarea,
  #customer-create .wrapper .el-dialog .el-date-picker{
    width: 200px;
  }
  #customer-create .el-table td{
    padding: 0;
  }
  #customer-create .el-table .el-input,
  #customer-create .el-table .el-select{
    width: 100%;
    border: none;
  }
</style>
<style lang="scss">
  #customer-create .el-form--inline .el-form-item__label{
    line-height: 32px !important;
    margin-bottom: 5px;
    color: #333;
  }
  #customer-create .form-wrapper .el-form-item{
    margin-bottom: 20px !important;
  }
  #customer-create .table-input td {
    padding: 0;
    padding: 3px 0;
  }
  #customer-create .table-input th {
    height: 46px;
    padding: 0;
    background:rgba(251,251,251,1);
    color: #808080;
  }

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
  #customer-create .input-range .el-input{
    width: 150px !important;
  }
</style>

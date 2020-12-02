<template>
  <div id="device-detail">
    <el-form :inline="true" :model="ruleForm" size="small" label-width="100px">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(new Date(ruleForm.createdDate))}}</div>
        <div class="headRight">
          <el-button :disabled="permission" class="btn pull-right" style="margin-right: 0" @click.native="edit()">编辑</el-button>
          <el-button :disabled="permission" class="btn btn-default pull-right" style="margin-right: 0" @click.native="del()">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息</div>
      <div class="detailInfo">
        <KeyValue keytag='设备编号' :valuetag="ruleForm.no" />
        <KeyValue keytag='设备名称' :valuetag="ruleForm.name" />
        <KeyValue keytag='设备分类' :valuetag="getArrValue(deviceTypes,ruleForm.type,1)" />
        <KeyValue keytag='收费类型' :valuetag="getArrValue(chargeTypes,ruleForm.chargeType,2)" />
        <KeyValue keytag='设备品牌' :valuetag="ruleForm.brandName" />
        <KeyValue keytag='规格型号' :valuetag="ruleForm.spec" />
        <KeyValue keytag='设备状态' :valuetag="getArrValue(deviceStatus,ruleForm.status,3)" />
        <KeyValue keytag='设备位置' :valuetag="ruleForm.address" />
        <KeyValue keytag='出场编号' :valuetag="ruleForm.factNo" />
        <KeyValue keytag='出厂日期' :valuetag="formatDate(ruleForm.factDate)" />
        <KeyValue keytag='购买成本' :valuetag="ruleForm.cost" />
        <KeyValue keytag='设备功率' :valuetag="ruleForm.power" />
        <KeyValue keytag='安装日期' :valuetag="formatDate(ruleForm.installDate)" />
        <KeyValue keytag='运行时间(年)' :valuetag="ruleForm.uptime" />
        <KeyValue keytag='折旧年限(年)' :valuetag="ruleForm.depreciationYear" />
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">维保信息</div>
      <div class="detailInfo">
        <KeyValue keytag='维保单位' :valuetag="ruleForm.serviceCompany" />
        <KeyValue keytag='维保频次' :valuetag="ruleForm.serviceFrequency" />
        <KeyValue keytag='质保期限' :valuetag="ruleForm.warranty" />
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">关联信息</div>
      <div class="detailInfo">
        <KeyValue keytag='关联项目' :valuetag="ruleForm.assetName" />
        <KeyValue keytag='关联楼栋' :valuetag="ruleForm.buildingName" />
        <KeyValue keytag='关联楼层' :valuetag="ruleForm.floorName" />
        <KeyValue keytag='关联租赁单元' :valuetag="ruleForm.roomName" />
        <KeyValue keytag='初始抄表日期' :valuetag="formatDate(ruleForm.meterDate)" />
        <KeyValue keytag='抄表底数' :valuetag="ruleForm.meterNum" />
        <KeyValue keytag='责任人' :valuetag="ruleForm.personLiable" />
      </div>
      <div class="new-block">
        <div class="content-wrapper content-tabs">
          <el-tabs v-model="activeName">
            <el-tab-pane label="供应商信息" name="supplier" style="outline: none">
              <el-table :data="ruleForm.supplierList">
                <el-table-column type="index" width="50px" label="序号"></el-table-column>
                <el-table-column prop="name" label="供应商名称">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.name" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="address" label="供应商地址">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.address" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contact" label="供应商联系人">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contact" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contactJob" label="联系人职务">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contactJob" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contactTel" label="联系人电话">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contactTel" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column width="60">
                  <template slot="header">
                    <el-link type="primary"  @click="addRow" v-if="false">添加</el-link>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary"  @click="supplierDelete(scope.$index, scope.row)" v-if="false">删除</el-link>
                  </template>
                </el-table-column>
              </el-table>
            </el-tab-pane>
            <el-tab-pane label="维保记录" name="serviceRecord">
              <el-table :data="ruleForm.serviceRecordsList">
                <el-table-column type="index" width="50px" label="序号"></el-table-column>
                <el-table-column prop="serviceCompany" label="维保单位">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.serviceCompany" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="serviceFrequency" label="维保频次">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.serviceFrequency" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="serviceTime" label="维保时间" width="280">
                  <template slot-scope="scope">
                    <el-date-picker
                      style="width: 100%"
                      disabled="disabled"
                      v-model="scope.row.serviceTime"
                      type="date"
                      size="small"
                      value-format="yyyy-MM-dd"
                      placeholder="">
                    </el-date-picker>
                  </template>
                </el-table-column>
                <el-table-column prop="servicePerson" label="维保人员">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.servicePerson" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="tel" label="维保人员电话">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.tel" disabled="disabled"></el-input>
                  </template>
                </el-table-column>
                <el-table-column width="60">
                  <template slot="header">
                    <el-link type="primary"  @click="addRow" v-if="false">添加</el-link>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary"  @click="serviceRecordDelete(scope.$index, scope.row)" v-if="false">删除</el-link>
                  </template>
                </el-table-column>
              </el-table>
            </el-tab-pane>
            <el-tab-pane label="附件信息" name="attachment">
              <!-- <el-table :data="ruleForm.attachmentList">
                <el-table-column type="index" width="50px" label="序号"></el-table-column>
                <el-table-column label="附件名称">
                  <template slot-scope="scope">
                    <el-link type="primary" :href="scope.row.attachmentPath" target="_blank" :download="scope.row.attachmentName">{{scope.row.attachmentName}}</el-link>
                  </template>
                </el-table-column>
                <el-table-column width="100">
                  <template slot="header">
                    <el-upload
                      :action="''"
                      :on-preview="handlePreview"
                      :on-remove="handleRemove"
                      :before-remove="beforeRemove"
                      :auto-upload="false"
                      :on-change="fileChange"
                      :show-file-list="false">
                      <el-link type="primary" v-if="false">添加</el-link>
                    </el-upload>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary" @click="deleteFile(scope.$index)" v-if="false">删除</el-link>
                  </template>
                </el-table-column>
              </el-table> -->
              <div class="files" v-for="(item,index) in ruleForm.attachmentList" :key="index">
                <a :href="item.attachmentPath" target="_blank" :download="item.attachmentName"><i class="el-icon-paperclip">{{item.attachmentName}}</i></a>
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </div>
    </el-form>
  </div>
</template>
<script>

import { getAssetName } from '@/http/assets'
import KeyValue from '../../../components/KeyValue'
import { queryDetailById, deleteById } from '@/http/device'
import { http } from '@/http/index'
import { mapState } from 'vuex'
import * as utils from '@/utils/index'

export default {
  props: ['drawer'],
  components: { KeyValue },
  data () {
    var validateMeterNum = (rule, value, callback) => {
      if (Number.isNaN(value * 1) && value !== undefined && value !== '') {
        callback(new Error('请输入数字值'))
      }
      callback()
    }
    return {
      permission: '',
      message: this.$message,
      fileList: [],
      ruleForm: {
        supplierList: [],
        serviceRecordsList: [],
        attachmentList: []
      },
      rules: {
        no: [{required: true, message: '请输入设备编号', trigger: 'blur'}],
        name: [{required: true, message: '请输入设备名称', trigger: 'blur'}],
        type: [{required: true, message: '请选择设备分类', trigger: 'blur'}],
        chargeType: [{required: true, message: '请选择收费类型', trigger: 'blur'}],
        brandName: [{required: true, message: '请输入设备品牌', trigger: 'blur'}],
        spec: [{required: true, message: '请输入规格型号', trigger: 'blur'}],
        status: [{required: true, message: '请选择设备状态', trigger: 'blur'}],
        cost: [{required: true, message: '请输入购买成本', trigger: 'blur'}],
        uptime: [{required: true, message: '请输入运行时间', trigger: 'blur'}],
        depreciationYear: [{required: true, message: '请输入折旧年限', trigger: 'blur'}],
        serviceCompany: [{required: true, message: '请输入维保单位', trigger: 'blur'}],
        serviceFrequency: [{required: true, message: '请输入维保频次', trigger: 'blur'}],
        warranty: [{required: true, message: '请输入质保期限', trigger: 'blur'}],
        assetId: [{required: true, message: '请选择关联项目', trigger: 'blur'}],
        buildingId: [{required: true, message: '请选择关联楼栋', trigger: 'blur'}],
        floorId: [{required: true, message: '请选择关联楼层', trigger: 'blur'}],
        personLiable: [{required: true, message: '请输入责任人', trigger: 'blur'}],
        meterNum: [{validator: validateMeterNum, trigger: 'blur'}]
      },
      deviceTypes: [
        {id: '1', name: '给排水设备'},
        {id: '2', name: '暖通设备'},
        {id: '3', name: '强电设备'},
        {id: '4', name: '升降设备'},
        {id: '5', name: '弱电设备'},
        {id: '6', name: '消防设备'},
        {id: '7', name: '其他设备'}
      ],
      deviceStatus: [
        {id: '1', name: '正常'},
        {id: '2', name: '异常'},
        {id: '3', name: '报废'}
      ],
      chargeTypes: [
        {id: '1', name: '电费'},
        {id: '2', name: '水费'},
        {id: '3', name: '燃气费'},
        {id: '4', name: '其他'}
      ],
      activeName: 'supplier',
      assets: [],
      buildings: [],
      floors: [],
      stores: [],
      units: []
    }
  },
  computed: {
    ...mapState(['merchant', 'permissionList']),
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    getAssetName({mainId: this.merchant.id}).then(res => {
      this.assets = res
    })
    this.getDetail(this.$route.params.id)
  },
  watch: {
  },
  methods: {
    handleRemove (file, fileList) {
      this.ruleForm.attachmentList = fileList
    },
    getArrValue (arr, type, num) {
      let res = ''
      arr.map(item => {
        if (item.id === type) {
          res = item.name || item.assetName || item.buildingName || item.floorName || item.unitNo
        }
      })
      return res
    },
    formatDate (e) {
      // const year = e.getFullYear()
      // const month = e.getMonth()
      // const day = e.getDate()
      if (utils.isEmpty(e)) {
        return '-'
      }
      return utils.format(new Date(e))
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    handlePreview () {

    },
    beforeRemove () {

    },
    handleExceed () {

    },
    fileChange (file, fileList) {
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post('/asset-fileservice-web/filesystem/upload', data).then(res => {
        if (res.code === '0') {
          this.ruleForm.attachmentList.push({name: file.name, url: res.data, attachmentName: file.name, attachmentPath: res.data, attachmentType: 1})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    addRow () {
      if (this.activeName === 'supplier') {
        this.ruleForm.supplierList.push({})
      } else if (this.activeName === 'serviceRecord') {
        this.ruleForm.serviceRecordsList.push({})
      }
    },
    supplierDelete (index, row) {
      this.ruleForm.supplierList.splice(index, 1)
    },
    serviceRecordDelete (index, row) {
      this.ruleForm.serviceRecordsList.splice(index, 1)
    },
    deleteFile (index) {
      this.ruleForm.attachmentList.splice(index, 1)
    },
    edit () {
      this.$router.push('/asset/device/edit/' + this.ruleForm.id)
    },
    del () {
      const id = this.ruleForm.id
      this.$confirm('此操作将删除设备, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(() => {
        deleteById({id}).then(res => {
          if (res.code === '0') {
            this.$message({message: res.msg})
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/asset/device')
          }
        })
      }).catch(() => {})
    },
    getDetail (deviceId) {
      queryDetailById({id: deviceId}).then(res => {
        this.ruleForm = res
        this.ruleForm.attachmentList.forEach(item => {
          item.name = item.attachmentName
          item.url = item.attachmentPath
        })
      })
    },
    cancel () {
      // this.drawer.drawerDetail.hide()
      this.$router.push('/asset/device')
    },
    reset () {
      this.ruleForm = {
        supplierList: [],
        serviceRecordsList: [],
        attachmentList: []
      }
      this.message.success('已重置')
    }
  }
}
</script>
<style lang="scss" scoped>
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
</style>
<style lang="scss">
  #device-detail{
    .content-tabs{
      .el-input__inner{
        border-color: #e5e5e5;
        border-radius: 0;
      }
    }
  }
</style>

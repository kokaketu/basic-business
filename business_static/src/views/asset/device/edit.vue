<template>
  <div id="device-edit">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form :inline="true" :model="ruleForm1" :rules="rules1" ref="ruleForm1" size="small" label-width="150px">
            <el-form-item label="设备编号" prop="no">
              <el-input v-model="ruleForm1.no" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="设备名称" prop="name">
              <el-input v-model="ruleForm1.name" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="设备分类" prop="type">
              <el-select v-model="ruleForm1.type" placeholder="请选择" >
                <el-option class='select-option-selected' v-for="item in deviceTypes" :key="item.id" :label="item.name" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="收费类型" prop="chargeType">
              <el-select v-model="ruleForm1.chargeType" placeholder="请选择" >
                <el-option
                  class='select-option-selected'
                  v-for="item in chargeTypes"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="设备品牌" prop="brandName">
              <el-input v-model="ruleForm1.brandName" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="规格型号" prop="spec">
              <el-input v-model="ruleForm1.spec" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="设备状态" prop="status">
              <el-select v-model="ruleForm1.status" placeholder="请选择" >
                <el-option class='select-option-selected' v-for="item in deviceStatus" :key="item.id" :label="item.name" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="设备位置" prop="address">
              <el-input v-model="ruleForm1.address" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="出厂编号" prop="factNo">
              <el-input v-model="ruleForm1.factNo" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="出厂日期" prop="factDate">
              <el-date-picker
                v-model="ruleForm1.factDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="购买成本" prop="cost">
              <el-input v-model="ruleForm1.cost" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="设备功率" prop="power">
              <el-input v-model="ruleForm1.power" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="安装日期" prop="installDate" >
              <el-date-picker
                v-model="ruleForm1.installDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="运行时间(年)" prop="uptime">
              <el-input v-model="ruleForm1.uptime" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="折旧年限" prop="depreciationYear">
              <el-input v-model="ruleForm1.depreciationYear" placeholder="请输入" ></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">维保信息</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form :model="ruleForm2" ref="ruleForm2" :rules="rules2" :inline="true" label-width="150px" size="small">
            <el-form-item label="维保单位" prop="serviceCompany">
              <el-input v-model="ruleForm2.serviceCompany" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="维保频次" prop="serviceFrequency">
              <el-input v-model="ruleForm2.serviceFrequency" placeholder="请输入" ></el-input>
            </el-form-item>
            <el-form-item label="质保期限" prop="warranty">
              <el-input v-model="ruleForm2.warranty" placeholder="请输入" ></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">关联信息</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form :inline="true" :model="ruleForm3" ref="ruleForm3" :rules="rules3" size="small" label-width="150px">
            <el-form-item label="关联项目" prop="assetId">
              <el-select v-model="ruleForm3.assetId" placeholder="请选择" >
                <el-option class='select-option-selected' v-for="item in assets" :key="item.id" :label="item.assetName" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="关联楼栋" prop="buildingId">
              <el-select v-model="ruleForm3.buildingId" placeholder="请选择"  @change="$forceUpdate()">
                <el-option class='select-option-selected' v-for="item in buildings" :key="item.id" :label="item.buildingName" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="关联楼层" prop="floorId">
              <el-select v-model="ruleForm3.floorId" placeholder="请选择"  @change="$forceUpdate()">
                <el-option class='select-option-selected' v-for="item in floors" :key="item.id" :label="item.floorName" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="关联租赁单元" prop="roomId">
              <el-select v-model="ruleForm3.roomId" placeholder="请选择"  @change="$forceUpdate()">
                <el-option class='select-option-selected' v-for="item in rooms" :key="item.id" :label="item.roomNo" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="初始抄表日期" prop="meterDate">
              <el-date-picker
                v-model="ruleForm3.meterDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="抄表底数" prop="meterNum">
              <el-input v-model="ruleForm3.meterNum" placeholder="请输入抄表底数" ></el-input>
            </el-form-item>
            <el-form-item label="责任人" prop="personLiable">
              <el-input v-model="ruleForm3.personLiable" placeholder="请输入" ></el-input>
            </el-form-item>
          </el-form>
        </div>
        <div class="content-wrapper content-tabs">
          <el-tabs v-model="activeName">
            <el-tab-pane label="供应商信息" name="supplier" style="outline: none">
              <el-table :data="supplierList">
                <el-table-column type="index" width="50px" label="序号"></el-table-column>
                <el-table-column prop="name" label="供应商名称">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.name"></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="address" label="供应商地址">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.address" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contact" label="供应商联系人">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contact" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contactJob" label="联系人职务">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contactJob" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="contactTel" label="联系人电话">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.contactTel" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column width="60">
                  <template slot="header">
                    <el-link type="primary"  @click="addRow">添加</el-link>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary"  @click="supplierDelete(scope.$index, scope.row)">删除</el-link>
                  </template>
                </el-table-column>
              </el-table>
            </el-tab-pane>
            <el-tab-pane label="维保记录" name="serviceRecord">
              <el-table :data="serviceRecordsList">
                <el-table-column type="index" width="50px" label="序号"></el-table-column>
                <el-table-column prop="serviceCompany" label="维保单位">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.serviceCompany" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="serviceFrequency" label="维保频次">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.serviceFrequency" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="serviceTime" label="维保时间" width="280">
                  <template slot-scope="scope">
                    <el-date-picker
                      style="width: 100%"
                      v-model="scope.row.serviceTime"
                      type="date"
                      size="small"
                      value-format="yyyy-MM-dd"
                      placeholder="选择日期">
                    </el-date-picker>
                  </template>
                </el-table-column>
                <el-table-column prop="servicePerson" label="维保人员">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.servicePerson" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column prop="tel" label="维保人员电话">
                  <template slot-scope="scope">
                    <el-input size="small" v-model="scope.row.tel" ></el-input>
                  </template>
                </el-table-column>
                <el-table-column width="60">
                  <template slot="header">
                    <el-link type="primary"  @click="addRow">添加</el-link>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary"  @click="serviceRecordDelete(scope.$index, scope.row)">删除</el-link>
                  </template>
                </el-table-column>
              </el-table>
            </el-tab-pane>
            <el-tab-pane label="附件信息" name="attachment">
              <!-- <el-table :data="attachmentList">
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
                      <el-link type="primary" >添加</el-link>
                    </el-upload>
                  </template>
                  <template slot-scope="scope">
                    <el-link type="primary" @click="deleteFile(scope.$index)">删除</el-link>
                  </template>
                </el-table-column>
              </el-table> -->
              <el-upload
                :action="''"
                :auto-upload="false"
                :on-change="fileChange"
                :show-file-list="false">
                <el-button size="small" round type="primary" icon="el-icon-upload2">上传文件</el-button>
                <div slot="tip" class="el-upload__tip">支持扩展名：rar，zip，doc，docx，pdf，jpg等</div>
              </el-upload>
              <div class="accessory">
                <div class="list-accessory" v-for="(item, index) in attachmentList" :key="item.uid">
                  <div class="left">
                    <i class="el-icon-paperclip"></i><span>{{item.attachmentName}}</span>
                  </div>
                  <i class="el-icon-close close" @click="deleteFile(index)"></i>
                </div>
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn btn-default pull-right" style="margin-right: 0" @click="cancel">取消</el-button>
      <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click="reset">重置</el-button>
      <el-button class="btn pull-right" style="margin-right: 0" @click.native="save()">保存</el-button>
    </div>
  </div>
</template>
<script>

import { getAssetName, getBuildingNameList, getFloorNameList, getrentalUnitList } from '@/http/assets'
import { saveDevice, queryDetailById } from '@/http/device'
import { http } from '@/http/index'
import { mapState } from 'vuex'

export default {
  props: ['drawer'],
  data () {
    /* eslint-disable */
    var validateMeterNum = (rule, value, callback) => {
      if (Number.isNaN(value * 1) && value !== undefined && value !== '') {
        callback(new Error('请输入数字值'))
      }
      callback()
    }
    return {
      message: this.$message,
      fileList: [],
      ruleForm1: {},
      ruleForm2: {},
      ruleForm3: {
        assetId: void 0,
        buildingId: void 0,
        floorId: void 0,
        roomId: void 0,
      },
      rules1: {
        chargeType: [{required: true, message: '请选择收费类型', trigger: 'blur'}],
      },
      rules2: {
      },
      rules3: {
        assetId: [{required: true, message: '请选择关联项目', trigger: 'blur'}],
        buildingId: [{required: true, message: '请选择关联楼栋', trigger: 'blur'}],
        floorId: [{required: true, message: '请选择关联楼层', trigger: 'blur'}],
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
      supplierList: [],
      serviceRecordsList: [],
      attachmentList: [],
      assets: [],
      buildings: [],
      floors: [],
      rooms: []
    }
  },
  computed: {
    ...mapState(['merchant']),
  },
  activated () {
    getAssetName({mainId: this.merchant.id}).then(res => {
      this.assets = res
    })
    this.getDetail(this.$route.params.id)
  },
  watch: {
    'ruleForm3.assetId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          if (oldVal) {
            this.buildings = []
            this.floors = []
            this.rooms = []
            this.ruleForm3.buildingId = null
            this.ruleForm3.floorId = null
            this.ruleForm3.roomId = null
            this.ruleForm3.unitId = null
          }
          getBuildingNameList({assetId: newVal}).then(res => {
            this.buildings = res
          })
        }
      }
    },
    'ruleForm3.buildingId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          if (oldVal) {
            this.floors = []
            this.rooms = []
            this.ruleForm3.floorId = null
            this.ruleForm3.roomId = null
            this.ruleForm3.unitId = null
          }
          getFloorNameList({buildingId: newVal}).then(res => {
            this.floors = res
          })
        }
      }
    },
    'ruleForm3.floorId': {
      handler: function (newVal, oldVal) {
        if (newVal !== oldVal && newVal) {
          if (oldVal) {
            this.rooms = []
            this.ruleForm3.roomId = null
            this.ruleForm3.unitId = null
          }
          getrentalUnitList({mainId: this.merchant.id, assetId: this.ruleForm3.assetId, buildingId: this.ruleForm3.buildingId, floorId: newVal, limit: 999}).then(res => {
            this.rooms = res.list
          })
        }
      }
    },
  },
  methods: {
    handleRemove (file, fileList) {
      this.attachmentList = fileList
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
          this.attachmentList.push({name: file.name, url: res.data, attachmentName: file.name, attachmentPath: res.data, attachmentType: 1})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    addRow () {
      if (this.activeName === 'supplier') {
        this.supplierList.push({})
      } else if (this.activeName === 'serviceRecord') {
        this.serviceRecordsList.push({})
      }
    },
    supplierDelete (index, row) {
      this.supplierList.splice(index, 1)
    },
    serviceRecordDelete (index, row) {
      this.serviceRecordsList.splice(index, 1)
    },
    deleteFile (index) {
      this.attachmentList.splice(index, 1)
    },
    save () {
      const p1 = new Promise((resolve, reject) => {
        this.$refs['ruleForm1'].validate(valid => {
          if (valid) resolve()
        })
      })
      const p2 = new Promise((resolve, reject) => {
        this.$refs['ruleForm2'].validate(valid => {
          if (valid) resolve()
        })
      })
      const p3 = new Promise((resolve, reject) => {
        this.$refs['ruleForm3'].validate(valid => {
          if (valid) resolve()
        })
      })
      Promise.all([p1, p2, p3]).then(() => {
        let params = Object.assign(this.ruleForm1, this.ruleForm2, this.ruleForm3)
        params.attachmentList = this.attachmentList
        params.supplierList = this.supplierList
        params.serviceRecordsList = this.serviceRecordsList
        saveDevice(params).then(res => {
          if (res.code === '0') {
            this.$message.success(res.msg)
            this.cancel()
          }
        })
      })
    },
    getDetail (deviceId) {
      queryDetailById({id: deviceId}).then(res => {
        this.ruleForm1 = res
        this.ruleForm2 = {
          serviceCompany: res.serviceCompany,
          serviceFrequency: res.serviceFrequency,
          warranty: res.warranty
        }
        this.ruleForm3 = {
          assetId: res.assetId,
          buildingId: res.buildingId,
          floorId: res.floorId,
          roomId: res.roomId,
          meterDate: res.meterDate,
          meterNum: res.meterNum,
          personLiable: res.personLiable
        }
        this.supplierList = res.supplierList
        this.serviceRecordsList = res.serviceRecordsList
        this.attachmentList = res.attachmentList || []
        this.attachmentList.forEach(item => {
          item.name = item.attachmentName
          item.url = item.attachmentPath
        })
      })
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/asset/device')
    },
    reset () {
      this.ruleForm1 = {
        no: this.ruleForm1.no
      }
      this.ruleForm2 = {}
      this.ruleForm3 = {}
      this.attachmentList = []
      this.supplierList = []
      this.serviceRecordsList = []
      this.attachmentList = []
      this.$message.success('已重置')
    }
  }
}
</script>
<style lang="scss" scoped>
.btn-group{
  background: #fff;
  padding: 20px;
  overflow: hidden;
}
.accessory {
  margin-top: 10px;
  .list-accessory {
    width: 330px;
    height: 34px;
    cursor: pointer;
    display: flex;
    align-items: center;
    padding: 0 8px;
    justify-content: space-between;
    .left {
      display: flex;
      align-items: center;
    }
    i {
      font-size: 18px;
      padding: 4px;
    }
    span {
      color: #333;
      font-size: 15px;
    }
    .close {
      color: #BCABDE;
      display: none;
    }
    &:hover {
      background: #F8F5FF;
      span {
        color: #5E0EFF;
      }
      .close {
        display: block;
      }
    }
  }
}
</style>
<style lang="scss">
  #device-edit{
    .content-tabs{
      .el-input__inner{
        border-color: #e5e5e5;
        border-radius: 0;
      }
    }
    .btn-group{
      background: #fff;
      padding: 20px;
      overflow: hidden;
    }
  }
</style>

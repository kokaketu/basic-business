<!--
 * @Author: your name
 * @Date: 2020-06-28 19:42:26
 * @LastEditTime: 2020-09-21 17:27:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\project\edit.vue
-->
<template>
  <div id="project-edit">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="baseInfo"
            :rules="baseInfoRules"
            :model="baseInfo"
            size="small"
            label-width="90px">
            <el-form-item label="项目编号" prop="assetCode">
              <el-input v-model="baseInfo.assetCode" :disabled="isUpd" placeholder="请输入项目编号"></el-input>
            </el-form-item>
            <el-form-item label="项目名称" prop="assetName" required>
              <el-input v-model="baseInfo.assetName" placeholder="请输入项目名称"></el-input>
            </el-form-item>
            <el-form-item label="项目简称" prop="shortName">
              <el-input v-model="baseInfo.shortName" placeholder="请输入项目简称"></el-input>
            </el-form-item><br/>
            <el-form-item label="业态" prop="assetLayout" required>
              <el-select
                v-model="baseInfo.assetLayout"
                :disabled="isUpd"
                placeholder="请选择项目业态">
                <el-option
                  v-for="item in assetLayoutList"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 办公 -->
            <el-form-item
              v-show="baseInfo.assetLayout == 1"
              label="环保类型"
              prop="envirCertify">
              <el-select
                v-model="baseInfo.envirCertify"
                placeholder="请选择环保类型">
                <el-option
                  v-for="item in [{value: '1', label: 'LEED'}, {value: '2', label: 'WELL'}, {value: '3', label: 'BREEAM'}, {value: '4', label: '无认证'}]"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 商业 -->
            <el-form-item
              v-show="baseInfo.assetLayout == 2"
              label="商业类型"
              prop="businessType">
              <el-select
                v-model="baseInfo.businessType"
                placeholder="请选择商业类型">
                <el-option
                  v-for="item in [{value: '1', label: '购物中心'}, {value: '2', label: '社区商业'}, {value: '3', label: '商业街'}, {value: '4', label: '其他'}]"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 产业园 -->
            <el-form-item
              v-show="baseInfo.assetLayout == 3"
              label="园区分类"
              prop="parkType">
              <el-select
                v-model="baseInfo.parkType"
                placeholder="请选择商业类型">
                <el-option
                  class='select-option-selected'
                  v-for="item in [{value: '1', label: '商务园'}, {value: '2', label: '科技园'}, {value: '3', label: '工业园'}]"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <br/>
            <el-form-item label="所在区域" required>
              <city-select
                style="width: 280px;"
                @upDateCity="upDateCityFn"
                :selectedCity="selectedCity">
              </city-select>
            </el-form-item>
            <el-form-item label="详细地址" prop="address" required>
              <el-input v-model="baseInfo.address" placeholder="请输入详细地址"></el-input>
            </el-form-item><br/>

            <el-form-item label="资产分类" prop="assetStatus">
              <el-select
                v-model="baseInfo.assetStatus"
                placeholder="请选择资产分类">
                <el-option
                  v-for="item in [{value: '1', label: '优质资产'}, {value: '2', label: '良好资产'}, {value: '3', label: '不良资产'}]"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="经营阶段" prop="operationStage">
              <el-select
                v-model="baseInfo.operationStage"
                placeholder="请选择经营阶段">
                <el-option
                  v-for="item in [{value: '3', label: '筹备期'}, {value: '4', label: '培育期'}, {value: '5', label: '成熟期'}]"
                  class='select-option-selected'
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="车位个数" prop="parkingLotNum">
              <el-input v-model="baseInfo.parkingLotNum" placeholder="请输入车位数，支持整数">
                <template slot="append">个</template>
              </el-input>
            </el-form-item><br/>
            <el-form-item label="项目封面">
              <p style="font-size: 13px;color: #666;">(请上传jpg,png...格式，建议不大于5M的图片)</p>
              <el-upload
                :action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview"
                :on-remove="handleRemove"
                :auto-upload="false"
                :on-change="fileChange"
                :file-list="bsAssetResourceDTOList">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible" :append-to-body="true">
                <img width="100%" :src="dialogImageUrl" alt="">
              </el-dialog>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">建筑信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="building"
            :model="building"
            :rules="buildingRules"
            size="small"
            label-width="120px">
            <el-form-item label="总建筑面积" prop="totalBuildingArea" required>
              <InputNumber
                :value="building.totalBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.totalBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地上建筑面积" prop="groundAreaUp">
              <InputNumber
                :value="building.groundAreaUp"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.groundAreaUp = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地下建筑面积" prop="groundAreaDown">
              <InputNumber
                :value="building.groundAreaDown"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.groundAreaDown = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总套内面积" prop="innerArea" >
              <InputNumber
                :value="building.innerArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.innerArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总可出租面积" prop="rentableArea" required>
              <InputNumber
                :value="building.rentableArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.rentableArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 办公、产业园 -->
            <el-form-item
              v-show="baseInfo.assetLayout != 1"
              label="总配套商业面积"
              prop="businessArea" >
              <InputNumber
                :value="building.businessArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.businessArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 商业 -->
            <el-form-item
              v-show="baseInfo.assetLayout == 2"
              label="总经营面积"
              prop="operatingArea" >
              <InputNumber
                :value="building.operatingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => building.operatingArea = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">产权信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            :model="property"
            size="small"
            label-width="110px">
            <el-form-item label="产权年限" prop="yearsOfOwnership" >
              <el-select
                v-model="property.yearsOfOwnership"
                placeholder="请选择产权年限">
                <el-option
                  class='select-option-selected'
                  v-for="item in [{value: '40', label: '40年'}, {value: '50', label: '50年'}, {value: '70', label: '70年'}]"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="土地获取时间" prop="landAcquisitionDate" >
              <el-date-picker
                v-model="property.landAcquisitionDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="竣工时间" prop="completedDate" >
              <el-date-picker
                v-model="property.completedDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="交付时间" prop="deliverDate" >
              <el-date-picker
                v-model="property.deliverDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item
              label="开业时间"
              prop="openingDate"
              v-show="baseInfo.assetLayout == 2">
              <el-date-picker
                v-model="property.openingDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <br/>
          </el-form>
        </div>
      </div>
    </div>
    <!-- 企业信息 -->
    <div class="corporate-information">
      <div class="new-block-title">企业信息</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-row>
            <el-col :span="8">
              <el-form :inline="true" size="small" label-width="100px">
                <el-form-item label="开发商"
                  v-for="(item, index) in developers"
                  :key="index"
                  v-show="item.operation!='del'">
                  <el-input
                    v-model="item.fieldValue"
                    placeholder="请输入开发商">
                    <template slot="append">
                      <i @click="addRow('developers')" v-show="index == 0" class="el-icon-plus"></i>
                      <i @click="removeRow('developers', index)" v-show="index > 0" class="el-icon-delete"></i>
                    </template>
                  </el-input>
                </el-form-item>
              </el-form>
            </el-col>
            <el-col :span="8">
              <el-form :inline="true" size="small" label-width="100px">
                <el-form-item label="设计公司"
                  v-for="(item, index) in designCompany"
                  :key="index"
                  v-show="item.operation!='del'">
                  <el-input
                    v-model="item.fieldValue"
                    placeholder="请输入设计公司">
                    <template slot="append">
                      <i @click="addRow('designCompany')" v-show="index == 0" class="el-icon-plus"></i>
                      <i @click="removeRow('designCompany', index)" v-show="index > 0" class="el-icon-delete"></i>
                    </template>
                  </el-input>
                </el-form-item>
              </el-form>
            </el-col>
            <el-col :span="8">
              <el-form :inline="true" size="small" label-width="100px">
                <el-form-item label="资产拥有方"
                  v-for="(item, index) in assetOwner"
                  :key="index"
                  v-show="item.operation!='del'">
                  <el-input
                    v-model="item.fieldValue"
                    placeholder="请输入资产拥有方">
                    <template slot="append">
                      <i @click="addRow('assetOwner')" v-show="index == 0" class="el-icon-plus"></i>
                      <i @click="removeRow('assetOwner', index)" v-show="index > 0" class="el-icon-delete"></i>
                    </template>
                  </el-input>
                </el-form-item>
              </el-form>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
    <!-- 经营公司 -->
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
                <el-input v-model="scope.row.fieldValue" placeholder="请输入公司名称"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.strartDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.endDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              label="操作"
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addRow('operatingCompany')" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removeRow('operatingCompany', scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <!-- 物管公司 -->
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
                <el-input v-model="scope.row.fieldValue" placeholder="请输入公司名称"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="strartDate"
              label="开始日期">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.strartDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="endDate"
              label="结束日期">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.endDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              label="操作"
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addRow('propertyCompany')" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removeRow('propertyCompany', scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" @click="cancel" style="margin-right: 10px">取消</el-button>
    </div>
  </div>
</template>
<script>
import { queryResultById, assetUpdate } from '@/http/assets'
import { mapState } from 'vuex'
import CitySelect from '@/components/CitySelect'
import InputNumber from '@/components/InputNumber'
import { http } from '@/http/index'
export default {
  data () {
    return {
      uploadSrc: '',
      dialogImageUrl: '',
      dialogVisible: false,
      selectedCity: null,
      isUpd: '',
      bsAssetResourceDTOList: [],
      baseInfo: {
        assetCode: '',
        assetName: '',
        shortName: '',
        assetLayout: '1',
        businessType: '',
        envirCertify: '',
        parkType: '',
        city: null,
        cityNames: '',
        address: '',
        assetStatus: '',
        operationStage: '',
        parkingLotNum: '',
        provinceCode: '',
        provinceName: '',
        cityCode: '',
        cityName: '',
        districtCode: '',
        districtName: ''
      },
      building: {
        totalBuildingArea: '',
        groundAreaUp: '',
        groundAreaDown: '',
        innerArea: '',
        operatingArea: '',
        businessArea: '',
        rentableArea: '',
      },
      property: {
        yearsOfOwnership: '',
        landAcquisitionDate: '',
        completedDate: '',
        deliverDate: '',
        openingDate: '',
      },
      baseInfoRules: {
        assetName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        assetLayout: [
          { required: true, message: ' ', trigger: 'change' }
        ],
        cityNames: [
          { required: true, message: ' ', trigger: 'change' }
        ],
        address: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      },
      buildingRules: {
        totalBuildingArea: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        rentableArea: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      },
      developers: [{
        name: '开发商',
        fieldName: 'developers',
        fieldValue: '',
        strartDate: '',
        endDate: ''
      }],
      designCompany: [{
        name: '设计公司',
        fieldName: 'designCompany',
        fieldValue: '',
        strartDate: '',
        endDate: ''
      }],
      assetOwner: [{
        name: '资产拥有方',
        fieldName: 'assetOwner',
        fieldValue: '',
        strartDate: '',
        endDate: ''
      }],
      operatingCompany: [{
        name: '经营公司',
        fieldName: 'operatingCompany',
        fieldValue: '',
        strartDate: '',
        endDate: ''
      }],
      propertyCompany: [{
        name: '物管公司',
        fieldName: 'propertyCompany',
        fieldValue: '',
        strartDate: '',
        endDate: ''
      }]
    }
  },
  computed: mapState(['merchant', 'assetLayoutList']),
  watch: {
  },
  methods: {
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      const contractID = this.$route.params.id
      this.$router.push('/asset/project/detail/' + contractID)
    },
    upDateCityFn (city) {
      this.city = city
      this.baseInfo.provinceCode = city.provinceCode
      this.baseInfo.provinceName = city.provinceName
      this.baseInfo.cityCode = city.cityCode
      this.baseInfo.cityName = city.cityName
      this.baseInfo.districtCode = city.districtCode
      this.baseInfo.districtName = city.districtName
    },
    getDetail () {
      const projectId = this.$route.params.id
      queryResultById({id: projectId}).then(res => {
        this.selectedCity = {
          provinceCode: res.provinceId ? String(res.provinceId) : '',
          provinceName: res.provinceName ? String(res.provinceName) : '',
          cityCode: res.cityId ? String(res.cityId) : '',
          cityName: res.cityName ? String(res.cityName) : '',
          districtCode: res.areaId ? String(res.areaId) : '',
          districtName: res.districtName ? String(res.districtName) : ''
        }
        for (const key in this.baseInfo) {
          if (this.baseInfo.hasOwnProperty(key)) {
            this.baseInfo[key] = res[key]
          }
        }
        for (const key in this.building) {
          if (this.building.hasOwnProperty(key)) {
            this.building[key] = res[key]
          }
        }
        for (const key in this.property) {
          if (this.property.hasOwnProperty(key)) {
            this.property[key] = res[key]
          }
        }
        this.baseInfo.city = {
          provinceName: res.provinceName,
          provinceCode: res.provinceId,
          cityName: res.cityName,
          cityCode: res.cityId,
          districtCode: res.areaId,
          districtName: res.districtName
        }
        this.isUpd = res.isUpd === 'true'
        this.bsAssetResourceDTOList = res.bsAssetResourceDTOList.map(item => {
          item.url = item.resourceUrl
          return item
        })
        if (res.bsAssetEnterpriseDTOList && res.bsAssetEnterpriseDTOList.length > 0) {
          this.developers = res.bsAssetEnterpriseDTOList.filter(item => item.name === '开发商')
          this.designCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '设计公司')
          this.assetOwner = res.bsAssetEnterpriseDTOList.filter(item => item.name === '资产拥有方')
          this.operatingCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '经营公司')
          this.propertyCompany = res.bsAssetEnterpriseDTOList.filter(item => item.name === '物管公司')
        }
      })
    },
    handleRemove (file, fileList) {
      this.bsAssetResourceDTOList = fileList
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    fileChange (file, fileList) {
      fileList.splice(fileList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('请上传图片文件')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          this.bsAssetResourceDTOList.push({name: file.name, url: res.data, resourceName: file.name, resourceUrl: res.data, resourceType: 1})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    addRow (obj) {
      const keys = {
        developers: '开发商',
        designCompany: '设计公司',
        assetOwner: '资产拥有方',
        operatingCompany: '经营公司',
        propertyCompany: '物管公司'
      }
      this[obj].push({
        name: keys[obj],
        fieldName: obj,
        fieldValue: '',
        strartDate: '',
        endDate: ''
      })
    },
    removeRow (obj, index) {
      this[obj].splice(index, 1)
    },
    add () {
      const baseInfoArr = []
      const baseInfo = ['assetName', 'assetLayout', 'cityNames', 'address']
      baseInfo.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const buildingArr = []
      const building = ['totalBuildingArea', 'rentableArea']
      building.map(item => {
        this.$refs.building.validateField(item, valid => {
          buildingArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.map(item => Boolean(item)).filter(item => item)
      const buildingBool = buildingArr.filter(item => Boolean(item)).filter(item => item)
      if (baseInfoBool.length !== 0 || buildingBool.length !== 0) {
        return false
      }
      const bsAssetEnterpriseDTOList = [
        ...this.developers,
        ...this.designCompany,
        ...this.assetOwner,
        ...this.operatingCompany,
        ...this.propertyCompany
      ].map(item => {
        delete item.id
        return item
      })
      if (this.city) {
        this.baseInfo.city = this.city
      }
      const params = {
        'id': this.$route.params.id,
        'assetCode': this.baseInfo.assetCode,
        'assetName': this.baseInfo.assetName,
        'shortName': this.baseInfo.shortName,
        'assetLayout': this.baseInfo.assetLayout,
        'businessType': this.baseInfo.businessType,
        'envirCertify': this.baseInfo.envirCertify,
        'parkType': this.baseInfo.parkType,
        'provinceId': this.baseInfo.city.provinceCode,
        'provinceName': this.baseInfo.city.provinceName,
        'cityId': this.baseInfo.city.cityCode,
        'cityName': this.baseInfo.city.cityName,
        'areaId': this.baseInfo.city.districtCode,
        'areaName': this.baseInfo.city.districtName,
        'address': this.baseInfo.address,
        'assetStatus': this.baseInfo.assetStatus,
        'operationStage': this.baseInfo.operationStage,
        'parkingLotNum': this.baseInfo.parkingLotNum,

        'assetIntroduce': '',
        'assetLevel': '',
        'totalBuildingArea': this.building.totalBuildingArea,
        'groundAreaUp': this.building.groundAreaUp,
        'groundAreaDown': this.building.groundAreaDown,
        'innerArea': this.building.innerArea,
        'operatingArea': this.building.operatingArea,
        'businessArea': this.building.businessArea,
        'rentableArea': this.building.rentableArea,

        'yearsOfOwnership': this.property.yearsOfOwnership,
        'landAcquisitionDate': this.property.landAcquisitionDate,
        'completedDate': this.property.completedDate,
        'deliverDate': this.property.deliverDate,
        'openingDate': this.property.openingDate,

        'mainId': this.merchant.id,
        'mainName': this.merchant.name,
        'isSplitSales': '',
        'capitalizationRate': '',
        'remark': '',
        'bsAssetEnterpriseDTOList': bsAssetEnterpriseDTOList,
        'bsAssetResourceDTOList': this.bsAssetResourceDTOList
      }
      // 业态不同移除不同字段
      const assetLayout = Number(this.baseInfo.assetLayout)
      if (assetLayout === 1) { // 办公
        delete params.businessType
        delete params.parkType
        delete params.operatingArea
        delete params.openingDate
      } else if (assetLayout === 2) { // 商业
        delete params.envirCertify
        delete params.parkType
        delete params.businessArea
      } else if (assetLayout === 3) { // 产业园
        delete params.businessType
        delete params.envirCertify
        delete params.operatingArea
        delete params.openingDate
      }
      assetUpdate(params).then(res => {
        if (res.code === '0') {
          this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id, isUpdate: true})
          this.$store.dispatch('setProjects', {isUpdate: true})
          this.$message.success(res.msg)
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
  },
  components: {
    CitySelect,
    InputNumber
  },
  activated () {
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
</style>
<style lang="scss">
#project-edit .left-wrapper .el-form-item__label {
  text-align: right;
}
#project-edit .input-unit .el-input__inner{
  padding-right: 30px;
}
#project-edit .el-input-group__append{
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
  font-weight: bold;
  cursor: pointer;
}
</style>

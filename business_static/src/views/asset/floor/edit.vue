<!--
 * @Author: your name
 * @Date: 2020-05-29 16:06:15
 * @LastEditTime: 2020-09-04 09:31:45
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\project\create.vue
-->
<template>
  <div id="floor-create">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" ref="baseInfo" :rules="baseInfoRules" :model="ruleForm" size="small" label-width="110px">
            <el-form-item label="项目名称" prop="assetId" required>
              <el-select @change = "getBuildingList" v-model="ruleForm.assetId" placeholder="请选择项目" disabled>
                <el-option
                  v-for="item in projectNameList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="楼栋名称" prop="buildingId" required>
              <el-select v-model="ruleForm.buildingId" placeholder="请选择楼栋" disabled>
                <el-option
                  v-for="item in buildingList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.buildingName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="楼层名称" prop="floorName" required>
              <el-input v-model="ruleForm.floorName" placeholder="请输入楼层名称"></el-input>
            </el-form-item>
            <br/>
            <el-form-item label="总建筑面积" prop="totalBuildingArea" required>
              <InputNumber
                :value="ruleForm.totalBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.totalBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="套内面积" prop="innerArea">
              <InputNumber
                :value="ruleForm.innerArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.innerArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 商业 -->
            <el-form-item v-show="assetLayout == 2" label="经营面积" prop="businessArea">
              <InputNumber
                :value="ruleForm.businessArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.businessArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 办公 -->
            <el-form-item v-show="assetLayout == 1 || assetLayout == 3" label="配套商业面积" prop="businessArea">
              <InputNumber
                :value="ruleForm.businessArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.businessArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="可出租面积" prop="rentableArea" required>
              <InputNumber
                :value="ruleForm.rentableArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.rentableArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="平面图排序" prop="sort" required>
              <el-input v-model="ruleForm.sort" @input="() => {ruleForm.sort = isNaN(Number(ruleForm.sort)) ? '' : Number(ruleForm.sort)}" placeholder="请输入平面图排序"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>

    <!-- 楼层附件 -->
    <div class="corporate-information">
      <div class="new-block-title">附件</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form :inline="true" size="small" label-width="80px">
            <el-form-item  style="width:100%" label="平面图"><span class='picTextStyle'>(请上传jpg,png...格式，建议不大于5M的图片。)</span>
              <el-upload
                :action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview1"
                :on-remove="handleRemove1"
                :auto-upload="false"
                :on-change="fileChange1"
                :file-list="floorPlanList">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible1" :append-to-body="true">
                <img width="100%" :src="dialogImageUrl1" alt="">
              </el-dialog>
            </el-form-item>
            <br/>
            <el-form-item  style="width:100%" label="其他附件"><span class='picTextStyle'></span>
              <el-upload
                :action="''"
                :auto-upload="false"
                :on-change="fileChange2"
                :show-file-list="false"
                :file-list="attachmentList"
              >
                <!-- <i class="el-icon-plus">添加</i> -->
                <el-button size="small" round type="primary" icon="el-icon-upload2">上传文件</el-button>
                <div slot="tip" class="el-upload__tip">支持扩展名：rar，zip，doc，docx，pdf，jpg等</div>
              </el-upload>
              <div class="accessory">
                <div class="list-accessory" v-for="(item, index) in attachmentList" :key="item.uid">
                  <div class="left">
                    <i class="el-icon-paperclip"></i><span>{{item.resourceName}}</span>
                  </div>
                  <i class="el-icon-close close" @click="handleRemove2(attachmentList[index], [], index)"></i>
                </div>
              </div>
              <!-- <el-table :data="attachmentList" :show-header="false">
                <el-table-column prop="resourceName" width="500">
                  <template slot-scope="scope">
                    <el-link :href="scope.row.resourceUrl" :download="scope.row.resourceName" @click="attachmentList.splice(scope.$index, 1)">{{scope.row.resourceName}}</el-link>
                  </template>
                </el-table-column>
                <el-table-column prop="resourceName" width="100">
                  <template slot-scope="scope">
                    <el-link @click="handleRemove2(attachmentList[scope.$index], [], scope.$index)">删除</el-link>
                  </template>
                </el-table-column>
              </el-table> -->
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>

    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="edit" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" @click.native="cancel" style="margin-right: 10px">取消</el-button>
    </div>
  </div>
</template>
<script>
import {
  getBuildingNameList,
  updFloor,
  addFloorResource,
  delFloorResource,
  getQueryById
} from '@/http/assets'
import { mapState } from 'vuex'
import {businessBaseInfo, officeBaseInfo} from './floor'
import { http } from '@/http/index'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
      assetLayout: '1',
      buildingList: [],
      dialogImageUrl1: '',
      dialogVisible1: false,
      dialogImageUrl2: '',
      dialogVisible2: false,
      ruleForm: {
        assetId: '',
        assetName: '',
        buildingId: '',
        buildingName: '',
        floorLayout: '',
        floorName: '',
        totalBuildingArea: '',
        innerArea: '',
        businessArea: '',
        rentableArea: '',
        sort: '',
        bsFloorResourceDTOList: []
      },
      baseInfoRules: {
        assetId: [
          { required: true, message: '请选择项目', trigger: 'blur' },
          { required: true, message: '请选择项目', trigger: 'change' }
        ],
        buildingId: [
          { required: true, message: '请选择楼栋', trigger: 'blur' },
          { required: true, message: '请选择楼栋', trigger: 'change' }
        ],
        floorName: [
          { required: true, message: '请输入楼层名称', trigger: 'blur' },
          { required: true, message: '请输入楼层名称', trigger: 'change' }
        ],
        totalBuildingArea: [
          { required: true, message: '请输入总建筑面积', trigger: 'blur' },
          { required: true, message: '请输入总建筑面积', trigger: 'change' }
        ],
        // innerArea: [
        //   { required: true, message: '请输入总套内面积', trigger: 'blur' },
        //   { required: true, message: '请输入总套内面积', trigger: 'change' }
        // ],
        // businessArea: [
        //   { required: true, message: '请输入总套内面积', trigger: 'blur' },
        //   { required: true, message: '请输入总套内面积', trigger: 'change' }
        // ],
        rentableArea: [
          { required: true, message: '请输入总可出租面积', trigger: 'blur' },
          { required: true, message: '请输入总可出租面积', trigger: 'change' }
        ],
        sort: [
          { required: true, message: '请输入平面图排序', trigger: 'blur' },
          { required: true, message: '请输入平面图排序', trigger: 'change' }
        ]
      },
      drawerEditStatus: false,
      businessBaseInfo: businessBaseInfo,
      officeBaseInfo: officeBaseInfo,
      baseInfo: [],
      floorPlanList: [],
      attachmentList: []
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  watch: {
    'ruleForm.assetId': {
      handler () {
        this.projectNameList.filter(item => {
          if (item.id === this.ruleForm.assetId) {
            this.assetLayout = item.assetLayout
          }
        })
      }
    }
  },
  methods: {
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      // const contractID = this.$route.params.id
      this.$router.push('/asset/floor')
    },
    getBuildingList () {
      this.ruleForm.buildingId = ''
      getBuildingNameList({'assetId': this.ruleForm.assetId}).then(res => {
        this.buildingList = res
      })
    },
    getDetail () {
      const floorId = this.$route.params.id
      getQueryById({id: floorId}).then(res => {
        for (const key in this.ruleForm) {
          if (this.ruleForm.hasOwnProperty(key)) {
            this.ruleForm[key] = res[key]
          }
        }
        getBuildingNameList({'assetId': this.ruleForm.assetId}).then(res => {
          this.buildingList = res
        })
        const assetLayout = res.floorLayout
        this.assetLayout = assetLayout
        const baseInfoTemp = assetLayout === '1'
          ? officeBaseInfo : businessBaseInfo
        this.baseInfo = baseInfoTemp.map(item => {
          item.value = res[item.key] || '-'
          return item
        })
        if (res.bsFloorResourceDTOList !== null) {
          this.floorPlanList = res.bsFloorResourceDTOList.filter(item => item.resourceType !== '3').map(element => {
            element.url = element.resourceUrl
            element.name = element.resourceName
            return element
          })
          this.attachmentList = res.bsFloorResourceDTOList.filter(item => item.resourceType === '3').map(element => {
            element.url = element.resourceUrl
            element.name = element.resourceName
            return element
          })
        }
      })
    },
    handleRemove1 (file, floorPlanList) {
      this.floorPlanList = floorPlanList
      let params = {}
      params['id'] = file.id
      delFloorResource(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
          }, 1000)
        }
      })
    },
    handlePictureCardPreview1 (file) {
      this.dialogImageUrl1 = file.resourceUrl
      this.dialogVisible1 = true
    },
    fileChange1 (file, floorPlanList) {
      floorPlanList.splice(floorPlanList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('平面图请上传图片文件')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post('/asset-fileservice-web/filesystem/upload', data).then(res => {
        if (res.code === '0') {
          let params = {}
          params['floorId'] = this.$route.params.id
          params['resourceType'] = '1'
          params['resourceName'] = file.name
          params['resourceUrl'] = res.data
          addFloorResource(params).then(result => {
            if (result.code === '0') {
              this.floorPlanList.push({id: result.data, name: file.name, url: res.data, resourceUrl: res.data, attachmentName: file.name, attachmentPath: res.data, attachmentType: 1})
              this.$message.success(result.msg)
              setTimeout(() => {
              }, 1000)
            }
          })
        }
      })
    },
    handleRemove2 (file, attachmentList, index) {
      this.attachmentList.splice(index, 1)
      let params = {}
      params['id'] = file.id
      delFloorResource(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
          }, 1000)
        }
      })
    },
    handlePictureCardPreview2 (file) {
      this.dialogImageUrl2 = file.resourceUrl
      this.dialogVisible2 = true
    },
    fileChange2 (file, attachmentList) {
      attachmentList.splice(attachmentList.length - 1, 1)
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post('/asset-fileservice-web/filesystem/upload', data).then(res => {
        if (res.code === '0') {
          file.resourceName = file.name
          file.resourceUrl = res.data
          file.resourceType = 3

          let params = {}
          params['floorId'] = this.$route.params.id
          params['resourceType'] = '3'
          params['resourceName'] = file.name
          params['resourceUrl'] = res.data
          addFloorResource(params).then(result => {
            if (result.code === '0') {
              this.attachmentList.push({id: result.data, name: file.name, url: res.data, resourceUrl: res.data, resourceName: file.name, attachmentPath: res.data, attachmentType: 3})
              this.$message.success(result.msg)
              setTimeout(() => {
              }, 1000)
            }
          })
        }
      })
    },
    getValueById (obj, id, name) {
      return obj.filter(item => {
        if (item.id === this.ruleForm[id]) {
          return item
        }
      })[0][name]
    },
    edit () {
      const baseInfoArr = []
      const dealedKey = ['assetId', 'buildingId', 'floorName', 'totalBuildingArea', 'innerArea', 'businessArea', 'rentableArea', 'sort']
      dealedKey.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.filter(item => item).length === 0
      if (!baseInfoBool) return false
      let params = {}
      dealedKey.map(item => {
        const value = this.ruleForm[item]
        params[item] = value
      })
      params['id'] = this.$route.params.id
      params['floorLayout'] = this.assetLayout
      params['assetName'] = this.getValueById(this.projectNameList, 'assetId', 'assetName')
      params['buildingName'] = this.getValueById(this.buildingList, 'buildingId', 'buildingName')
      if (!baseInfoBool) return false
      updFloor(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          // 删除路由
          this.$destroy()
          this.$store.dispatch('setRouteList', {
            route: this.$route,
            type: 'delete'
          })
          this.$router.push('/asset/floor')
          // setTimeout(() => {
          //   this.$parent.drawerCreateStatus = false
          //   this.$parent.handleClose()
          // }, 1000)
        }
      })
    }
  },
  components: {
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
.accessory {
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
      display: inline-block;
      width: 270px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
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
#floor-create .input-unit .el-input__inner{
  padding-right: 30px;
}
#floor-create .el-input-group__append{
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

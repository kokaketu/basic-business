<!--
 * @Author: your name
 * @Date: 2020-05-29 16:06:15
 * @LastEditTime: 2020-09-04 09:31:38
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
              <el-select @change = "getBuildingList" v-model="ruleForm.assetId" placeholder="请选择项目">
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
              <el-select v-model="ruleForm.buildingId" placeholder="请选择楼栋">
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
              <el-input v-model="ruleForm.sort" @input="verifySort" placeholder="请输入平面图排序"></el-input>
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
            <el-form-item style="width:100%" label="平面图"><span class='picTextStyle'>(请上传jpg,png...格式，建议不大于5M的图片。)</span>
              <el-upload
                :action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview1"
                :on-remove="handleRemove1"
                :auto-upload="false"
                :on-change="fileChange1"
                :file-list="floorPlanList">
                <i class="el-icon-plus"></i><br/>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible1" :append-to-body="true">
                <img width="100%" :src="dialogImageUrl1" alt="">
              </el-dialog>
            </el-form-item>
            <br/>
            <el-form-item  style="width:100%"  label="其他附件"><span class='picTextStyle'></span>
              <el-upload
                :action="''"
                :auto-upload="false"
                :on-change="fileChange2"
                :show-file-list="false">
                <el-button size="small" round type="primary" icon="el-icon-upload2">上传文件</el-button>
                <div slot="tip" class="el-upload__tip">支持扩展名：rar，zip，doc，docx，pdf，jpg等</div>
              </el-upload>
              <div class="accessory">
                <div class="list-accessory" v-for="(item, index) in attachmentList" :key="item.uid">
                  <div class="left">
                    <i class="el-icon-paperclip"></i><span>{{item.resourceName}}</span>
                  </div>
                  <i class="el-icon-close close" @click="attachmentList.splice(index, 1)"></i>
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
                    <el-link @click="attachmentList.splice(scope.$index, 1)">删除</el-link>
                  </template>
                </el-table-column>
              </el-table> -->
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>

    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" :loading="loading" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click.native="cancel">取消</el-button>
    </div>
  </div>
</template>
<script>
import { getBuildingNameList, addFloor } from '@/http/assets'
import { mapState } from 'vuex'
import { http } from '@/http/index'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
      loading: false,
      assetLayout: '1',
      buildingList: [],
      dialogImageUrl1: '',
      dialogVisible1: false,
      dialogImageUrl2: '',
      dialogVisible2: false,
      floorPlanList: [],
      attachmentList: [],
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
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        buildingId: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        floorName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        totalBuildingArea: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        rentableArea: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        sort: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      }
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
      this.$router.push('/asset/floor')
    },
    getBuildingList () {
      this.ruleForm.buildingId = ''
      getBuildingNameList({'assetId': this.ruleForm.assetId}).then(res => {
        this.buildingList = res
      })
    },
    handleRemove1 (file, floorPlanList) {
      this.floorPlanList = floorPlanList
    },
    verifySort () {
      if (this.ruleForm.sort !== undefined) {
        const isNegative = this.ruleForm.sort.toString().slice(0, 1) === '-'
        const value = isNegative ? this.ruleForm.sort.toString().slice(1) : this.ruleForm.sort.toString()
        this.ruleForm.sort = (isNegative ? '-' : '') + value.toString().replace(/[^\d]/g, '')
      }
    },
    fileChange1 (file, fileList) {
      fileList.splice(fileList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('平面图请上传图片文件')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          // this.floorPlanList = fileList
          // file.resourceName = file.name
          // file.resourceUrl = res.data
          // file.resourceType = 1
          this.floorPlanList.push({
            name: file.name,
            percentage: file.percentage,
            raw: {uid: file.uid},
            uid: file.uid,
            url: res.data,
            resourceName: file.name,
            resourceUrl: res.data,
            resourceType: 1,
            size: file.size,
            status: file.status
          })
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    handleRemove2 (file, attachmentList) {
      this.attachmentList = attachmentList
    },
    fileChange2 (file, fileList) {
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          // this.attachmentList = fileList
          // file.resourceName = file.name
          // file.resourceUrl = res.data
          // file.resourceType = 3
          // this.$message({message: res.msg, type: 'success'})

          this.attachmentList.push({
            name: file.name,
            percentage: file.percentage,
            raw: {uid: file.uid},
            uid: file.uid,
            url: res.data,
            resourceName: file.name,
            resourceUrl: res.data,
            resourceType: 3,
            size: file.size,
            status: file.status
          })
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    handlePictureCardPreview1 (file) {
      console.log(file)
      this.dialogImageUrl1 = file.url
      this.dialogVisible1 = true
    },
    handlePictureCardPreview2 (file) {
      this.dialogImageUrl2 = file.url
      this.dialogVisible2 = true
    },
    getValueById (obj, id, name) {
      return obj.filter(item => {
        if (item.id === this.ruleForm[id]) {
          return item
        }
      })[0][name]
    },
    add () {
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
      params['floorLayout'] = this.assetLayout
      params['assetName'] = this.getValueById(this.projectNameList, 'assetId', 'assetName')
      params['buildingName'] = this.getValueById(this.buildingList, 'buildingId', 'buildingName')
      params['bsFloorResourceDTOList'] = this.floorPlanList.concat(this.attachmentList)
      if (!baseInfoBool) return false

      this.loading = true
      addFloor(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          setTimeout(() => {
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push(`/asset/floor/detail/${res.data}`)
            // this.$parent.handleClose()
          }, 1000)
        } else {
          this.loading = false
        }
      })
    }
  },
  components: {
    InputNumber
  },
  mounted () {
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
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
#floor-create .left-wrapper .el-form-item__label {
    text-align: right;
}
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

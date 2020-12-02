<template>
  <div id="multiplePoints-edit">
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
            <el-form-item label="项目名称" prop="assetId" required>
              <el-select
                v-model="baseInfo.assetId"
                placeholder="请选择项目"
                @change="getRoomNo">
                <el-option
                  v-for="item in projectNameList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="多经编号" prop="roomNo" required>
              <el-input v-model="baseInfo.roomNo" placeholder="请输入多经编号"></el-input>
            </el-form-item>

            <el-form-item label="位置区域" prop="address" required>
              <el-input v-model="baseInfo.address" placeholder="请输入位置区域"></el-input>
            </el-form-item>

            <el-form-item label="点位类型" prop="pointType" required>
              <el-select
                v-model="baseInfo.pointType"
                placeholder="请选择点位类型">
                <el-option
                  class='select-option-selected'
                  v-for="item in [{id: '1', label: '固定点位'}, {id: '2', label: '临时点位'}]"
                  :key="item.id"
                  :label="item.label"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item
              label="多经类型"
              prop="diverseType"
              required>
              <el-select
                v-model="baseInfo.diverseType"
                placeholder="请选择多经类型">
                <el-option
                  v-for='item in [{"id":"1","label":"广告位"},{"id":"2","label":"灯箱"},{"id":"3","label":"LED"},{"id":"4","label":"ATM"},{"id":"5","label":"侧旗"},{"id":"6","label":"吊幔"},{"id":"7","label":"外广场橱窗"},{"id":"8","label":"其他"}]'
                  :key="item.id"
                  :label="item.label"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item
              v-if="baseInfo.diverseType == 8"
              label="类型描述"
              prop="diverseRemark"
              required>
              <el-input placeholder="请输入，20字以内" maxlength="20" v-model="baseInfo.diverseRemark"></el-input>
            </el-form-item>

          </el-form>
        </div>
      </div>
      <div class="new-block-title">其他信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            :model="other"
            size="small"
            label-width="120px">

            <el-form-item label="楼栋名称" prop="buildingId" >
              <el-select
                clearable
                @change="getFloorList"
                v-model="other.buildingId"
                placeholder="请选择楼栋">
                <el-option
                  v-for="item in buildingList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.buildingName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="楼层名称" prop="floorId" >
              <el-select
                clearable
                v-model="other.floorId"
                placeholder="请选择楼层">
                <el-option
                  v-for="item in floorList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.floorName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="场内/场外" prop="inOrOut">
              <el-select
                clearable
                v-model="other.inOrOut"
                placeholder="请选择场内/场外">
                <el-option
                  v-for="item in [{id: '1',label: '场内'}, {id: '2', label: '场外'}]"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.label"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="是否露天" prop="isOpenAir">
              <el-select
                clearable
                v-model="other.isOpenAir"
                placeholder="请选择是否露天">
                <el-option
                  v-for="item in [{id: '1',label: '是'}, {id: '2', label: '否'}]"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.label"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="可出租面积" prop="rentableArea">
              <InputNumber
                :value="other.rentableArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => other.rentableArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item
              label="备注"
              prop="remark">
              <el-input placeholder="请输入，50字以内" maxlength="50" v-model="other.remark"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" style="margin-left: 10px">保存</el-button>
      <el-button class="btn btn-default pull-right" @click.native="cancel">取消</el-button>
    </div>
  </div>
</template>
<script>
import { diverseUpdate, getBuildingNameList, diverseDetail, getFloorNameList, getRoomNo } from '@/http/assets'
import { mapState } from 'vuex'
import CitySelect from '@/components/CitySelect'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
      baseInfo: {
        assetId: null,
        roomNo: null,
        address: null,
        pointType: null,
        diverseType: null,
        diverseRemark: null
      },
      other: {
        buildingId: null,
        floorId: null,
        inOrOut: null,
        isOpenAir: null,
        rentableArea: null,
        remark: null
      },
      buildingList: [],
      floorList: [],
      baseInfoRules: {
        assetId: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        roomNo: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        address: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' },
        ],
        pointType: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        diverseType: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        diverseRemark: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    getDetail () {
      const projectId = this.$route.params.id
      diverseDetail({id: projectId}).then(res => {
        const data = res.data
        for (const key in data) {
          if (this.baseInfo.hasOwnProperty(key)) {
            this.baseInfo[key] = data[key]
          }
          if (this.other.hasOwnProperty(key)) {
            this.other[key] = data[key]
          }
        }
        this.getBuildingList('init')
      })
    },
    getRoomNo () {
      const assetId = this.baseInfo.assetId
      getRoomNo(assetId).then(res => {
        if (res.code === '0') {
          this.baseInfo.roomNo = res.data
        }
        this.getBuildingList()
      })
    },
    // 获取楼栋
    getBuildingList (type) {
      if (type !== 'init') {
        this.other.buildingId = null
        this.other.floorId = null
      }
      const assetId = this.baseInfo.assetId
      getBuildingNameList({'assetId': assetId}).then(res => {
        this.buildingList = res
        if (type) {
          this.getFloorList('init')
        }
      })
    },
    // 获取楼层
    getFloorList (type) {
      if (type !== 'init') {
        this.other.floorId = null
      }
      let buildingId
      this.buildingList.forEach(element => {
        if (element.id === this.other.buildingId) {
          buildingId = element.id
        }
      })
      getFloorNameList({'buildingId': buildingId}).then(res => {
        this.floorList = res
      })
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/asset/multiplePoints')
    },
    add () {
      let check = false
      this.$refs.baseInfo.validate(valid => {
        check = valid
      })
      if (!check) return false
      const params = {
        id: this.$route.params.id,
        assetId: this.baseInfo.assetId,
        buildingId: this.other.buildingId,
        floorId: this.other.floorId,
        roomNo: this.baseInfo.roomNo,
        address: this.baseInfo.address,
        pointType: this.baseInfo.pointType,
        diverseType: this.baseInfo.diverseType,
        diverseRemark: this.baseInfo.diverseRemark,
        inOrOut: this.other.inOrOut,
        isOpenAir: this.other.isOpenAir,
        rentableArea: this.other.rentableArea,
        remark: this.other.remark
      }
      diverseUpdate(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          // 删除路由
          this.$destroy()
          this.$store.dispatch('setRouteList', {
            route: this.$route,
            type: 'delete'
          })
          this.$router.push('/asset/multiplePoints/detail/' + res.data)
        }
      })
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getDetail()
  },
  components: {
    CitySelect,
    InputNumber
  }
}
</script>
<style lang="scss" scoped>
#multiplePoints-edit{
  .btn-group{
    background: #fff;
    padding: 20px;
    overflow: hidden;
  }
}
</style>
<style lang="scss">
#multiplePoints-edit .left-wrapper .el-form-item__label{
  text-align: right;
}
#multiplePoints-edit .input-unit .el-input__inner{
  padding-right: 30px;
}
#multiplePoints-edit .el-input-group__append{
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

<!--
 * @Author: your name
 * @Date: 2020-06-24 20:33:04
 * @LastEditTime: 2020-10-29 14:48:32
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\building\create.vue
-->
<template>
  <div id="building-create" class="YJ-create">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block" style="margin-bottom: -18px;">
        <div class="filter-infor-wrapper remove-style">
          <el-form
            :inline="true"
            ref="baseInfo"
            :rules="baseInfoRules"
            :model="ruleForm"
            size="small"
            label-position ="right"
            label-width="130px">
            <el-form-item label="项目名称" prop="assetId" required>
              <el-select
                v-model="ruleForm.assetId"
                @change="queryFQ()"
                placeholder="请选择项目">
                <el-option
                  v-for="item in projectNameList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="楼栋名称" prop="buildingName" required>
              <el-input v-model="ruleForm.buildingName" placeholder="请输入楼栋名称"></el-input>
            </el-form-item>
            <el-form-item v-if="assetLayout == 3" label="所属分期" prop="stagesId" required>
              <el-select
                v-model="ruleForm.stagesId"
                placeholder="请选择所属分期">
                <el-option
                  v-for="item in stageList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.stagesName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item v-if="assetLayout == 3" label="建筑形态" prop="buildingForm">
              <el-select
                v-model="ruleForm.buildingForm"
                placeholder="请选择建筑形态">
                <el-option
                  v-for="item in [{id:1,name:'独栋'},{id:2,name:'多层'},{id:3,name:'高层'}]"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">建筑信息</div>
      <div class="new-block">
        <div class="filter-infor-wrapper remove-style">
          <el-form
            :inline="true"
            ref="building"
            :rules="buildingRules"
            :model="ruleForm"
            size="small"
            label-position ="right"
            label-width="130px">
            <el-form-item label="总建筑面积" prop="totalBuildingArea" required>
              <InputNumber
                :value="ruleForm.totalBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.totalBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地上建筑面积" prop="groundAreaUp">
              <InputNumber
                :value="ruleForm.groundAreaUp"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.groundAreaUp = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地下建筑面积" prop="groundAreaDown">
              <InputNumber
                :value="ruleForm.groundAreaDown"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.groundAreaDown = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总套内面积" prop="innerArea">
              <InputNumber
                :value="ruleForm.innerArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.innerArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 商业 -->
            <el-form-item v-if="assetLayout == 2" label="总经营面积" prop="operatingArea">
              <InputNumber
                :value="ruleForm.operatingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.operatingArea = result">
              </InputNumber>
            </el-form-item>
            <!-- 办公 -->
            <el-form-item v-if="assetLayout == 1 || assetLayout == 3" label="总配套商业面积" prop="businessArea">
              <InputNumber
                :value="ruleForm.businessArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.businessArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总可出租面积" prop="rentableArea" required>
              <InputNumber
                :value="ruleForm.rentableArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.rentableArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="首层层高" prop="firstFloorHeight">
              <InputNumber
                :value="ruleForm.firstFloorHeight"
                placeholder="保留2位小数"
                className="input-unit"
                unit="m"
                @input="result => ruleForm.firstFloorHeight = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="首层面积" prop="firstFloorArea">
              <InputNumber
                :value="ruleForm.firstFloorArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.firstFloorArea = result">
              </InputNumber>
            </el-form-item>

            <el-form-item label="标准层层高" prop="standardFloorHeight">
              <InputNumber
                :value="ruleForm.standardFloorHeight"
                placeholder="保留2位小数"
                className="input-unit"
                unit="m"
                @input="result => ruleForm.standardFloorHeight = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="标准层面积" prop="standardFloorArea">
              <InputNumber
                :value="ruleForm.standardFloorArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.standardFloorArea = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
      </div>

      <div class="new-block-title">产权信息</div>
      <div class="new-block">
        <div class="filter-infor-wrapper remove-style">
          <el-form
            :inline="true"
            :model="ruleForm"
            size="small"
            label-position ="right"
            label-width="130px">
            <el-form-item label="竣工时间" prop="completedDate">
              <el-date-picker
                v-model="ruleForm.completedDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="交付时间" prop="deliverDate">
              <el-date-picker
                v-model="ruleForm.deliverDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item v-if="assetLayout == 2" label="开业时间" prop="openingDate">
              <el-date-picker
                v-model="ruleForm.openingDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>

          </el-form>
        </div>
      </div>

      <div v-if="assetLayout == 3" class="new-block-title">企业信息</div>
      <div class="new-block" v-if="assetLayout == 3">
        <div class="filter-infor-wrapper remove-style">
          <el-form
            :inline="true"
            :model="ruleForm"
            size="small"
            label-position ="right"
            label-width="130px">
            <el-form-item label="资产拥有方"
              v-for="(item, index) in assetOwner"
              :key="index">
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
        </div>
      </div>

      <div  v-if="assetLayout == 3" class="new-block-title">经营公司</div>
      <div class="new-block" v-if="assetLayout == 3">
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

      <div class="new-block-title" v-if="assetLayout == 3">物管公司</div>
      <div class="new-block"  v-if="assetLayout == 3">
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

      <div class="btn-group">
        <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
        <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click="cancel">取消</el-button>
      </div>
    </div>
  </div>
</template>
<script>
import {addBsBuilding, queryFQByAssetId, quotaLayoutCheck} from '@/http/assets'
import { mapState } from 'vuex'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
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
      }],
      assetLayout: '1',
      buildingList: [],
      stageList: [],
      ruleForm: {
        assetId: '',
        stagesId: '',
        buildingForm: '',
        buildingName: '',
        totalBuildingArea: '',
        groundAreaUp: '',
        groundAreaDown: '',
        innerArea: '',
        operatingArea: '',
        businessArea: '',
        rentableArea: '',
        firstFloorHeight: '',
        firstFloorArea: '',
        standardFloorHeight: '',
        standardFloorArea: '',
        completedDate: '',
        deliverDate: '',
        openingDate: ''
      },
      baseInfoRules: {
        assetId: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        stagesId: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        buildingName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
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
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  watch: {
    'ruleForm.assetId': {
      handler () {
        this.projectNameList.filter(item => {
          if (Number(item.id) === Number(this.ruleForm.assetId)) {
            this.assetLayout = item.assetLayout
            // 配额业态校验
            const params = {
              mainId: this.merchant.id,
              quotaType: '3',
              addCount: '1',
              addArea: null,
              assetLayout: this.assetLayout
            }
            quotaLayoutCheck(params)
          }
        })
      }
    }
  },
  methods: {
    queryFQ () {
      queryFQByAssetId({assetId: this.ruleForm.assetId}).then(res => {
        this.stageList = res.data
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
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/asset/building')
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
      const baseInfo = ['assetId', 'buildingName', 'stagesId']
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
      ]
      const params = {
        'mainId': this.merchant.id,
        'assetId': this.ruleForm.assetId,
        'stagesId': this.ruleForm.stagesId,
        'buildingForm': this.ruleForm.buildingForm,
        'assetName': this.getValueById(this.projectNameList, 'assetId', 'assetName'),
        'buildingLayout': this.assetLayout,
        'buildingCode': '',
        'createName': this.$store.getters.userInfo.name,
        'buildingName': this.ruleForm.buildingName,
        'beCompletedDate': this.ruleForm.completedDate,
        'openingDate': this.ruleForm.openingDate,
        'deliverDate': this.ruleForm.deliverDate,
        'totalBuildingArea': this.ruleForm.totalBuildingArea,
        'innerArea': this.ruleForm.innerArea,
        'businessArea': this.ruleForm.businessArea,
        'rentableArea': this.ruleForm.rentableArea,
        'groundAreaUp': this.ruleForm.groundAreaUp,
        'groundAreaDown': this.ruleForm.groundAreaDown,
        'floorCountUp': '',
        'floorCountDown': '',
        'firstFloorHeight': this.ruleForm.firstFloorHeight,
        'standardFloorHeight': this.ruleForm.standardFloorHeight,
        'firstFloorArea': this.ruleForm.firstFloorArea,
        'standardFloorArea': this.ruleForm.standardFloorHeight,
        'escalator': '',
        'directPassengerElevator': '',
        'sightseeingLift': '',
        'remark': '',
        'sort': '',
        'bsAssetEnterpriseDTOList': bsAssetEnterpriseDTOList,
      }
      addBsBuilding(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          // 删除路由
          this.$destroy()
          this.$store.dispatch('setRouteList', {
            route: this.$route,
            type: 'delete'
          })
          this.$router.push(`/asset/building/detail/${res.data}`)
        }
      })
    }
  },
  components: {
    InputNumber
  },
  activated () {
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
</style>
<style lang="scss">
#building-create .input-unit .el-input__inner{
  padding-right: 30px;
}
#building-create .el-input-group__append{
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
</style>

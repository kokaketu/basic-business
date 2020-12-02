<!--
 * @Author: your name
 * @Date: 2020-06-28 20:34:45
 * @LastEditTime: 2020-09-03 17:41:09
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\rentalUnit\edit.vue
-->
<template>
  <div id="rentalUnit-edit">
    <!-- 基本信息 -->
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form :inline="true" ref="baseInfo" :rules="baseInfoRules" :model="ruleForm" size="small" label-width="150px">
            <el-form-item label="项目名称" prop="assetName" required>
              <el-input disabled v-model="ruleForm.assetName"></el-input>
            </el-form-item>
            <el-form-item label="楼栋名称" prop="buildingName" required>
              <el-input disabled v-model="ruleForm.buildingName"></el-input>
            </el-form-item>
            <el-form-item label="楼层名称" prop="floorName" required>
              <el-input disabled v-model="ruleForm.floorName"></el-input>
            </el-form-item>
            <el-form-item label="租赁单元编号" prop="roomNo" required>
              <el-input v-model="ruleForm.roomNo" placeholder="请输入租赁单元编号"></el-input>
            </el-form-item>
            <br v-show="assetLayout !== '2'"/>
            <el-form-item v-show="assetLayout === '2'" label="店型定位" prop="storePositioning" >
              <el-select v-model="ruleForm.storePositioning" placeholder="请选择店型定位">
                <el-option
                  v-for="item in storePositioning"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item v-show="assetLayout === '2'" label="业态定位" prop="layoutPositioning" >
              <el-select v-model="ruleForm.layoutPositioning" placeholder="请选择业态定位">
                <el-option
                  v-for="item in layoutPositioning"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="总建筑面积" prop="buildingArea" required>
              <InputNumber
                :value="ruleForm.buildingArea"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.buildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="套内面积" prop="innerArea">
              <InputNumber
                :value="ruleForm.innerArea"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.innerArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="可出租面积" prop="rentableArea" required>
              <InputNumber
                :value="ruleForm.rentableArea"
                placeholder="请输入，保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => ruleForm.rentableArea = result">
              </InputNumber>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">工程条件</div>
      <div class="new-block">
        <div class="filter-wrapper remove-style">
          <el-form
            :inline="true"
            ref="engineering"
            :model="engineering"
            size="small"
            label-width="150px">
            <el-form-item label="天花" prop="ceiling">
              <el-select
                v-model="engineering.ceiling"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in engineeringObject.ceiling"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="地面" prop="ground">
              <el-select
                v-model="engineering.ground"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in engineeringObject.ground"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="结构/荷载(KN/㎡)" prop="structure">
              <InputNumber
                :value="engineering.structure"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.structure = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="门窗(数量)" prop="windowNum">
              <el-input
                v-model="engineering.windowNum"
                placeholder="请输入整数"
                @input="handelInteger(engineering.windowNum, 'windowNum')">
              </el-input>
            </el-form-item>
            <el-form-item label="门窗大小(m)" prop="windowSize">
              <el-input
                v-model="engineering.windowSize"
                placeholder="请输入长*宽">
              </el-input>
            </el-form-item>
            <el-form-item label="柱距(m)" prop="pillarSpacing">
              <InputNumber
                :value="engineering.pillarSpacing"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.pillarSpacing = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="门头/店招(m)" prop="signHeight">
              <InputNumber
                :value="engineering.signHeight"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.signHeight = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="空调数量" prop="airConditioning">
              <el-input
                v-model="engineering.airConditioning"
                placeholder="请输入整数"
                @input="handelInteger(engineering.airConditioning, 'airConditioning')">
              </el-input>
            </el-form-item>
            <el-form-item label="强电(相数)" prop="strongCurrentType">
              <el-select
                v-model="engineering.strongCurrentType"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in engineeringObject.strongCurrentType"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="强电(功率)(KW)" prop="strongCurrentPower">
              <el-input
                v-model="engineering.strongCurrentPower"
                placeholder="请输入整数"
                @input="handelInteger(engineering.strongCurrentPower, 'strongCurrentPower')">
              </el-input>
            </el-form-item>
            <el-form-item label="弱电(网络接口)" prop="networkInterface">
              <el-select
                v-model="engineering.networkInterface"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in engineeringObject.networkInterface"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="给水(数量)" prop="waterSupplyNum">
              <el-input
                v-model="engineering.waterSupplyNum"
                placeholder="请输入整数"
                @input="handelInteger(engineering.waterSupplyNum, 'waterSupplyNum')">
              </el-input>
            </el-form-item>
            <el-form-item label="给水(管径)(mm)" prop="waterSupplyPipeDiameter">
              <InputNumber
                :value="engineering.waterSupplyPipeDiameter"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.waterSupplyPipeDiameter = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="排水(数量)" prop="drainNum">
              <el-input
                v-model="engineering.drainNum"
                placeholder="请输入整数"
                @input="handelInteger(engineering.drainNum, 'drainNum')">
              </el-input>
            </el-form-item>
            <el-form-item label="排水(管径)(mm)" prop="drainPipeDiameter">
              <InputNumber
                :value="engineering.drainPipeDiameter"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.drainPipeDiameter = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="排烟(数量)" prop="smokeExhaustNum">
              <el-input
                v-model="engineering.smokeExhaustNum"
                placeholder="请输入整数"
                @input="handelInteger(engineering.smokeExhaustNum, 'smokeExhaustNum')">
              </el-input>
            </el-form-item>
            <el-form-item label="排烟(管径)(mm)" prop="smokeExhaustPipeDiameter">
              <InputNumber
                :value="engineering.smokeExhaustPipeDiameter"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.smokeExhaustPipeDiameter = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="天然气(数量)" prop="naturalGasNum">
              <el-input
                v-model="engineering.naturalGasNum"
                placeholder="请输入整数"
                @input="handelInteger(engineering.naturalGasNum, 'naturalGasNum')">
              </el-input>
            </el-form-item>
            <el-form-item label="天然气管径(mm)" prop="naturalGasPipeDiameter">
              <InputNumber
                :value="engineering.naturalGasPipeDiameter"
                placeholder="保留2位小数"
                className="input-unit"
                @input="result => engineering.naturalGasPipeDiameter = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="消防(喷淋头数量)" prop="sprinkler">
              <el-input
                v-model="engineering.sprinkler"
                placeholder="请输入整数"
                @input="handelInteger(engineering.sprinkler, 'sprinkler')">
              </el-input>
            </el-form-item>
            <el-form-item label="消防(烟雾感应数量)" prop="smokeSensor">
              <el-input
                v-model="engineering.smokeSensor"
                placeholder="请输入整数"
                @input="handelInteger(engineering.smokeSensor, 'smokeSensor')">
              </el-input>
            </el-form-item>
            <el-form-item label="消防(温度感应数量)" prop="temperatureSensor">
              <el-input
                v-model="engineering.temperatureSensor"
                placeholder="请输入整数"
                @input="handelInteger(engineering.temperatureSensor, 'temperatureSensor')">
              </el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">一铺一价</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="yearPriceData"
            border
            style="width: 100%;">
            <el-table-column
              prop="year"
              label="年份">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.year"
                  type="year"
                  value-format="yyyy"
                  placeholder="选择年">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="price"
              label="单价（元/㎡/月）">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.price"
                  placeholder="请输入单价"
                  className="input-unit"
                  @input="result => scope.row.price = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              label="操作"
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addRow()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removeRow(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" @click.native="close" style="margin-right: 10px">取消</el-button>
    </div>
  </div>
</template>
<script>
import {
  queryStorePositioning,
  queryLayoutPositioning,
  bsRoomUpd,
  bsRoomDetail
} from '@/http/assets'
import { mapState } from 'vuex'
import { engineeringObject } from './rentalUnit'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
      assetLayout: '1',
      buildingList: [],
      floorList: [],
      storePositioning: [],
      layoutPositioning: [],
      ruleForm: {
        assetName: '',
        assetId: '',
        buildingName: '',
        buildingId: '',
        floorName: '',
        floorId: '',
        roomNo: '',
        storePositioning: '',
        layoutPositioning: '',
        buildingArea: '',
        innerArea: '',
        rentableArea: ''
      },
      baseInfoRules: {
        assetId: [
          { required: true, message: '请选择项目名称', trigger: 'blur' },
          { required: true, message: '请选择项目名称', trigger: 'change' }
        ],
        buildingId: [
          { required: true, message: '请选择楼栋名称', trigger: 'blur' },
          { required: true, message: '请选择楼栋名称', trigger: 'change' }
        ],
        floorId: [
          { required: true, message: '请选择楼层名称', trigger: 'blur' },
          { required: true, message: '请选择楼层名称', trigger: 'change' }
        ],
        roomNo: [
          { required: true, message: '请输入租赁单元编号', trigger: 'blur' },
          { required: true, message: '请输入租赁单元编号', trigger: 'change' }
        ],
        // storePositioning: [
        //   { required: true, message: '请选择店型定位', trigger: 'blur' },
        //   { required: true, message: '请选择店型定位', trigger: 'change' }
        // ],
        // layoutPositioning: [
        //   { required: true, message: '请选择业态定位', trigger: 'blur' },
        //   { required: true, message: '请选择业态定位', trigger: 'change' }
        // ],
        buildingArea: [
          { required: true, message: '请输入总建筑面积', trigger: 'blur' },
          { required: true, message: '请输入总建筑面积', trigger: 'change' }
        ],
        // innerArea: [
        //   { required: true, message: '请输入总套内面积', trigger: 'blur' },
        //   { required: true, message: '请输入总套内面积', trigger: 'change' }
        // ],
        rentableArea: [
          { required: true, message: '请输入总可出租面积', trigger: 'blur' },
          { required: true, message: '请输入总可出租面积', trigger: 'change' }
        ]
      },
      engineeringObject: engineeringObject,
      engineering: {
        ceiling: '',
        ground: '',
        structure: '',
        windowNum: '',
        windowSize: '',
        pillarSpacing: '',
        signHeight: '',
        airConditioning: '',
        strongCurrentType: '',
        strongCurrentPower: '',
        networkInterface: '',
        waterSupplyNum: '',
        waterSupplyPipeDiameter: '',
        drainNum: '',
        drainPipeDiameter: '',
        smokeExhaustNum: '',
        smokeExhaustPipeDiameter: '',
        naturalGasNum: '',
        naturalGasPipeDiameter: '',
        sprinkler: '',
        smokeSensor: '',
        temperatureSensor: ''
      },
      yearPriceData: []
    }
  },
  computed: mapState(['merchant']),
  methods: {
    handelInteger (val, props) {
      this.engineering[props] = this.engineering[props].replace(/[^0-9]/g, '')
    },
    addRow () {
      this.yearPriceData.push({
        year: '',
        price: ''
      })
    },
    removeRow (index) {
      this.yearPriceData.splice(index, 1)
    },
    getDetail () {
      this.assetLayout = this.$route.params.assetLayout
      const id = this.$route.params.id
      bsRoomDetail({id: id}, this.assetLayout).then(res => {
        Object.keys(this.ruleForm).map(item => {
          this.ruleForm[item] = res[item]
        })

        if (res.bsRoomConditionsDTO) {
          Object.keys(this.engineering).map(item => {
            this.engineering[item] = res.bsRoomConditionsDTO[item]
          })
        }

        let relust = res.bsRoomYearPriceDTOS
        if (relust.length === 0) {
          this.yearPriceData = [{
            year: '',
            price: ''
          }]
        } else {
          relust.forEach(item => {
            if (item.year) {
              item.year = item.year + ''
            }
          })
          this.yearPriceData = relust
        }
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
    getValueById (obj, id, name) {
      return obj.filter(item => {
        if (item.id === this.ruleForm[id]) {
          return item
        }
      })[0][name]
    },
    close () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/asset/rentalUnit')
    },
    add () {
      const baseInfoArr = []
      const dealedKey = this.assetLayout === '2'
        ? ['assetId', 'buildingId', 'floorId', 'roomNo', 'storePositioning', 'layoutPositioning', 'buildingArea', 'innerArea', 'rentableArea']
        : ['assetId', 'buildingId', 'floorId', 'roomNo', 'buildingArea', 'innerArea', 'rentableArea']
      dealedKey.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.filter(item => item).length === 0
      if (!baseInfoBool) return false
      const type = this.assetLayout

      let params = {}
      dealedKey.map(item => {
        const value = this.ruleForm[item]
        params[item] = value
      })
      params.id = this.$route.params.id

      params.bsRoomConditionsDTO = this.engineering
      params.bsRoomYearPriceDTOS = []

      let islock = true
      this.yearPriceData.forEach(item => {
        if (item.year && item.price) {
          params.bsRoomYearPriceDTOS.push(item)
        } else if (!item.year && !item.price) {
          return false
        } else {
          this.$message.warning('请输入年份或单价')
          islock = false
          return false
        }
      })

      if (islock) {
        bsRoomUpd(params, type).then(res => {
          if (res.code === '0') {
            this.$message.success(res.msg)
            setTimeout(this.close(), 2000)
            // this.$parent.handleClose()
            // this.$route.params.assetLayout === '2' ? this.$parent.$parent.getBsStoreList() : this.$parent.$parent.getrentalUnitList()
          }
        })
      }
    }
  },
  components: {
    InputNumber
  },
  activated () {
    this.getStorePositioning()
    this.getLayoutPositioning()
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
      cursor: pointer;
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
#rentalUnit-edit .input-unit .el-input__inner{
  padding-right: 30px;
}
#rentalUnit-edit .el-input-group__append{
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

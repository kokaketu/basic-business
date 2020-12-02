<template>
  <div id="staging-edit">
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="baseInfo"
            :rules="baseInfoRules"
            :model="detailObject"
            size="small"
            label-width="90px">
            <el-form-item label="项目名称" prop="assetId" required>
              <el-select
                v-model="detailObject.assetId"
                placeholder="请选择项目名称"
                disabled>
                <el-option
                  class='select-option-selected'
                  v-for="item in projectNameList"
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="分期编号" prop="stagesCode" required>
              <el-input v-model="detailObject.stagesCode" placeholder="请输入分期编号"></el-input>
            </el-form-item>
            <el-form-item label="分期名称" prop="stagesName" required>
              <el-input v-model="detailObject.stagesName" placeholder="请输入分期名称"></el-input>
            </el-form-item><br/>
            <!-- <el-form-item label="项目名称" prop="assetName" required>
              <el-input v-model="baseInfo.assetName" placeholder="请输入项目名称"></el-input>
            </el-form-item><br/> -->
            <el-form-item label="经营阶段" prop="operationStage">
              <el-select
                v-model="detailObject.operationStage"
                placeholder="请选择经营阶段">
                <el-option
                  class='select-option-selected'
                  v-for="item in [{value: '1', label: '未营业'},{value: '2', label: '试营业'},{value: '3', label: '筹备期'}, {value: '4', label: '培育期'}, {value: '5', label: '成熟期'}]"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="车位个数" prop="parkingLotNum">
              <el-input v-model="detailObject.parkingLotNum" placeholder="请输入车位数，支持整数" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="number">
              </el-input>
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
            :model="detailObject"
            :rules="buildingRules"
            size="small"
            label-width="120px">
            <el-form-item label="总建筑面积" prop="totalBuildingArea" required>
              <InputNumber
                :value="detailObject.totalBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.totalBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地上建筑面积" prop="groundAreaUp">
              <InputNumber
                :value="detailObject.groundAreaUp"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.groundAreaUp = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地下建筑面积" prop="groundAreaDown">
              <InputNumber
                :value="detailObject.groundAreaDown"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.groundAreaDown = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总套内面积" prop="innerArea">
              <InputNumber
                :value="detailObject.innerArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.innerArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总可出租面积" prop="rentableArea" required>
              <InputNumber
                :value="detailObject.rentableArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.rentableArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item
              label="总配套商业面积"
              prop="businessArea">
              <InputNumber
                :value="detailObject.businessArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => detailObject.businessArea = result">
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
            :model="detailObject"
            size="small"
            label-width="110px">
            <el-form-item label="竣工时间" prop="completedDate" >
              <el-date-picker
                v-model="detailObject.completedDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="交付时间" prop="deliverDate" >
              <el-date-picker
                v-model="detailObject.deliverDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" style="margin-right: 10px;" @click.native="cancel">取消</el-button>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { getStagingDetail, updBsAssetStages } from '@/http/assets'
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
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
      baseInfoRules: {
        stagesCode: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        stagesName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        assetId: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      },
      detailObject: {
        completedDate: '',
        deliverDate: '',
        assetId: '',
        stagesCode: '',
        stagesName: '',
        operationStage: '',
        parkingLotNum: '',
        totalBuildingArea: '',
        groundAreaUp: '',
        groundAreaDown: '',
        innerArea: '',
        rentableArea: '',
        businessArea: ''
      }
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  components: {
    InputNumber
  },
  methods: {
    add () {
      const baseInfoArr = []
      const baseInfo = ['assetId', 'stagesCode', 'stagesName']
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

      let params = this.detailObject
      params.id = this.$route.params.id
      params.mainId = this.merchant.id
      updBsAssetStages(params).then(res => {
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
          this.$router.push('/asset/staging')
        }
      })
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      const contractID = this.$route.params.id
      this.$router.push('/asset/staging/detail/' + contractID)
    },
    getDetail () {
      const projectId = this.$route.params.id
      getStagingDetail({id: projectId}).then(res => {
        for (const key in this.detailObject) {
          this.detailObject[key] = res[key]
        }
      })
    }
  },
  activated () {
    this.getDetail()
  }
}
</script>

<style lang="scss" scoped>
.btn-group {
  background: #fff;
  padding: 20px;
  overflow: hidden;
}
</style>
<style lang="scss">
#staging-edit .left-wrapper .el-form-item__label{
  text-align: right;
}
#staging-edit .input-unit .el-input__inner{
  padding-right: 30px;
}
#staging-edit .el-input-group__append{
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

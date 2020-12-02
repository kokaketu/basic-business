<!--
 * @Author: winerss
 * @Date: 2020-05-25 18:14:25
 * @LastEditTime: 2020-08-06 19:59:12
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\distribution\index.vue
-->
<template>
  <div id="distribution" class="page">
    <div class="filter">
      <el-form :inline="true" size="small" label-width="88px">

        <el-form-item label="项目名称：">
          <el-select
            v-model="projectName"
            @change = "getBuildingListThis"
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

        <el-form-item label="楼栋名称：">
          <el-select
            no-data-text="请先选择项目"
            v-model="buildingName"
            @change = "selectBuilding"
            placeholder="请选择楼栋">
            <el-option
              v-for="item in buildingList"
              class='select-option-selected'
              :key="item.id"
              :label="item.buildingStages"
              :value="item.id">
              <span style="float: left">{{ item.buildingName }}</span>
              <span v-show="item.stagesName" class="select-stages-tip">({{ item.stagesName }})</span>
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
    </div>
    <div class="tab">
      <div class="items">
        <el-select
          class="pull-left"
          style="margin: 25px 20px;width: 150px;"
          v-model="type"
          size="small"
          @change="getList"
          placeholder="请选择分析分类">
          <el-option
            v-for="item in types"
            class='select-option-selected'
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
        <div class="item"
          v-for="(item, index) in floorTotal"
          :key="index">
          <div class="color" :style="{
            background: colors[item.type.includes('空铺') ?
            colors.length-1 :
            item.color]}"></div>
          <div class="content">
            <p class="name">{{item.type}}</p>
            <p class="value">{{item.value}}&nbsp;{{item.supplement}}</p>
          </div>
        </div>
      </div>
    </div>
    <Floor :floor="floor" :assetId = 'assetId' :assetType='assetType'/>
  </div>
</template>
<script>
import Floor from './floor'
import { getAssetNameList, getBuildingList } from '../../asset/assets'
import { queryData } from '@/http/rentControl'
import { mapState } from 'vuex'

const officeTypes = [{label: '出租情况', value: 'office_rent'}, {label: '行业分布', value: 'office_inine'}, {label: '租金分布', value: 'office_therent'}]
const businessTypes = [{label: '出租情况', value: 'business_rent'}, {label: '业态分布', value: 'business_inine'}, {label: '租金分布', value: 'business_therent'}]
const parkTypes = [{label: '出租情况', value: 'park_rent'}, {label: '行业分布', value: 'park_inine'}, {label: '租金分布', value: 'park_therent'}]
export default {
  data () {
    return {
      projectName: '',
      buildingName: '',
      colors: ['#70D7B8', '#C0E086', '#DD7471', '#8D9EE6', '#DFC392', '#75AEF2', '#A07BEC', '#CFD1DA', '#EEE27E', 'rgba(207,209,218,1)'],
      types: '',
      type: '',
      assetType: '',
      assetId: '',
      projectNameList: [],
      buildingList: [],
      floor: null,
      floorTotal: null
    }
  },
  computed: mapState(['merchant']),
  components: {
    Floor
  },
  methods: {
    // 获取项目名称
    getProjectList () {
      getAssetNameList(this.merchant.id).then(res => {
        this.projectNameList = res
        this.projectName = res[0].id
        this.getBuildingListThis()
      })
    },
    checkTypes (assetLayout) {
      if (Number(assetLayout) === 1) {
        this.types = officeTypes
      } else if (Number(assetLayout) === 2) {
        this.types = businessTypes
      } else {
        this.types = parkTypes
      }
      this.type = this.types[0].value
    },
    // 切换项目，获取楼栋
    getBuildingListThis () {
      this.buildingName = ''
      this.buildingList = []
      this.floor = []
      this.floorTotal = []
      this.type = ''
      this.types = []
      this.projectNameList.forEach(element => {
        if (element.id === this.projectName) {
          this.assetId = element.id
          this.assetType = element.assetLayout
        }
      })
      getBuildingList(this.assetId).then(res => {
        if (res && res.length > 0) {
          this.checkTypes(this.assetType)
          this.buildingList = res
          this.buildingList.forEach(item => {
            item.buildingStages = item.buildingName + (item.stagesName ? `(${item.stagesName})` : '')
          })
          this.buildingName = res[0].id
          this.getList()
        }
      })
    },
    selectBuilding () {
      this.type = this.types[0].value
      this.getList()
    },
    // 获取列表
    getList () {
      console.log(this.type)
      let parmas = {
        assetId: this.projectName,
        buildingId: this.buildingName,
        dimension: this.type
      }
      queryData(parmas).then(res => {
        try {
          this.floorTotal = res.floorTotal
          let floor = res.floor
          floor.forEach(element => {
            if (element.room && element.room.length > 50) {
              element.room = element.room.slice(0, 50)
            }
            element.room.map(item => {
              item.size = item.size + '%'
            })
          })
          const rentableAreas = floor.map(item => Number(item.rentableArea))
          const max = Math.max(...rentableAreas)
          floor = floor.map(item => {
            item.width = parseFloat(item.rentableArea / max) * 100
            return item
          })
          this.floor = floor
        } catch (error) {
          this.floor = []
          this.floorTotal = []
        }
      })
    }
  },
  activated () {
    this.getProjectList()
  }
}
</script>
<style lang="scss" scoped>
#distribution{
  border-radius:6px;
  border:1px solid rgba(227,226,226,1);
  overflow: hidden;
  .filter{
    height: 80px;
    box-sizing: border-box;
    padding-top: 20px;
    padding-left: 20px;
    padding-right: 20px;
    padding-bottom: 2px;
    background: #fff;
  }
  .tab{
    height:82px;
    background:rgba(246,246,246,1);
    .items{
      .item{
        float: left;
        margin-left: 20px;
        margin-top: 20px;
        .color{
          float: left;
          width: 30px;
          height: 42px;
          margin-right: 8px;
        }
        .content{
          float: left;
          overflow: hidden;
          .name{
            line-height: 20px;
            font-weight: 500;
            font-size: 15px;
            color: #333;
          }
          .value{
            line-height: 24px;
            font-size: 12px;
            color: #666666;
          }
        }
      }
    }
  }
}
</style>

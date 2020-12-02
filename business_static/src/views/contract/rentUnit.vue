<!--
 * @Author: your name
 * @Date: 2020-06-04 16:13:13
 * @LastEditTime: 2020-08-11 17:17:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\rentUnit.vue
-->
<template>
  <div id="rent-unit">
    <div class="table-wrapper table-input">
      <el-table
        :data="tableData"
        border
        style="width: 100%;">
        <el-table-column
          prop="building"
          label="选择楼栋">
          <template slot-scope="scope">
            <el-select
              v-model="scope.row.building"
              placeholder="请选择"
              @change="getFloorList()">
              <el-option
                v-for="item in buildingList"
                class='select-option-selected'
                :key="item.id"
                :label="item.buildingName"
                :value="item.id">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column
          prop="floor"
          label="选择楼层">
          <template slot-scope="scope">
            <el-select
              v-model="scope.row.floor"
              placeholder="请选择"
              @change="getrentalunitList()">
              <el-option
                v-for="item in floorList"
                class='select-option-selected'
                :key="item.id"
                :label="item.floorName"
                :value="item.id">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column
          prop="unit"
          label="选择租赁单元">
          <template slot-scope="scope">
            <!-- <el-autocomplete
              v-model="scope.row.unit"
              :trigger-on-focus="false"
              :fetch-suggestions="querySearchAsync"
              @select = "handleSelect"
              placeholder="请选择，支持模糊搜索">
            </el-autocomplete> -->
            <el-select
              v-model="scope.row.unit"
              placeholder="请选择"
              @change="handleSelect">
              <el-option
                v-for="item in rentalunitList"
                class='select-option-selected'
                :key="item.id"
                :label="item.unitNo"
                :value="item.id">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
      </el-table>
      <div class="footer">
        <el-button class="btn" @click.native="closeDialog('confirm')">确定</el-button>
        <el-button class="btn btn-default" @click.native="closeDialog('cancel')">取消</el-button>
      </div>
    </div>
  </div>
</template>
<script>
import { getBuildingList, getFloorList } from '@/views/asset/assets'
import { getRentUnitList } from '@/http/contract'
export default {
  props: ['type', 'assetId'],
  data () {
    return {
      tableData: [{building: '', floor: '', unit: ''}],
      buildingList: [],
      floorList: [],
      unitList: [],
      unit: {},
      rentalunitList: []
    }
  },
  methods: {
    // 获取楼栋
    getBuildingList (assetId) {
      this.tableData.map(item => {
        for (const key in item) {
          if (item.hasOwnProperty(key)) {
            item[key] = ''
          }
        }
      })
      getBuildingList(assetId).then(res => {
        this.buildingList = res
      })
    },
    // 获取楼层
    getFloorList () {
      this.tableData[0].floor = ''
      this.tableData[0].unit = ''
      let buildingId
      this.buildingList.forEach(element => {
        if (element.id === this.tableData[0].building) {
          buildingId = element.id
        }
      })
      getFloorList(buildingId).then(res => {
        this.floorList = res
      })
    },
    querySearchAsync (queryString, cb) {
      let params = {
        assetId: this.assetId,
        buildingId: this.tableData[0].building,
        floorId: this.tableData[0].floor,
        keywords: this.tableData[0].unit
      }
      getRentUnitList(params).then(res => {
        res.forEach(item => {
          item.value = item.unitNo
          item.rentArea = item.rentableArea
        })
        cb(res)
      })
    },
    getrentalunitList () {
      let params = {
        assetId: this.assetId,
        buildingId: this.tableData[0].building,
        floorId: this.tableData[0].floor
      }
      getRentUnitList(params).then(res => {
        res.forEach(item => {
          item.value = item.unitNo
          item.rentArea = item.rentableArea
        })
        this.rentalunitList = res
      })
    },
    // handleSelect (item) {
    //   this.unit = item
    // },
    handleSelect (id) {
      this.unit = this.rentalunitList.filter(item => item.id === id)[0]
    },
    closeDialog (type) {
      if (type === 'confirm') {
        const unit = this.unit
        unit.roomId = this.unit.id
        this.$emit('accpectUnit', unit)
      } else {
        this.$emit('accpectUnit')
      }
    }
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
#rent-unit {
  .table-input {
    .el-select {
      width: 100%;
    }
  }
  .footer{
    width: 200px;
    margin: 20px auto 0;
    text-align: center;
  }
}
</style>

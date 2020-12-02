<template>
  <div id="asset-unit" class="page">
    <div class="filter-wrapper">
      <el-form
        :inline="true"
        :model="ruleForm"
        size="small"
        label-width="90px">
        <el-form-item label="项目名称：">
          <el-select
            clearable
            @change="getBuildingList"
            v-model="ruleForm.assetId"
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
            clearable
            @change="getFloorList"
            no-data-text="请先选择项目"
            v-model="ruleForm.buildingId"
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
        <el-form-item label="楼层名称：">
          <el-select
            clearable
            no-data-text="请先选择楼栋"
            v-model="ruleForm.floorId"
            placeholder="请选择楼层"
            @change="search()">
            <el-option
              v-for="item in floorList"
              class='select-option-selected'
              :key="item.id"
              :label="item.floorName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="租赁单元：">
          <el-autocomplete
            v-model="ruleForm.keyNumber"
            :trigger-on-focus="false"
            :fetch-suggestions="querySearchAsync"
            @select="search()"
            placeholder="请选择，支持模糊搜索">
          </el-autocomplete>
        </el-form-item>
        <el-form-item label="租赁情况：" >
          <el-select
            v-model="ruleForm.rentStatus"
            placeholder="请选择租赁情况"
            @change="search()"
            clearable>
            <el-option
              v-for="item in rentStatusList"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="业态：" >
          <el-select
            v-model="ruleForm.unitType"
            placeholder="请选择租赁业态"
            @change="search()"
            clearable>
            <el-option
              v-for="item in [{value: '105', label: '办公'}, {value: '101', label: '商业'}, {value: '107', label: '产业园'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button
          class="btn btn-default pull-right"
          @click.native="exportExcel"
          style="margin-left: 10px"
          :disabled="permission">导出租赁单元</el-button>
        <el-button
          :disabled="permission"
          class="btn btn-default pull-right"
          style="margin-left: 10px"
          @click.native="$router.push({path: '/asset/rentalUnit/import', query: {type: 'rentalUnit'}})">导入租赁单元</el-button>
        <el-button
          :disabled="permission"
          class="btn pull-right"
          style="margin-left: 10px"
          @click.native="drawerOpenCreate">新建租赁单元</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @row-click="drawerOpenDetail">
        <el-table-column
          prop="roomNo"
          label="租赁单元编号">
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称">
        </el-table-column>
        <el-table-column
          prop="layoutStr"
          label="业态">
        </el-table-column>
        <el-table-column
          prop="rentalStatus"
          label="租赁情况">
        </el-table-column>
        <el-table-column
          prop="buildingArea"
          label="建筑面积(㎡)"
          align="right">
          <template slot-scope="scope">{{scope.row.buildingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="innerArea"
          label="套内面积(㎡)"
          align="right">
          <template slot-scope="scope">{{scope.row.innerArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="可出租面积(㎡)"
          align="right"
          class-name="set-last-cell">
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<script>
// line 383
import { getBuildingList, getFloorList, reset } from '../assets'
import { getrentalUnitList, fetchRentalUnit, exportRoomExcel } from '@/http/assets'
import { mapState } from 'vuex'
const businessStatusList = [{value: '已签约', label: '已签约'}, {value: '空铺', label: '空铺'}]
export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        assetId: null,
        buildingId: null,
        floorId: null,
        keyNumber: null,
        rentStatus: null,
        unitType: null
      },
      rentStatusList: businessStatusList,
      buildingList: [],
      floorList: [],
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
    }
  },
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    // 获取楼栋
    getBuildingList () {
      this.search()
      this.ruleForm.buildingId = null
      this.ruleForm.floorId = null
      const assetId = this.ruleForm.assetId
      getBuildingList(assetId).then(res => {
        this.buildingList = res
      })
    },
    // 获取楼层
    getFloorList () {
      this.search()
      this.ruleForm.floorId = ''
      this.ruleForm.id = ''
      const buildingId = this.ruleForm.buildingId
      getFloorList(buildingId).then(res => {
        this.floorList = res
      })
    },
    querySearchAsync (queryString, cb) {
      let params = {
        assetId: this.ruleForm.assetId,
        buildingId: this.ruleForm.building,
        floorId: this.ruleForm.floorId,
        keywords: this.ruleForm.keyNumber
      }
      fetchRentalUnit(params).then(res => {
        if (res.length > 0) {
          res.forEach(item => {
            item.value = item.unitNo
            item.rentArea = item.rentableArea
          })
          cb(res)
        }
      })
    },
    listAndExportParams () {
      return {
        assetId: this.ruleForm.assetId,
        mainId: this.merchant.id,
        buildingId: this.ruleForm.buildingId,
        floorId: this.ruleForm.floorId,
        rentalStatus: this.ruleForm.rentStatus,
        unitType: this.ruleForm.unitType,
        keyNumber: this.ruleForm.keyNumber,
        page: this.currentPage,
        limit: this.limit,
        orderBy: ''
      }
    },
    getrentalUnitList () {
      const params = this.listAndExportParams()
      getrentalUnitList(params).then(res => {
        this.tableData = res.list || []
        this.total = res.total * 10
      })
    },
    exportExcel () {
      const params = this.listAndExportParams()
      exportRoomExcel(params).then(res => {
        const { data, name } = res
        let blob = new Blob([data], {type: 'application/vnd.ms-excel'})
        let url = URL.createObjectURL(blob)
        let a = document.createElement('a')
        a.download = name
        a.href = url
        document.body.appendChild(a)
        a.click()
        document.body.removeChild(a)
      })
    },
    reset () {
      this.currentPage = 1
      let object = this.ruleForm
      reset(object)
      this.getrentalUnitList()
    },
    search () {
      this.currentPage = 1
      this.getrentalUnitList()
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getrentalUnitList()
    },

    // 详情、新建、编辑弹窗
    drawerOpenDetail (rows) {
      this.$router.push('/asset/rentalUnit/detail/' + rows.id + '/' + rows.assetLayout)
    },
    drawerOpenCreate () {
      this.$router.push('/asset/rentalUnit/create')
    }
  },
  components: {
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getrentalUnitList()
  }
}
</script>
<style lang="scss" scoped>
#asset-unit{
  .block{
    background: #fff;
    padding: 20px;
    margin-bottom: 20px;
  }
  .table-header{
    height: 60px;
    box-sizing: border-box;
    .tabs {
      line-height: 36px;
    }
    li{
      text-align: center;
      box-sizing: border-box;
      margin-right: 20px;
      font-size:15px;
      font-weight:400;
      color:rgba(102,102,102,1);
      cursor: pointer;
    }
    li.active{
      font-weight:500;
      color:rgba(51,51,51,1);
      border-bottom: 3px solid #5E0EFF;
    }
  }
}
</style>

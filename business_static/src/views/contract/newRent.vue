<template>
  <div id="points" class="page">
    <div class="filter-wrapper">
      <el-form
        :inline="true"
        :model="ruleForm"
        size="small"
        label-width="120px">
        <el-form-item label="选择楼栋：">
          <el-select
            v-model="ruleForm.building"
            placeholder="请选择楼栋"
            @change="handelSelectBuilding">
            <el-option
              v-for="item in buildingList"
              class='select-option-selected'
              :key="item.id"
              :label="item.buildingName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择楼层：">
          <el-select
            v-model="ruleForm.floor"
            placeholder="请选择楼层"
            @change="getList">
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
          <el-input placeholder="请输入租赁单元编号" v-model="ruleForm.unit" @input="getList"></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-wrapper">
      <el-table
        :data="tableData"
        style="width: 100%;"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          prop="unitNo"
          label="租债单元编号"
          sortable
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="buildingArea"
          label="总建筑面积(㎡)"
          sortable
          width="170"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="innerArea"
          label="套内面积(㎡)"
          sortable
          width="170"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="可出租面积(㎡)"
          sortable
          width="170"
          show-overflow-tooltip>
        </el-table-column>
      </el-table>
      <!-- <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div> -->
      <div class="btn-group">
        <el-button class="btn btn-default pull-right" @click.native="save">取消</el-button>
        <el-button class="btn pull-right" @click.native="save" style="margin-right: 10px;">确认</el-button>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { getRentUnitList } from '@/http/contract'
import { getBuildingList, getFloorList } from '@/views/asset/assets'
export default {
  data () {
    return {
      ruleForm: {
        building: null,
        floor: null,
        unit: null
      },
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      multipleSelection: [],
      buildingList: [],
      floorList: []
    }
  },
  props: ['assetId'],
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    getList () {
      let params = {
        assetId: this.assetId,
        buildingId: this.ruleForm.building,
        floorId: this.ruleForm.floor,
        keywords: this.ruleForm.unit,
        page: this.currentPage,
        limit: this.limit,
      }
      getRentUnitList(params).then(res => {
        this.tableData = res
        // this.total = res.data.total * 10
      })
    },
    // 获取楼栋
    getBuildingList (assetId) {
      getBuildingList(assetId).then(res => {
        this.buildingList = res
      })
    },
    // 获取楼层
    handelSelectBuilding () {
      this.ruleForm.floor = ''
      this.floorList = []
      getFloorList(this.ruleForm.building).then(res => {
        this.floorList = res
      })
      this.getList()
    },
    handleSelectionChange (val) {
      this.multipleSelection = val
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    save () {
      const unit = this.multipleSelection.map(item => {
        item.roomId = item.id
        item.rentArea = item.rentableArea
        return item
      })
      this.$emit('accpectUnit', unit)
      this.ruleForm.building = this.ruleForm.floor = this.ruleForm.unit = null
    }
  },
  components: {
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
    this.getBuildingList()
  },

}
</script>
<style scoped lang="scss">
#points {
  .filter-wrapper{
    box-shadow: unset;
    padding: 0;
    margin: 0;
  }
}
</style>

<!--
 * @Author: your name
 * @Date: 2020-06-04 16:13:13
 * @LastEditTime: 2020-08-28 15:50:06
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\rentUnit.vue
-->
<template>
  <div id="points" class="page">
    <div class="filter-wrapper">
      <el-form
        :inline="true"
        :model="ruleForm"
        size="small"
        label-width="88px">
        <el-form-item label="多经编号：" >
          <el-input
            v-model="ruleForm.roomNo"
            @input="getList"
            placeholder="请输入多经编号"></el-input>
        </el-form-item>
        <el-form-item label="位置区域：" >
          <el-input
            v-model="ruleForm.address"
            @input="getList"
            placeholder="请输入位置区域"></el-input>
        </el-form-item>
        <el-form-item label="点位类型：">
          <el-select
            v-model="ruleForm.pointTypeList"
            placeholder="请选择点位类型"
            multiple
            collapse-tags
            @change="getList">
            <el-option
              v-for="item in [{id: 1, label: '固定点位'}, {id: 2, label: '临时点位'}]"
              class='select-option-selected'
              :key="item.id"
              :label="item.label"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="多经类型：">
          <el-select
            v-model="ruleForm.diverseTypeList"
            placeholder="请选择多经类型"
            multiple
            collapse-tags
            @change="getList">
            <el-option
              v-for='item in [{"id":"1","label":"广告位"},{"id":"2","label":"灯箱"},{"id":"3","label":"LED"},{"id":"4","label":"ATM"},{"id":"5","label":"侧旗"},{"id":"6","label":"吊幔"},{"id":"7","label":"外广场橱窗"},{"id":"8","label":"其他"}]'
              class='select-option-selected'
              :key="item.id"
              :label="item.label"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-wrapper">
      <el-table
        :data="tableData"
        style="width: 100%;"
        @sort-change="sortTable"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          prop="roomNo"
          label="多经编号"
          sortable
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          label="位置区域"
          prop="address"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目名称"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="pointTypeStr"
          label="点位类型"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="diverseTypeStr"
          label="多经类型"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="rentableArea"
          label="可出租面积（㎡）"
          sortable
          width="170"
          show-overflow-tooltip>
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
      <div class="btn-group">
        <el-button class="btn btn-default pull-right" @click.native="save">取消</el-button>
        <el-button class="btn pull-right" @click.native="save" style="margin-right: 10px;">确认</el-button>
      </div>
    </div>
  </div>
</template>
<script>
import { queryPage } from '@/http/assets'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      ruleForm: {
        roomNo: null,
        address: null,
        pointTypeList: null,
        diverseTypeList: null,
      },
      tableData: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      sortCode: '',
      orderBy: '',
      multipleSelection: []
    }
  },
  props: ['assetId'],
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    sortTable ({ column, prop, order }) {
      this.orderBy = prop === 'roomNo' ? 'room_no' : 'rentable_area'
      this.sortCode = order === 'ascending' ? 'asc' : 'desc'
      this.getList()
    },
    getList () {
      const params = {
        mainId: this.merchant.id,
        assetId: this.assetId,
        roomNo: this.ruleForm.roomNo,
        address: this.ruleForm.address,
        rentalStatus: null,
        pointTypeList: this.ruleForm.pointTypeList,
        diverseTypeList: this.ruleForm.diverseTypeList,
        page: this.currentPage,
        limit: this.limit,
        orderBy: this.orderBy
      }
      queryPage(params).then(res => {
        this.tableData = res.data.list
        this.total = res.data.total * 10
      })
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
    }
  },
  components: {
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
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

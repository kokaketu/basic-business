<!--
 * @Author: your name
 * @Date: 2020-06-04 16:13:13
 * @LastEditTime: 2020-08-27 17:06:02
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\rentUnit.vue
-->

<template>
  <div id="staging">
    <div class="filter-wrapper default-form">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="88px">
        <el-form-item label="项目名称：" prop="projectName">
          <el-select @change="search"
            v-model="ruleForm.assetId"
            placeholder="请选择项目名称">
            <el-option
              class='select-option-selected'
              v-for="item in projectNameList"
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="多经编号：" >
          <el-input
            v-model="ruleForm.roomNo"
            @input="search"
            placeholder="请输入多经编号"></el-input>
        </el-form-item>
        <el-form-item label="位置区域：" >
          <el-input
            v-model="ruleForm.address"
            @input="search"
            placeholder="请输入位置区域"></el-input>
        </el-form-item>
        <el-form-item label="点位类型：">
          <el-select
            v-model="ruleForm.pointTypeList"
            placeholder="请选择点位类型"
            multiple
            collapse-tags
            @change="search">
            <el-option
              v-for="item in [{id: '1', label: '固定点位'}, {id: '2', label: '临时点位'}]"
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
            @change="search">
            <el-option
              v-for='item in [{"id":"1","label":"广告位"},{"id":"2","label":"灯箱"},{"id":"3","label":"LED"},{"id":"4","label":"ATM"},{"id":"5","label":"侧旗"},{"id":"6","label":"吊幔"},{"id":"7","label":"外广场橱窗"},{"id":"8","label":"其他"}]'
              class='select-option-selected'
              :key="item.id"
              :label="item.label"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="租赁情况：">
          <el-select
            v-model="ruleForm.rentalStatus"
            placeholder="请选择租赁情况"
            @change="search">
            <el-option
              v-for="item in [{id: 1, label: '已签约'}, {id: 2, label: '未签约'}]"
              class='select-option-selected'
              :key="item.label"
              :label="item.label"
              :value="item.label">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">多经列表</el-button>
        <el-button class="btn pull-right" :disabled="permission" @click.native="drawerOpenCreate">新建多经点位</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;"
        @sort-change="sortTable"
        @row-click="drawerOpenDetail">
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
          prop="rentalStatus"
          label="租赁情况"
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
          label="可出租面积(㎡)"
          sortable
          width="170"
          align="right"
          class-name="set-sortable-align"
          show-overflow-tooltip>
          <template slot-scope="scope">{{scope.row.rentableArea | comdify}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @size-change="handleCurrentChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="limit"
          layout="prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<script>
import { queryPage } from '@/http/assets'
import { mapState } from 'vuex'
import { reset } from '../assets'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        assetId: null,
        roomNo: null,
        address: null,
        pointTypeList: null,
        diverseTypeList: null,
        rentalStatus: null
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
  computed: mapState(['merchant', 'projectNameList', 'permissionList']),
  methods: {
    sortTable ({ column, prop, order }) {
      this.orderBy = prop === 'roomNo' ? 'room_no' : 'rentable_area'
      this.sortCode = order === 'ascending' ? 'asc' : 'desc'
      this.search()
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    getList () {
      const params = {
        mainId: this.merchant.id,
        assetId: this.ruleForm.assetId,
        roomNo: this.ruleForm.roomNo,
        address: this.ruleForm.address,
        rentalStatus: this.ruleForm.rentalStatus,
        pointTypeList: this.ruleForm.pointTypeList,
        diverseTypeList: this.ruleForm.diverseTypeList,
        page: this.currentPage,
        limit: this.limit,
        orderBy: this.orderBy
      }
      queryPage(params).then(res => {
        this.tableData = res.data.list
        this.total = res.data.total
      })
    },
    reset () {
      this.currentPage = 1
      let object = this.ruleForm
      reset(object)
      this.getList()
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    drawerOpenCreate () {
      this.$router.push('/asset/multiplePoints/create')
    },
    drawerOpenDetail (row) {
      this.$router.push(`/asset/multiplePoints/detail/${row.id}`)
    }
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
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

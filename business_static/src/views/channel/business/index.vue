<template>
  <div id="business">
    <div class="filter-wrapper">
      <el-form
        :inline="true"
        :model="ruleForm"
        size="small"
        label-width="96px">
        <el-form-item label="项目名称：">
          <el-select
            clearable
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
        <el-form-item label="租赁单元：">
          <!-- <el-autocomplete
            v-model="ruleForm.keyNumber"
            :trigger-on-focus="false"
            :fetch-suggestions="querySearchAsync"
            @select="search()"
            placeholder="请选择，支持模糊搜索">
          </el-autocomplete> -->
          <el-input v-model="ruleForm.keyNumber" placeholder="请输入单元编号" @input="search()"></el-input>
        </el-form-item>
        <el-form-item label="业态：" v-show="assetLayout === '2'" >
          <el-select
            v-model="ruleForm.unitType"
            placeholder="请选择租赁业态"
            @change="search()"
            clearable>
            <el-option
              v-for="item in unitTypeData"
              class='select-option-selected'
              :key="item.code"
              :label="item.name"
              :value="item.code">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="行业：" v-show="assetLayout === '1' || assetLayout === '3'">
          <el-select
            v-model="ruleForm.industry"
            placeholder="请选择租赁行业"
            @change="search()"
            clearable>
            <el-option
              v-for="item in industryType"
              class='select-option-selected'
              :key="item.code"
              :label="item.name"
              :value="item.code">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="租赁状态：" >
          <el-select
            v-model="ruleForm.rentStatus"
            placeholder="请选择租赁单元状态"
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
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button
          :disabled="permission"
          class="btn pull-right"
          style="margin-left: 10px"
          @click.native="drawerOpenCreate">新增一键招商</el-button>
      </div>
      <el-table
        :data="tableData"
        @row-click="drawerOpenDetail"
        style="width: 100%;">
        <el-table-column
          prop="assetName"
          label="项目名称"
          min-width="100">
        </el-table-column>
        <el-table-column
          prop="roomNo"
          label="租赁单元"
          min-width="100">
        </el-table-column>
        <el-table-column
          prop="buildingArea"
          min-width="120"
          label="建筑面积(㎡)">
          <template slot-scope="scope">{{scope.row.buildingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          min-width="100"
          label="业态/行业">
          <template slot-scope="scope">{{scope.row.assetLayout === '2' ? scope.row.layoutPositioningStr || '-' : scope.row.industryStr || '-'}}</template>
        </el-table-column>
        <el-table-column
          min-width="120"
          label="租金(元/㎡/天)">
          <template slot-scope="scope">{{scope.row.minRentalPrice | comdify}}~{{scope.row.maxRentalPrice | comdify}}</template>
        </el-table-column>
        <el-table-column
          min-width="120"
          label="物业(元/㎡/天)">
          <template slot-scope="scope">{{scope.row.minPropertyPrice | comdify}}~{{scope.row.maxPropertyPrice | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="pushStatusStr"
          min-width="120"
          label="租赁单元状态">
          <template slot-scope="scope">{{scope.row.pushStatusStr || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="rentDateStr"
          min-width="120"
          label="预计入驻时间">
          <template slot-scope="scope">{{scope.row.rentDateStr || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="contactPerson"
          min-width="100"
          label="联系人">
          <template slot-scope="scope">{{scope.row.contactPerson || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="phone"
          min-width="120"
          label="联系电话">
          <template slot-scope="scope">{{scope.row.phone || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="pushDateStr"
          min-width="120"
          label="上架日期">
          <template slot-scope="scope">{{scope.row.pushDateStr || '-'}}</template>
        </el-table-column>
        <el-table-column
          prop="negotiation"
          min-width="80"
          label="洽谈次数">
          <template slot-scope="scope">{{scope.row.negotiation || '-'}}</template>
        </el-table-column>
        <el-table-column
          fixed="right"
          width="140"
          align="center"
          label="操作">
          <template slot-scope="scope">
           <el-button
            v-if="scope.row.pushStatus === '1'"
            type="text"
            size="small"
            @click.stop="handelSoldout(scope.row, 3)">下架</el-button>
            <el-button
            v-if="scope.row.pushStatus === '1'"
            type="text"
            size="small"
            @click.stop="handelSoldout(scope.row, 2)">已出租</el-button>
            <el-button v-else-if="scope.row.pushStatus === '2'" type="text" size="small">-</el-button>
           <el-button v-else type="text" size="small" @click.stop="handelPutaway(scope.row)">上架</el-button>
          </template>
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
    <!-- 右弹窗--新建招商计划 -->
    <!-- <create-component
      class="animated fadeIn"
      v-show="drawerCreateStatus"
      ref="create">
    </create-component> -->
  </div>
</template>

<script>
import { getBusinessList, getProjectList, putaway, soldout } from '@/http/business'
import { fetchRentalUnit, queryLayoutPositioning } from '@/http/assets'
// import CreateComponent from './create'
import { mapState } from 'vuex'
import { industryType } from '@/components/const'
const businessStatusList = [{value: '1', label: '已上架'}, {value: '2', label: '已出租'}, {value: '3', label: '已下架'}]

export default {
  data () {
    return {
      permission: '',
      ruleForm: {
        assetId: null,
        keyNumber: null,
        unitType: null,
        rentStatus: null,
        industry: null
      },
      rentStatusList: businessStatusList,
      tableData: [],
      drawerCreateStatus: false,
      currentPage: 1,
      limit: 10,
      total: 0,
      unitTypeData: [],
      industryType,
      assetLayout: '',
      projectNameList: []
    }
  },
  watch: {
    'ruleForm.assetId' (val) {
      this.ruleForm.unitType = ''
      this.ruleForm.industry = ''
      if (val) {
        const result = this.projectNameList.filter(item => item.id === val)
        this.assetLayout = result[0].assetLayout
      } else {
        this.assetLayout = ''
      }
      this.search()
    },
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    reset () {
      this.currentPage = 1
      let object = this.ruleForm
      this.resetObj(object)
      this.getList()
    },
    search () {
      this.currentPage = 1
      this.getList()
    },
    querySearchAsync (queryString, cb) {
      let params = {
        assetId: this.ruleForm.assetId,
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
    getLayoutPositioning () {
      queryLayoutPositioning().then(res => {
        this.unitTypeData = res
      })
    },
    getList () {
      const params = {
        mainId: this.merchant.id,
        businessAssetId: this.ruleForm.assetId,
        keyNumber: this.ruleForm.keyNumber,
        layoutPositioning: this.ruleForm.unitType,
        pushStatus: this.ruleForm.rentStatus,
        industry: this.ruleForm.industry,
        page: this.currentPage,
        limit: this.limit,
      }
      getBusinessList(params).then(res => {
        this.tableData = res.list
        this.total = res.total
      })
    },
    handelSoldout (row, inx) {
      soldout({id: row.id, mainId: this.merchant.id, assetCloudState: inx}).then(res => {
        if (res.code === '0') {
          this.$message({message: res.msg, type: 'success'})
          this.getList()
        }
      })
    },
    handelPutaway (row) {
      putaway({id: row.id, mainId: this.merchant.id}).then(res => {
        if (res.code === '0') {
          this.$message({message: res.msg, type: 'success'})
          this.getList()
        }
      })
    },
    getProjectList () {
      const params = {
        mainId: this.merchant.id,
        dataSource: 1,
      }
      getProjectList(params).then(res => {
        this.projectNameList = res
      })
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    drawerOpenDetail (row) {
      this.$router.push(`/channel/business/detail/${row.id}`)
    },
    drawerOpenCreate () {
      // this.drawerCreateStatus = true
      // this.$nextTick(() => {
      //   this.$refs.create.getList()
      // })
      this.$router.push('/channel/business/create')
    },
    resetObj (object) {
      for (const key in object) {
        let type = Object.prototype.toString.call(object[key])
        type === '[object Array]' ? object[key] = [] : object[key] = ''
      }
    }
  },
  activated () {
    // 获取项目名称
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    // this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getList()
    this.getProjectList()
    this.getLayoutPositioning()
  },
  // components: {
  //   CreateComponent
  // }
}
</script>

<style lang="scss" scoped>

</style>

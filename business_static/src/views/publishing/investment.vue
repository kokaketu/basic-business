<template>
  <div id="investment-list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="96px">

        <el-form-item label="项目名称：" >
          <el-select @change = "getStoreList(1)" v-model="ruleForm.assetId" placeholder="请选择">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="铺位：" prop="storeId">
          <el-select
            @change = "getStoreList(0)"
            v-model="ruleForm.storeNo"
            placeholder="请选择">
            <el-option
              v-for="item in storeList"
              class='select-option-selected'
              :key="item"
              :label="item"
              :value="item">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item v label="业态/行业：" prop="layout">
          <el-select
            @change = "getStoreList(0)"
            v-model="ruleForm.layout"
            placeholder="请选择">
            <el-option
              v-for="item in storeLayoutList"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="上架状态：" prop="putAwayStatus">
          <el-select
            @change = "getList(0)"
            v-model="ruleForm.putAwayStatus"
            placeholder="请选择">
            <el-option
              v-for="item in [{label: '已上架', value: '0'},{label: '已下架', value: '1'},{label: '已租出', value: '2'}]"
              class='select-option-selected'
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item>
         <el-button class="btn" style="margin-top: 20px" @click="search()">搜索</el-button>
          <el-button class="btn btn-default" style="margin-top: 20px" @click="reset()">重置</el-button>
        </el-form-item> -->
      </el-form>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">已上架列表</el-button>
        <el-button class="btn pull-right" @click.native="toCreateData">铺位发布</el-button>
      </div>
      <el-table
        :data="tableData"
        style="width: 100%;">
        <el-table-column
          prop="assetName"
          label="项目"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="storeNo"
          label="铺位信息"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="assetAddr"
          label="铺位地址详情"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="storeLayoutStr"
          label="业态/行业"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="tenantryName"
          label="当前租户"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="contractExpirationDateStr"
          label="合约到期日"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="avgRentAmount"
          label="租金日单价(元/㎡)"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="putAwayAddr"
          label="上架地址"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="contactPhoneNo"
          label="联系方式"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="createdDateStr"
          label="上架日期"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="updatedDateStr"
          label="更新日期"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="putAwayStatus"
          label="上架状态"
          show-overflow-tooltip>
          <template slot-scope="oneselfScope">
            <span v-if="oneselfScope.row.putAwayStatus == 0">已上架</span>
            <span v-if="oneselfScope.row.putAwayStatus == 1">已下架</span>
            <span v-if="oneselfScope.row.putAwayStatus == 2">已租出</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="putAwayStatus"
          label="操作"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <span v-if="scope.row.putAwayStatus == 0"><el-button type="primary" @click.native="offShelf(scope.row)">下架</el-button></span>
            <span v-if="scope.row.putAwayStatus == 1">-</span>
            <span v-if="scope.row.putAwayStatus == 2">-</span>
          </template>
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
import {getPutAwayList, offShelfRental} from '@/http/publishing'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      ruleForm: {},
      storeList: [],
      tableData: [],
      layoutStr: [],
      storeLayoutList: [],
      storeLayout: '',
      storeLayoutStr: '',
      isRefresh: '0',
      currentPage: 1,
      limit: 10,
      total: 0
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    getList (isRefresh) {
      let params = {
        pageNum: this.currentPage,
        pageSize: this.limit,
        mainId: this.merchant.id,
        assetId: this.ruleForm.assetId ? this.ruleForm.assetId : this.projectNameList[0].id,
        unitNo: this.ruleForm.storeNo ? this.ruleForm.storeNo : null,
        layout: this.ruleForm.layout ? this.ruleForm.layout : null,
        putAwayStatus: this.ruleForm.putAwayStatus ? this.ruleForm.putAwayStatus : null
      }

      getPutAwayList(params).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
        if (isRefresh === 1) {
          res.list.forEach((item, key) => {
            this.storeList.push(item.storeNo)
            this.storeLayoutList.push({value: item.storeLayout, label: item.storeLayoutStr})
          })
        }

        this.storeList = [...new Set(this.storeList)]
      })
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    reset () {
      this.currentPage = 1
      this.storeList = []
      this.storeLayoutList = []
      this.ruleForm.putAwayStatus = ''
      this.ruleForm.layout = ''
      this.ruleForm.storeNo = ''
      this.getList(1)
    },
    getStoreList (isRefresh) {
      this.getList(isRefresh)
    },
    toCreateData () {
      this.$router.replace({name: 'publishingCreate', params: {id: this.ruleForm.assetId}})
    },
    offShelf (params) {
      this.ruleForm.id = params.id
      this.offShelfRental()
    },
    offShelfRental () {
      let params = this.ruleForm.id
      offShelfRental(params).then(result => {
        if (result) {
          this.$message.success('商铺已下架！')
          this.getList()
        } else {
          this.$message.error('商铺下架失败，请联系管理员！')
        }
      })
    }
  },
  activated () {
    // 获取项目名称
    if (this.projectNameList.length > 0) {
      this.ruleForm.assetId = this.projectNameList[0].assetName
      this.getList()
    } else {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then((res) => {
        this.ruleForm.assetId = res[0].assetName
        this.getList()
      })
    }
  }
}
</script>

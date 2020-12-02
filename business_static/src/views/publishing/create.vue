<template>
  <div id="investment-list" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" :model="ruleForm"  size="small" label-width="120px">

        <el-form-item label="选择项目" >
          <el-select @change = "getList(1)" v-model="ruleForm.assetId" placeholder="请选择">
            <el-option
              v-for="item in projectNameList"
              class='select-option-selected'
              :key="item.id"
              :label="item.assetName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="快捷筛选" prop="screen">
<!--            <el-checkbox label="获取所有空铺信息"/>-->
<!--            <el-checkbox label="获取截至特定日期合约到期的铺位信息"/>-->
          <el-radio v-model="ruleForm.signStatus" label=2 border @change="changeSignStatus">获取所有空铺信息</el-radio>
          <el-radio v-model="ruleForm.signStatus" label=1 border @change="changeSignStatus">获取截至特定日期合约到期的铺位信息</el-radio>
        </el-form-item>

        <el-form-item style="margin-top: 20px;">
          <el-date-picker
            v-show="showRentPrise"
            v-model="ruleForm.contExpirationTime"
            type="date"
            placeholder="选择日期"
            @change="changeSignStatus">
          </el-date-picker>
        </el-form-item>

        <el-form-item>
          <el-button class="btn btn-default" style="margin-top: 20px" @click="reset()">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">发布上架</el-button>
        <el-button class="btn pull-right" @click.native="doConfirm">确认上架</el-button>
      </div>
      <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          width="60">
        </el-table-column>
        <el-table-column
          prop="assetName"
          label="项目"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="unitNo"
          label="铺位信息"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="assetAddress"
          label="铺位地址详情"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="showIndustryOrLayoutStr"
          label="业态/行业"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="companyName"
          label="当前租户"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="contEndDateStr"
          label="合约到期日"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="contPricePerUnit"
          label="租金日单价(元/㎡)"
          show-overflow-tooltip>
        </el-table-column>
        <el-table-column
          prop="rentAmount"
          label="租赁价格(元/月)"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-input v-model="scope.row.rentAmount" placeholder="租赁价格"/>
          </template>
        </el-table-column>
        <el-table-column
          prop="putAwayAddr"
          label="上架地址"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-input v-model="scope.row.putAwayAddr" placeholder="上架地址"/>
          </template>
        </el-table-column>
        <el-table-column
          prop="contactPhoneNo"
          label="联系方式"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-input v-model="scope.row.contactPhoneNo" placeholder="联系方式"/>
          </template>
        </el-table-column>
        <el-table-column
          prop="remark"
          label="备注"
          show-overflow-tooltip>
          <template slot-scope="scope">
            <el-input v-model="scope.row.remark" placeholder="备注"/>
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
import {getYepPutAwayList, storeDoConfirm} from '@/http/publishing'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      ruleForm: {
        signStatus: '2',
        contExpirationTime: ''
      },
      tableData: [],
      rentAmount: '',
      contactPhoneNo: '',
      remark: '',
      putAwayAddr: '',
      storeList: [],
      limit: 10,
      total: 0,
      currentPage: 1,
      showRentPrise: false,
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    search () {
      this.currentPage = 1
      this.getList()
    },
    getList () {
      let params = {
        pageSize: this.currentPage,
        pageNum: this.limit,
        mainId: this.merchant.id,
        assetId: this.ruleForm.assetId ? this.ruleForm.assetId : this.projectNameList[0].id,
        signStatus: this.ruleForm.signStatus,
        contExpirationTime: this.ruleForm.contExpirationTime
      }
      getYepPutAwayList(params).then(res => {
        this.tableData = res.list
        this.total = res.total * 10
      })
    },
    reset () {
      this.currentPage = 1
      this.ruleForm.signStatus = '2'
      this.ruleForm.contExpirationTime = ''
      this.getList(1)
    },
    handleSelectionChange (val) {
      this.storeList = val
    },
    doConfirm () {
      if (this.storeList.length < 1) {
        this.$message.success('请选择要发布的铺位！')
      }
      let params = {
        assetId: this.storeList[0].assetId,
        storeList: this.storeList
      }
      storeDoConfirm(params).then(result => {
        if (result === true) {
          this.$message.success('发布成功！')
        } else {
          this.$message.error('发布失败，请联系管理员！')
        }
        this.getList(1)
      })
    },
    changeSignStatus (value) {
      if (parseInt(value) === 1) {
        this.$message.success('请选择日期！')
        this.showRentPrise = true
      } else if (parseInt(value) === 2) {
        this.showRentPrise = false
        this.ruleForm.contExpirationTime = ''
        this.getList()
      } else {
        this.getList()
      }
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    }
  },
  activated () {
    // 获取项目名称
    if (this.projectNameList.length > 0) {
      const routerParams = this.$route.params.id
      this.ruleForm.assetId = routerParams || this.projectNameList[0].assetName
      this.getList()
    } else {
      this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id}).then((res) => {
        const routerParams = this.$route.params.id
        this.ruleForm.assetId = routerParams || res[0].assetName
        this.getList()
      })
    }
  }
}
</script>

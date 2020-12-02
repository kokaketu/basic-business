<!--
 * @Author: your name
 * @Date: 2020-07-06 09:39:32
 * @LastEditTime: 2020-08-31 15:42:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\investment\create.vue
-->
<template>
  <div id="investment-create">
    <div class="wrapper">
      <div class="header">
        <i class="el-icon-close" @click="close"></i>
        <p>新建招商计划</p>
      </div>
      <div class="base-info">
        <div class="filter-wrapper left-wrapper">
          <el-form :inline="true" ref="baseInfo" :model="ruleForm" size="small" label-width="150px">
            <el-form-item label="项目名称" prop="assetId">
              <el-select
                clearable
                v-model="ruleForm.assetId"
                placeholder="请选择项目名称"
                @change="getList">
                <el-option
                  v-for="item in projectNameList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="租赁单元编号" prop="leaseNo">
              <el-input
                v-model="ruleForm.leaseNo"
                placeholder="请输入租赁单元编号"
                @input="getList">
              </el-input>
            </el-form-item>

            <el-form-item label="租赁情况" prop="rentalStatus">
              <el-select
                v-model="ruleForm.rentalStatus"
                placeholder="请选择租赁情况"
                @change="getList">
                <el-option
                  v-for="item in [{id: 1, value: '已签约'}, {id: 2, value: '空铺'}]"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.value"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="合约到期" prop="contEnd">
              <el-select
                v-model="ruleForm.contEnd"
                placeholder="请选择合约到期情况"
                @change="getList">
                <el-option
                  v-for="item in [{id: 1, value: '近1个月到期'}, {id: 2, value: '近3个月到期'}, {id: 3, value: '近6个月到期'}]"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.value"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>

          </el-form>
        </div>
      </div>
      <div class="table-wrapper">
        <el-table
          :data="tableData"
          style="width: 100%;">
          <el-table-column
            width="50px">
            <template slot-scope="scope">
              <el-checkbox @change="checkLease(scope.$index)" v-model="scope.row.checked"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column
            prop="leaseNo"
            label="租赁单元编号"
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
            prop="contEndDate"
            label="合同到期时间"
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
      </div>
      <div class="btn-group">
        <div style="width: 196px;margin: 0 auto;">
          <el-button class="btn" @click="confirm">确认</el-button>
          <el-button class="btn btn-default" @click="close">取消</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { getAttractList, addAttractList } from '@/http/rentControl'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      ruleForm: {
        assetId: null,
        leaseNo: null,
        status: null,
        contEnd: null
      },
      leaseId: [],
      currentPage: 1,
      limit: 10,
      total: 0,
      tableData: [],
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    getList () {
      const assetLayout = this.ruleForm.assetId && this.projectNameList.filter(({id}) => Number(id) === this.ruleForm.assetId)[0].assetLayout
      let params = {
        page: this.currentPage,
        limit: this.limit,
        mainId: this.merchant.id,
        assetId: this.ruleForm.assetId,
        leaseNo: this.ruleForm.leaseNo,
        rentalStatus: this.ruleForm.rentalStatus,
        contEnd: this.ruleForm.contEnd,
        type: assetLayout,
        orderBy: '',
        attractStage: '',
        operation: 1
      }
      getAttractList(params).then(res => {
        this.tableData = res.data.list.map(item => {
          item.checked = false
          return item
        })
        this.total = res.data.total * 10
      })
    },
    checkLease (index) {
      const leaseId = this.tableData[index].leaseId
      if (this.leaseId.includes(leaseId)) {
        this.leaseId = this.leaseId.filter(item => leaseId !== item)
      } else {
        this.leaseId.push(leaseId)
      }
    },
    handleCurrentChange (val) {
      this.currentPage = val
      this.getList()
    },
    confirm () {
      let params = []
      this.tableData.map(item => {
        if (item.checked === true) {
          params.push({
            'leaseId': item.leaseId,
            'mainId': item.mainId,
            'assetId': item.assetId,
            'assetName': item.assetName,
            'leaseNo': item.leaseNo
          })
        }
        return item
      })
      if (params.length < 1) return
      addAttractList(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          this.$parent.drawerCreateStatus = false
          this.$parent.getList()
        }
      })
    },
    close () {
      for (const key in this.ruleForm) {
        if (this.ruleForm.hasOwnProperty(key)) {
          this.ruleForm[key] = null
        }
      }
      this.$parent.drawerCreateStatus = false
    }
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.mainId})
  }
}
</script>
<style lang="scss" scoped>
#investment-create{
  position: fixed;
  z-index: 999;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  background: rgba(0,0,0,0.5);
  .wrapper{
    width: 680px;
    height: 80vh;
    margin: 0 auto;
    margin-top: 10vh;
    overflow: auto;
    .header {
      position: relative;
      height: 50px;
      line-height: 50px;
      text-align: center;
      color: #fff;
      background: #141414;
      .el-icon-close{
        position: absolute;
        cursor: pointer;
        right: 25px;
        top: 17px;
      }
    }
    .filter-wrapper{
      margin-bottom: 0;
      .el-form-item {
        margin-bottom: 0px !important;
      }
    }
    .block-title{
      height: 44px;
      line-height: 44px;
      padding: 0 25px;
      background:rgba(246,246,246,1)
    }
    .btn-group{
      margin: 0 auto;
      padding-left: 20px;
      padding-bottom: 30px;
      background: #fff;
    }
    .table-wrapper{
      border-left: 1px solid #EBEEF5;
    }
  }
}
</style>
<style lang="scss">
#investment-create .input-unit .el-input__inner{
  padding-right: 30px;
}
#investment-create .el-input-group__append{
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
#investment-create .filter-wrapper .el-form-item{
  width: 285px;
}
</style>

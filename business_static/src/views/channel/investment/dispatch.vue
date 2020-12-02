<!--
 * @Author: your name
 * @Date: 2020-07-06 16:10:29
 * @LastEditTime: 2020-08-31 15:59:54
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\rentcontrol\investment\dispatch.vue
-->
<template>
  <div id="investment-dispatch">
    <div class="wrapper">
      <div class="header">
        <i class="el-icon-close" @click="close"></i>
        <p>分配跟进人</p>
      </div>
      <div class="table-wrapper">
        <el-table
          class="table"
          :data="tableData"
          style="width: 100%;">
          <el-table-column
            width="50px">
            <template slot-scope="scope">
              <el-checkbox @change="checkUser(scope.$index)" v-model="scope.row.checked"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column
            prop="name"
            label="姓名"
            show-overflow-tooltip>
          </el-table-column>
          <el-table-column
            prop="mobile"
            label="手机号"
            show-overflow-tooltip>
          </el-table-column>
          <el-table-column
            prop="deptName"
            label="部门"
            show-overflow-tooltip>
          </el-table-column>
          <div slot="empty">暂无数据，请去组织配置中去添加部门人员</div>
        </el-table>
        <div class="btn-group">
          <div style="width: 196px;margin: 0 auto;">
            <el-button class="btn" @click.native="confirm">确认</el-button>
            <el-button class="btn btn-default" @click.native="close">取消</el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { queryMemberList, updAttract } from '@/http/rentControl'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      origin: 'list', // list:列表，edit: 编辑
      memberId: '',
      id: '',
      tableData: []
    }
  },
  computed: mapState(['merchant']),
  methods: {
    getMemberList () {
      queryMemberList(this.merchant.id).then(res => {
        this.tableData = res.data.map(item => {
          // item.checked = this.memberId === item.memberId
          item.checked = false
          return item
        })
      })
    },
    checkUser (index) {
      this.tableData = this.tableData.map((item, key) => {
        if (Number(index) !== Number(key)) {
          item.checked = false
        }
        return item
      })
    },
    confirm () {
      const selected = this.tableData.filter(item => {
        if (item.checked) {
          return item
        }
      })[0]
      if (!selected) {
        this.$message.error('请选择分配跟进人')
        return false
      }
      const params = {
        'id': this.id,
        'field_1': null,
        'memberId': selected.memberId,
        'memberName': selected.name,
        'memberMobile': selected.mobile,
        'memberDept': selected.deptName,
        'monitorPeople': null,
        'demandDescribe': null,
        'attractBrand': null,
        'attractPrice': null,
        'plannedCompletionDate': null
      }
      updAttract(params).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          if (this.origin === 'edit') {
            this.$parent.getDetail()
          } else {
            this.$parent.getList()
          }
          this.$parent.drawerDispatchStatus = false
        }
      })
    },
    close () {
      this.$parent.drawerDispatchStatus = false
    }
  }
}
</script>
<style lang="scss" scoped>
#investment-dispatch{
  position: fixed;
  z-index: 999;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  background: rgba(0,0,0,0.5);
  .wrapper{
    position: relative;
    width: 680px;
    height: 600px;
    margin: 0 auto;
    margin-top: 10vh;
    .header {
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
    }
    .block-title{
      height: 44px;
      line-height: 44px;
      padding: 0 25px;
      background:rgba(246,246,246,1)
    }
    .btn-group{
      margin: 20px auto 0;
      padding-left: 20px;
      background: #fff;
    }
    .table-wrapper{
      border-left: 1px solid #EBEEF5;
      .table {
        position: absolute;
        top: 50px;
        height: 500px;
        overflow: auto;
      }
      .btn-group{
        position: absolute;
        bottom: 0;
        margin: 0;
        padding: 10px 0;
        width: 100%;
        background: #fff;
      }
    }
  }
}
</style>
<style lang="scss">
#investment-dispatch .input-unit .el-input__inner{
  padding-right: 30px;
}
#investment-dispatch .el-input-group__append{
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
</style>

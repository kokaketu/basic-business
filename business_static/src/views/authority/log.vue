<template>
  <div class="authority-dist-container">
    <!--<div class="title">权限分配</div>-->
    <el-table
      class="table-member"
      :data="tableData"
    >
      <el-table-column label="用户" prop="actionMember"/>
      <el-table-column label="操作" prop="action"/>
      <el-table-column label="内容" prop="logDesc"/>
      <el-table-column label="时间" prop="actionTime"/>
    </el-table><div class="pagination">
    <el-pagination
      @size-change="handleCurrentChange"
      @current-change="handleCurrentChange"
      :current-page.sync="filter.pageNum"
      :page-size="100"
      layout="prev, pager, next, jumper"
      :total="filter.total">
    </el-pagination>
  </div>

  </div>
</template>

<script>
import { actionLog } from '../../http/authority'
import { mapState } from 'vuex'
export default {
  name: 'Log',
  data () {
    return {
      headers: [],
      tableData: [],
      filter: {
        pageNum: 1,
        pageSize: 10,
        total: 0,
      }
    }
  },
  props: {
    active: {
      type: Boolean,
      default: false
    }
  },
  computed: mapState(['merchant']),
  activated () {
    this.actionLog()
  },
  watch: {
    active (val) {
      if (val) {
        this.actionLog()
      }
    }
  },
  methods: {
    actionLog () {
      actionLog({mainId: this.merchant.id, ...this.filter}).then((res) => {
        this.tableData = res.list
        this.filter.total = res.total
      })
    },
    handleCurrentChange (val) {
      this.filter.pageNum = val
      this.actionLog()
    },
  },
}
</script>

<style lang="scss">
.authority-dist-container {
  color: #333;
  background-color: white;
  border-radius:3px;
  /*border:1px solid rgba(227, 226, 226, 1);*/
  .title {
    line-height: 60px;
    padding: 0 20px;
  }
  .el-checkbox {
    margin-right: 0;
    display: block;
  }
}
</style>

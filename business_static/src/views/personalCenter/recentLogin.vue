
<template>
  <div class="recent-login-body">
    <div class="title">
      最近登录
    </div>
    <el-table
      class="table-loginInfo"
      :data="loginInfos"
      border
    >
      <el-table-column
        prop="loginTime"
        label="登录时间"
      />
      <el-table-column
        prop="ipAddress"
        label="登录IP"
      />
    </el-table>
  </div>
</template>

<script>

import {
  loginHistory,
} from '../../http/personalCenter'

export default {
  components: {},
  data () {
    return {
      loginInfos: []
    }
  },
  activated () {
    this.loginHistory()
  },
  methods: {
    loginHistory () {
      loginHistory({
        mobile: '13311111111',
        pageSize: 5
      }).then((res) => {
        this.loginInfos = res
      })
    }
  },
}
</script>
<style lang="scss" scoped>

.recent-login-body {
  border-radius:3px;
  /*border:1px solid rgba(227,226,226,1);*/
  .title {
    line-height: 60px;
    padding: 0 20px 0 0;
    font-weight: bold;
    > .fr {
      margin-top: 12px;
    }
  }
  .table-loginInfo {
    width: auto;
    max-width: inherit;
    margin-right: -1px;
    /*border-bottom-left-radius: 3px;*/
    /*border-bottom-right-radius: 3px;*/
  }
}
</style>

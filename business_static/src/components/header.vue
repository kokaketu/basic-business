<!--
 * @Author: your name
 * @Date: 2020-05-21 10:16:23
 * @LastEditTime: 2020-11-04 10:38:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\header.vue
-->
<template>
  <div id="header-wrapper">
    <div class="nav-dropdown clearfix">
      <div class="layout">
        {{$store.getters.userInfo.name}} {{$store.getters.userInfo.mobile}}
        <img @click="logout" src="../assets/layout.svg" alt="">
      </div>
    </div>
    <header-tabs></header-tabs>
  </div>
</template>
<script>
import { logout } from '@/http/authority'
import HeaderTabs from './HeaderTabs'
export default {
  name: 'Header',
  data () {
    return {
    }
  },
  created () {
  },
  methods: {
    logout () {
      this.$confirm('退出登录, 是否继续?', '退出确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(
        () => {
          logout().then(res => {
            if (res.code === '0') {
              sessionStorage.clear()
              this.$message.success(res.msg)
              const hostname = window.location.hostname
              const isDev = hostname.includes('test') || hostname.includes('local')
              if (process.env.EVN_FLAG === 'dev' || process.env.EVN_FLAG === 'test') {
                window.location.href = 'http://' + process.env.EVN_FLAG + '.caicchina.com/#/login'
              } else {
                window.location.href = isDev ? 'http://dev.caicchina.com/#/login' : 'https://www.caicchina.com/#/login'
              }
            }
          })
        }
      )
    }
  },
  components: {
    HeaderTabs
  }
}
</script>
<style lang="scss" scoped>
#header-wrapper{
  position: relative;
  height: 80px;
  // min-width: calc(1366px - 235px);
  padding-left: 20px;
  background: #fff;
  .nav-dropdown{
    position: relative;
    height: 40px;
    line-height: 40px;
    font-size: 14px;
    .layout{
      position: absolute;
      right: 20px;
      color: #333;
      img{
        vertical-align: middle;
        cursor: pointer;
        margin-left: 5px;
        margin-top: -2px;
      }
    }
  }
}
</style>

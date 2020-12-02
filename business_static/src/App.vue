<!--
 * @Author: your name
 * @Date: 2020-05-18 14:59:36
 * @LastEditTime: 2020-10-30 10:03:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\App.vue
-->
<template>
  <div id="app">
    <el-container>
      <el-aside width="235px">
        <Menu/>
      </el-aside>
      <el-container>
        <el-main>
          <Header/>
          <transition name="fade-transform" mode="out-in">
            <div class="container">
              <bread-crumb></bread-crumb>
              <keep-alive>
                <router-view :key="$route.fullPath"/>
              </keep-alive>
            </div>
          </transition>
        </el-main>
      </el-container>
    </el-container>
    <IsOpen />
    <Loading v-show="loading" />
  </div>
</template>
<script>
import Menu from '@/components/menus'
import Header from '@/components/header'
import BreadCrumb from '@/components/breadcrumb'
import IsOpen from '@/components/IsOpen'
import Loading from '@/components/Loading'
// import { listMenu } from '@/http/authority'
import { mapState } from 'vuex'
export default {
  data () {
    return {
    }
  },
  watch: {
    '$route': {
      handler () {
        this.$store.dispatch('setRouteList', {
          route: this.$route,
          type: 'add'
        })
      }
    }
  },
  computed: mapState(['loading']),
  components: {
    Menu,
    Header,
    BreadCrumb,
    IsOpen,
    Loading
  },
  created () {
    const userInfo = JSON.parse(sessionStorage.getItem('userInfo')) || {}
    const merchant = JSON.parse(sessionStorage.getItem('merchant' + userInfo.memberId)) || {}
    const permList = JSON.parse(sessionStorage.getItem('permList')) || {}
    this.$store.dispatch('setUserinfo', userInfo)
    this.$store.dispatch('setMerchant', merchant)
    this.$store.dispatch('setPermission', permList)
    // const params = {
    //   ssoMember: userInfo.memberId,
    //   mainId: merchant.id
    // }
    // listMenu(params).then(res => {
    //   if (res.code === '0') {
    //     if (!res.data) {
    //       this.menuList = []
    //       return false
    //     }
    //     const permList = {}
    //     res.data.map(it =>{
    //       permList[it.code] = it.permission
    //     })
    //     this.$store.dispatch('setPermission',permList)
    //   } else {
    //     this.$message.error(res.msg)
    //   }
    // })
  },
}
</script>
<style lang="scss" scoped>
#app{
  height: 100vh;
  min-width: 1366px;
  background: #F7F7F7;
}
.el-header{
  height: 80px !important;
  padding: 0;
}
.el-main{
  padding: 0;
  height: 100vh;
  overflow-x: hidden;
  background: #f2f2f2;
  .container{
    padding: 20px;
    background: #f2f2f2;
  }
}
</style>

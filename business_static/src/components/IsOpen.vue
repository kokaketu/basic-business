<!--
 * @Author: your name
 * @Date: 2020-07-15 19:39:31
 * @LastEditTime: 2020-08-07 18:21:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\IsOpen.vue
-->
<template>
  <div id="isOpen" v-show="show">
    <div class="wrapper">
      <img :src="warnning" alt="">
      <h1>温馨提示</h1>
      <p class="tips">您暂未开通该服务，如需帮助请联系客服</p>
      <p class="phone">客服电话：021-66270855</p>
      <el-button @click="choose">确定</el-button>
    </div>
  </div>
</template>
<script>
import warnning from '@/assets/icon-open-warnning.svg'
import { authentication } from '@/http/authority'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      warnning,
      show: false
    }
  },
  computed: mapState(['userInfo']),
  methods: {
    getAuthentication: function () {
      const { memberId, mobile } = this.userInfo
      authentication({memberId, mobile}).then(res => {
        if (res.code !== '0') {
          this.show = true
        }
      })
    },
    choose () {
      const hostname = window.location.hostname
      const isDev = hostname.includes('test') || hostname.includes('local')
      if (process.env.EVN_FLAG === 'dev' || process.env.EVN_FLAG === 'test') {
        window.location.href = 'http://' + process.env.EVN_FLAG + '.caicchina.com/#/login'
      } else {
        window.location.href = isDev ? 'http://dev.caicchina.com/#/login' : 'https://www.caicchina.com/#/login'
      }
    }
  },
  created () {
    // 不要再注释我了
    this.getAuthentication()
  }
}
</script>
<style lang="scss" scoped>
#isOpen{
  position: fixed;
  z-index: 999;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background:rgba(0,0,0,.5);
  .wrapper{
    width:450px;
    height:377px;
    margin: calc((100vh - 377px)/2) auto;
    border-radius:20px;
    text-align: center;
    background:rgba(255,255,255,1);
    img{
      margin-top: 40px;
    }
    h1{
      margin-top: 20px;
      margin-bottom: 20px;
      font-size:26px;
      font-weight:500;
      color:rgba(51,51,51,1);
    }
    .tips{
      margin-bottom: 15px;
      font-size:15px;
      font-weight:400;
      color:rgba(153,153,153,1);
    }
    .phone{
      font-size:16px;
      font-weight:400;
      color:rgba(59,94,254,1);
      text-decoration: underline;
    }
    .el-button{
      width:340px;
      height:52px;
      margin-top: 30px;
      font-size:16px;
      font-weight:400;
      color:rgba(255,255,255,1);
      background:rgba(59,94,254,1);
      box-shadow:0px 4px 10px 2px rgba(204,213,254,1);
      border-radius:28px;
    }
  }
}
</style>

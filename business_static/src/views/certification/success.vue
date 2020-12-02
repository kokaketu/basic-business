<!--
 * @Author: your name
 * @Date: 2020-07-14 19:34:41
 * @LastEditTime: 2020-08-18 16:53:52
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\certification\success.vue
-->
<template>
  <div id="success" class="page">
    <div class="content-wrapper">
      <div class="title">
        <img src="../../assets/icon-success.svg" alt="">
        恭喜！您已完成企业认证
      </div>
      <div class="content">
        <p>企业名称：{{merchant.name | mosaic}}</p>
        <p>统一社会信用代码：{{merchant.uniqueNO | mosaic}}</p>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
export default {
  computed: mapState(['merchant'])
}
</script>
<style lang="scss" scoped>
  @import './certification';
</style>

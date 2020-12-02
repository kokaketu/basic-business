<!--
 * @Author: your name
 * @Date: 2020-07-14 19:34:41
 * @LastEditTime: 2020-08-18 16:23:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\certification\failure.vue
-->
<template>
  <div id="failure" class="page">
    <div class="content-wrapper">
      <div class="title">
        <img src="../../assets/icon-failure.svg" alt="">审核失败
      </div>
      <div class="content">
        <p>抱歉，请确认您是否已签订合同，</p>
        <p>如有问题，请联系：<span>021-66270855</span></p>
        <el-button class="btn" @click="$router.push('/certification/normal')">重新提交</el-button>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  @import './certification';
</style>

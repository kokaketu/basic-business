<!--
 * @Author: your name
 * @Date: 2020-07-14 19:34:41
 * @LastEditTime: 2020-08-18 16:27:09
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\certification\processing.vue
-->
<template>
  <div id="processing" class="page">
    <div class="content-wrapper">
      <div class="title">
        <img src="../../assets/icon-processing.svg" alt="audit">审核中…
      </div>
      <div class="content">我们将尽快进行审核</div>
      <div class="content">如有问题，请联系：<span>021-66270855</span></div>
    </div>
  </div>
</template>

<script>
import audit_png from '@/assets/audit.png'

export default {
  data () {
    return {
      audit_png: audit_png
    }
  }
}
</script>
<style lang="scss" scoped>
  @import './certification';
</style>

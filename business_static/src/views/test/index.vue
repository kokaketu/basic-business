<!--
 * @Author: your name
 * @Date: 2020-07-11 13:11:37
 * @LastEditTime: 2020-08-10 11:37:59
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\test\index.vue
-->
<template>
  <div id="test">
    <iframe
      src="http://test-zgy.caicchina.com/#/asset-diagnose/detail"
      frameborder="0"
      width="100%"
      height="1000px"></iframe>
  </div>
</template>
<script>
import InputNumber from '@/components/InputNumber'
export default {
  data () {
    return {
      a: 1
    }
  },
  methods: {
    test (result) {
      this.a = result
    }
  },
  activated () {
    this.a = 132.22222
  },
  components: {
    InputNumber
  }
}
</script>
<style lang="scss" scoped>
</style>

<!--
 * @Author: your name
 * @Date: 2020-07-27 10:50:14
 * @LastEditTime: 2020-07-27 13:54:37
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\loading\loading.vue
-->
<template>
    <div id="loading">
        <img src="../assets/loading.gif" alt="">
    </div>
</template>
<script>
export default {
  name: 'loading',
  data () {
    return {
    }
  },
  updated () {
  }
}
</script>
<style scoped lang='scss'>
    #loading {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 100px;
        height: 100px;
        z-index:9999;
        img {
            position: absolute;
            width:50px;
            height:50px;
            top:50%;
            left:50%;
            margin-left:-25px;
            margin-top:-25px;
        }
    }
</style>

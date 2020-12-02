<!--
 * @Author: your name
 * @Date: 2020-05-23 18:21:11
 * @LastEditTime: 2020-07-11 18:07:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\BreadCrumb.vue
-->
<template>
  <div id="breadcrumb">
    <span
      v-for="(item, index) in levelList"
      :key="index"
      :style="{cursor: (item.path === '' ? '' : 'pointer')}"
      @click="goUrl(item)">
      {{item.title}}
      <img :src="arrowRight" alt="">
    </span>
  </div>
</template>
<script>
import arrowRight from '@/assets/icon-tabs-arrow-right.svg'
export default {
  data () {
    return {
      arrowRight: arrowRight,
      levelList: null
    }
  },
  watch: {
    $route () {
      this.getBreadcrumb()
    }
  },
  created () {
  },
  methods: {
    getBreadcrumb () {
      let [ data ] = this.$route.matched.filter(item => {
        if (item.name) {
          return true
        }
      })
      this.levelList = data.meta.breadcrumb
    },
    goUrl (item) {
      this.$router.push(item.path)
    }
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
#breadcrumb{
  margin-top: -10px;
  width: 100%;
  margin-bottom: 10px;
  span {
    font-size:12px;
    font-weight:400;
    color:rgba(153,153,153,1);
    img{
      height: 10px;
      margin-top: 1px;
    }
  }
  span:nth-last-child(1) {
    font-size:12px;
    font-weight:400;
    color:rgba(51,51,51,1);
    line-height:20px;
    img{
      display: none;
    }
  }
}
</style>

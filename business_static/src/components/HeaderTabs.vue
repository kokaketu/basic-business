<!--
 * @Author: your name
 * @Date: 2020-07-09 16:45:06
 * @LastEditTime: 2020-07-21 15:19:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\HeaderTabs.vue
-->
<template>
  <div id="header-tabs">
    <div class="tab" @click="prevRoute">
      <img :src="arrowLeft" alt="">
    </div>
    <div class="tab">
      <img :src="home" alt="" @click="goHome('/workbench')">
    </div>
    <div class="tab-container">
      <div class="clearfix" ref="tabContainer" style="height: 40px;">
        <div class="tab"
          v-for="(route, index) in routeList"
          :key="index"
          :class="{'active': currentRouteName === route.name}"
          @click="goUrl(route)">
            {{route.meta.title}}
            <img
              class="close"
              @click.stop="removeRoute(route)"
              :src="close"/>
        </div>
      </div>
    </div>
    <div class="tab" @click="nextRoute" style="float:right;">
      <img :src="arrowRight" alt="">
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import close from '@/assets/icon-tabs-close.svg'
import home from '@/assets/icon-tabs-home.svg'
import arrowRight from '@/assets/icon-tabs-arrow-right.svg'
import arrowLeft from '@/assets/icon-tabs-arrow-left.svg'
export default {
  data () {
    return {
      currentRouteName: '',
      close: close,
      home: home,
      arrowRight: arrowRight,
      arrowLeft: arrowLeft,
      tabs: [],
      i: 0
    }
  },
  watch: {
    $route: {
      handler () {
        this.currentRouteName = this.$route.name
      }
    },
    routeList: {
      handler () {
        this.$nextTick(() => {
          const tabsWidthArray = this.getTabsWidthArray()
          const tabContainerWidth = tabsWidthArray.reduce((prev, cur) => {
            return Math.ceil(prev) + Math.ceil(cur)
          }, 0)
          this.$refs.tabContainer.style.width = tabContainerWidth + 'px'
        })
      }
    }
  },
  computed: mapState(['routeList']),
  methods: {
    goUrl (route) {
      this.$router.push(route.fullPath)
    },
    goHome (url) {
      this.$router.push(url)
    },
    getTabsWidthArray () {
      const tabContainer = this.$refs.tabContainer
      const tabs = tabContainer.getElementsByClassName('tab')
      const tabsWidths = []
      for (let index = 0; index < tabs.length; index++) {
        const style = window.getComputedStyle ? window.getComputedStyle(tabs[index], null) : null || tabs[index].currentStyle
        tabsWidths.push(style.width)
      }
      return tabsWidths.map(item => item.slice(0, -2))
    },
    prevRoute () {
      const tabsWidthArray = this.getTabsWidthArray()
      if (this.i < tabsWidthArray.length - 1) {
        this.i++
        const offset = tabsWidthArray.slice(0, this.i).reduce((prev, cur) => {
          return Math.ceil(prev) + Math.ceil(cur)
        }, 0)
        this.$nextTick(() => {
          this.$refs.tabContainer.style.transform = `translateX(${-offset}px)`
          this.$refs.tabContainer.style.transition = 'all ease-in .3s'
        })
      }
    },
    nextRoute () {
      const tabsWidthArray = this.getTabsWidthArray()
      if (this.i > 0) {
        this.i--
        const offset = tabsWidthArray.slice(0, this.i).reduce((prev, cur) => {
          return Math.ceil(prev) + Math.ceil(cur)
        }, 0)
        this.$nextTick(() => {
          this.$refs.tabContainer.style.transform = `translateX(${-offset}px)`
          this.$refs.tabContainer.style.transition = 'all ease-in .3s'
        })
      }
    },
    removeRoute (route) {
      if (this.routeList.length === 1) return
      this.$store.dispatch('setRouteList', {
        route: route,
        type: 'delete'
      })
      this.$nextTick(() => {
        this.i = 0
        this.$refs.tabContainer.style.transform = `translateX(0px)`
        this.$refs.tabContainer.style.transition = 'all ease-in .3s'
      })
      const [ prevRoute ] = this.routeList.slice(-1)
      const url = prevRoute ? prevRoute.fullPath : '/workbench'
      this.$router.push(url)
    }
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
#header-tabs{
  position: absolute;
  left: 0;
  right: 0;
  height: 40px;
  border: 1px solid #F5F5F5;
  .tab{
    position: relative;
    float: left;
    height: 40px;
    padding-left: 20px;
    padding-right: 20px;
    line-height: 40px;
    text-align: center;
    font-size: 15px;
    box-sizing: border-box;
    white-space: nowrap;
    border-right: 1px solid #F5F5F5;
    color: #666;
    cursor: pointer;
    .close{
      margin-left: 12px;
      width: 9px;
      height: 9px;
    }
  }
  .tab:nth-last-child(1){
    border-left: 1px solid #F5F5F5;
  }
  .active{
    border-top: 2px solid #333333;
    color: #333333;
    background:rgba(246,246,246,1);
  }
  .tab-container{
    position: absolute;
    height: 40px;
    left: 106px;
    right: 53px;
    overflow: hidden;
  }
  .contextmenu{
    position: absolute;
    top: 50px;
    z-index: 999;
    width: 140px;
    height: 160px;
    padding: 20px 10px;
    box-sizing: border-box;
    line-height: 30px;
    color: #000;
    background: #fff;
    box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
    border-radius: 4px;
    .el-icon-caret-top{
      position: absolute;
      left: 70px;
      top: -12px;
      margin-left: -10px;
      font-size: 20px;
      color: #fff;
    }
    li{
      padding: 0 10px;
      font-size: 14px;
      border-bottom: 1px solid #fbfbfb;
      cursor: pointer;
    }
    li:nth-last-child(1){
      border-bottom: none;
    }
  }
}
</style>

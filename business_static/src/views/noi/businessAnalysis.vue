<!--
 * @Author: winerss
 * @Date: 2020-05-26 20:07:32
 * @LastEditTime: 2020-05-27 19:38:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\noi\businessAnalysis.vue
-->
<template>
  <div id="business-analysis">
    <!-- header -->
    <div class="block header">
      <el-row>
        <el-col :span="20">
          <el-image class="pull-left building" :src="images.building"></el-image>
          <h3 class="title">中山公园龙之梦</h3>
          <div class="area-group">
            <p class="area">总建筑面积：47440㎡</p>
            <p class="area">经营建筑面积：39602㎡</p>
            <p class="area">可出租面积：2300㎡</p>
          </div>
        </el-col>
        <el-col :span="4">
          <h3 class="pull-right">估值:13.4亿元</h3>
        </el-col>
      </el-row>
      <el-row class="icon-group">
        <el-col :span="4" v-for="(item, index) in icons" :key="index">
          <div class="title">
            <el-image class="icon" :src="item.icon"></el-image>
            <span>出租率</span>
          </div>
          <p class="value">{{item.value}}</p>
        </el-col>
      </el-row>
    </div>
    <!-- 收入报表 -->
    <el-row :gutter="20" class="total-report">
      <el-col :span="8" v-for="(item, index) in totalReport" :key="index">
        <div class="block">
          <div class="clearfix">
            <div class="pull-left">
              <img :src="item.icon" alt="">
              <span class="title">{{item.title}}</span>
            </div>
            <div class="pull-right">
              <span>{{item.type}}：</span>
              <span class="increase" v-if="item.rate > 0">
                <i class="el-icon-caret-top"></i>
                {{item.rate}}%
              </span>
              <span class="decrease" v-else>
                <i class="el-icon-caret-bottom"></i>
                {{Math.abs(item.rate)}}%
              </span>
            </div>
            <div class="pull-right"></div>
          </div>
          <h3 class="value">129.48<span class="unit">万元</span></h3>
          <line-chart style="height: 110px" :datas="item.charts"></line-chart>
        </div>
      </el-col>
    </el-row>
    <!-- 收入支出 -->
    <div class="income">
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="收入" name="first"></el-tab-pane>
        <el-tab-pane label="支出" name="second"></el-tab-pane>
      </el-tabs>
      <div v-show="activeName == 'first'">
        <el-row :gutter="20">
          <el-col :span="14" class="left-side">
            <h4>收入趋势</h4>
            <zoom-chart
              style="height: 380px;"
              :datas = incomeTrend></zoom-chart>
            <div class="lenged-bottom" style="width: 120px">
              <div class="pull-left"><i class="color-block" style="background: #5E0EFF"></i>收入</div>
              <div class="pull-right"><i class="color-block" style="background: #FCB644"></i>同比</div>
            </div>
          </el-col>
          <el-col :span="10">
            <h4>收入分布</h4>
            <el-row>
              <el-col :span="12" v-for="(item, index) in incomeDistribution" :key="index">
                <div class="ring-wrapper">
                  <ring-chart style="height: 150px" :datas="item"></ring-chart>
                  <p class="value text-center">{{item.value}}%</p>
                  <p class="title text-center">{{item.name}}</p>
                </div>
              </el-col>
            </el-row>
          </el-col>
        </el-row>
      </div>
    </div>
    <!-- 租约情况 -->

  </div>
</template>
<script>
import mock from './mock'

import lineChart from '@/components/echarts/line-chart'
import zoomChart from '@/components/echarts/zoom-chart'
import ringChart from '@/components/echarts/ring-chart'
import pieChart from '@/components/echarts/pie-chart'

export default {
  data () {
    return {
      images: mock.images,
      icons: mock.icons,
      totalReport: mock.totalReport,
      activeName: 'first',
      incomeTrend: mock.incomeTrend,
      incomeDistribution: mock.incomeDistribution
    }
  },
  methods: {

  },
  components: {
    'line-chart': lineChart,
    'zoom-chart': zoomChart,
    'ring-chart': ringChart,
    'pie-chart': pieChart
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
@import './style';
</style>

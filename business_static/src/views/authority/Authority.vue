<template>
  <el-tabs v-model="activeTab" class="person-authority-container">
    <el-tab-pane label="组织架构" name="1">
      <department />
    </el-tab-pane>
    <el-tab-pane label="权限分配" name="2">
      <dist />
    </el-tab-pane>
    <el-tab-pane label="操作日志" name="3">
      <log :active="activeTab === '3'"/>
    </el-tab-pane>
  </el-tabs>
</template>

<script>
import Department from './Department'
import Dist from './Dist'
import Log from './log'

export default {
  name: 'Authority',
  components: {Department, Dist, Log},
  data () {
    return {
      activeTab: '1'
    }
  }
}
</script>

<style lang="scss">
  .person-authority-container {
    min-height: 70vh;
    background-color: white;
    border: 1px solid #E3E2E2;
    border-radius: 3px;

    .el-tabs__nav-wrap {
      line-height: 49px;
      padding: 10px 20px 0;
    }
    .el-tabs__item {
      font-size: 15px;
    }
    .el-tabs__header {
      margin-bottom: 0;
    }
  }
</style>

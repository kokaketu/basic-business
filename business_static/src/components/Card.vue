<template>
  <el-card class="card">
    <div slot="header" class="card-header clearfix">
      <span class="title">{{title}}</span>
      <slot name="header-right"/>
    </div>
    <slot/>
  </el-card>
</template>

<script>
export default {
  name: 'Card',
  props: {
    title: String,
  },
}
</script>

<style scoped>
  .card {
    font-size: 14px;
  }

  .card-header {
    padding: 3px 2px;
  }

  .title {
    font-size: 18px;
    color: #1F242D;
    font-weight: bold;
  }
</style>

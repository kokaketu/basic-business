<template>
  <el-card shadow="always">
    <div class="card-data">
      <div class="card-icon fr" >
        <img :src="img" alt="">
      </div>
      {{title}}
      <el-tooltip placement="top">
        <div slot="content">{{tip}}</div>
        <img class="tooltip" src="./assets/warn.svg" alt="">
      </el-tooltip>
      <div class="amount">{{amount}}</div>
      <slot></slot>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'CardData',
  props: ['title', 'img', 'tip', 'amount']
}
</script>

<style scoped>
  .card-data {
    position: relative;
    padding: 5px;
    font-size: 15px;
  }
  .card-icon {
    position: absolute;
    top: 0;
    right: 0;
    margin-top: -8px;
  }
  .tooltip {
    vertical-align: top;
  }
  .amount {
    min-height: 40px;
    margin: 10px 0 20px;
    font-size: 40px;
    font-weight: bold;
  }
</style>

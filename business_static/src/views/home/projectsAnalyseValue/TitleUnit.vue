<template>
  <title-suffix :title="title">
    <span class="unit">单位：{{unit}}</span>
  </title-suffix>
</template>

<script>
import TitleSuffix from './TitleSuffix'

export default {
  name: 'TitleUnit',
  components: { TitleSuffix },
  props: {
    title: {
      type: String,
      default: '',
      required: false
    },
    unit: {
      type: String,
      default: '万元',
      required: false
    }
  }
}
</script>

<style scoped>
.unit {
  float: right;
  font-size: 14px;
  color: #999;
  text-align: right;
}
</style>

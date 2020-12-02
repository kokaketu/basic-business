<template>
  <div class="container">
    <span class="title">{{title}}</span>
    <slot/>
  </div>
</template>

<script>
export default {
  name: 'TitleSuffix',
  props: {
    title: {
      type: String,
      default: '',
      required: false
    },
  }
}
</script>

<style scoped>
.container {
  padding: 15px 0;
}
.title{
  font-size: 16px;
  font-weight: bold;
}
</style>

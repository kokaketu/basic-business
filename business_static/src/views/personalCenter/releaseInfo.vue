
<template>
  <div class="release-info-body">
    <div class="title">
      发布上架信息
    </div>
  </div>
</template>

<script>

export default {
  components: {},
  data () {
    return {
      releaseInfo: []
    }
  },
  activated () {
  },
  methods: {
  },
}
</script>
<style lang="scss" scoped>

.release-info-body {
  border-radius:3px;
  /*border:1px solid rgba(227,226,226,1);*/
  .title {
    line-height: 60px;
    padding: 0 20px 0 0;
    font-weight: bold;
    > .fr {
      margin-top: 12px;
    }
  }
}
</style>

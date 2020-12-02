<!--
 * @Author: your name
 * @Date: 2020-05-27 09:27:39
 * @LastEditTime: 2020-05-27 19:44:33
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\AssetType.vue
-->
<template>
  <div class="state">
    <span
      :class="{active: code == active}"
      v-for="{code, name} in types()"
      @click="change(code)"
      :key="code"
    >{{name}}</span>
  </div>
</template>

<script>
/* eslint-disable camelcase */
import { ASSET_TYPEs } from './const'

export default {
  name: 'AssetType',
  props: ['active', 'change'],
  data () {
    return {}
  },
  methods: {
    types () {
      return ASSET_TYPEs
    }
  }
}
</script>

<style lang="scss" scoped>
  .state {
    padding: 6px 0;
    > {
      span {
        display: inline-block;
        height: 28px;
        line-height: 28px;
        margin-right: 20px;
        padding: 0 11px;
        background: #F5F6F9;
        border: 1px solid #E2E3E5;
        border-radius: 2px;
        cursor: pointer;
      }

      .active {
        color: white;
        background-color: #5E0EFF;
        border-color: #5E0EFF;
      }
    }
  }
</style>

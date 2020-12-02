<!--
 * @Author: your name
 * @Date: 2020-06-12 18:43:43
 * @LastEditTime: 2020-07-02 15:43:06
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\home\projectsAnalyseValue\AssetType.vue
-->
<template>
  <div class="asset-type">
    <span
      :class="['type', {active: code === assetType}]"
      v-for="{code, name} in ASSET_TYPEs"
      :key="code"
      @click="assetTypeChange(code)"
    >{{name}}</span>
  </div>
</template>

<script>
import { ASSET_TYPEs } from 'src/components/const'

export default {
  name: 'AssetType',
  props: {
    assetType: {
      type: String,
      required: true,
    }
  },
  data() {
    return {
      ASSET_TYPEs: [
        {code: '', name: '全部'},
        {code: '2', name: '商业'},
        {code: '1', name: '办公'},
        {code: '3', name: '产业园'}
      ]
    }
  },
  created () {
    // this.ASSET_TYPEs = ASSET_TYPEs
  },
  methods: {
    assetTypeChange (code) {
      if (code !== this.assetType) {
        this.$emit('change', code)
      }
    }
  },
}
</script>

<style scoped>

  .type {
    display: inline-block;
    padding: 0 10px;
    border-left: 1px solid #DADADA;
    cursor: pointer;
  }

  .active {
    color: #5E0EFF;
    cursor: default;
  }

  .asset-type .type:nth-child(1) {
     border-left: none;
  }
</style>

<!--
 * @Author: your name
 * @Date: 2020-07-23 16:22:52
 * @LastEditTime: 2020-08-24 16:40:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\InputNumber.vue
-->
<template>
  <el-input
    v-model="newValue"
    :class="className"
    :size="size"
    :placeholder="placeholder">
    <template
      v-if="unit"
      slot="append">{{unit}}</template>
  </el-input>
</template>
<script>
import { isNull } from 'lodash-es'
export default {
  props: ['value', 'className', 'placeholder', 'unit', 'max', 'min', 'size'],
  data () {
    return {
      newValue: ''
    }
  },
  watch: {
    value: {
      handler () {
        const value = this.value
        this.newValue = isNull(value) ? '' : value
      },
      immediate: true
    },
    newValue: {
      handler () {
        if (this.newValue !== undefined) {
          const isNegative = this.newValue.toString().slice(0, 1) === '-'
          const value = isNegative ? this.newValue.toString().slice(1) : this.newValue.toString()
          let result = (isNegative ? '-' : '') + value.toString()
            .replace(/[^\d.]/g, '')
            .replace(/\.{2,}/g, '.')
            .replace(/^\./g, '')
            .replace('.', '$#$').replace(/\./g, '').replace('$#$', '.')
            .replace(/^(-)*(\d+)\.(\d\d).*$/, '$1$2.$3')
          if (this.max !== undefined) {
            result = result > this.max ? this.max : result
          }
          if (this.min !== undefined) {
            result = result < this.min ? this.min : result
          }
          this.newValue = result
          this.$emit('input', result)
        }
      },
      immediate: true
    }
  },
  activated () {
    const value = this.value
    this.newValue = isNull(value) ? '' : value
  }
}
</script>

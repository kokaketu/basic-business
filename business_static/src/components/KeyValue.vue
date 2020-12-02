<!--
 * @Author: sunyu
 * @Date: 20200721
 * @LastEditTime: 2020-08-07 17:55:04
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\KeyValue.vue
-->
<template>
  <div class="state">
    <div class='key-label'>{{keytag}}</div>
    <div class='value-label'>{{value}}{{unit}}</div>
  </div>
</template>

<script>
import { isNull } from 'lodash-es'
export default {
  name: 'KeyValue',
  props: {
    keytag: {
      type: String
    },
    valuetag: {
      default: ''
    },
    unit: {
      type: String,
      default: ''
    }
  },
  computed: {
    value () {
      if (this.valuetag !== '' && !isNull(this.valuetag)) {
        return this.valuetag.toString() ? this.valuetag.toString().replace(/null|undefined/g, '-') : '-'
      } else {
        return '-'
      }
    }
  },
  data () {
    return {
    }
  },
  activated () {
  }
}
</script>

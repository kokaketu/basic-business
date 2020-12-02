<!--
 * @Author: your name
 * @Date: 2020-06-09 20:38:26
 * @LastEditTime: 2020-07-14 10:27:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\PayerAutoComplete.vue
-->
<template>
  <el-form-item :label="label" :prop="prop" :required="required">
    <el-select
      class="select-width-100"
      v-model="payerId"
      clearable
      filterable
      :placeholder="placeholder"
      @change="selectPayer"
    >
      <el-option
        v-for="{ fid, companyId, companyName} in payerNames"
        class='select-option-selected'
        :value="companyId"
        :label="companyName"
        :key="fid"
      />
    </el-select>
  </el-form-item>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'PayerAutoComplete',
  props: {
    label: {
      type: String,
      default: '付款方：',
    },
    placeholder: {
      type: String,
      default: '请选择付款方',
    },
    prop: String,
    id: Number,
    required:String,
  },
  data () {
    return {
      payerId: null,
    }
  },
  computed: mapState(['payerNames']),
  watch: {
    id (id) {
      this.payerId = id
    }
  },
  activated () {
    this.$store.dispatch('setPayerNames', {})
  },
  methods: {
    payerNameSearch (queryString, cb) {
      if (!queryString) {
        this.$emit('select')
      }
      const results = queryString
        ? this.payerNamesLabel.filter(({ value }) => (value + '').includes(queryString))
        : this.payerNamesLabel

      cb(results)
    },
    selectPayer (id) {
      const company = this.payerNames.find(({ companyId }) => companyId === id) || {}
      this.$emit('select', id, company)
    },
  }
}
</script>

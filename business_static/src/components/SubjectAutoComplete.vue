<!--
 * @Author: your name
 * @Date: 2020-06-09 20:38:26
 * @LastEditTime: 2020-07-29 17:30:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\SubjectAutoComplete.vue
-->
<template>
  <el-form-item :label="label" :prop="prop">
    <el-select
      class="select-width-100"
      v-model="code"
      clearable
      filterable
      :placeholder="placeholder"
      @change="selectSubject"
    >
      <el-option
        v-for="{subjectCode, subjectName} in subjectNamesLabel"
        class='select-option-selected'
        :value="subjectCode"
        :label="subjectName"
        :key="subjectCode"
      />
    </el-select>
  </el-form-item>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'SubjectAutoComplete',
  props: {
    label: {
      type: String,
      default: '款项名称：',
    },
    placeholder: {
      type: String,
      default: '请选择款项名称',
    },
    test: {
      type: String,
      default: '',
    },
    prop: String,
    subjectCode: String,
    scope: Object,
  },
  data () {
    return {
      code: void 0
    }
  },
  computed: mapGetters(['subjectNamesLabel', 'merchant']),
  watch: {
    subjectCode (subjectCode) {
      this.code = subjectCode
    }
  },
  activated () {
    this.$store.dispatch('setSubjectNames', {refresh: false})
    if (this.subjectId !== this.id) {
      this.id = this.subjectId
    }
  },
  methods: {
    selectSubject (value) {
      this.$emit('select', this.subjectNamesLabel.find(({ subjectCode }) => value === subjectCode) || {}, this.scope)
    },
  }
}
</script>

<!--
 * @Author: your name
 * @Date: 2020-06-13 13:36:55
 * @LastEditTime: 2020-09-04 10:30:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\ProjectAutoComplete.vue
-->
<template>
  <el-form-item :label="label" :prop="prop">
    <el-select
      class="select-width-100"
      v-model="id"
      clearable
      filterable
      :size="size"
      :placeholder="placeholder"
      @change="selectProject"
    >
      <el-option
        v-for="{assetName, id} in projectList"
        class='select-option-selected'
        :value="id"
        :label="assetName"
        :key="id"
      />
    </el-select>
  </el-form-item>
</template>

<script>
import { mapState } from 'vuex'
import { get } from 'lodash-es'

export default {
  name: 'ProjectAutoComplete',
  props: {
    label: {
      type: String,
      default: '项目名称：',
    },
    placeholder: {
      type: String,
      default: '请选择项目名称',
    },
    size: {
      type: String,
      default: 'medium',
    },
    assetLayout: {
      type: String,
      default: '',
    },
    prop: String,
    projectId: Number
  },
  data () {
    return {
      id: void 0,
      projectList: []
    }
  },
  computed: mapState(['projects']),
  watch: {
    projectId (projectId) {
      this.id = projectId
    }
  },
  mounted () {
    this.$store.dispatch('setProjects', {isUpdate: false})
      .then((res) => {
        if (this.assetLayout) {
          this.projectList = this.projects.filter(item => item.assetLayout === '2')
        } else {
          this.projectList = this.projects
        }
        this.$emit('complete', get(res, '[0]') || {})
      })
  },
  methods: {
    selectProject (value) {
      this.$emit('select', (this.projects || []).find(({ id }) => value === id) || {})
    },
  }
}
</script>

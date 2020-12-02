<!--
 * @Author: your name
 * @Date: 2020-07-14 19:34:41
 * @LastEditTime: 2020-07-16 21:33:01
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\ProjectSelect.vue
-->
<template>
  <el-select
    class="select-width-100"
    v-model="id"
    clearable
    filterable
    :size="size"
    placeholder="请选择项目"
    @change="selectProject"
  >
    <el-option class='select-option-selected' :value="void 0" label="所有项目"/>
    <el-option
      v-for="{assetName, id} in projects"
      class='select-option-selected'
      :value="id"
      :label="assetName"
      :key="id"
    />
  </el-select>
</template>

<script>
import { mapState } from 'vuex'
import { get } from 'lodash-es'

export default {
  name: 'ProjectSelect',
  props: {
    label: {
      type: String,
      default: '项目名称：',
    },
    size: {
      type: String,
      default: 'medium',
    },
    projectId: Number,
  },
  data () {
    return {
      id: void 0,
    }
  },
  computed: mapState(['projects']),
  watch: {
    projectId (projectId) {
      this.id = projectId
    }
  },
  activated () {
    this.$store.dispatch('setProjects', {isUpdate: false})
      .then((res) => {
        this.$emit('complete', get(res, '[0]') || {})
      })
  },
  methods: {
    selectProject (value) {
      this.$emit('select', (this.projects || []).find(({ id }) => value === id) || {}, value)
    },
  }
}
</script>

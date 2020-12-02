<!--
 * @Author: your name
 * @Date: 2020-06-13 13:36:55
 * @LastEditTime: 2020-08-14 13:38:32
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\UpdateFormDialog.vue
-->
<template>
  <el-dialog :visible.sync="dialogFormVisible" :close-on-click-modal="false" :destroy-on-close="true">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">新增/编辑</span>
      </div>
      <el-form :inline="true" :model="form" :rules="rules" ref="form">
        <slot/>
        <!--<el-form-item
          label="活动名称"
          :rules="[
            {required: true, message: '域名不能为空',},
          ]"
          prop="name"
        >
          <el-input v-model="form.name"/>
        </el-form-item>
        <el-table border :data="tableData">
          <el-table-column
            prop="code"
            label="日期"
          >
            <template slot-scope="scope">
              <el-form-item
                prop="name1"
              >
                <el-input type="text" v-model="tableData[scope.$index].value"/>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column
            prop="date"
            label="日期"
          >
            <template slot-scope="scope">
            </template>
          </el-table-column>
        </el-table>-->
        <div style="padding-top: 20px;">
          <el-button type="default" @click="submit"><span style="color: #5E0EFF">+ 增加一行</span></el-button>
          <el-button type="primary" @click="submit" class="fr">保存</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>

<script>
export default {
  name: 'UpdateFormDialog',
  props: {
    rules: Object,
  },
  data () {
    return {
      dialogFormVisible: true,
      form: {},
    }
  },
  activated () {},
  methods: {
    submit () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.$emit('submit:save', {...this.form})
        } else {
          return false
        }
      })
    },
  },
}
</script>

<style scoped>
  .title {
    font-size: 16px;
    font-weight: bold;
    color: #333;
  }

  .box-card {
    margin: -60px -20px -30px;
  }
</style>

<!--数据导入template-->
<template>
  <div id="imports" class="page">
    <div class="filter-wrapper">
      <div class="file-content">
        <div class="file-select clearfix">
          <el-upload
            action="''"
            class="file-upload"
            :show-file-list="false"
            :auto-upload="false"
            :on-change="fileChange"
          >
            <el-input placeholder="请选择文件（不大于20M）" v-model="file.name"/>
          </el-upload>
          <el-button class="btn" @click.stop="imports" :loading="loading">上传</el-button>
        </div>
        <div class="file-down" v-show="type==='project'">
          <el-link href="/static/file/project_import_template.xlsx" :underline="false" download="项目导入模板.xlsx">下载项目导入模板</el-link>
        </div>
        <div class="file-down" v-show="type==='staging'">
          <el-link href="/static/file/staging_import_template.xlsx" :underline="false" download="分期导入模板.xlsx">下载分期导入模板</el-link>
        </div>
        <div class="file-down" v-show="type==='building'">
          <el-link href="/static/file/building_import_template.xlsx" :underline="false" download="楼栋导入模板.xlsx">下载楼栋导入模板</el-link>
        </div>
        <div class="file-down" v-show="type==='floor'">
          <el-link href="/static/file/floor_import_template.xlsx" :underline="false" download="楼层导入模板.xlsx">下载楼层导入模板</el-link>
        </div>
        <div class="file-down" v-show="type==='rentalUnit'">
          <el-link href="/static/file/room_import_template.xlsx" :underline="false" download="租赁单元导入模板.xlsx">下载租赁单元导入模板</el-link>
        </div>
        <div class="file-down" v-show="type==='device'">
          <el-link href="/static/file/device_import_template.xlsx" :underline="false" download="设备导入模板.xlsx">下载设备导入模板</el-link>
        </div>
        <!--
        <div class="file-down" v-show="type==='budget-making-list'">
          <el-link href="/static/file/budget_making_import_template.xlsx" :underline="false" download="预算编制导入模板.xlsx">下载预算编制导入模板</el-link>
        </div>
        -->
      </div>
    </div>
    <div class="table-wrapper">
      <div v-show="result.code">
      <div class="text-content" v-show="result.code !== '0'">
        <span :style="[{color: 'red'}, {fontSize: '18px'}]">导入失败！原因：<br/><br/></span>
        <span :style="[{lineHeight: '25px'}]" v-html="result.msg"></span>
      </div>
      <div class="text-content" v-show="result.code === '0'">
        <span :style="[{lineHeight: '25px'}]">导入成功&nbsp;&nbsp;&nbsp;</span>
        <el-link @click="$router.push($route.path.replace('/import', ''))" :underline="false">查看</el-link>
      </div>
    </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { http } from '@/http/index'
export default {
  data () {
    return {
      type: this.$route.query.type,
      result: {},
      file: {},
      loading: false,
      routeFrom: '',
      routeTo: ''
    }
  },
  activated () {
  },
  computed: mapState(['merchant', 'permissionList']),
  watch: {
    $route: {
      handler (to, from) {
        this.routeFrom = from
        this.routeTo = to
      },
      deep: true
    }
  },
  methods: {
    imports () {
      if (this.file.raw) {
        let url = ''
        let data = new FormData()
        data.append('file', this.file.raw)
        data.append('mainId', this.merchant.id)

        if (this.type === 'project') {
          // 项目导入
          url = '/asset-basedata-web/bsAsset/upload'
        } else if (this.type === 'staging') {
          // 分期导入
          url = '/asset-basedata-web/bsAssetStages/upload'
        } else if (this.type === 'building') {
          // 楼栋导入
          url = '/asset-basedata-web/bsBuilding/upload'
        } else if (this.type === 'floor') {
          // 楼层导入
          url = '/asset-basedata-web/bsFloor/import'
        } else if (this.type === 'rentalUnit') {
          // 租赁单元导入
          url = '/asset-basedata-web/bsRoom/rentalUnit/import'
        } else if (this.type === 'device') {
          // 设备导入
          url = '/asset-basedata-web/bsDevice/upload'
        } else if (this.type === 'budget-making-list') {
          // 预算编制导入
          url = '/asset-budget-web/budgetDetail/import'
        } else if (this.type === 'budget-fill-list') {
          // 预算执行填报导入
          this.$message('功能建设中')
        } else {
          this.$message.error('不存在的导入类型')
        }
        if (url) {
          this.loading = true
          http.post(url, data, {hideErrMsg: true}).then(res => {
            if (res.msg) {
              res.msg = res.msg.replace(/\n/g, '<br/>')
            }
            this.file = {}
            this.loading = false
            this.result = res
          })
        }
      } else {
        this.$message.warning('请选择文件后上传')
      }
    },
    fileChange (file) {
      if (file.size > 1024 * 1024 * 20) {
        this.$message.error('文件大小超过20M，请重新选择。')
      } else {
        this.file = file
      }
    }
  },
}
</script>
<style lang="scss" scoped>
  #imports{
    .block{
      background: #fff;
      padding: 20px;
    }
    .filter-wrapper{
      height: 80px;
      padding-top: 200px;
      margin-bottom: 0;
      .file-content{
        width: 660px;
        margin-top: 0px;
        margin-left: auto;
        margin-right: auto;
        .file-select{
          .file-upload{
            float: left;
            width: 550px;
            height: 40px;
          }
          .el-button{
            width: 100px;
            height: 40px;
            margin-left: 10px;
            float: left;
            color: #fff;
            border-color: #5E0EFF;
            background-color: #5E0EFF;
          }
        }
        .file-down{
          margin-top: 10px;
          .el-link{
            margin-right: 20px;
          }
        }
      }
      .el-input{
        width: 550px;
        cursor: pointer;
      }
    }
    .table-wrapper{
      padding: 0px 20px;
      height: 54vh;
      .text-content{
        width: 660px;
        height: 54vh;
        overflow-y: auto;
        overflow-x: auto;
        font-size: 14px;
        margin-left: auto;
        margin-right: auto;
        .text-result{
          color: #e5e5e5;
        }
      }
    }
  }
</style>

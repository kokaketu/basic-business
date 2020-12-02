<template>
  <div id="staging-detail">
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName}} &nbsp; - &nbsp; 创建时间：{{ruleForm.createdDate ? ruleForm.createdDate.slice(0, 10) : '-'}}</div>
        <div class="headRight">
          <el-button class="btn pull-right" :disabled="permission" @click.native="edit" style="margin-right: 0">编辑</el-button>
          <el-button class="btn btn-default pull-right" :disabled="permission" @click.native="del" style="margin-right: 0">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>分期编号</div>
          <div class='value-label'>{{ruleForm.stagesCode}}</div>
        </div>
        <div class="state">
          <div class='key-label'>分期名称</div>
          <div class='value-label'>{{ruleForm.stagesName}}</div>
        </div>
        <div class="state">
          <div class='key-label'>项目名称</div>
          <div class='value-label'>{{ruleForm.assetName}}</div>
        </div>
        <div class="state">
          <div class='key-label'>经营阶段</div>
          <div class='value-label'>{{operationObj[ruleForm.operationStage]}}</div>
        </div>
        <div class="state">
          <div class='key-label'>车位数</div>
          <div class='value-label'>{{ruleForm.parkingLotNum || '-'}}</div>
        </div>
      </div>
      <div class="new-block-title">建筑信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>总建筑面积</div>
          <div class='value-label'>{{ruleForm.totalBuildingArea ? ruleForm.totalBuildingArea + ' ㎡' : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>地上建筑面积</div>
          <div class='value-label'>{{ruleForm.groundAreaUp ? ruleForm.groundAreaUp + ' ㎡' : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>地下建筑面积</div>
          <div class='value-label'>{{ruleForm.groundAreaDown ? ruleForm.groundAreaDown + ' ㎡' : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>总套内面积</div>
          <div class='value-label'>{{ruleForm.innerArea ? ruleForm.innerArea + ' ㎡' : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>总可出租面积</div>
          <div class='value-label'>{{ruleForm.rentableArea ? ruleForm.rentableArea + ' ㎡' : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>总配套商业面积</div>
          <div class='value-label'>{{ruleForm.businessArea ? ruleForm.businessArea + ' ㎡' : '-'}}</div>
        </div>
      </div>
      <div class="new-block-title">产权信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>竣工时间</div>
          <div class='value-label'>{{ruleForm.completedDate ? ruleForm.completedDate.substr(0, 10) : '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>交付时间</div>
          <div class='value-label'>{{ruleForm.deliverDate ? ruleForm.deliverDate.substr(0, 10) : '-'}}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { getStagingDetail, stagingDelete } from '@/http/assets'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {},
      operationObj: {0: '', 1: '未营业', 2: '试营业', 3: '筹备期', 4: '培育期', 5: '成熟期'}
    }
  },
  computed: mapState(['permissionList', 'merchant']),
  methods: {
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/staging/edit/' + contractID)
    },
    del () {
      const projectId = this.$route.params.id
      this.$confirm('此操作将删除项目, 是否继续?', '删除确认', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        cancelButtonClass: 'btn-custom-cancel',
        type: 'warning'
      }).then(
        () => {
          stagingDelete({id: projectId}).then(res => {
            if (res.code === '0') {
              this.$message.success(res.msg)
              this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id, isUpdate: true})
              this.$store.dispatch('setProjects', {isUpdate: true})
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/asset/staging')
            }
          })
        }
      )
    },
    getDetail () {
      const projectId = this.$route.params.id
      getStagingDetail({id: projectId}).then(res => {
        this.ruleForm = res
      })
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getDetail()
  }
}
</script>

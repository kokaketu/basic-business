<template>
  <div id="multiplePoints-detail">
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName || '-'}} &nbsp; - &nbsp; 创建时间：{{ruleForm.createdDate ? ruleForm.createdDate.slice(0, 10) : '-'}}</div>
        <div class="headRight">
          <el-button class="btn pull-right" :disabled="permission" @click.native="edit" style="margin-right: 0">编辑</el-button>
          <el-button class="btn btn-default pull-right" :disabled="permission" @click.native="del" style="margin-right: 0">删除</el-button>
        </div>
      </div>
      <div class="new-block-title">基本信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>项目名称</div>
          <div class='value-label'>{{ruleForm.assetName || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>多经编号</div>
          <div class='value-label'>{{ruleForm.roomNo || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>位置区域</div>
          <div class='value-label'>{{ruleForm.address || '-'}}</div>
        </div>
       <div class="state">
          <div class='key-label'>点位类型</div>
          <div class='value-label'>{{ruleForm.pointTypeStr || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>多经类型</div>
          <div class='value-label'>{{ruleForm.diverseTypeStr || '-'}}</div>
        </div>
        <div class="state" v-show="ruleForm.diverseTypeStr == '其他'">
          <div class='key-label'>类型描述</div>
          <div class='value-label'>{{ruleForm.diverseRemark || '-'}}</div>
        </div>

      </div>
      <div class="new-block-title">其他信息</div>
      <div class="detailInfo">
        <div class="state">
          <div class='key-label'>楼栋名称</div>
          <div class='value-label'>{{ruleForm.buildingName || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>楼层名称</div>
          <div class='value-label'>{{ruleForm.floorName || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>场内/场外</div>
          <div class='value-label'>{{ruleForm.inOrOutStr || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>是否露天</div>
          <div class='value-label'>{{ruleForm.isOpenAirStr || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>可出租面积</div>
          <div class='value-label'>{{ruleForm.rentableArea || '-'}}</div>
        </div>
        <div class="state">
          <div class='key-label'>备注</div>
          <div class='value-label'>{{ruleForm.remark || '-'}}</div>
        </div>
      </div>
      <div class="new-block-title">历史合同</div>
      <div class="new-block">
        <div class="table-wrapper table-input remove-style">
          <el-table
            :data="ruleForm.historicalContractVOS"
            border
            style="width: 100%;">
            <el-table-column
            prop="contNo"
            label="合同编号">
          </el-table-column>
          <el-table-column
            label="租户"
            prop="companyName">
          </el-table-column>
          <el-table-column
            prop="contRange"
            label="合同期限">
          </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { diverseDetail, diverseDelete } from '@/http/assets'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {}
    }
  },
  computed: mapState(['permissionList']),
  methods: {
    getDetail () {
      const projectId = this.$route.params.id
      diverseDetail({id: projectId}).then(res => {
        this.ruleForm = res.data
      })
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/asset/multiplePoints/edit/' + contractID)
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
          diverseDelete({id: projectId}).then(res => {
            if (res.code === '0') {
              this.$message.success(res.msg)
              setTimeout(() => {
                // 删除路由
                this.$destroy()
                this.$store.dispatch('setRouteList', {
                  route: this.$route,
                  type: 'delete'
                })
                this.$router.push('/asset/multiplePoints')
              }, 1000)
            }
          })
        }
      )
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getDetail()
  }
}
</script>

<!--
 * @Author: your name
 * @Date: 2020-10-26 15:49:01
 * @LastEditTime: 2020-10-30 15:46:17
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\channel\Intermediary\detail.vue
-->
<template>
  <div id="intermediary-detail">
    <div class="base-info">
      <div class="clearfix new-block">
        <el-button :disabled="permission" class="btn btn-default pull-right" @click.native="del" style="margin-right: 0">删除</el-button>
        <el-button :disabled="permission" class="btn pull-right" @click.native="edit" style="margin-right: 10px">编辑</el-button>
      </div>
      <div class="new-block-title">基本信息</div>
      <div class="detailInfo">
        <KeyValue
          keytag="渠道名称："
          :valuetag="detail.agencyName" />
        <KeyValue
          keytag="渠道类型："
          :valuetag="detail.type" />
        <KeyValue
          keytag="渠道等级："
          :valuetag="detail.level" />
        <KeyValue
          keytag="所在区域："
          :valuetag="detail.origin" />
        <KeyValue
          keytag="详细地址："
          :valuetag="detail.address" />
        <KeyValue
          keytag="人数规模："
          :valuetag="detail.agencyScale" />
        <KeyValue
          keytag="佣金政策："
          :valuetag="detail.commPolicy" />
      </div>
      <div class="new-block-title">联系人信息</div>
      <div class="detailInfo">
        <KeyValue
          keytag="联系人姓名："
          :valuetag="detail.contacts" />
        <KeyValue
          keytag="联系电话："
          :valuetag="detail.mobile" />
      </div>
      <div v-if="detail.agencyType == 1">
        <div class="new-block-title">经纪人信息</div>
        <div class="detailInfo">
          <div style="width: 800px;margin: 20px 180px">
            <el-table
              :data="detail.contactAgentList"
              border>
              <el-table-column
                prop="agentName"
                label="经纪人姓名">
                <template slot-scope="scope">
                  <p>{{scope.row.agentName}}</p>
                </template>
              </el-table-column>
              <el-table-column
                prop="agentMobile"
                label="经纪人手机号">
                <template slot-scope="scope">
                  <p>{{scope.row.agentMobile}}</p>
                </template>
              </el-table-column>
            </el-table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { queryContactsDetail, delContacts } from '@/http/channel'
import { mapState } from 'vuex'
import KeyValue from '@/components/KeyValue'
export default {
  data () {
    return {
      permission: null,
      detail: null
    }
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    getDetail () {
      queryContactsDetail({
        id: this.$route.params.id
      }).then(res => {
        this.detail = res
        this.detail.type = ['中介公司', '独立经纪'][res.agencyType - 1]
        this.detail.level = ['金牌', '银牌', '铜牌'][res.agencyLevel - 1]
        this.detail.origin = '' + res.provinceName + res.cityName + res.areaName
      })
    },
    del () {
      delContacts({
        id: this.$route.params.id
      }).then(res => {
        if (res.code === '0') {
          this.$message.success(res.msg)
          // 删除路由
          this.$destroy()
          this.$store.dispatch('setRouteList', {
            route: this.$route,
            type: 'delete'
          })
          this.$router.push('/channel/intermediary')
        }
      })
    },
    edit () {
      this.$router.push('/channel/intermediary/edit/' + this.$route.params.id)
    }
  },
  activated () {
    this.getDetail()
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
  },
  components: {
    KeyValue
  }
}
</script>
<style lang="scss" scoped>
#intermediary-detail{
  .detailInfo{
    line-height: 28px;
  }
}
</style>

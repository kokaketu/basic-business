
<template>
  <div id="personal-center" class="border">

    <div class="main-info">
      <el-row>
        <el-col :span="20">
          <el-col :span="3">
            <div style="margin-left: 18px;margin-bottom: 20px;margin-right: 20px">
              <el-avatar :size="96" src="https://empty" @error="errorHandler">
                <img :src="memberInfo.avatarUrl" alt=""/>
              </el-avatar>
            </div>
            <el-button type="primary" style="margin-left: 21px" class="auth-button">
              认证详情
            </el-button>
            <el-button type="primary" v-show="false">点击认证</el-button>
            <el-button type="warning" v-show="false">转企业认证</el-button>
          </el-col>
          <el-col :span="4">
            <span>
                <span class="name" style="margin-right: 0">{{memberInfo.name}}</span>
                <span class="tag"><span class="tag-name">企业</span></span>
                <span class="tag"><span class="tag-name" v-show="false">未认证</span></span>
                <span class="tag"><span class="tag-name" v-show="false">个人</span></span>
            </span>
            <p class="name-bottom" style="margin-top: 15px;">手机号码：{{memberInfo.mobile}}</p>
            <p class="name-bottom">注册时间：{{memberInfo.createTime}}</p>
          </el-col>
        </el-col>
      </el-row>
    </div>

    <!-- tab页 -->
    <div>
    <el-tabs v-model="activeTab" class="person-center-tab">
      <el-tab-pane label="最近登录" name="1">
        <recentLogin />
      </el-tab-pane>
      <el-tab-pane label="我的订单" name="2">
        <myOrder />
      </el-tab-pane>
<!--      <el-tab-pane label="发布上架信息" name="3">
        <releaseInfo />
      </el-tab-pane>-->
    </el-tabs>
    </div>

  </div>
</template>

<script>
import recentLogin from './recentLogin'
import myOrder from './myOrder'
import releaseInfo from './releaseInfo'

import {
  queryByMobile,
} from '../../http/personalCenter'

export default {
  components: { recentLogin, myOrder, releaseInfo },
  data () {
    return {
      memberInfo: {},
      date: new Date(),
      activeTab: '1',
    }
  },
  activated () {
    this.queryByMobile()
  },
  methods: {
    queryByMobile () {
      queryByMobile({
        mobile: this.$store.getters.userInfo.mobile
      }).then((res) => {
        this.memberInfo = res
      })
    },
    errorHandler () {
      return true
    }
  },
}
</script>
<style lang="scss" scoped>
@import './style';
</style>

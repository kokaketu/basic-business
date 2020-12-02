<!--
 * @Author: your name
 * @Date: 2020-05-21 10:11:52
 * @LastEditTime: 2020-09-01 13:43:30
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\menus.vue
-->
<template>
  <el-aside id="menu">
    <el-scrollbar>
      <div class="menu-wrapper">
        <div class="content" @click="isShow = false">
          <div class="logo-wrapper" @click="projectVisible = true">
            <img src="../assets/logo.svg" alt="">
            <img style="width: 9px;margin-top: -10px;vertical-align: middle;" src="../assets/logo-triangle.svg" alt="">
          </div>

          <div class="submenu-wrapper" >
            <!-- 非创建组织（被邀请进组织） -->
            <div class="double-line" v-if="merchant && merchant.memberId !== userInfo.memberId">
              <img :src="certification" alt="">
              {{merchant.name}}
            </div>
            <div class="title" v-else>
              <img :src="certification" alt="">
              {{merchant.name || userInfo.name}}
            </div>
            <!-- 自创建组织 -->
            <!-- <div class="uncertification" v-if="merchant && merchant.memberId === userInfo.memberId">
              <span
                v-if="merchant.verifyStatus === null && !merchant.uniqueNO"
                @click="doCertification('')">
                去认证
              </span>
              <span
                v-if="merchant.verifyStatus === null && merchant.uniqueNO"
                @click="doCertification('processing')">
                审核中
              </span>
              <span
                v-if="merchant.verifyStatus === true"
                @click="doCertification('success')">
                成功认证
              </span>
              <span
                v-if="merchant.verifyStatus === false"
                @click="doCertification('failure')">
                认证失败
              </span>
            </div> -->
            <!-- 有多个组织 -->
            <span
              class="toggle"
              @click.stop="toggleMerchant"
              v-if="memberMerchantListLength > 1 || (merchant && merchant.memberId === userInfo.memberId && merchant.verifyStatus === true)">切换</span>
          </div>

          <el-menu
            background-color="#141414"
            text-color="#666666"
            active-text-color="#FFFFFF">
            <el-submenu
              v-for="(item, index) in menuList"
              :key="index"
              :index="item.id"
              @click.native="openPage('parent', item)">
              <template slot="title">
                <img :src="item.icon" style="margin-right: 15px;margin-top: -2px;">
                {{item.title}}
              </template>
              <el-menu-item-group>
                <el-menu-item
                  v-for="(child, index) in item.child"
                  :key="index"
                  :index="child.id"
                  @click.native="openPage('child', child)">
                  {{child.name}}
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </div>
      </div>
    </el-scrollbar>
    <div class="merchants" v-show="isShow" @click.self="isShow = false">
      <div class="wrapper">
        <div class="header">
          切换组织
          <i class="el-icon-close" @click.stop="isShow = !isShow"></i>
        </div>
        <ul class="content">
          <div class="header">加入的组织</div>
          <li
            v-for="(item, index) in merchantList"
            @click="selectMerchant(item)"
            :key="index"
            :class="{'active': merchant.id === item.id}">
            <span>
              <img class="icon" :src="certification" alt="">{{item.name}}
            </span>
          </li>
        </ul>
        <ul class="content">
          <div class="header">创建的组织</div>
          <li
            v-for="(item, index) in myMerchantList"
            @click="selectMerchant(item)"
            :key="index"
            :class="{'active': merchant.id === item.id}">
            <span>
              <!-- <img v-if="merchant && merchant.memberId === userInfo.memberId && merchant.verifyStatus === true" class="icon" :src="certification" alt="">
              <img v-else class="icon" :src="warnning" alt=""> -->
              <img class="icon" :src="certification" alt="">
              {{item.name}}
              <!-- <span style="color: #F5A623;" v-if="merchant" class="uncertification">
                <span @click.stop="doCertification('')" v-if="merchant.verifyStatus == null && !merchant.uniqueNO">去认证</span>
                <span @click.stop="doCertification('processing')" v-if="merchant.verifyStatus == null && merchant.uniqueNO">审核中</span>
                <span @click.stop="doCertification('success')" v-if="merchant.verifyStatus == true">成功认证</span>
                <span @click.stop="doCertification('failure')" v-if="merchant.verifyStatus == false">认证失败</span>
              </span> -->
            </span>
          </li>
        </ul>
        <!-- <ul class="content">
          <div class="submenu-wrapper" style="background: unset">
            <div class="uncertification">
              <span @click="doCertification('')">添加企业认证</span>
            </div>
          </div>
        </ul> -->
      </div>
    </div>
    <!-- 项目切换 -->
    <div v-show="projectVisible" class="project-select-wrapper animated fadeIn">
      <div class="project-select">
        <div class="banner">
          <img @click="projectVisible = false" class="close" src="../assets/close.svg" alt="">
          <h1>CAIC两云一库</h1>
          <h2>了解行业动向，快速寻找商机，精准资产管理</h2>
        </div>
        <el-row>
          <el-col :span="12">
            <h1>投管云</h1>
            <p style="width: 165px;">覆盖全国254个房产企业在24个城市的土地及住宅项目</p>
            <a :href="tgy" class="btn">找项目</a>
          </el-col>
          <el-col :span="12">
            <h1>数据系统</h1>
            <p style="width: 165px;">多层次，多维度的市场分析全方位跟踪资产生命周期</p>
            <a :href="sjk" class="btn">看行业</a>
          </el-col>
        </el-row>
      </div>
    </div>
    <!-- 去认证弹窗 -->
    <el-dialog
      title="请选择企业认证方式"
      :center="true"
      :visible.sync="certificationState"
      width="600px"
      custom-class="certification-dialog"
      :before-close="certificationHandleClose">
      <el-row class="certification" :gutter="52">
        <el-col :span="12">
          <el-card>
            <img src="../assets/icon-license.svg" alt="">
            <p class="title">提交资料</p>
            <p class="tips">上传营业执照信息，</p>
            <p class="tips">1-3个工作日内进行审核</p>
            <el-button class="btn" @click="certificationConfirmInformation">选择</el-button>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <img src="../assets/icon-quick-certification.svg" alt="">
            <p class="title">快速认证</p>
            <p class="tips">已签订合同，</p>
            <p class="tips">14小时内即可审核通过</p>
            <el-button class="btn" @click="certificationQuickCertification">选择</el-button>
          </el-card>
        </el-col>
      </el-row>
    </el-dialog>
  </el-aside>
</template>
<script>
import menuList from './menu'
import { listMenu, memberMerchantList, userPermission } from '@/http/authority'
import { mainSubjectInit } from '@/http/certification'
import certification from '@/assets/icon-certification.svg'
import warnning from '@/assets/icon-menu-warnning.svg'
import { mapState } from 'vuex'
export default {
  data () {
    return {
      // 组织个数
      memberMerchantListLength: 0,
      warnning: warnning,
      certification: certification,
      menuList: menuList,
      merchantList: [],
      myMerchantList: [],
      isShow: false,
      certificationState: false,
      projectVisible: false,
      tgy: '',
      sjk: '',
      statusType: ''
    }
  },
  computed: mapState(['userInfo', 'merchant']),
  methods: {
    certificationHandleClose () {
      this.certificationState = !this.certificationState
      this.isShow = false
    },
    certificationConfirmInformation () {
      this.certificationState = !this.certificationState
      this.isShow = false
      this.$router.push('/certification/normal')
    },
    certificationQuickCertification () {
      this.certificationState = !this.certificationState
      this.isShow = false
      this.$router.push('/certification/quick')
    },
    doCertification (type) {
      const links = {
        'processing': '/certification/processing',
        'success': '/certification/success',
        'failure': '/certification/failure'
      }
      this.isShow = false
      if (type) {
        this.$router.push(links[type])
      } else {
        this.certificationState = !this.certificationState
      }
    },
    toggleMerchant (stage) {
      if (stage !== 'init') {
        this.isShow = !this.isShow
      }
      memberMerchantList({memberId: this.userInfo.memberId, mobile: this.userInfo.mobile}).then(res => {
        this.myMerchantList = []
        this.merchantList = []
        for (let i = 0; i < res.data.length; i++) {
          if (res.data[i].memberId === this.userInfo.memberId) {
            this.myMerchantList.push(res.data[i])
          } else {
            this.merchantList.push(res.data[i])
          }
        }
      })
    },
    openPage (type, item) {
      if (type === 'child') {
        // if (this.statusType === 1 && item.id === '11-2') {
        //   this.certificationState = !this.certificationState
        // } else {
        //   this.$router.push(item.link)
        // }
        this.$router.push(item.link)
      }
      if (type === 'parent' && !item.child) {
        this.$router.push(item.link)
      }
    },
    selectMerchant (item) {
      const merchant = JSON.stringify(item)
      const userId = JSON.parse(sessionStorage.getItem('userInfo')).memberId
      sessionStorage.setItem('merchant' + userId, merchant)
      this.$router.push('/workbench')
      setTimeout(() => {
        window.location.reload()
      }, 100)
    },
    getMenu () {
      const params = {
        ssoMember: this.userInfo.memberId,
        mainId: this.merchant.id
      }
      listMenu(params).then(res => {
        if (res.code === '0') {
          if (!res.data) {
            this.menuList = this.menuList.slice(0, 1)
            return false
          } else {
            const codes = res.data.map(({code}) => code)
            this.menuList = this.menuList.slice(0, 1).concat(this.menuList.filter(({code}) => codes.includes(code)))
          }
        }
      })
    },
    userPermission () {
      const params = {
        mainId: this.merchant.id
      }
      let memberId = JSON.parse(sessionStorage.getItem('userInfo')).memberId
      let {type} = JSON.parse(sessionStorage.getItem('merchant' + memberId))
      this.statusType = type
      userPermission(params).then(res => {
        if (!res.data.configPermission) {
          let len = this.menuList.length
          this.menuList[len - 1].child = this.menuList[len - 1].child.filter(item => item.id !== '11-2')
        }
      })
    }
  },
  mounted () {
    this.getMenu()
    this.userPermission()
    this.tgy = window.location.hostname === 'asset.caicchina.com'
      ? 'https://tgy.caicchina.com/#/index'
      : 'http://test-tgy.caicchina.com/#/index'
    this.sjk = window.location.hostname === 'asset.caicchina.com'
      ? 'https://db.caicchina.com/#/home'
      : 'http://test-db.caicchina.com/#/home'
    memberMerchantList({
      memberId: this.userInfo.memberId,
      mobile: this.userInfo.mobile
    }).then(res => {
      this.memberMerchantListLength = res.data.length
      for (let i = 0; i < res.data.length; i++) {
        if (res.data[i].type === 1) {
          mainSubjectInit({merchantId: res.data[i].id})
        }
      }
    })
  }
}
</script>
<style lang="scss" scoped>
#menu {
  height: 100vh;
  width: 235px !important;
  background-color: #141414;
  box-sizing: border-box;
  overflow: auto;
  .logo-wrapper{
    height: 74px;
    text-align: center;
    background: url('../assets/logo-bg.png');
    cursor: pointer;
    img{
      margin-top: 26px;
      width: 128px;
    }
  }
  .submenu-wrapper{
    position: relative;
    height:60px;
    padding: 10px 20px;
    box-sizing: border-box;
    color:rgba(255,255,255,1);
    background:rgba(94,14,255,1);
    .title{
      width: 165px;
      line-height: 21px;
      font-size: 14px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      padding-top: 10px;
      img{
        vertical-align: middle;
        margin-top: -4px;
      }
    }
    .double-line{
      position: relative;
      width: 150px;
      padding-top: 10px;
      padding-left: 16px;
      line-height: 18px;
      font-size: 14px;
      text-overflow: -o-ellipsis-lastline;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      line-clamp: 2;
      -webkit-box-orient: vertical;
      img{
        position: absolute;
        left: 0;
        top: 12px;
      }
    }
    .toggle{
      position: absolute;
      right: 14px;
      top: 20px;
      display: block;
      padding: 6px 8px;
      text-align: center;
      font-size: 12px;
      transform: scale(.8);
      background:rgba(245,166,35,1);
      border-radius:8px;
      cursor: pointer;
    }
    .uncertification{
      position: relative;
      span{
        position: absolute;
        left: 20px;
        top: 5px;
        font-size: 12px;
        cursor: pointer;
        color: #F5A623;
        text-decoration: underline;
      }
    }
  }
  .el-aside {
    width: 235px !important;
    color: #333;
  }
  .el-menu {
    border-right: 1px solid #141414;
  }
  .merchants{
    position: absolute;
    z-index: 9999;
    left: 235px;
    right: 0;
    top: 0;
    bottom: 0;
    background:rgba(0,0,0,.5);
    .wrapper{
      position: absolute;
      width: 300px;
      float: left;
      top: 0;
      bottom: 0;
      background: #fff;
      .header{
        height: 50px;
        padding-left: 20px;
        border-bottom: 1px solid #E7E7E7;
        font-weight:500;
        font-size:15px;
        color:#333333;
        line-height:50px;
        .el-icon-close{
          float: right;
          font-size: 16px;
          margin-top: 17px;
          margin-right: 15px;
          cursor: pointer;
        }
      }
      .content{
        .header{
          height: 36px;
          line-height: 36px;
          font-size:12px;
          font-weight:400;
          color:rgba(153,153,153,1);
        }
        li{
          position: relative;
          height: 60px;
          padding-left: 36px;
          padding-right: 30px;
          line-height: 60px;
          font-size:14px;
          color: #666666;
          transition: all ease-in .3s;
          cursor: pointer;
          text-overflow: ellipsis;
          white-space: nowrap;
          overflow: hidden;
          .icon{
            position: absolute;
            left: 20px;
            top: 23px;
          }
        }
        li:hover{
          color: #fff;
          color: #333;
          background: #F1F1F1;
        }
        .active{
          color: #fff;
          background: #5E0EFF;
        }
      }
    }
    .space{
      width: 100%;
      height: 100%;
    }
  }
    // 项目切换
  .project-select-wrapper {
    position: fixed;
    z-index: 999;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background:rgba(0,0,0,.5);
    .project-select{
      width: 600px;
      margin: 15% auto;
      text-align: center;
      .banner {
        position: relative;
        height: 150px;
        background: url("../assets/banner.svg");
        background-size: cover;
        font-family: "PingFangSC-Medium,PingFang SC";
        .close{
          position: absolute;
          height: 12px;
          top: 10px;
          right: 10px;
          cursor: pointer;
        }
        h1 {
          padding-top: 40px;
          font-size: 20px;
          font-weight: 500;
          color: rgba(255, 255, 255, 1);
          line-height: 28px;
        }
        h2 {
          margin-top: 15px;
          font-size: 16px;
          font-weight: 400;
          color: rgba(181, 214, 252, 1);
          line-height: 22px;
        }
      }
      .el-row{
        background: #fff;
        img{
          margin-top: 65px;
        }
        h1{
          margin-top: 40px;
          font-family:'PingFangSC-Regular,PingFang SC';
          font-weight: bold;
          font-size: 18px;
        }
        p{
          width: 120px;
          margin: 0 auto;
          margin-top: 12px;
          font-size:12px;
          font-family:'PingFangSC-Regular,PingFang SC';
          font-weight:400;
          color:rgba(51,51,51,1);
          line-height:17px;
        }
        a{
          display: block;
          font-size:15px;
          font-family:'PingFangSC-Regular,PingFang SC';
          font-weight:400;
          color:rgba(255,255,255,1);
          margin: 20px auto 70px;
          width:120px;
          height:40px;
          line-height: 40px;
          text-align: center;
          text-decoration: none;
          border-radius:4px;
        }
      }
    }
  }
}
</style>
<style lang="scss">
  // 认证
  #menu{
    .certification-dialog{
      height: 350px;
      .el-dialog__header{
        padding-top: 32px;
      }
      .certification{
        margin-left: 0 !important;
        margin-right: 0 !important;
        .el-card.is-always-shadow{
          text-align: center;
          box-shadow: inherit;
          background: #f1f1f1;
          img{
            height: 24px;
          }
          .title{
            margin-top: 10px;
            font-size:15px;
            font-weight:500;
            color:rgba(51,51,51,1);
            line-height:21px;
          }
          .tips{
            margin-top: 10px;
            font-size:12px;
            font-weight:400;
            color:rgba(102,102,102,1);
            line-height:17px;
          }
          .btn{
            margin-top: 30px;
          }
        }
      }
    }
  }
.el-submenu__title{
  font-size: 16px !important;
  background:linear-gradient(270deg,rgba(20,20,20,1) 0%,rgba(33,33,33,1) 100%) !important;
  color: #fff !important;
}
.el-menu-item{
  color: #fff !important;
}
.el-menu-item.is-active{
  background-image: linear-gradient(to left, rgba(94, 14, 255, 0.22) , rgba(94, 14, 255, 1));
  color: #FFFFFF !important;
}
.el-menu-item{
  font-size: 16px !important;
  padding-left: 56px !important;
}
#menu .el-scrollbar{
  height: 100vh;
  overflow-x: hidden;
}
#menu .el-scrollbar__wrap{
  overflow-x: hidden;
}
</style>

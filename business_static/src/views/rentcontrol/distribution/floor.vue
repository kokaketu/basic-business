<!--
 * @Author: winerss
 * @Date: 2020-05-25 20:27:10
 * @LastEditTime: 2020-08-06 14:58:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\asset\distribution\floor.vue
-->
<template>
  <div id="floor">
    <div class="items">
      <div class="item"
        v-for="(item, index) in floor"
        @click="getFloorStatistical(item.floorName, item.id)"
        :key="index">
        <div class="left-side">
          <el-popover
            placement="right"
            trigger="click"
            popper-class="floor-popover">
            <div class="label-tips">
              <el-row class="header">
                <el-col :span="12">{{floorDetail.floorNum}} {{floorDetail.floorArea}}</el-col>
                <el-col :span="12">出租率：{{floorDetail.signProportion}}</el-col>
              </el-row>
              <div class="container">
                <div>平均租金：{{floorDetail.avgRentPrice}}</div>
                <el-row>
                  <el-col :span="12">
                    <p>总铺位：{{floorDetail.totalStore}}个</p>
                    <p>合同数：{{floorDetail.contNum}}个</p>
                  </el-col>
                  <el-col :span="12">
                    <p>空铺：{{floorDetail.vacantStore}}个</p>
                    <p>公司数：{{floorDetail.companyNum}}个</p>
                  </el-col>
                </el-row>
              </div>
              <div class="footer">占用项目总建面积： {{floorDetail.areaProportion}}</div>
            </div>
            <div slot="reference" class="content">
              <p class="name">{{item.floorName}}</p>
              <p class="value">{{item.attribute}}</p>
            </div>
          </el-popover>
        </div>
        <div class="right-side">
          <div class="lists">
            <div :style="{'width': item.width + '%'}" class="list clearfix" v-show="item.room && item.room.length > 0">
              <div class="item pull-left"
                v-for="(childItem, index) in item.room"
                @click.prevent="getStoreDetail(childItem.id)"
                :key="index"
                :style="{
                  background: colors[childItem.storeName === '空铺'?
                              colors.length-1 :
                              Number(childItem.color)],
                  width: childItem.size
                }">
                <el-popover
                  placement="top-start"
                  trigger="click"
                  popper-class="floor-popover">
                  <div class="label-tips">
                    <el-row class="header">
                      <el-col :span="16">{{storeDetail.unitName}}<span class="tag" v-show="storeDetail.layoutPosition">{{storeDetail.layoutPosition}}</span></el-col>
                      <el-col :span="8" class="text-right">{{storeDetail.storePosition}}</el-col>
                    </el-row>
                    <div class="container">
                      <div>{{storeDetail.companyName}}</div>
                      <p>
                        <span class="text-underline">{{storeDetail.contNo}}</span>
                      </p>
                      <el-row>
                        <el-col :span="12">
                          <p>{{storeDetail.unitCode}}</p>
                          <p>{{storeDetail.rentUnitPriceStr}}</p>
                        </el-col>
                        <el-col :span="12">
                          <p>{{storeDetail.rentableAreaStr}}</p>
                          <p>{{storeDetail.contDateRange}}</p>
                        </el-col>
                      </el-row>
                    </div>
                    <div class="footer">占用项目总建面积： {{storeDetail.areaProportion}}</div>
                  </div>
                  <div slot="reference" style="width: 100%;height: 100%;"></div>
                </el-popover>
              </div>
            </div>
            <div :style="{'width': item.width + '%'}" class="blank-bar" v-show="!item.room || item.room.length == 0">
              <p>暂无铺位信息</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="blank" v-show="!floor || floor.length == 0">
      <div class="wrapper">
        <img src="./img/icon-blank.png" alt="">
        <h2>暂无楼层信息</h2>
        <p>暂没有楼层信息，请完善资料</p>
      </div>
    </div>
  </div>
</template>
<script>
import { floorStatistical, queryStoreDetail } from '@/http/rentControl'
export default {
  props: ['floor', 'assetId', 'assetType'],
  data () {
    return {
      colors: ['#70D7B8', '#C0E086', '#DD7471', '#8D9EE6', '#DFC392', '#75AEF2', '#A07BEC', '#CFD1DA', '#EEE27E', 'rgba(207,209,218,1)'],

      lists: [],
      floorDetail: {},
      storeDetail: {}
    }
  },
  methods: {
    getFloorStatistical (floorNum, floorId) {
      let parmas = {
        assetId: this.assetId,
        floorId: floorId
      }
      floorStatistical(parmas).then(res => {
        this.floorDetail = res
        this.floorDetail.floorNum = floorNum
      })
    },
    getStoreDetail (unitId) {
      let parmas = {
        assetId: this.assetId,
        unitId: unitId
      }
      queryStoreDetail(parmas).then(res => {
        this.storeDetail = res
      })
    }
  },
  activated () {
  }
}
</script>
<style lang="scss" scoped>
#floor{
  background: #fff;
  .items{
    padding: 15px 20px 70px 20px;
    .item{
      position: relative;
      padding: 5px 0;
      height: 80px;
      box-sizing: border-box;
      border-bottom: 1px solid #F4F4F4;
      .left-side{
        position: absolute;
        width: 110px;
        .content{
          position: relative;
          margin-top: 10px;
          height: 50px;
          line-height: 25px;
          cursor: pointer;
        }
      }
      .right-side{
        padding-left: 110px;
        .lists{
          .list{
            // display: flex;
            // justify-content: space-between;
            height: 70px;
            .item{
              height: 70px;
              border-right: 1px solid #fff;
              &:nth-last-child(1){
                border-right: 0;
              }
            }
          }
          .blank-bar{
            position: relative;
            height: 70px;
            width: 100%;
            background:rgba(234,234,234,1);
            p{
              position: absolute;
              right: 10px;
              bottom: 10px;
              font-size:12px;
              font-weight:400;
              color:rgba(196,196,196,1);
              line-height:17px;
            }
          }
        }
      }
    }
  }
  .blank{
    .wrapper{
      width: 210px;
      height: 600px;
      margin: 0 auto;
      text-align: center;
      img{
        margin-top: 80px;
        width: 155px;
        height: 155px;
      }
      h2{
        height:28px;
        margin: 10px 0;
        font-size:20px;
        font-weight:500;
        color:rgba(51,51,51,1);
        line-height:28px;
      }
      p{
        height:22px;
        margin: 10px 0;
        font-size:16px;
        font-weight:400;
        color:rgba(153,153,153,1);
        line-height:22px;
      }
      .btn{
        width: 140px;
        margin-top: 15px;
      }
    }
  }
}
.name{
  color:rgba(51,51,51,1) !important;
  font-size:16px;
  font-weight: 600;
}
.value{
  color:rgba(102,102,102,1) !important;
  font-size:14px;
}
</style>
<style lang="scss">
  $black: #141414;
  .el-popover{
    // width: 280px !important;
    // margin-top: -10px;
    // margin-left: -70px !important;
    // padding: 20px !important;
    border-color: $black !important;
    background: $black !important;
    color: #fff !important;
    font-size: 14px;
    .header{
      font-size: 16px;
      line-height: 22px;
      margin-bottom: 10px;
      .tag{
        height:16px;
        margin-left: 10px;
        padding: 0 6px;
        background:rgba(220,178,105,1);
        border-radius:2px;
        font-size:10px;
        font-weight:400;
        color:rgba(255,255,255,1);
        line-height:14px;
      }
    }
    .container{
      line-height: 20px;
      div{
        margin: 5px 0;
      }
    }
    .footer{
      margin-top: 10px;
      font-size: 15px;
      line-height: 21px;
    }
  }
  .floor-popover[x-placement^="right"] .popper__arrow::after{
    border-right-color: $black;
  }
  .floor-popover[x-placement^="top"] .popper__arrow::after{
    border-top-color: $black;
  }
  .floor-popover[x-placement^="bottom"] .popper__arrow::after{
    border-bottom-color: $black;
  }
  // .el-popper[x-placement^="top"] .popper__arrow{
  //   left: 50% !important;
  // }
  // .el-popper[x-placement^="bottom"] .popper__arrow{
  //   left: 50% !important;
  // }
</style>

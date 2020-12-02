<template>
  <div id="tenant-create">
    <!-- 基本信息 -->
    <div class="wrapper base-info">
      <div class="wrapper-title">基本信息</div>
      <div class="block">
        <el-form
          :inline="true"
          :model="baseInfo"
          :rules="baseInfoRules"
          ref="baseInfo"
          size="small"
          label-width="150px">
          <el-form-item label="项目名称" required prop="assetId">
            <el-select
              v-model="baseInfo.assetId"
              placeholder="请选择项目名称">
              <el-option
                v-for="item in projectNameList"
                class='select-option-selected'
                :key="item.id"
                :label="item.assetName"
                :value="item.id">
              </el-option>
            </el-select>
          </el-form-item>
          <br/>
          <el-form-item label="项目面积" prop="tradeArea">
            <el-input v-model="baseInfo.tradeArea" placeholder="请输入交易项目面积">
              <template slot="append">㎡</template>
            </el-input>
          </el-form-item>
          <br/>
          <el-form-item label="项目位置" prop="assetAddress">
            <el-input v-model="baseInfo.assetAddress" placeholder="请输入项目位置详情"></el-input>
          </el-form-item>
          <br/>
          <el-form-item label="产证类型" prop="certType">
            <template>
              <el-checkbox-group v-model="baseInfo.certType">
                <el-checkbox label="OFFICE">办公</el-checkbox>
                <el-checkbox label="COMMERCIAL">商业</el-checkbox>
                <el-checkbox label="HOTEL">酒店</el-checkbox>
                <el-checkbox label="FLAT">长租公寓</el-checkbox>
                <el-checkbox label="INDUSTRIAL">产业园区</el-checkbox>
              </el-checkbox-group>
            </template>
          </el-form-item>
          <br/>
          <el-form-item label="交易方式" prop="transaction">
            <template>
              <el-checkbox-group v-model="type" @change="change">
                <el-checkbox label="1" >所有权交易</el-checkbox>
                <el-checkbox label="2">融资交易</el-checkbox>
                <el-checkbox label="3">经营权交易</el-checkbox>
              </el-checkbox-group>
            </template>
          </el-form-item>
          <br v-show="type.includes('1')"/>
          <el-form-item label="所有权交易-转让总价" prop="totalTransferPrice" v-show="type.includes('1')">
            <el-input v-model="temp[0].totalTransferPrice" placeholder="请输入内容"></el-input> 万
          </el-form-item>
          <br v-show="type.includes('2')"/>
          <el-form-item label="融资交易-融资成本" prop="financingCost" v-show="type.includes('2')">
            <el-input v-model="temp[1].financingCost" placeholder="请输入内容"></el-input> %
          </el-form-item>
          <br v-show="type.includes('3')"/>
          <el-form-item label="经营权交易-租赁单价" v-show="type.includes('3')">
            <el-input placeholder="请输入内容" v-model="temp[2].rentalSinglePriceBegin">
            </el-input> -
            <el-input placeholder="请输入内容" v-model="temp[2].rentalSinglePriceEnd">
            </el-input> 元/㎡/天
          </el-form-item>
          <br/>
          <el-form-item label="备注" prop="memo">
            <el-input v-model="baseInfo.memo" placeholder="请输入备注"></el-input>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <div class="clearfix btn-group">
      <el-button class="btn" @click.native="add">保存</el-button>
      <el-button class="btn btn-default" @click.native="cancel">取消</el-button>
    </div>
  </div>
</template>
<script>
import {businessCreate} from '@/http/publishing'
import { mapState } from 'vuex'

export default {
  data () {
    return {
      baseInfo: {
        assetAddress: '',
        assetId: '',
        tradeArea: '',
        memo: '',
        operator: '',
        operatorName: '',
        certType: [],
        transaction: []
      },
      type: [],
      baseInfoRules: {
        assetId: [
          { required: true, message: '请选择所属项目', trigger: 'blur' }
        ],
        tradeArea: [
          { required: true, message: '请输入项目面积', trigger: 'blur' }
        ],
        assetAddress: [
          { required: true, message: '请输入项目位置', trigger: 'blur' }
        ]
      },
      dialogImageUrl1: '',
      dialogVisible1: false,
      dialogImageUrl2: '',
      dialogVisible2: false,
      temp: [{active: false}, {active: false}, {active: false}]
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/publishing/business')
    },
    businessCreate () {
      businessCreate().then(res => {
        this.companyType = res.companyType
        this.operatingType = res.operatingType
        this.companyIndustry = res.companyIndustry
        this.brandLayout = res.brandLayout
        this.brandLevel = res.brandLevel
      })
    },
    change (obj) {
      obj.forEach(item => {
        this.temp[item - 1].active = true
        this.temp[item - 1].type = item
      })
    },
    getValueById (obj, id, name) {
      return obj.filter(item => {
        if (item.id === id) {
          return item
        }
      })[0][name]
    },
    add () {
      this.$refs['baseInfo'].validate(valid => {
        if (valid) {
          let params = {
            'mainId': this.merchant.id,
            'assetName': this.getValueById(this.projectNameList, this.baseInfo.assetId, 'assetName'),
            'assetId': this.baseInfo.assetId,
            'assetAddress': '',
            'tradeArea': '',
            'memo': '',
            'operator': '',
            'operatorName': '',
            'certType': [],
            'transaction': [{
              'type': '',
              'totalTransferPrice': '',
              'financingCost': '',
              'rentalSinglePriceBegin': '',
              'rentalSinglePriceEnd': '',
            }]
          }
          this.temp.forEach(item => {
            if (item.active === true) {
              this.baseInfo.transaction.push(item)
            }
          })
          for (const key in this.baseInfo) {
            if (this.baseInfo.hasOwnProperty(key)) {
              params[key] = this.baseInfo[key]
            }
          }
          businessCreate(params).then(res => {
            if (res.code === '0') {
              // 删除路由
              this.$destroy()
              this.$store.dispatch('setRouteList', {
                route: this.$route,
                type: 'delete'
              })
              this.$router.push('/publishing/business')
            }
          })
        } else {
          return false
        }
      })
    }
  },
  activated () {
    // 获取项目名称
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
  }
}
</script>
<style lang="scss" scoped>
  #tenant-create{
    margin-bottom: 50px;
    $purple: #5E0EFF;
    .wrapper{
      background: #fff;
      .wrapper-title{
        background:#F3F3F3;
        position: relative;
        height: 44px;
        padding: 0 30px;
        line-height: 44px;
        &::before{
          position: absolute;
          top: 14px;
          left: 20px;
          content: '';
          display: block;
          width:5px;
          height:16px;
          background: $purple;
        }
      }
    }
  }
  #tenant-create .wrapper .el-input,
  #tenant-create .wrapper .el-textarea,
  #tenant-create .wrapper .el-select{
    width: 320px;
  }
  #tenant-create .el-table td{
    padding: 0;
  }
  #tenant-create .el-table .el-input,
  #tenant-create .el-table .el-select{
    width: 100%;
    border: none;
  }
</style>
<style lang="scss">
  #tenant-create .table-input td {
    padding: 0;
    padding: 3px 0;
  }
  #tenant-create .table-input th {
    height: 46px;
    padding: 0;
    background:rgba(251,251,251,1);
    color: #808080;
  }
</style>

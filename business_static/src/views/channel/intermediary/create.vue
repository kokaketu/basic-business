<!--
 * @Author: your name
 * @Date: 2020-10-26 16:06:29
 * @LastEditTime: 2020-10-30 16:02:20
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\channel\intermediary\create.vue
-->
<template>
  <div id="intermediary-create" class="page">
    <div class="base-info">
      <div class="new-block-title">基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" ref="baseInfo" :rules="baseInfoRules" :model="ruleForm" size="small" label-width="110px">
            <el-form-item label="渠道名称：" prop="agencyName" required>
              <el-input v-model="ruleForm.agencyName" placeholder="请输入渠道名称"></el-input>
            </el-form-item>
            <el-form-item label="渠道类型：" prop="agencyType" required>
              <el-select v-model="ruleForm.agencyType" placeholder="请选择渠道类型">
                <el-option
                  v-for="item in types"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="渠道等级：" prop="agencyLevel" required>
              <el-select v-model="ruleForm.agencyLevel" placeholder="请选择渠道等级">
                <el-option
                  v-for="item in levels"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
            <br/>
            <el-form-item label="所在区域："  prop='cityNames'>
              <city-select
                :v-model="ruleForm.cityNames"
                style="width: 280px;"
                @upDateCity="upDateCityFn">
              </city-select>
            </el-form-item>
            <el-form-item label="详细地址：" prop="address" >
              <el-input v-model="ruleForm.address" placeholder="请输入详细地址"></el-input>
            </el-form-item>
            <el-form-item label="人数规模：" prop="agencyScale" >
              <el-input
                v-model="ruleForm.agencyScale"
                @input="result => ruleForm.agencyScale = Number(result.replace(/\D/g, ''))"
                placeholder="请输入人数规模"></el-input>
            </el-form-item>
            <br/>
            <el-form-item label="佣金政策：" prop="commPolicy" >
              <el-input type="textarea" maxlength="300" show-word-limit style="width: 685px;" :autosize="{ minRows: 5, maxRows: 5}" v-model="ruleForm.commPolicy" placeholder="请输入,300字以内"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="new-block-title">联系人信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" ref="contacts" :rules="contactsRules" :model="contacts" size="small" label-width="120px">
            <el-form-item label="联系人姓名：" prop="contacts" required>
              <el-input v-model="contacts.contacts" placeholder="请输入联系人姓名"></el-input>
            </el-form-item>
            <el-form-item label="联系电话：" prop="mobile" required>
              <el-input
                v-model="contacts.mobile"
                @input="contacts.mobile = contacts.mobile.replace(/[^\d]/g,'')"
                placeholder="请输入联系电话"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div v-if="ruleForm.agencyType == 1">
        <div class="new-block-title">经纪人信息<span style="color: #F56C6C">*</span></div>
        <div class="new-block">
          <el-table
            :data="contactAgentList"
            border
            style="width: 500px">
            <el-table-column
              prop="agentName"
              label="经纪人姓名">
              <template slot-scope="scope">
                <el-input v-model="scope.row.agentName" placeholder="请输入经纪人姓名"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="agentMobile"
              label="经纪人手机号">
              <template slot-scope="scope">
                <el-input
                  v-model="scope.row.agentMobile"
                  maxlength="11"
                  @input="scope.row.agentMobile = scope.row.agentMobile.replace(/[^\d]/g,'')"
                  placeholder="请输入经纪人手机号"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addRow()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="delRow(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="new-block">
        <div class="btn-group clearfix">
          <el-button class="btn pull-left" @click.native="save" style="margin-right: 0">保存</el-button>
          <el-button class="btn btn-default pull-left" @click="cancel">取消</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { addContacts } from '@/http/channel'
import CitySelect from '@/components/CitySelect'
import { mapState } from 'vuex'
const types = [{id: 1, name: '中介公司'}, {id: 2, name: '独立经纪'}]
const levels = [{id: 1, name: '金牌'}, {id: 2, name: '银牌'}, {id: 3, name: '铜牌'}]
export default {
  data () {
    return {
      types: types,
      levels: levels,
      city: null,
      ruleForm: {
        agencyName: null,
        agencyType: null,
        agencyLevel: null,
        cityNames: null,
        address: null,
        agencyScale: null,
        commPolicy: null
      },
      contacts: {
        contacts: null,
        mobile: null
      },
      baseInfoRules: {
        agencyName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        agencyType: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        agencyLevel: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      },
      contactsRules: {
        contacts: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        mobile: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ]
      },
      contactAgentList: [{agentName: null, agentMobile: null}]
    }
  },
  computed: mapState(['merchant']),
  methods: {
    upDateCityFn (city) {
      this.city = city
      this.ruleForm.cityNames = city.provinceName + city.cityName + city.districtName
    },
    save () {
      const baseInfoArr = []
      const baseInfo = ['agencyName', 'agencyType', 'agencyLevel']
      baseInfo.map(item => {
        this.$refs.baseInfo.validateField(item, valid => {
          baseInfoArr.push(valid)
        })
      })
      const baseInfoBool = baseInfoArr.map(item => Boolean(item)).filter(item => item)

      const contactsArr = []
      const contact = ['contacts', 'mobile']
      contact.map(item => {
        this.$refs.contacts.validateField(item, valid => {
          contactsArr.push(valid)
        })
      })
      const contactsBool = contactsArr.map(item => Boolean(item)).filter(item => item)
      if (baseInfoBool.length !== 0 || contactsBool.length !== 0) {
        return false
      }
      const bool = this.contactAgentList.every(item => Boolean(item.agentName) && Boolean(item.agentMobile))
      if (Number(this.ruleForm.agencyType) === 1 && !bool) {
        this.$message.error('请输入经纪人信息')
        return false
      }
      addContacts({
        mainId: this.merchant.id,
        agencyName: this.ruleForm.agencyName,
        agencyType: this.ruleForm.agencyType,
        agencyLevel: this.ruleForm.agencyLevel,
        agencyScale: this.ruleForm.agencyScale,
        provinceId: this.city ? this.city.provinceCode : null,
        provinceName: this.city ? this.city.provinceName : null,
        cityId: this.city ? this.city.cityCode : null,
        cityName: this.city ? this.city.cityName : null,
        areaId: this.city ? this.city.districtCode : null,
        areaName: this.city ? this.city.districtName : null,
        address: this.ruleForm.address,
        commPolicy: this.ruleForm.commPolicy,
        contacts: this.contacts.contacts,
        mobile: this.contacts.mobile,
        contactAgentList: this.contactAgentList
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
    cancel () {
      this.$confirm('您确定放弃创建渠道吗?', '提示', {
        confirmButtonText: '确定离开',
        cancelButtonText: '继续创建',
        type: 'warning'
      }).then(() => {
        // 删除路由
        this.$destroy()
        this.$store.dispatch('setRouteList', {
          route: this.$route,
          type: 'delete'
        })
        this.$router.push('/channel/intermediary')
      })
    },
    addRow () {
      this.contactAgentList.push({agentName: null, agentMobile: null})
    },
    delRow (index) {
      this.contactAgentList.splice(index, 1)
    }
  },
  components: {
    CitySelect
  }
}
</script>
<style lang="scss" scoped>
#intermediary-create{
  .btn-group{
    margin-top: 20px;
  }
}
</style>
<style lang="scss">
#intermediary-create .el-table td{
  padding: 0;
}
#intermediary-create .el-table__body .el-input__inner:hover, .el-table__body .el-input__inner{
  border: none;
}
#intermediary-create  .el-table--enable-row-hover .el-table__body tr:hover > td{
  background-color: unset;
}
#intermediary-create .left-wrapper .el-form-item__label{
  text-align: right;
}
</style>

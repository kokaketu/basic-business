<!--
 * @Author: your name
 * @Date: 2020-06-29 11:18:14
 * @LastEditTime: 2020-08-06 15:05:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\components\citySelect.vue
-->
<template>
  <div id="city-select">
    <el-select @change="getCity" v-model="provinceCode" placeholder="请选择省">
      <el-option
        v-for="item in provinceList"
        class='select-option-selected'
        :key="item.provinceCode"
        :label="item.provinceName"
        :value="item.provinceCode">
      </el-option>
    </el-select>
    <el-select @change="getDistrict" v-model="cityCode" placeholder="请选择市">
      <el-option
        v-for="item in cityList"
        class='select-option-selected'
        :key="item.cityCode"
        :label="item.cityName"
        :value="item.cityCode">
      </el-option>
    </el-select>
    <el-select @change="updateCity" v-model="districtCode" placeholder="请选择区">
      <el-option
        v-for="item in districtList"
        class='select-option-selected'
        :key="item.districtCode"
        :label="item.districtName"
        :value="item.districtCode">
      </el-option>
    </el-select>
  </div>
</template>
<script>

import { getProvinceList, getCityList, getDistrictList } from '@/http/city'
export default {
  props: ['selectedCity'],
  data () {
    return {
      isEdit: false,
      provinceCode: '',
      cityCode: '',
      districtCode: '',
      provinceList: [],
      cityList: [],
      districtList: []
    }
  },
  watch: {
    'selectedCity': {
      handler () {
        this.isEdit = true
        const { provinceCode, cityCode, districtCode } = this.selectedCity
        this.provinceCode = provinceCode
        this.cityCode = cityCode
        this.districtCode = districtCode
        this.getProvince()
        this.getCity()
        this.getDistrict()
      }
    }
  },
  methods: {
    getProvince () {
      getProvinceList().then(res => {
        this.provinceList = res
      })
    },
    getCity () {
      if (!this.isEdit) {
        this.cityCode = ''
        this.districtCode = ''
      }
      getCityList({provinceCode: this.provinceCode}).then(res => {
        this.districtList = []
        this.cityList = res
      })
    },
    getDistrict () {
      if (!this.isEdit) {
        this.districtCode = ''
      }
      getDistrictList({cityCode: this.cityCode}).then(res => {
        this.districtList = res
      })
    },
    updateCity () {
      const city = {
        provinceCode: this.provinceCode,
        provinceName: this.provinceList.filter(item => item.provinceCode === this.provinceCode)[0].provinceName,
        cityCode: this.cityCode,
        cityName: this.cityList.filter(item => item.cityCode === this.cityCode)[0].cityName,
        districtCode: this.districtCode,
        districtName: this.districtList.filter(item => item.districtCode === this.districtCode)[0].districtName
      }
      this.$emit('upDateCity', city)
    }
  },
  activated () {
    this.getProvince()
  }
}
</script>
<style lang="scss">
#city-select .el-select .el-input.is-focus .el-input__inner{
  border-color: #e5e5e5 !important;
}
#city-select .el-select .el-input__inner:focus{
  border-color: #e5e5e5 !important;
}
#city-select .el-select .el-input__inner:hover{
  border-color: #e5e5e5 !important;
}
#city-select .el-select .el-input__inner{
  border-color: #e5e5e5 !important;
}
#city-select{
  font-size: 0;
  width: 321px;
  .el-select{
    width: 33.333%;
    .el-input{
      width: 100%;
      .el-input__inner{
        border-radius: 0;
        padding-left: 10px;
        padding-right: 20px;
      }
      .el-input__suffix{
        right: 0;
        .el-select__caret{
          font-size: 12px;
        }
      }
    }
  }
  .el-select:nth-child(1){
    .el-input__inner{
      border-top-left-radius: 4px;
      border-bottom-left-radius: 4px;
      border-right: 0;
    }
  }
  .el-select:nth-child(2){
    .el-input__inner{
      border-left: 0;
      border-right: 0;
    }
  }
  .el-select:nth-child(3){
    .el-input__inner{
      border-top-right-radius: 4px;
      border-bottom-right-radius: 4px;
      border-left: 0;
    }
  }
}
</style>

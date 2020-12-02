<!--
 * @Author: your name
 * @Date: 2020-05-25 19:58:13
 * @LastEditTime: 2020-09-04 09:33:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\detail.vue
-->
<template>
  <div id="contract-create" class="contract">
    <div class="wrapper">
      <div class="wrapper-title">基本信息</div>
      <div class="block">
        <div class="form-wrapper">
          <el-form :inline="true" size="small">
            <el-form-item class="require" label="合同编号" prop="conNo">
              <el-input
                class="double-width"
                v-model="baseInfo.conNo"
                placeholder="请输入合同编号"></el-input>
            </el-form-item>
            <br>
            <el-form-item class="require" label="项目" prop="assetId">
              <el-select
                :popper-append-to-body="false"
                v-model="baseInfo.assetId"
                placeholder="请选择项目"
                >
                <el-option
                  v-for="item in projectNameList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.assetName"
                  :value="item.id"
                  @click.native="getContRentList()">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item class="require" label="租户" prop="companyId">
              <el-select
                v-model="baseInfo.companyId"
                placeholder="请选择租户"
                >
                <el-option
                  v-for="item in baseInfo.rentalList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.companyName"
                  :value="item.id"
                  @click.native="getBrandList(item)">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 商业 -->
            <el-form-item v-show="assetLayout == 2" class="require" label="品牌" prop="brandId">
              <el-select
                v-model="baseInfo.brandId"
                placeholder="请选择品牌"
                clearable>
                <el-option
                  v-for="item in baseInfo.brandList"
                  class='select-option-selected'
                  :key="item.id"
                  :label="item.brandName"
                  :value="item.id"
                  @click.native="getSignLayout(item)">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item v-show="assetLayout == 2"  class="require" label="经营业态" prop="signLayout">
              <el-select
                v-model="baseInfo.signLayout.code"
                placeholder="请选择经营业态"
                clearable>
                <el-option
                  v-for="item in baseInfo.brandLayout"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 办公、产业园 -->
            <el-form-item v-show="assetLayout != 2" class="require" label="行业" prop="signIndustry">
              <el-input disabled v-model="baseInfo.signIndustry.name" placeholder="请输入行业"></el-input>
            </el-form-item>
            <el-form-item class="require" label="租赁单元" prop="unitList">
              <div class="unit-content">
                <span
                  v-for="(item, index) in baseInfo.unitList"
                  :key="index">
                  <el-badge @click.native="delUnitNo(index)" value="x" class="item">
                    {{item.unitNo}}
                  </el-badge>
                  <span v-show="baseInfo.unitList.length != index + 1">，</span>
                </span>
                <span style="color: #5E0EFF;" class="el-input-group__append" @click="selectRentUnitToggle">添加</span>
              </div>
            </el-form-item>
          </el-form>
        </div>
      </div>
      <div class="wrapper-title">租约信息</div>
      <div class="block">
        <div class="form-wrapper">
          <el-form :inline="true" size="small">
            <span v-for="(item, index) in lease" :key="index" >
              <el-form-item v-if="item.isShow && item.type == 'number'" :label="item.name" :required="item.isRequired">
                <InputNumber
                  :value="item.value"
                  :placeholder="item.placeholder"
                  className="input-unit"
                  unit="㎡"
                  @input="result => item.value = result">
                </InputNumber>
              </el-form-item>
              <br v-show="index == 2"/>
              <el-form-item v-if="item.isShow && item.type == 'date'" :label="item.name" :required="item.isRequired">
                <el-date-picker value-format="yyyy-MM-dd" v-model="item.value" type="date" placeholder="选择日期"></el-date-picker>
              </el-form-item>
              <div v-if="item.isShow && !item.operate && item.type == 'dateRange'">
                <el-form-item :label="item.name1" :required="item.isRequired">
                  <el-date-picker value-format="yyyy-MM-dd" v-model="item.value1" type="date" placeholder="选择日期"></el-date-picker>
                </el-form-item>
                <el-form-item :label="item.name2" :required="item.isRequired">
                  <el-date-picker value-format="yyyy-MM-dd" v-model="item.value2" type="date" placeholder="选择日期"></el-date-picker>
                </el-form-item>
              </div>
              <div v-if="item.isShow && item.operate && item.type == 'dateRange'">
                <div v-for="(child, childIndex) in item.child" :key="childIndex">
                  <el-form-item :label="child.name1" :required="item.isRequired">
                    <el-date-picker value-format="yyyy-MM-dd" v-model="child.value1" type="date" placeholder="选择日期"></el-date-picker>
                  </el-form-item>
                  <el-form-item :label="child.name2" :required="item.isRequired">
                    <el-date-picker value-format="yyyy-MM-dd" v-model="child.value2" type="date" placeholder="选择日期"></el-date-picker>
                  </el-form-item>
                  <i v-show="childIndex == 0"
                    class="icon-opreate el-icon-plus"
                    @click="addfreeRentDate(childIndex)"></i>
                  <i v-show="childIndex > 0"
                    class="icon-opreate el-icon-delete"
                    @click="removefreeRentDate(childIndex)"></i>
                </div>
              </div>
            </span>
          </el-form>
        </div>
      </div>
      <div class="wrapper-title">租金条款</div>
      <div class="block">
        <div class="form-wrapper">
          <el-form :inline="true" size="small">
            <span v-for="(item, index) in rentTerms" :key="index" >
              <el-form-item :label="item.name">
                <el-select
                  v-model="item.value"
                  placeholder="请选择"
                  clearable>
                  <el-option
                    v-for="child in item.options"
                    class='select-option-selected'
                    :key="child.value"
                    :label="child.label"
                    :value="child.value">
                  </el-option>
                </el-select>
              </el-form-item>
            </span>
          </el-form>
        </div>
        <div class="tabs">
          <ul class="clearfix">
            <li>首期租金（非必填）</li>
          </ul>
        </div>
        <!-- 首期租金 -->
        <div class="tab-wrapper table-input">
          <el-table
            :data="rent.downRent"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableAmount"
              label="首期总金额(元)(含税)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.receivableAmount"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.receivableAmount = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableDate"
              label="首期应收日期">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.receivableDate"
                  value-format="yyyy-MM-dd"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="tabs" style="margin-top: 20px;">
          <ul class="clearfix">
            <li>非首期租金</li>
          </ul>
        </div>
        <!-- 非首期租金 ---固定 -->
        <div class="tab-wrapper table-input" v-show="this.rentTerms[0].value != '2' && this.rentTerms[0].value != '3'">
          <el-table
            :data="rent.fixedRent"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
           <el-table-column
              prop="monthAmount"
              label="含税月租金(元)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.monthAmount"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.monthAmount = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="monthAmountNoTax"
              label="不含税月租金(元)">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.monthAmountNoTax" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addfixedRent()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removefixedRent(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <!-- 非首期租金 ---扣点 -->
        <div class="tab-wrapper table-input" v-show="this.rentTerms[0].value == '2'">
          <el-table
            :data="rent.snapPointRent"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              label="销售额范围(元)">
              <template slot-scope="scope">
                <div class="cell-range-group"
                  v-for="(item, index) in scope.row.steps"
                  :key="index">
                  <div class="cell-range-wrapper clearfix">
                    <el-input v-model="item.salesStart" placeholder="请输入"></el-input>
                    <p class="center">至</p>
                    <el-input v-model="item.salesEnd" placeholder="请输入"></el-input>
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              label="扣率(%)">
              <template slot-scope="scope">
                <div class="cell-range-group"
                  v-for="(item, index) in scope.row.steps"
                  :key="index">
                    <el-input class="single" v-model="item.discountRate" placeholder="请输入">
                      <template slot="append">
                        <i v-show="index === 0" @click="addsnapPointRentSteps(scope.$index)" class="el-icon-plus"></i>
                        <i v-show="index > 0" @click="removesnapPointRentSteps(scope.$index, index)" class="el-icon-minus"></i>
                      </template>
                    </el-input>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addsnapPointRent()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removesnapPointRent(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <!-- 非首期租金 ---两者取高 -->
        <div class="tab-wrapper table-input" v-show="this.rentTerms[0].value == '3'">
          <el-table
            :data="rent.bothTakeHighRent"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              label="销售额范围(元)"
              width="160">
              <template slot-scope="scope">
                <div class="cell-range-group"
                  v-for="(item, index) in scope.row.steps"
                  :key="index">
                  <div class="cell-range-wrapper clearfix">
                    <el-input v-model="item.salesStart" placeholder="请输入"></el-input>
                    <p class="center">至</p>
                    <el-input v-model="item.salesEnd" placeholder="请输入"></el-input>
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              label="扣率(%)">
              <template slot-scope="scope">
                <div class="cell-range-group"
                  v-for="(item, index) in scope.row.steps"
                  :key="index">
                    <el-input class="single" v-model="item.discountRate" placeholder="请输入">
                      <template slot="append">
                        <i v-show="index === 0" @click="addbothTakeHighRentSteps(scope.$index)" class="el-icon-plus"></i>
                        <i v-show="index > 0" @click="removebothTakeHighRentSteps(scope.$index, index)" class="el-icon-minus"></i>
                      </template>
                    </el-input>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="monthAmount"
              label="含税月租金(元)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.monthAmount"
                  placeholder="保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.monthAmount = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="monthAmountNoTax"
              label="不含税月租金(元)">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.monthAmountNoTax" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addbothTakeHighRent()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removebothTakeHighRent(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="wrapper-title">物业管理条款</div>
      <div class="block">
        <div class="form-wrapper">
          <el-form :inline="true" size="small">
            <span v-for="(item, index) in propertyTerms" :key="index" >
              <el-form-item :label="item.name">
                <el-select
                  v-model="item.value"
                  placeholder="请选择"
                  clearable>
                  <el-option
                    v-for="child in item.options"
                    class='select-option-selected'
                    :key="child.value"
                    :label="child.label"
                    :value="child.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <br v-show="index == 2">
            </span>
          </el-form>
        </div>
        <div class="tabs">
          <ul class="clearfix">
            <li>首期物管费（非必填）</li>
          </ul>
        </div>
        <div class="tab-wrapper table-input">
          <el-table
            :data="property.downProperty"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableAmount"
              label="首期总金额(元)(含税)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.receivableAmount"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.receivableAmount = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableDate"
              label="首期应收日期"
              width="220">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.receivableDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
          </el-table>
        </div>
        <div class="tabs" style="margin-top: 20px;">
          <ul class="clearfix">
            <li>非首期物管费</li>
          </ul>
        </div>
        <div class="tab-wrapper table-input">
          <el-table
            :data="property.fixedProperty"
            border
            style="width: 1000px;">
            <el-table-column
              prop="chargeDate"
              label="租赁期"
              width="230">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.chargeDate"
                  type="daterange"
                  value-format="yyyy-MM-dd"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              prop="monthAmount"
              label="含税月物管(元)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.monthAmount"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.monthAmount = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="taxRate"
              label="税率(%)">
              <template slot-scope="scope">
                <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="monthAmountNoTax"
              label="不含税月物管(元)">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.monthAmountNoTax" placeholder="请输入"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addfixedProperty()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removefixedProperty(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="wrapper-title">其他收费条款</div>
      <div class="block">
        <div style="margin-bottom: 20px;" v-for="(otherTerm, index) in otherTermArray" :key="index">
          <div v-show="index > 0" class="opreate-del">
            <i class="el-icon-delete" @click="delOtherTerm(index)">&nbsp;删除</i>
          </div>
          <div class="form-wrapper">
            <el-form :inline="true" size="small">
              <span v-for="(item, index) in otherTerm.otherTerms" :key="index" >
                <el-form-item :label="item.name">
                  <el-select
                    v-model="item.value"
                    placeholder="请选择"
                    clearable>
                    <el-option
                      v-for="child in item.options"
                      class='select-option-selected'
                      :key="child.value"
                      :label="child.label"
                      :value="child.value">
                    </el-option>
                  </el-select>
                </el-form-item>
                <br v-show="index == 2">
              </span>
            </el-form>
          </div>
          <div class="tab-wrapper table-input">
            <el-table
              :data="otherTerm.others"
              border
              style="width: 1000px;">
              <el-table-column
                prop="chargeDate"
                label="租赁期"
                width="230">
                <template slot-scope="scope">
                  <el-date-picker
                    v-model="scope.row.chargeDate"
                    type="daterange"
                    value-format="yyyy-MM-dd"
                    range-separator="至"
                    start-placeholder="开始日期"
                    end-placeholder="结束日期">
                  </el-date-picker>
                </template>
              </el-table-column>
              <el-table-column
                prop="monthAmount"
                label="含税周期总额(元)">
                <template slot-scope="scope">
                  <InputNumber
                    :value="scope.row.monthAmount"
                    placeholder="请输入，保留2位小数"
                    className="input-unit"
                    unit=""
                    @input="result => scope.row.monthAmount = result">
                  </InputNumber>
                </template>
              </el-table-column>
              <el-table-column
                prop="taxRate"
                label="税率(%)">
                <template slot-scope="scope">
                  <el-input v-model="scope.row.taxRate" placeholder="请输入"></el-input>
                </template>
              </el-table-column>
              <el-table-column
                prop="monthAmountNoTax"
                label="不含税周期总额(元)">
                <template slot-scope="scope">
                  <el-input disabled v-model="scope.row.monthAmountNoTax" placeholder="请输入"></el-input>
                </template>
              </el-table-column>
              <el-table-column
                label=""
                width="60">
                <template slot-scope="scope">
                  <el-button @click.native="addOtherTermOthers(index)" v-show="scope.$index == 0" type="text">增加</el-button>
                  <el-button @click.native="removeOtherTermOthers(index, scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </div>
        </div>
        <el-button @click.native="addotherTerm" class="btn" style="width: 160px; margin-top: 20px;"><i class="el-icon-plus" style="margin-right: 10px;"></i>增加其他收费款项</el-button>
      </div>

      <div class="wrapper-title">保证金条款</div>
      <div class="block">
        <div class="tab-wrapper table-input">
          <el-table
            :data="securityDeposit"
            border
            style="width: 1000px;">
            <el-table-column
              prop="charge"
              label="收费款项"
              width="329">
              <template slot-scope="scope">
                <el-select
                  style="width: 320px"
                  v-model="scope.row.subjectId"
                  placeholder="请选择"
                  clearable>
                  <el-option
                    v-for="child in chargeList"
                    class='select-option-selected'
                    :key="child.id"
                    :label="child.subjectName"
                    :value="child.id">
                  </el-option>
                </el-select>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableMoney"
              label="应收金额(元)">
              <template slot-scope="scope">
                <InputNumber
                  :value="scope.row.receivableMoney"
                  placeholder="请输入，保留2位小数"
                  className="input-unit"
                  unit=""
                  @input="result => scope.row.receivableMoney = result">
                </InputNumber>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableDate"
              label="应收日期"
              width="335">
              <template slot-scope="scope">
                <el-date-picker
                  v-model="scope.row.receivableDate"
                  type="date"
                  value-format="yyyy-MM-dd"
                  placeholder="选择日期">
                </el-date-picker>
              </template>
            </el-table-column>
            <el-table-column
              label=""
              width="60">
              <template slot-scope="scope">
                <el-button @click.native="addsecurityDeposit()" v-show="scope.$index == 0" type="text">增加</el-button>
                <el-button @click.native="removesecurityDeposit(scope.$index)" v-show="scope.$index > 0" type="text" style="margin-left: 0;">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <div class="wrapper-title">附件及关键条款</div>
      <div class="block">
        <el-form :inline="false" size="small">
          <el-form-item label="合同附件">
            <!-- <el-upload
              action="''"
              :auto-upload="false"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview"
              :on-remove="handleRemove"
              :on-change="fileChange">
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible">
              <img width="100%" :src="dialogImageUrl" alt="">
            </el-dialog> -->

            <el-upload
              :action="''"
              :auto-upload="false"
              :on-change="fileChange"
              :show-file-list="false">
              <el-button size="small" round type="primary" icon="el-icon-upload2">上传文件</el-button>
              <div slot="tip" class="el-upload__tip">支持扩展名：rar，zip，doc，docx，pdf，jpg等</div>
            </el-upload>
            <div class="accessory">
              <div class="list-accessory" v-for="(item, index) in attachmentStrList" :key="index">
                <div class="left">
                  <i class="el-icon-paperclip"></i><span>附件{{index + 1}}</span>
                </div>
                <i class="el-icon-close close" @click="deleteFile(index)"></i>
              </div>
            </div>
          </el-form-item>
          <el-form-item label="关键条款">
            <el-input
              type="textarea"
              :autosize="{ minRows: 5, maxRows: 5}"
              placeholder="请输入内容"
              v-model="textarea">
            </el-input>
          </el-form-item>
        </el-form>
        <div class="btn-group clearfix">
          <el-button class="btn pull-left" @click.native="saveContract" style="margin-right: 0">保存</el-button>
          <el-button class="btn btn-default pull-left" @click="goBack">取消</el-button>
        </div>
      </div>
    </div>
    <!-- <el-dialog
      title="租赁单元"
      :modal-append-to-body="false"
      :visible.sync="baseInfo.selectRentUnit">
      <rentunit-component
        ref='child'
        @accpectUnit="updateUnit($event)"
        :type="'business'"
        :assetId ='this.baseInfo.assetId'>
      </rentunit-component>
    </el-dialog> -->
    <el-dialog
      title="租赁单元"
      :modal-append-to-body="false"
      :visible.sync="baseInfo.selectRentUnit">
      <new-rent
        ref='child'
        @accpectUnit="updateUnit($event)"
        :type="'business'"
        :assetId ='this.baseInfo.assetId'>
      </new-rent>
    </el-dialog>
  </div>
</template>
<script>
import {getContCompanyList, getSubjectDropDown, createContract, getContNo, calculateAndSave} from '@/http/contract'
import rentunitComponent from './rentUnit'
import newRent from './newRent'
import { mapState } from 'vuex'
import { isDeepNull } from '@/utils/isDeepNull'
import { cloneDeep, isArray, isEmpty } from 'lodash-es'
import InputNumber from '@/components/InputNumber'
import { http } from '@/http/index'

export default {
  data () {
    return {
      assetLayout: null,
      baseInfo: {
        conNo: null,
        assetId: null,
        companyId: null,
        rentalList: [],
        brandId: null,
        brandList: [],
        signLayout: {
          code: null,
          name: null
        },
        signIndustry: {
          id: null,
          name: null
        },
        brandLayout: [
          {code: '1', name: '时装'},
          {code: '2', name: '餐饮'},
          {code: '3', name: '儿童'},
          {code: '4', name: '配套'},
          {code: '5', name: '超市'},
          {code: '6', name: '影院'},
          {code: '7', name: '娱乐'},
          {code: '8', name: '其它'}
        ],
        unitList: [],
        selectRentUnit: false
      },
      lease: [
        {
          isShow: true,
          operate: false,
          isRequired: true,
          placeholder: '请先选择租赁单元',
          type: 'number',
          name: '建筑面积',
          key: 'buildingArea',
          value: null,
        }, {
          isShow: true,
          operate: false,
          isRequired: true,
          placeholder: '请先选择租赁单元',
          type: 'number',
          name: '套内面积',
          key: 'innerArea',
          value: null,
        }, {
          isShow: true,
          operate: false,
          isRequired: true,
          placeholder: '请先选择租赁单元',
          type: 'number',
          name: '计租面积',
          key: 'rentArea',
          value: null,
        }, {
          isShow: true,
          operate: false,
          isRequired: true,
          type: 'date',
          name: '签约日期',
          key: 'signDate',
          value: null
        }, {
          isShow: true,
          operate: false,
          isRequired: true,
          type: 'date',
          name: '交付日期',
          key: 'dueDate',
          value: null
        },
        {
          isShow: true,
          operate: false,
          isRequired: true,
          type: 'date',
          name: '预计开业日期',
          key: 'openDate',
          value: null
        },
        {
          isShow: true,
          operate: false,
          isRequired: true,
          type: 'dateRange',
          key: 'contDate',
          key1: 'contStartDate',
          key2: 'contEndDate',
          name1: '合同开始日期',
          value1: null,
          name2: '合同结束日期',
          value2: null
        }, {
          isShow: true,
          operate: false,
          type: 'dateRange',
          key: 'decorationDate',
          key1: 'decorationStartDate',
          key2: 'decorationEndDate',
          name1: '装修开始日期',
          value1: null,
          name2: '装修结束日期',
          value2: null
        }, {
          isShow: true,
          operate: true,
          type: 'dateRange',
          key: 'freeDate',
          key1: 'freeStartDate',
          key2: 'freeEndDate',
          child: [{
            name1: '免租期开始日期',
            value1: null,
            name2: '免租期结束日期',
            value2: null
          }]
        }
      ],
      rentTerms: [
        {
          name: '计租方式',
          value: null,
          key: 'chargeType',
          options: [{value: '1', label: '固定'}, {value: '2', label: '扣点'}, {value: '3', label: '两者取高'}]
        }, {
          name: '收费形式',
          value: null,
          key: 'chargeForm',
          options: [{value: '1', label: '预收'}, {value: '3', label: '后收'}]
        }, {
          name: '最迟缴款日',
          value: null,
          key: 'lastPayDate',
          options: [{'value': 1, 'label': 1}, {'value': 2, 'label': 2}, {'value': 3, 'label': 3}, {'value': 4, 'label': 4}, {'value': 5, 'label': 5}, {'value': 6, 'label': 6}, {'value': 7, 'label': 7}, {'value': 8, 'label': 8}, {'value': 9, 'label': 9}, {'value': 10, 'label': 10}, {'value': 11, 'label': 11}, {'value': 12, 'label': 12}, {'value': 13, 'label': 13}, {'value': 14, 'label': 14}, {'value': 15, 'label': 15}, {'value': 16, 'label': 16}, {'value': 17, 'label': 17}, {'value': 18, 'label': 18}, {'value': 19, 'label': 19}, {'value': 20, 'label': 20}, {'value': 21, 'label': 21}, {'value': 22, 'label': 22}, {'value': 23, 'label': 23}, {'value': 24, 'label': 24}, {'value': 25, 'label': 25}, {'value': 26, 'label': 26}, {'value': 27, 'label': 27}, {'value': 28, 'label': 28}, {'value': 29, 'label': 29}, {'value': 30, 'label': 30}, {'value': 31, 'label': 31}, {'value': 32, 'label': '每月最后1天'}]
        }, {
          name: '支付周期',
          value: null,
          key: 'payCycle',
          options: [{value: '1', label: '月付'}, {value: '2', label: '二月付'}, {value: '3', label: '季付'}, {value: '4', label: '半年付'}, {value: '5', label: '年付'}, {value: '6', label: '一次付'}]
        }
      ],
      rent: {
        downRent: [{
          chargeDate: [],
          receivableAmount: null,
          taxRate: null,
          receivableDate: null
        }],
        fixedRent: [{
          chargeDate: [],
          taxRate: null,
          monthAmount: null,
          monthAmountNoTax: null
        }],
        snapPointRent: [{
          chargeDate: [],
          taxRate: null,
          monthAmount: null,
          monthAmountNoTax: null,
          steps: [{
            salesStart: null,
            salesEnd: null,
            discountRate: null
          }]
        }],
        bothTakeHighRent: [{
          chargeDate: [],
          taxRate: null,
          monthAmount: null,
          monthAmountNoTax: null,
          steps: [{
            salesStart: null,
            salesEnd: null,
            discountRate: null
          }]
        }]
      },
      propertyTerms: [
        {
          name: '计租方式',
          value: null,
          key: 'chargeType',
          options: [{value: '1', label: '固定'}
          ]
        }, {
          name: '收费形式',
          value: null,
          key: 'chargeForm',
          options: [{value: '1', label: '预收'}, {value: '3', label: '后收'}]
        }, {
          name: '最迟缴款日',
          value: null,
          key: 'lastPayDate',
          options: [{'value': 1, 'label': 1}, {'value': 2, 'label': 2}, {'value': 3, 'label': 3}, {'value': 4, 'label': 4}, {'value': 5, 'label': 5}, {'value': 6, 'label': 6}, {'value': 7, 'label': 7}, {'value': 8, 'label': 8}, {'value': 9, 'label': 9}, {'value': 10, 'label': 10}, {'value': 11, 'label': 11}, {'value': 12, 'label': 12}, {'value': 13, 'label': 13}, {'value': 14, 'label': 14}, {'value': 15, 'label': 15}, {'value': 16, 'label': 16}, {'value': 17, 'label': 17}, {'value': 18, 'label': 18}, {'value': 19, 'label': 19}, {'value': 20, 'label': 20}, {'value': 21, 'label': 21}, {'value': 22, 'label': 22}, {'value': 23, 'label': 23}, {'value': 24, 'label': 24}, {'value': 25, 'label': 25}, {'value': 26, 'label': 26}, {'value': 27, 'label': 27}, {'value': 28, 'label': 28}, {'value': 29, 'label': 29}, {'value': 30, 'label': 30}, {'value': 31, 'label': 31}, {'value': 32, 'label': '每月最后1天'}]
        }, {
          name: '支付周期',
          value: null,
          key: 'payCycle',
          options: [{value: '1', label: '月付'}, {value: '2', label: '二月付'}, {value: '3', label: '季付'}, {value: '4', label: '半年付'}, {value: '5', label: '年付'}, {value: '6', label: '一次付'}]
        }
      ],
      property: {
        downProperty: [{
          chargeDate: [],
          receivableAmount: null,
          taxRate: null,
          receivableDate: null
        }],
        fixedProperty: [{
          chargeDate: [],
          taxRate: null,
          monthAmount: null,
          monthAmountNoTax: null
        }]
      },
      otherTermArray: [{
        otherTerms: [
          {
            name: '收费款项',
            value: null,
            key: 'subjectId',
            options: []
          }, {
            name: '计租方式',
            value: null,
            key: 'chargeType',
            options: [{value: '1', label: '固定'}
            ]
          }, {
            name: '收费形式',
            value: null,
            key: 'chargeForm',
            options: [{value: '1', label: '预收'}, {value: '3', label: '后收'}]
          }, {
            name: '最迟缴款日',
            value: null,
            key: 'lastPayDate',
            options: [{'value': 1, 'label': 1}, {'value': 2, 'label': 2}, {'value': 3, 'label': 3}, {'value': 4, 'label': 4}, {'value': 5, 'label': 5}, {'value': 6, 'label': 6}, {'value': 7, 'label': 7}, {'value': 8, 'label': 8}, {'value': 9, 'label': 9}, {'value': 10, 'label': 10}, {'value': 11, 'label': 11}, {'value': 12, 'label': 12}, {'value': 13, 'label': 13}, {'value': 14, 'label': 14}, {'value': 15, 'label': 15}, {'value': 16, 'label': 16}, {'value': 17, 'label': 17}, {'value': 18, 'label': 18}, {'value': 19, 'label': 19}, {'value': 20, 'label': 20}, {'value': 21, 'label': 21}, {'value': 22, 'label': 22}, {'value': 23, 'label': 23}, {'value': 24, 'label': 24}, {'value': 25, 'label': 25}, {'value': 26, 'label': 26}, {'value': 27, 'label': 27}, {'value': 28, 'label': 28}, {'value': 29, 'label': 29}, {'value': 30, 'label': 30}, {'value': 31, 'label': 31}, {'value': 32, 'label': '每月最后1天'}]
          }, {
            name: '支付周期',
            value: null,
            key: 'payCycle',
            options: [{value: '1', label: '月付'}, {value: '2', label: '二月付'}, {value: '3', label: '季付'}, {value: '4', label: '半年付'}, {value: '5', label: '年付'}, {value: '6', label: '一次付'}]
          }
        ],
        others: [{
          chargeDate: [],
          taxRate: null,
          monthAmount: null,
          monthAmountNoTax: null
        }]
      }],
      securityDeposit: [{
        subjectId: null,
        receivableMoney: null,
        receivableDate: null
      }],
      chargeList: [],
      accountsActiveName: 'first',
      dialogImageUrl: '',
      dialogVisible: false,
      textarea: '',
      attachment: '',
      attachmentStrList: []
    }
  },
  watch: {
    'baseInfo.assetId': {
      handler: function () {
        this.count++
        this.assetLayout = this.projectNameList.filter(item => item.id === this.baseInfo.assetId)[0].assetLayout
        this.lease.map(item => {
          if (item.key === 'openDate') {
            item.isShow = Number(this.assetLayout) === 2
          }
        })
        if (this.count !== 1) {
          this.baseInfo.unitList = []
          const keys = ['buildingArea', 'innerArea', 'rentArea']
          this.lease.map(item => {
            if (keys.includes(item.key)) {
              item.value = null
            }
          })
          this.baseInfo.companyId = null
          this.baseInfo.signLayout = {
            code: null,
            name: null
          }
          this.baseInfo.signIndustry = {
            id: null,
            name: null
          }
        }
      }
    },
    rent: {
      handler: function () {
        /**
         * 不含税月租金: 每月租金总额/（1+税率）
         * */
        this.rent.fixedRent.map(item => {
          let taxRate = Number(item.taxRate)
          item.monthAmountNoTax = (item.monthAmount / (1 + taxRate / 100)).toFixed(2)
        })
        this.rent.bothTakeHighRent.map(item => {
          let taxRate = Number(item.taxRate)
          item.monthAmountNoTax = (item.monthAmount / (1 + taxRate / 100)).toFixed(2)
        })
      },
      deep: true
    },
    property: {
      handler: function () {
        /**
         * 不含税月租金: 每月租金总额/（1+税率）
         * */
        this.property.fixedProperty.map(item => {
          let taxRate = Number(item.taxRate)
          item.monthAmountNoTax = (item.monthAmount / (1 + taxRate / 100)).toFixed(2)
        })
      },
      deep: true
    },
    otherTermArray: {
      handler: function () {
        /**
         * 不含税月租金: 每月租金总额/（1+税率）
         * */
        this.otherTermArray.map(item => {
          item.others.map(childItem => {
            let taxRate = Number(childItem.taxRate)
            childItem.monthAmountNoTax = (childItem.monthAmount / (1 + taxRate / 100)).toFixed(2)
          })
        })
      },
      deep: true
    }
  },
  computed: mapState(['merchant', 'projectNameList']),
  methods: {
    goBack () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      window.history.back()
    },
    getContNo: function () {
      getContNo(this.merchant.id).then(res => {
        this.baseInfo.conNo = res.data
      })
    },
    selectRentUnitToggle: function () {
      if (!this.baseInfo.assetId) {
        this.$message({
          message: '请选择项目',
          type: 'warning'
        })
        return false
      }
      this.baseInfo.selectRentUnit = !this.baseInfo.selectRentUnit
      let assetId = this.baseInfo.assetId
      this.$nextTick(() => {
        this.$refs.child.getBuildingList(assetId)
        this.$refs.child.getList(assetId)
      })
    },
    getContRentList: function () {
      this.assetLayout = this.projectNameList.filter(item => item.id === this.baseInfo.assetId)[0].assetLayout
      if (Number(this.assetLayout) === 2) {
        this.rentTerms[0].options = [{value: '1', label: '固定'}, {value: '2', label: '扣点'}, {value: '3', label: '两者取高'}]
        this.lease[5].isShow = true
      } else {
        this.rentTerms[0].options = [{value: '1', label: '固定'}]
        this.lease[5].isShow = false
      }
      let params = {
        mainId: this.merchant.id,
        assetId: this.baseInfo.assetId,
        pageNum: '1',
        pageSize: '9999'
      }
      getContCompanyList(params).then(res => {
        this.baseInfo.rentalList = res.list
        this.baseInfo.companyId = ''
        this.baseInfo.brandId = ''
        this.baseInfo.signLayout = {
          name: '',
          code: ''
        }
      })
    },
    getBrandList: function (item) {
      const officeIndustryList = ['', 'TMT', '专业服务', '房地产', '零售', '金融', '能源', '制造业', '物流']
      const { companyIndustry, brandList } = item
      this.baseInfo.brandId = null
      this.baseInfo.brandList = brandList
      this.baseInfo.signIndustry = {
        id: companyIndustry,
        name: officeIndustryList[companyIndustry]
      }
    },
    getSignLayout: function (item) {
      this.baseInfo.signLayout = {
        name: item.firstLayoutName,
        code: item.firstLayout
      }
    },
    delUnitNo (index) {
      this.baseInfo.unitList.splice(index, 1)
      // 更新租赁单元， 更新建筑面积、套内面积、计租面积
      this.upDateLeaseArea()
    },
    // updateUnit: function (unit) {
    //   this.baseInfo.selectRentUnit = false
    //   if (isEmpty(unit)) return
    //   const bool = this.baseInfo.unitList.some(item => isEqual(item, unit))
    //   if (bool) return
    //   this.baseInfo.unitList.push(unit)
    //   this.upDateLeaseArea()
    // },
    updateUnit: function (unit) {
      this.baseInfo.selectRentUnit = false
      if (isEmpty(unit)) return
      const roomIds = this.baseInfo.unitList.map(item => item.roomId)
      unit.map(item => {
        if (!roomIds.includes(item.roomId)) {
          this.baseInfo.unitList.push(item)
        }
      })
      this.upDateLeaseArea()
    },
    upDateLeaseArea () {
      // 更新租赁单元， 更新建筑面积、套内面积、计租面积
      this.lease.map(item => {
        const keys = ['buildingArea', 'innerArea', 'rentArea']
        keys.map(key => {
          if (item.key === key) {
            item.value = this.baseInfo.unitList.reduce((prev, cur) => {
              return prev + cur[key]
            }, 0)
          }
        })
      })
    },
    addfreeRentDate (index) {
      this.lease.forEach(element => {
        if (element.operate) {
          element.child.push({
            name1: '免租期开始日期',
            value1: '',
            name2: '免租期结束日期',
            value2: ''
          })
        }
      })
    },
    removefreeRentDate (index) {
      this.lease.forEach(element => {
        if (element.operate) {
          element.child.splice(index, 1)
        }
      })
    },
    // 固定租金增减删除
    addfixedRent () {
      const { fixedRent } = this.rent
      fixedRent.push({
        chargeDate: '',
        taxRate: '',
        unitPrice: '',
        monthAmount: '',
        monthAmountNoTax: ''
      })
      this.rent.fixedRent = fixedRent
    },
    removefixedRent (index) {
      this.rent.fixedRent.splice(index, 1)
    },
    // 扣点租金增减删除
    addsnapPointRent () {
      const { snapPointRent } = this.rent
      snapPointRent.push({
        chargeDate: [],
        taxRate: null,
        monthAmount: null,
        monthAmountNoTax: null,
        steps: [{
          salesStart: null,
          salesEnd: null,
          discountRate: null
        }]
      })
      this.rent.snapPointRent = snapPointRent
    },
    removesnapPointRent (index) {
      this.rent.snapPointRent.splice(index, 1)
    },
    addsnapPointRentSteps (parentIndex) {
      const { snapPointRent } = this.rent
      snapPointRent[parentIndex].steps.push({
        salesStart: null,
        salesEnd: null,
        discountRate: null
      })
    },
    removesnapPointRentSteps (parentIndex, childIndex) {
      this.rent.snapPointRent[parentIndex].steps.splice(childIndex, 1)
    },
    // 两者取高租金增减删除
    addbothTakeHighRent () {
      const { bothTakeHighRent } = this.rent
      bothTakeHighRent.push({
        chargeDate: [],
        taxRate: null,
        monthAmount: null,
        monthAmountNoTax: null,
        steps: [{
          salesStart: null,
          salesEnd: null,
          discountRate: null
        }]
      })
      this.rent.bothTakeHighRent = bothTakeHighRent
    },
    removebothTakeHighRent (index) {
      this.rent.bothTakeHighRent.splice(index, 1)
    },
    addbothTakeHighRentSteps (parentIndex) {
      const { bothTakeHighRent } = this.rent
      bothTakeHighRent[parentIndex].steps.push({
        salesStart: null,
        salesEnd: null,
        discountRate: null
      })
    },
    removebothTakeHighRentSteps (parentIndex, childIndex) {
      this.rent.bothTakeHighRent[parentIndex].steps.splice(childIndex, 1)
    },

    addfixedProperty () {
      const { fixedProperty } = this.property
      fixedProperty.push({
        chargeDate: '',
        taxRate: '',
        unitPrice: '',
        monthAmount: '',
        monthAmountNoTax: ''
      })
      this.property.fixedProperty = fixedProperty
    },
    removefixedProperty (index) {
      this.property.fixedProperty.splice(index, 1)
    },
    addOtherTermOthers (parentIndex) {
      const { others } = this.otherTermArray[parentIndex]
      others.push({
        chargeDate: [],
        taxRate: null,
        monthAmount: null,
        monthAmountNoTax: null
      })
      this.otherTermArray[parentIndex].others = others
    },
    removeOtherTermOthers (parentIndex, index) {
      this.otherTermArray[parentIndex].others.splice(index, 1)
    },
    addotherTerm () {
      let item = cloneDeep(this.otherTermArray[0])
      item.otherTerms.map(el => { el.value = '' })
      for (const key in item.others[0]) {
        item.others[0][key] = isArray(item.others[key]) ? [] : ''
      }
      item.others = item.others.slice(0, 1)
      this.otherTermArray.push(item)
    },
    delOtherTerm (index) {
      this.otherTermArray.splice(index, 1)
    },
    addsecurityDeposit () {
      let item = cloneDeep(this.securityDeposit[0])
      for (const key in item) {
        item[key] = ''
      }
      this.securityDeposit.push(item)
    },
    removesecurityDeposit (index) {
      this.securityDeposit.splice(index, 1)
    },
    // 款项下拉 --- 收入
    getIncomeSubjectDrop () {
      let params = {
        mainId: this.merchant.id,
        assetLayout: this.assetLayout, // 资产业态code：1.办公 2.商业"
        subjectType: 1 // 款项类别：1.收入 2.支出 3.保证金
      }
      getSubjectDropDown(params).then(res => {
        if (res) {
          res.forEach(element => {
            element.label = element.subjectName
            element.value = element.id
          })
        }
        this.otherTermArray[0].otherTerms[0].options = res
      })
    },
    // 款项下拉 --- 保证金
    getSecuritySubjectDrop () {
      let params = {
        mainId: this.merchant.id,
        assetLayout: this.assetLayout, // 资产业态code：1.办公 2.商业"
        subjectType: 3 // 款项类别：1.收入 2.支出 3.保证金
      }
      getSubjectDropDown(params).then(res => {
        this.chargeList = res
      })
    },
    saveContract () {
      const { assetId, conNo, companyId, signLayout, signIndustry, brandId } = this.baseInfo
      const rentalUnits = this.baseInfo.unitList.map(item => item.roomId).map(item => ({ roomId: item }))
      const lease = this.lease
      const [ buildingArea ] = lease.filter(item => item.key === 'buildingArea')
      const [ innerArea ] = lease.filter(item => item.key === 'innerArea')
      const [ rentArea ] = lease.filter(item => item.key === 'rentArea')
      const [ signDate ] = lease.filter(item => item.key === 'signDate')
      const [ dueDate ] = lease.filter(item => item.key === 'dueDate')
      const [ openDate ] = lease.filter(item => item.key === 'openDate')
      const [ contDate ] = lease.filter(item => item.key === 'contDate')
      const [ decorationDate ] = lease.filter(item => item.key === 'decorationDate')
      const [ freeDate ] = lease.filter(item => item.key === 'freeDate')
      const freeDateArr = []
      freeDate.child.forEach(element => {
        freeDateArr.push({start: element.value1, end: element.value2})
      })
      // rentTerms
      const rentTerms = this.rentTerms
      const [ rentTermsChargeType ] = rentTerms.filter(item => item.name === '计租方式')
      const [ rentTermsPayCycle ] = rentTerms.filter(item => item.name === '支付周期')
      const [ rentTermsChargeForm ] = rentTerms.filter(item => item.name === '收费形式')
      const [ rentTermsLastPayDate ] = rentTerms.filter(item => item.name === '最迟缴款日')
      const [ rentTermsFirstCycle ] = this.rent.downRent
      const newRentTermsFirstCycle = {
        chargeStartDate: rentTermsFirstCycle.chargeDate[0],
        chargeEndDate: rentTermsFirstCycle.chargeDate[1],
        receivableAmount: rentTermsFirstCycle.receivableAmount,
        taxRate: rentTermsFirstCycle.taxRate,
        receivableDate: rentTermsFirstCycle.receivableDate
      }
      // 非首期租金
      const { fixedRent, snapPointRent, bothTakeHighRent } = this.rent
      const rentTermsfixedRentArr = []
      // 租金条款 计租方式
      const rentTermsChargeTypeTemp = rentTermsChargeType.value || 1
      const rentTermsRentOrigin = [fixedRent, snapPointRent, bothTakeHighRent][rentTermsChargeTypeTemp - 1]
      rentTermsRentOrigin.forEach(element => {
        rentTermsfixedRentArr.push({
          chargeStartDate: element.chargeDate[0], // 开始日期
          chargeEndDate: element.chargeDate[1], // 结束日期
          taxRate: element.taxRate, // 税率
          unitPrice: element.unitPrice, // 固定/两者取高-租赁单价
          monthAmount: element.monthAmount, // 固定/两者取高-含税总金额
          monthAmountNoTax: element.monthAmountNoTax, // 固定/两者取高-不含税总金额
          steps: element.steps // 扣点/两者取高-阶梯扣率
        })
      })
      const rentTermsRes = {
        'chargeType': rentTermsChargeType.value,
        'payCycle': rentTermsPayCycle.value,
        'chargeForm': rentTermsChargeForm.value,
        'lastPayDate': rentTermsLastPayDate.value,
        'firstCycle': isDeepNull(newRentTermsFirstCycle) ? newRentTermsFirstCycle : null,
        'cycles': rentTermsfixedRentArr
      }
      // propertyTerms
      const propertyTerms = this.propertyTerms
      const [ propertyTermsChargeType ] = propertyTerms.filter(item => item.name === '计租方式')
      const [ propertyTermsPayCycle ] = propertyTerms.filter(item => item.name === '支付周期')
      const [ propertyTermsChargeForm ] = propertyTerms.filter(item => item.name === '收费形式')
      const [ propertyTermsLastPayDate ] = propertyTerms.filter(item => item.name === '最迟缴款日')
      const [ propertyTermsFirstCycle ] = this.property.downProperty
      const newPropertyTermsFirstCycle = {
        chargeStartDate: propertyTermsFirstCycle.chargeDate[0],
        chargeEndDate: propertyTermsFirstCycle.chargeDate[1],
        receivableAmount: propertyTermsFirstCycle.receivableAmount,
        taxRate: propertyTermsFirstCycle.taxRate,
        receivableDate: propertyTermsFirstCycle.receivableDate
      }
      const propertyTermsfixedRent = this.property.fixedProperty
      const propertyTermsfixedRentArr = []
      propertyTermsfixedRent.forEach(element => {
        propertyTermsfixedRentArr.push({
          chargeStartDate: element.chargeDate[0],
          chargeEndDate: element.chargeDate[1],
          taxRate: element.taxRate,
          unitPrice: element.unitPrice,
          monthAmount: element.monthAmount,
          monthAmountNoTax: element.monthAmountNoTax
        })
      })
      const propertyTermsRes = {
        'chargeType': propertyTermsChargeType.value,
        'payCycle': propertyTermsPayCycle.value,
        'chargeForm': propertyTermsChargeForm.value,
        'lastPayDate': propertyTermsLastPayDate.value,
        'firstCycle': isDeepNull(newPropertyTermsFirstCycle) ? newPropertyTermsFirstCycle : null,
        'cycles': propertyTermsfixedRentArr
      }
      // otherTerms
      const otherTerms = []
      this.otherTermArray.forEach((element, index) => {
        const [ otherTermsSubjectId ] = element.otherTerms.filter(item => item.name === '收费款项')
        const [ otherTermsSubjectType ] = otherTermsSubjectId.options.filter(item => item.id === otherTermsSubjectId.value)
        const [ otherTermsChargeType ] = element.otherTerms.filter(item => item.name === '计租方式')
        const [ otherTermsPayCycle ] = element.otherTerms.filter(item => item.name === '支付周期')
        const [ otherTermsChargeForm ] = element.otherTerms.filter(item => item.name === '收费形式')
        const [ otherTermsLastPayDate ] = element.otherTerms.filter(item => item.name === '最迟缴款日')
        const cycles = element.others.map(item => ({
          chargeStartDate: item.chargeDate[0],
          chargeEndDate: item.chargeDate[1],
          taxRate: item.taxRate,
          monthAmount: item.monthAmount,
          monthAmountNoTax: item.monthAmountNoTax
        }))
        otherTerms.push({
          subjectId: otherTermsSubjectId.value,
          subjectType: otherTermsSubjectType ? otherTermsSubjectType.subjectType : null,
          chargeType: otherTermsChargeType.value,
          payCycle: otherTermsPayCycle.value,
          chargeForm: otherTermsChargeForm.value,
          lastPayDate: otherTermsLastPayDate.value,
          cycles: cycles
        })
      })

      let params = {
        'mainId': this.merchant.id,
        'contNo': conNo,
        'contSort': this.assetLayout,
        'contType': 1,
        'assetId': assetId,
        'companyId': companyId,
        'signIndustry': signIndustry.id,
        'signLayout': signLayout.code,
        'brandId': brandId,
        'rentalUnits': rentalUnits,
        'buildingArea': buildingArea.value,
        'innerArea': innerArea.value,
        'rentArea': rentArea.value,
        'signDate': signDate.value,
        'dueDate': dueDate.value,
        'openDate': openDate.value,
        'contStartDate': contDate.value1,
        'contEndDate': contDate.value2,
        'decorationStartDate': decorationDate.value1,
        'decorationEndDate': decorationDate.value2,
        'freeDate': freeDateArr,
        'rentTerms': isDeepNull(rentTermsRes) ? rentTermsRes : null,
        'propertyTerms': isDeepNull(propertyTermsRes) ? propertyTermsRes : null,
        'otherTerms': isDeepNull(otherTerms) ? otherTerms : null,
        'cashDeposits': isDeepNull(this.securityDeposit) ? this.securityDeposit : null,
        'attachmentStrList': this.attachmentStrList,
        'keyTerms': this.textarea
      }
      createContract(params).then(res => {
        if (res.code === '0') {
          const id = res.data
          this.$confirm('合同保存成功，是否立即生成台账?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            calculateAndSave(id).then(res => {
              if (res.code === '0') {
                const assetLayout = this.assetLayout
                const params = `${assetLayout}&${id}`
                // 删除路由
                this.$destroy()
                this.$store.dispatch('setRouteList', {
                  route: this.$route,
                  type: 'delete'
                })
                this.$router.push(`/contract/detail/${params}`)
              }
            })
          }).catch(() => {
            this.$router.push('/contract/index')
          })
        }
      })
    },
    getObjectType: function (data) {
      return Object.prototype.toString.call(data).slice(8, -1)
    },
    handleRemove (file, fileList) {
      console.log(file, fileList)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    fileChange (file, fileList) {
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          this.attachmentStrList.push(res.data)
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    deleteFile (index) {
      this.attachmentStrList.splice(index, 1)
    }
  },
  components: {
    newRent,
    rentunitComponent,
    InputNumber
  },
  activated () {
    this.$store.dispatch('setProjectNameList', {mainId: this.merchant.id})
    this.getContNo()
    this.getSecuritySubjectDrop()
    this.getIncomeSubjectDrop()
  }
}
</script>
<style lang="scss" scoped>
  @import './contract.scss';
  .accessory {
    margin-top: 10px;
    .list-accessory {
      width: 330px;
      height: 34px;
      cursor: pointer;
      display: flex;
      align-items: center;
      padding: 0 8px;
      justify-content: space-between;
      .left {
        display: flex;
        align-items: center;
      }
      i {
        font-size: 18px;
        padding: 4px;
      }
      span {
        color: #333;
        font-size: 15px;
        display: inline-block;
        width: 270px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .close {
        color: #BCABDE;
        display: none;
      }
      &:hover {
        background: #F8F5FF;
        span {
          color: #5E0EFF;
        }
        .close {
          display: block;
        }
      }
    }
  }
</style>
<style>
  @import './unscoped.scss';
</style>

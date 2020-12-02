<template>
  <div id="business-create">
    <div class="base-info">
      <div class="new-block-title">项目基本信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="baseInfo"
            :rules="baseInfoRules"
            :model="baseInfo"
            size="small"
            label-width="90px">
            <el-form-item label="项目名称" prop="assetName" required>
              <el-autocomplete
                v-model="baseInfo.assetName"
                :trigger-on-focus="false"
                :fetch-suggestions="querySearchAsync"
                @select="selectName"
                placeholder="请选择，支持模糊搜索">
              </el-autocomplete>
            </el-form-item>
            <el-form-item label="其他名称" prop="shortName" required>
              <el-input v-model="baseInfo.shortName" placeholder="请输入其他名称"></el-input>
            </el-form-item>
            <el-form-item label="项目现状" prop="assetPresentSituation" required>
              <el-select
                v-model="baseInfo.assetPresentSituation"
                placeholder="请选择项目现状">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.projectStatus"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="业态" prop="assetLayout" required>
              <el-select
                v-model="baseInfo.assetLayout"
                placeholder="请选择项目业态">
                <el-option
                  class='select-option-selected'
                  v-for="item in assetLayoutList"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="竣工时间" prop="beCompletedDate" required>
              <el-date-picker
                v-model="baseInfo.beCompletedDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="物业等级" prop="propertyGrade" required>
              <el-select
                v-model="baseInfo.propertyGrade"
                placeholder="请选择物业等级">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.hierarchy"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="项目介绍" prop="assetIntroduce" required>
              <el-input v-model="baseInfo.assetIntroduce" placeholder="请输入项目介绍"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">区位信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="area"
            :model="baseInfo"
            size="small"
            label-width="110px">
            <el-form-item label="所在区域" required>
              <city-select
                style="width: 280px;"
                @upDateCity="upDateCityFn" :selectedCity="selectedCity">
              </city-select>
            </el-form-item>
            <el-form-item label="详细地址" prop="address" required>
              <el-input v-model="baseInfo.address" placeholder="请输入详细地址" @blur="handelBlur"></el-input>
            </el-form-item>
            <baidu-map class="map" :center="center" :zoom="zoom" @ready="handler" :scroll-wheel-zoom="true" @click="mapClick">
              <bm-marker v-if="positionMap" :position="positionMap" :dragging="true" @dragend="handelDragend">
              </bm-marker>
            </baidu-map>
            <el-form-item label="经度" prop="latitude" required>
              <el-input v-model="baseInfo.latitude" disabled placeholder="请输入经度"></el-input>
            </el-form-item>
            <el-form-item label="纬度" prop="longitude" required>
              <el-input v-model="baseInfo.longitude" disabled placeholder="请输入纬度"></el-input>
            </el-form-item>
            <el-form-item label="环线位置" prop="loopLinePosition" required>
              <el-input v-model="baseInfo.loopLinePosition" placeholder="请输入环线位置"></el-input>
            </el-form-item>
            <el-form-item label="所属商圈" prop="businessName" v-if="baseInfo.assetLayout === '2'" required>
              <el-input v-model="baseInfo.businessName" placeholder="请输入所属商圈"></el-input>
            </el-form-item>
            <el-form-item label="所属商务区" prop="businessName" v-if="baseInfo.assetLayout === '1' || baseInfo.assetLayout === '3'" required>
              <el-input v-model="baseInfo.businessName" placeholder="请输入所属商务区"></el-input>
            </el-form-item>
            <el-form-item label="项目四至(东)" prop="nearByRoadE" required>
              <el-input v-model="baseInfo.nearByRoadE" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="项目四至(西)" prop="nearByRoadS" required>
              <el-input v-model="baseInfo.nearByRoadS" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="项目四至(南)" prop="nearByRoadW" required>
              <el-input v-model="baseInfo.nearByRoadW" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="项目四至(北)" prop="nearByRoadN" required>
              <el-input v-model="baseInfo.nearByRoadN" placeholder="请输入"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">企业信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="enterprise"
            :model="baseInfo"
            size="small"
            label-width="100px">
            <el-form-item label="物业公司" prop="property" required>
              <el-input v-model="baseInfo.property" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="开发商" prop="developers" required>
              <el-input v-model="baseInfo.developers" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="运营商" prop="operators" required>
              <el-input v-model="baseInfo.operators" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="资产拥有方" prop="assetOwner" required>
              <el-input v-model="baseInfo.assetOwner" placeholder="请输入"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">建筑信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="building"
            :model="baseInfo"
            size="small"
            label-width="100px">
            <el-form-item label="总建筑面积" prop="totalBuildingArea" required>
              <InputNumber
                :value="baseInfo.totalBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => baseInfo.totalBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="办公总栋数" prop="officeFloorCount" v-if="baseInfo.assetLayout === '1' || baseInfo.assetLayout === '3'" required>
              <el-input v-model="baseInfo.officeFloorCount" placeholder="请输入办公总栋数，支持整数" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')" />
              <span data-v-373b083b="" style="position: absolute;right: 10px;">栋</span>
            </el-form-item>
            <el-form-item label="标准层面积" prop="standardLayerArea" required>
              <InputNumber
                :value="baseInfo.standardLayerArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => baseInfo.standardLayerArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="总车位数" prop="parkingLotNum" required>
              <el-input v-model="baseInfo.parkingLotNum" placeholder="请输入总车位数，支持整数" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')" />
            </el-form-item>
            <el-form-item label="占地面积" prop="areaCovered" required>
              <InputNumber
                :value="baseInfo.areaCovered"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => baseInfo.areaCovered = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="写字楼面积" v-if="baseInfo.assetLayout === '1' || baseInfo.assetLayout === '3'" prop="officeBuildingArea" required>
              <InputNumber
                :value="baseInfo.officeBuildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => baseInfo.officeBuildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="得房率" prop="occupancyRate" required>
              <InputNumber
                :value="baseInfo.occupancyRate"
                placeholder="保留2位小数"
                className="input-unit"
                unit="%"
                @input="result => baseInfo.occupancyRate = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="地上楼层数" prop="groundFloorUp" required>
              <el-input v-model="baseInfo.groundFloorUp" placeholder="请输入地上楼层数，支持整数" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')" />
            </el-form-item>
            <el-form-item label="地下楼层数" prop="groundFloorDown" required>
              <el-input v-model="baseInfo.groundFloorDown" placeholder="请输入地下楼层数，支持整数" oninput="value=value.replace(/[^0-9]/g, '')" />
            </el-form-item>
            <el-form-item label="环保认证" prop="envirCertify" v-if="baseInfo.assetLayout === '1' || baseInfo.assetLayout === '3'" required>
              <el-input v-model="baseInfo.envirCertify" placeholder="请输入"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">租户信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="tenement"
            :model="baseInfo"
            size="small"
            label-width="116px">
            <el-form-item label="主力租户" prop="mainTenant" required>
              <el-input v-model="baseInfo.mainTenant" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="租户行业特征" prop="tenantCharacteristics" required>
              <el-input v-model="baseInfo.tenantCharacteristics" placeholder="请输入"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">项目配套</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <!-- <el-checkbox-group v-model="supportingProject">
            <el-checkbox :label="item.label" v-for="item in circumAllList" :key="item.value"></el-checkbox>
          </el-checkbox-group> -->
          <el-form
            :inline="true"
            ref="xmpt"
            size="small"
            label-width="90px">
            <el-form-item label="项目配套" prop="supportingProject" required>
              <el-checkbox-group v-model="supportingProject">
                <el-checkbox :label="item.label" v-for="item in circumAllList" :key="item.value"></el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">企业服务</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <!-- <el-checkbox-group v-model="enterpriseServices">
            <el-checkbox :label="item.label" v-for="item in serviceAllList" :key="item.value"></el-checkbox>
          </el-checkbox-group> -->
          <el-form
            :inline="true"
            ref="qyfw"
            size="small"
            label-width="90px">
            <el-form-item label="企业服务" prop="enterpriseServices" required>
              <el-checkbox-group v-model="enterpriseServices">
                <el-checkbox :label="item.label" v-for="item in serviceAllList" :key="item.value"></el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">楼栋信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" size="small" label-width="100px" ref="buildref">
            <div v-for="(item, index) in buildingList" :key="index">
              <el-form-item label="楼栋名称" required>
                <el-input v-model="item.buildingName" placeholder="请输入"></el-input>
              </el-form-item>
              <el-form-item label="总建面积" required>
                <InputNumber
                  :value="item.buildingArea"
                  placeholder="保留2位小数"
                  className="input-unit"
                  unit="㎡"
                  @input="result => item.buildingArea = result">
                </InputNumber>
              </el-form-item>
              <el-form-item label="标准层面积" required>
                <InputNumber
                  :value="item.standardFloorArea"
                  placeholder="保留2位小数"
                  className="input-unit"
                  unit="㎡"
                  @input="result => item.standardFloorArea = result">
                </InputNumber>
              </el-form-item>
              <el-form-item label="楼层数" required>
                <el-input v-model="item.floorNum" placeholder="请输入" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')"></el-input>
                <span data-v-373b083b="" style="position: absolute;right: 10px;">层</span>
              </el-form-item>
              <el-form-item label="得房率" required>
                <InputNumber
                  :value="item.occupancyRate"
                  placeholder="保留2位小数"
                  className="input-unit"
                  unit="%"
                  @input="result => item.occupancyRate = result">
                </InputNumber>
              </el-form-item>
              <el-form-item label="净层高" required>
                <InputNumber
                  :value="item.netFloorHeight"
                  placeholder="保留2位小数"
                  className="input-unit"
                  unit="m"
                  @input="result => item.netFloorHeight = result">
                </InputNumber>
              </el-form-item>
              <el-form-item label="客梯" required>
                <el-input v-model="item.directPassengerElevator" placeholder="请输入" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')"></el-input>
                <span data-v-373b083b="" style="position: absolute;right: 10px;">部</span>
              </el-form-item>
              <el-form-item label="货梯" required>
                <el-input v-model="item.cargoLift" placeholder="请输入" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')"></el-input>
                <span data-v-373b083b="" style="position: absolute;right: 10px;">部</span>
              </el-form-item>
              <el-form-item label="空调系统" required>
                <el-input v-model="item.airConditioningSystem" placeholder="请输入"></el-input>
              </el-form-item>
              <el-button @click.native="removeBuild(index)" type="primary" size="mini" icon="el-icon-delete" v-show="index > 0"></el-button>
            </div>
          </el-form>
        </div>
        <el-button type="primary" @click="addBuild">添加</el-button>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">房源基础信息</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form
            :inline="true"
            ref="housing"
            :model="housing"
            size="small"
            label-width="116px">
            <el-form-item label="租赁单元名称" prop="roomNo" required>
              <el-input v-model="housing.roomNo" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="总建筑面积" prop="buildingArea" required>
              <InputNumber
                :value="housing.buildingArea"
                placeholder="保留2位小数"
                className="input-unit"
                unit="㎡"
                @input="result => housing.buildingArea = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="所在楼栋" prop="buildingName" required>
              <!-- <el-input v-model="housing.buildingName" placeholder="请输入"></el-input> -->
              <el-select
                v-model="housing.buildingName"
                placeholder="请选择所在楼栋">
                <el-option
                  class='select-option-selected'
                  v-for="(item, index) in buildingList"
                  :key="item.buildingName + index"
                  :label="item.buildingName"
                  :value="item.buildingName">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="所在楼层" prop="floorNum" required>
              <el-input v-model="housing.floorNum" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="朝向" prop="orientation" required>
              <el-select
                v-model="housing.orientation"
                placeholder="请选择朝向">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.orientation"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="交付标准" prop="deliveryStandards" required>
              <el-select
                v-model="housing.deliveryStandards"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.standard"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="是否可注册" prop="canRegister" required>
              <el-select
                v-model="housing.canRegister"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.isBoolean"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="是否可分割" prop="canDivision" required>
              <el-select
                v-model="housing.canDivision"
                placeholder="请选择">
                <el-option
                  class='select-option-selected'
                  v-for="item in constObj.isBoolean"
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="房源亮点" prop="advantage" required>
              <el-input v-model="housing.advantage" placeholder="请输入"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">招商要求</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" ref="demand" :model="housing" size="small" label-width="116px">
            <el-form-item label="租金" prop="minRentalPrice" required>
              <InputNumber
                :value="housing.minRentalPrice"
                placeholder="请输入最小租金(元/㎡/天)"
                className="input-unit"
                unit="元/㎡/天"
                @input="result => housing.minRentalPrice = result">
              </InputNumber>&emsp;~
            </el-form-item>
            <el-form-item label="" prop="maxRentalPrice" required>
              <InputNumber
                :value="housing.maxRentalPrice"
                placeholder="请输入最大租金(元/㎡/天)"
                className="input-unit"
                unit="元/㎡/天"
                @input="result => housing.maxRentalPrice = result">
              </InputNumber>
            </el-form-item><br>
            <el-form-item label="物业费" prop="minPropertyPrice" required>
              <InputNumber
                :value="housing.minPropertyPrice"
                placeholder="请输入最小物业费(元/㎡/天)"
                className="input-unit"
                unit="元/㎡/天"
                @input="result => housing.minPropertyPrice = result">
              </InputNumber>&emsp;~
            </el-form-item>
            <el-form-item label="" prop="maxPropertyPrice" required>
              <InputNumber
                :value="housing.maxPropertyPrice"
                placeholder="请输入最大物业费(元/㎡/天)"
                className="input-unit"
                unit="元/㎡/天"
                @input="result => housing.maxPropertyPrice = result">
              </InputNumber>
            </el-form-item><br>
            <el-form-item label="业态：" prop="layoutPositioning" v-if="baseInfo.assetLayout === '2'">
              <el-select
                v-model="housing.layoutPositioning"
                placeholder="请选择租赁业态"
                clearable>
                <el-option
                  v-for="item in unitTypeData"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="行业：" prop="industry" v-if="baseInfo.assetLayout === '1' || baseInfo.assetLayout === '3'">
              <el-select
                v-model="housing.industry"
                placeholder="请选择租赁行业"
                clearable>
                <el-option
                  v-for="item in constObj.industryType"
                  class='select-option-selected'
                  :key="item.code"
                  :label="item.name"
                  :value="item.code">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="预计入驻时间" prop="rentDate" required>
              <el-date-picker
                v-model="housing.rentDate"
                value-format="yyyy-MM-dd"
                type="date"
                placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="最短租期" prop="minLeaseTerm" required>
              <InputNumber
                :value="housing.minLeaseTerm"
                placeholder="请输入"
                className="input-unit"
                unit="年"
                @input="result => housing.minLeaseTerm = result">
              </InputNumber>
            </el-form-item>
            <el-form-item label="佣金规则" prop="brokerage" required>
              <el-input type="textarea" v-model="housing.brokerage" :rows="4" placeholder="请输入佣金规则" style="width: 692px;"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">联系人</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" ref="linkman" :model="housing" size="small" label-width="90px">
            <el-form-item label="联系人" prop="contactPerson" required>
              <el-input v-model="housing.contactPerson" placeholder="请输入联系人"></el-input>
            </el-form-item>
            <el-form-item label="联系电话" prop="phone" required>
              <el-input v-model="housing.phone" placeholder="请输入联系电话"></el-input>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="base-info">
      <div class="new-block-title">附件</div>
      <div class="new-block">
        <div class="filter-wrapper left-wrapper remove-style">
          <el-form :inline="true" size="small" label-width="130px" ref="picture">
            <el-form-item label="租赁单元实景图" required>
              <p style="font-size: 13px;color: #666;">(支持扩展名：jpg、png等图片格式)</p>
              <el-upload
                action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview1"
                :on-remove="handleRemove1"
                :auto-upload="false"
                :limit="5"
                :on-change="fileChange1"
                :file-list="realisticPicture">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible1">
                <img width="100%" :src="dialogImageUrl1" alt="">
              </el-dialog>
            </el-form-item><br>
            <el-form-item label="所在楼层平面图" required>
              <p style="font-size: 13px;color: #666;">(支持扩展名：jpg、png等图片格式)</p>
              <el-upload
                action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview2"
                :on-remove="handleRemove2"
                :auto-upload="false"
                :limit="5"
                :on-change="fileChange2"
                :file-list="planPicture">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible2">
                <img width="100%" :src="dialogImageUrl2" alt="">
              </el-dialog>
            </el-form-item><br>
            <el-form-item label="项目外立面图" required>
              <p style="font-size: 13px;color: #666;">(支持扩展名：jpg、png等图片格式)</p>
              <el-upload
                action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview3"
                :on-remove="handleRemove3"
                :auto-upload="false"
                :limit="5"
                :on-change="fileChange3"
                :file-list="projectElevationPicture">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible3">
                <img width="100%" :src="dialogImageUrl3" alt="">
              </el-dialog>
            </el-form-item><br>
            <el-form-item label="楼栋外立面图" required>
              <p style="font-size: 13px;color: #666;">(支持扩展名：jpg、png等图片格式)</p>
              <el-upload
                action="''"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview4"
                :on-remove="handleRemove4"
                :auto-upload="false"
                :limit="5"
                :on-change="fileChange4"
                :file-list="buildingElevationPicture">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible4">
                <img width="100%" :src="dialogImageUrl4" alt="">
              </el-dialog>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <el-button class="btn pull-right" @click.native="add" style="margin-right: 0">保存</el-button>
      <el-button class="btn btn-default pull-right" style="margin-right: 10px" @click.native="cancel">取消</el-button>
    </div>
  </div>
</template>
<script>
import CitySelect from '@/components/CitySelect'
import InputNumber from '@/components/InputNumber'
import { getProjectList, getMessage, handelAddBusiness, getBusinessDetail } from '@/http/business'
import { mapState } from 'vuex'
import { http } from '@/http/index'
import { queryLayoutPositioning } from '@/http/assets'
import { circumAllList, serviceAllList, projectStatus, hierarchy, loopLine, orientation, isBoolean, standard, industryType } from '@/components/const'
export default {
  data () {
    return {
      centerEnd: '',
      positionMap: null,
      center: {lng: 0, lat: 0},
      zoom: 3,
      selectedCity: null,
      constObj: {
        projectStatus,
        hierarchy,
        loopLine,
        orientation,
        isBoolean,
        standard,
        industryType
      },
      baseInfo: {},
      housing: {},
      baseInfoRules: {
        assetName: [
          { required: true, message: ' ', trigger: 'blur' },
          { required: true, message: ' ', trigger: 'change' }
        ],
        assetLayout: [
          { required: true, message: ' ', trigger: 'change' }
        ],
      },
      circumAllList,
      serviceAllList,
      supportingProject: [],
      enterpriseServices: [],
      buildingList: [
        {
          buildingName: '',
          buildingArea: '',
          standardFloorArea: '',
          floorNum: '',
          occupancyRate: '',
          netFloorHeight: '',
          directPassengerElevator: '',
          cargoLift: '',
          airConditioningSystem: '',
        }
      ],
      rentalunit: {},
      dialogVisible1: false,
      dialogVisible2: false,
      dialogVisible3: false,
      dialogVisible4: false,
      dialogImageUrl1: '',
      dialogImageUrl2: '',
      dialogImageUrl3: '',
      dialogImageUrl4: '',
      realisticPicture: [],
      planPicture: [],
      projectElevationPicture: [],
      buildingElevationPicture: [],
      unitTypeData: []
    }
  },
  computed: mapState(['merchant', 'assetLayoutList', 'projectNameList']),
  methods: {
    handler ({BMap, map}) {
      this.center = '上海市'
      this.zoom = 15
    },
    handelDragend (obj) {
      this.baseInfo.latitude = obj.point.lng
      this.baseInfo.longitude = obj.point.lat
    },
    mapClick ({point}) {
      this.positionMap = point
      this.baseInfo.latitude = point.lng
      this.baseInfo.longitude = point.lat
    },
    handelBlur () {
      this.center = this.centerEnd + this.baseInfo.address
    },
    getDetail () {
      const projectId = this.$route.params.id
      getBusinessDetail({mainId: this.merchant.id, id: projectId}).then(res => {
        this.baseInfo = res.data.assetDTO
        this.housing = res.data
        this.buildingList = res.data.buildingDTOS

        const assetDTO = res.data.assetDTO

        this.selectedCity = {
          provinceCode: assetDTO.provinceId,
          cityCode: assetDTO.cityId,
          districtCode: assetDTO.areaId
        }

        this.center = assetDTO.provinceName + assetDTO.cityName + assetDTO.districtName + assetDTO.address

        this.supportingProject = assetDTO.supportingProject.split(',')
        this.enterpriseServices = assetDTO.enterpriseServices.split(',')

        this.realisticPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '1').map(element => {
          element.url = element.resourceUrl
          element.name = element.resourceName
          return element
        })

        this.planPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '2').map(element => {
          element.url = element.resourceUrl
          element.name = element.resourceName
          return element
        })

        this.projectElevationPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '3').map(element => {
          element.url = element.resourceUrl
          element.name = element.resourceName
          return element
        })

        this.buildingElevationPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '4').map(element => {
          element.url = element.resourceUrl
          element.name = element.resourceName
          return element
        })
      })
    },
    upDateCityFn (city) {
      this.baseInfo.provinceId = city.provinceCode
      this.baseInfo.provinceName = city.provinceName
      this.baseInfo.cityId = city.cityCode
      this.baseInfo.cityName = city.cityName
      this.baseInfo.areaId = city.districtCode
      this.baseInfo.areaName = city.districtName

      if (city.districtName) {
        this.centerEnd = city.provinceName + city.cityName + city.districtName
      }
    },
    querySearchAsync (queryString, cb) {
      let params = {
        dataSource: 2,
        mainId: this.merchant.id,
        keywords: this.baseInfo.assetName
      }
      getProjectList(params).then(res => {
        if (res.length > 0) {
          res.forEach(item => {
            item.value = item.assetName
          })
          cb(res)
        }
      })
    },
    selectName (val) {
      let params = {
        id: val.id,
        dataSource: val.dateSource,
        mainId: this.merchant.id,
        assetName: val.assetName
      }
      getMessage(params).then(res => {
        this.baseInfo = res.businessAssetDTO
        this.buildingList = res.buildingDTOS
        this.supportingProject = res.businessAssetDTO.supportingProject.split(',')
        this.enterpriseServices = res.businessAssetDTO.enterpriseServices.split(',')
        this.selectedCity = {
          provinceCode: res.businessAssetDTO.provinceId,
          cityCode: res.businessAssetDTO.cityId,
          districtCode: res.businessAssetDTO.areaId
        }
        this.center = this.baseInfo.provinceName + this.baseInfo.cityName + this.baseInfo.districtName + this.baseInfo.address
      })
    },
    getLayoutPositioning () {
      queryLayoutPositioning().then(res => {
        this.unitTypeData = res
      })
    },
    addBuild () {
      this.buildingList.push({
        buildingName: '',
        buildingArea: '',
        standardFloorArea: '',
        floorNum: '',
        occupancyRate: '',
        netFloorHeight: '',
        directPassengerElevator: '',
        cargoLift: '',
        airConditioningSystem: '',
      })
    },
    removeBuild (index) {
      this.buildingList.splice(index, 1)
    },
    add () {
      if (this.realisticPicture.length === 0 || this.planPicture.length === 0 || this.projectElevationPicture.length === 0 || this.buildingElevationPicture.length === 0) {
        this.$message.warning('请上传图片')
        return
      }
      if (this.supportingProject.length === 0 || this.enterpriseServices.length === 0) return

      const refData = ['baseInfo', 'area', 'enterprise', 'building', 'buildref', 'housing', 'demand', 'linkman', 'tenement']
      let resultArr = []
      refData.map(item => {
        this.$refs[item].validate(valid => {
          resultArr.push(valid)
        })
      })

      if (resultArr.every(item => item)) {
        this.baseInfo.supportingProject = this.supportingProject.join()
        this.baseInfo.enterpriseServices = this.enterpriseServices.join()
        let params = {
          id: this.$route.params.id,
          ...this.housing,
          assetDTO: this.baseInfo,
          buildingDTOS: this.buildingList,
          roomResourceDTOS: [
            ...this.realisticPicture,
            ...this.planPicture,
            ...this.projectElevationPicture,
            ...this.buildingElevationPicture
          ]
        }

        handelAddBusiness(params).then(res => {
          if (res.code === '0') {
            this.$message.success(res.msg)
            // 删除路由
            this.$destroy()
            this.$store.dispatch('setRouteList', {
              route: this.$route,
              type: 'delete'
            })
            this.$router.push('/channel/business')
          }
        })
      }
    },
    cancel () {
      // 删除路由
      this.$destroy()
      this.$store.dispatch('setRouteList', {
        route: this.$route,
        type: 'delete'
      })
      this.$router.push('/channel/business')
    },
    fileChange1 (file, fileList) {
      this.handelFileChange(file, fileList, this.realisticPicture, 1)
    },
    fileChange2 (file, fileList) {
      this.handelFileChange(file, fileList, this.planPicture, 2)
    },
    fileChange3 (file, fileList) {
      this.handelFileChange(file, fileList, this.projectElevationPicture, 3)
    },
    fileChange4 (file, fileList) {
      this.handelFileChange(file, fileList, this.buildingElevationPicture, 4)
    },
    handelFileChange (file, fileList, target, resourceType) {
      fileList.splice(fileList.length - 1, 1)
      if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.name)) {
        this.$message.error('请上传图片文件')
        return false
      }
      let data = new FormData()
      data.append('multipartFile', file.raw)
      http.post(`/asset-fileservice-web/filesystem/upload`, data).then(res => {
        if (res.code === '0') {
          target.push({name: file.name, url: res.data, resourceName: file.name, resourceUrl: res.data, resourceType})
          this.$message({message: res.msg, type: 'success'})
        }
      })
    },
    handlePictureCardPreview1 (file) {
      this.dialogImageUrl1 = file.url
      this.dialogVisible1 = true
    },
    handleRemove1 (file, realisticPicture) {
      this.realisticPicture = realisticPicture
    },
    handlePictureCardPreview2 (file) {
      this.dialogImageUrl2 = file.url
      this.dialogVisible2 = true
    },
    handleRemove2 (file, planPicture) {
      this.planPicture = planPicture
    },
    handlePictureCardPreview3 (file) {
      this.dialogImageUrl3 = file.url
      this.dialogVisible3 = true
    },
    handleRemove3 (file, projectElevationPicture) {
      this.projectElevationPicture = projectElevationPicture
    },
    handlePictureCardPreview4 (file) {
      this.dialogImageUrl4 = file.url
      this.dialogVisible4 = true
    },
    handleRemove4 (file, buildingElevationPicture) {
      this.buildingElevationPicture = buildingElevationPicture
    },
  },
  activated () {
    this.$store.dispatch('setAssetLayoutEnum')
    this.getLayoutPositioning()
    this.getDetail()
  },
  components: {
    InputNumber,
    CitySelect
  }
}
</script>
<style lang="scss" scoped>
.btn-group{
  background: #fff;
  padding: 20px;
  overflow: hidden;
}
.map {
  width: 796px;
  height: 300px;
  margin-bottom: 20px;
}
</style>
<style lang="scss">
#business-create .left-wrapper .el-form-item__label{
  text-align: right;
}
#business-create .input-unit .el-input__inner{
  padding-right: 30px;
}
#business-create .el-input-group__append{
  position: absolute;
  z-index: 999;
  top: 0;
  right: 0;
  bottom: 0;
  width: 56px;
  line-height: 30px;
  background: none;
  border: none;
  color: #999;
  font-weight: bold;
  cursor: pointer;
  text-align: right;
  padding-right: 6px;
}
#business-create .el-form-item__error {
  display: none;
}
</style>

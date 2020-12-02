<template>
  <div id="business-detail">
    <div class="base-info">
      <div class="createInfo">
        <div class="headLeft">创建人：{{ruleForm.createdName || '-'}} &nbsp; - &nbsp; 创建时间：{{ruleForm.createdDate ? ruleForm.createdDate.slice(0, 10) : '-'}}</div>
        <div class="headRight">
          <div v-if="ruleForm.pushStatus === '1'">
            <el-button class="btn pull-right"
              :disabled="permission"
              style="margin-right: 10px"
              @click="handelSoldout(3)">下架</el-button>
            <el-button class="btn pull-right" @click="handelSoldout(2)" style="margin-right: 10px">已出租</el-button>
          </div>
          <el-button class="btn pull-right"
            v-else :disabled="permission"
            style="margin-right: 0"
            @click="handelPutaway">上架</el-button>
          <el-button class="btn pull-right" :disabled="permission" @click.native="edit" style="margin-right: 0">编辑</el-button>
        </div>
      </div>
      <div v-for="item in fieldData" :key="item.id">
        <div class="new-block-title">{{item.name}}</div>
        <div class="detailInfo">
          <div class="state" v-for="(childItem, index) in item.children" :key="childItem.type + index" v-show="!(childItem.isShow && ruleForm.assetLayout === '2')">
            <div class='key-label'>{{childItem.name}}</div>
            <div class='value-label'>{{childItem.value}}{{childItem.unit}}</div>
          </div>
        </div>
      </div>
      <div class="base-info">
        <div class="new-block-title">项目配套</div>
        <div class="new-block">
          <div class="filter-wrapper left-wrapper remove-style">
            <el-checkbox-group v-model="circumList">
              <el-checkbox :label="item.label" v-for="item in circumAllList" :key="item.value" disabled></el-checkbox>
            </el-checkbox-group>
          </div>
        </div>
      </div>
      <div class="base-info">
        <div class="new-block-title">企业服务</div>
        <div class="new-block">
          <div class="filter-wrapper left-wrapper remove-style">
            <el-checkbox-group v-model="serviceList">
              <el-checkbox :label="item.label" v-for="item in serviceAllList" :key="item.value" disabled></el-checkbox>
            </el-checkbox-group>
          </div>
        </div>
      </div>
      <div>
        <div class="new-block-title">楼栋信息</div>
        <div class="detailInfo">
          <div style="width: 100%" v-for="childItem in buildingDTOS" :key="childItem.id">
            <div class="state" style="display: inline-flex" v-for="(item, index) in buildingData" :key="item.type + index">
              <div class='key-label'>{{item.name}}</div>
              <div class='value-label'>{{childItem[item.key]}}{{item.unit}}</div>
            </div>
          </div>
        </div>
      </div>
      <div v-for="item in housingData" :key="item.id">
        <div class="new-block-title">{{item.name}}</div>
        <div class="detailInfo">
          <div class="state" v-for="(childItem, index) in item.children" :key="childItem.type + index" v-show="!childItem.isShow">
            <div class='key-label'>{{childItem.name}}</div>
            <div class='value-label'>{{childItem.value}}{{childItem.unit}}</div>
          </div>
        </div>
      </div>
      <div class="new-block-title">附件</div>
      <div class="new-block">
        <div class="img-wrapper">
          <p class="title">租赁单元实景图</p>
          <p v-if="!picture.realisticPicture">-</p>
          <div v-else class="img-list">
            <el-image
              v-for="item in picture.realisticPicture" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="realisticPreview">
            </el-image>
          </div>
        </div>
        <div class="img-wrapper">
          <p class="title">所在楼层平面图</p>
          <p v-if="!picture.planPicture">-</p>
          <div v-else class="img-list">
            <el-image
              v-for="item in picture.planPicture" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="planPreview">
            </el-image>
          </div>
        </div>
        <div class="img-wrapper">
          <p class="title">项目外立面图</p>
          <p v-if="!picture.projectElevationPicture">-</p>
          <div v-else class="img-list">
            <el-image
              v-for="item in picture.projectElevationPicture" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="projectElevationPreview">
            </el-image>
          </div>
        </div>
        <div class="img-wrapper">
          <p class="title">楼栋外立面图</p>
          <p v-if="!picture.buildingElevationPicture">-</p>
          <div v-else class="img-list">
            <el-image
              v-for="item in picture.buildingElevationPicture" :key="item.id" :src="item.resourceUrl"
              :preview-src-list="buildingElevationPreview">
            </el-image>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import InputNumber from '@/components/InputNumber'
import { industryType, circumAllList, serviceAllList } from '@/components/const'
import { queryLayoutPositioning } from '@/http/assets'
import { getBusinessDetail, putaway, soldout } from '@/http/business'
import KeyValue from '@/components/KeyValue'
import { fieldData, housingData, housingData1, buildingData } from './business'
export default {
  data () {
    return {
      permission: '',
      ruleForm: {},
      picture: {
        realisticPicture: [],
        planPicture: [],
        projectElevationPicture: [],
        buildingElevationPicture: [],
      },
      realisticPreview: [],
      planPreview: [],
      projectElevationPreview: [],
      buildingElevationPreview: [],
      industryType,
      unitTypeData: [],
      fieldData,
      housingData: [],
      buildingData,
      circumAllList,
      serviceAllList,
      circumList: [],
      serviceList: [],
      buildingDTOS: []
    }
  },
  components: {
    InputNumber,
    KeyValue
  },
  computed: mapState(['merchant', 'permissionList']),
  methods: {
    getLayoutPositioning () {
      queryLayoutPositioning().then(res => {
        this.unitTypeData = res
      })
    },
    getDetail () {
      const projectId = this.$route.params.id
      getBusinessDetail({mainId: this.merchant.id, id: projectId}).then(res => {
        this.ruleForm = res.data
        res.data.rentalPrice = res.data.minRentalPrice + ' ~ ' + res.data.maxRentalPrice
        res.data.propertyPrice = res.data.minPropertyPrice + ' ~ ' + res.data.maxPropertyPrice
        const assetDTO = res.data.assetDTO

        this.buildingDTOS = res.data.buildingDTOS

        this.circumList = assetDTO.supportingProject.split(',')
        this.serviceList = assetDTO.enterpriseServices.split(',')

        fieldData.forEach(item => {
          item.children.map(childitem => {
            childitem.value = assetDTO[childitem.key]
            if (assetDTO.assetLayout === '2' && childitem.key === 'businessName') {
              childitem.name = '所属商圈'
            }
            return childitem
          })
        })

        let result = []

        if (assetDTO.assetLayout === '2') {
          result = housingData
        } else if (assetDTO.assetLayout === '1' || assetDTO.assetLayout === '3') {
          result = housingData1
        }

        result.forEach(item => {
          item.children.map(childitem => {
            childitem.value = res.data[childitem.key]
            return childitem
          })
        })

        this.housingData = result

        this.picture.realisticPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '1')
        this.realisticPreview = this.picture.realisticPicture.map(item => item.resourceUrl)

        this.picture.planPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '2')
        this.planPreview = this.picture.planPicture.map(item => item.resourceUrl)

        this.picture.projectElevationPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '3')
        this.projectElevationPreview = this.picture.projectElevationPicture.map(item => item.resourceUrl)

        this.picture.buildingElevationPicture = res.data.roomResourceDTOS.filter(item => item.resourceType === '4')
        this.buildingElevationPreview = this.picture.buildingElevationPicture.map(item => item.resourceUrl)
      })
    },
    handelSoldout (inx) {
      soldout({id: this.$route.params.id, mainId: this.merchant.id, assetCloudState: inx}).then(res => {
        if (res.code === '0') {
          this.$message({message: res.msg, type: 'success'})
          this.getDetail()
        }
      })
    },
    handelPutaway () {
      putaway({id: this.$route.params.id, mainId: this.merchant.id}).then(res => {
        if (res.code === '0') {
          this.$message({message: res.msg, type: 'success'})
          this.getDetail()
        }
      })
    },
    edit () {
      const contractID = this.$route.params.id
      this.$router.push('/channel/business/edit/' + contractID)
    }
  },
  activated () {
    const routeName = this.$router.history.current.meta.name
    this.permission = this.permissionList[routeName].indexOf('WRITE') === -1
    this.getLayoutPositioning()
    this.getDetail()
  }
}
</script>

<style lang="scss" scoped>
.img-wrapper {
  width: 100%;
  display: flex;
  margin-bottom: 20px;
  p {
    width: 80px;
    text-align: right;
    color: #333;
    font-size: 15px;
    padding-right: 12px;
    box-sizing: border-box;
  }
  .title {
    width: 130px;
  }
  .img-list {
    flex: 1;
    .el-image {
      width: 100px;
      height: 100px;
      margin: 5px;
    }
  }
}
</style>

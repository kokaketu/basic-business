<!--
 * @Author: your name
 * @Date: 2020-08-24 15:40:58
 * @LastEditTime: 2020-08-31 17:34:51
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \asset_management_static\src\views\contract\multiplePoints\detail.vue
-->
<template>
  <div id="contract-detail" class="contract">
    <div class="wrapper detail-form-style-rest">
      <div class="createInfo">
        <div class="headLeft">创建人：{{detail.createdName}} &nbsp; - &nbsp; 创建时间：{{formatDate(detail.createdDate)}}</div>
        <div class="headRight">
          <el-button :disabled="permission || !operation.edit" class="btn pull-right" @click.native="edit">编辑</el-button>
          <el-button :disabled="permission || !operation.reGenerate" class="btn btn-green pull-right" @click.native="reGenerate">重新生成台账</el-button>
          <el-button :disabled="permission || !operation.generate" class="btn btn-green pull-right" @click.native="generate">生成台账</el-button>
          <el-button :disabled="permission || !operation.invalid" class="btn btn-default pull-right" @click.native="invalid">作废</el-button>
          <el-button :disabled="permission || !operation.termination" v-show="detail.contStatus != '4'" class="btn btn-default pull-right" @click.native="termination">解约</el-button>
          <!-- <el-button :disabled="permission" class="btn pull-right" v-if="operation.restore" @click.native="reinstate">恢复</el-button>-->
          <el-popover
            style="margin-left: 10px"
            v-show="detail.contStatus == '4'"
            placement="bottom"
            width="200"
            trigger="hover">
            <div v-html="`解约时间：${detail.contFailDate || ''} <br/>解约原因：${detail.contFailReason || ''}`"></div>
            <el-button slot="reference" class="btn btn-default pull-right">已解约<i class="el-icon-question el-icon--right"></i></el-button>
          </el-popover>
        </div>
      </div>
      <!-- 基本信息 -->
      <div class="wrapper-title">基本信息</div>
      <div class="detailInfo">
        <KeyValue keytag='合同编号' :valuetag="baseInfo.contNo" />
        <KeyValue keytag='项目' :valuetag="baseInfo.assetName" />
        <KeyValue keytag='租户' :valuetag="baseInfo.companyName" />

        <KeyValue v-if="assetLayout != 2" keytag='行业' :valuetag="baseInfo.signIndustry" />
        <KeyValue v-if="assetLayout == 2" keytag='品牌' :valuetag="baseInfo.brandName" />
        <KeyValue v-if="assetLayout == 2" keytag='经营业态' :valuetag="baseInfo.signLayout" />

        <KeyValue keytag='多经点位' :valuetag="baseInfo.rentalUnits" />
      </div>
      <!-- 租约信息 -->
      <div class="wrapper-title">租约信息</div>
      <div class="detailInfo">
        <KeyValue keytag='计租面积' :valuetag="detail.rentArea" />
        <KeyValue keytag='签约日期' :valuetag="detail.signDate" />
        <KeyValue keytag='交付日期' :valuetag="detail.dueDate" />
        <KeyValue v-if="assetLayout == 2" keytag='预计开业日期' :valuetag="detail.openDate" />
        <!-- 占位 -->
        <KeyValue v-else keytag='' valuetag=" " />
        <KeyValue keytag='合同开始日期' :valuetag="detail.contStartDate" />
        <KeyValue keytag='合同结束日期' :valuetag="detail.contEndDate" />
      </div>
      <!-- 其他收费条款 -->
      <div class="wrapper-title">收费条款</div>
      <div v-if="otherTerms.length > 0">
        <div class="detailInfo"
          v-for="otherTerm in otherTerms"
          :key="otherTerm.id">
          <KeyValue keytag='收费款项' :valuetag="otherTerm.subjectName" />
          <KeyValue keytag='计租方式' :valuetag="otherTerm.chargeType" />
          <KeyValue keytag='收费形式' :valuetag="otherTerm.chargeForm" />
          <KeyValue keytag='最迟缴款日' :valuetag="otherTerm.lastPayDate == 32 ? '每月最后1天' : otherTerm.lastPayDate" />
          <KeyValue keytag='支付周期' :valuetag="otherTerm.payCycle" />
          <div style="width: 100%"></div>
          <div class="tab-wrapper table-input" style="margin-bottom: 20px">
            <el-table
              :data="otherTerm.cycles"
              border
              style="width: 1000px;">
              <el-table-column
                label="租赁期"
                width="230">
                <template slot-scope="scope">
                  {{scope.row.chargeStartDate}}~{{scope.row.chargeEndDate}}
                </template>
              </el-table-column>
              <el-table-column
                prop="monthAmount"
                label="含税周期总额(元)">
                <template slot-scope="scope">
                  <el-input disabled v-model="scope.row.monthAmount"></el-input>
                </template>
              </el-table-column>
              <el-table-column
                prop="taxRate"
                label="税率(%)">
                <template slot-scope="scope">
                  <el-input disabled v-model="scope.row.taxRate" ></el-input>
                </template>
              </el-table-column>
              <el-table-column
                prop="monthAmountNoTax"
                label="不含税周期总额(元)">
                <template slot-scope="scope">
                  <el-input disabled v-model="scope.row.monthAmountNoTax"></el-input>
                </template>
              </el-table-column>
            </el-table>
          </div>
        </div>
      </div>
      <div v-else class="noData">暂无数据</div>
      <!-- 保证金条款 -->
      <div class="wrapper-title">保证金条款</div>
      <div class="block">
        <div class="tab-wrapper table-input">
          <el-table
            :data="cashDeposits"
            border
            style="width: 1000px;">
            <el-table-column
              prop="subjectName"
              label="收费款项"
              width="329">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.subjectName"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableMoney"
              label="应收金额(元)"
              width="335">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.receivableMoney"></el-input>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableDate"
              label="应收日期"
              width="335">
              <template slot-scope="scope">
                <el-input disabled v-model="scope.row.receivableDate"></el-input>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </div>
      <!-- 附件及关键条款 -->
      <div class="wrapper-title">附件及关键条款</div>
      <div class="block">
        <el-form :inline="false" size="small">
          <!-- <el-form-item label="合同附件">

          </el-form-item> -->
          <div class="filesdetail">
            <p>合同附件</p>
            <div class="file-list">
              <div class="files" v-for="(item,index) in attachmentList" :key="index">
                <a :href="item" :download="'附件' + (index + 1)"><i class="el-icon-paperclip">附件{{index + 1}}</i></a>
              </div>
              <span v-show="attachmentList.length===0">-</span>
            </div>
          </div>
          <el-form-item label="关键条款">
            <el-input
              disabled
              type="textarea"
              :autosize="{ minRows: 5, maxRows: 5}"
              v-model="detail.keyTerms">
            </el-input>
          </el-form-item>
        </el-form>
      </div>
      <!-- 台账 -->
      <div class="wrapper-title">费用台账</div>
      <div class="block" style="margin-bottom: 30px;">
        <div class="tabs">
          <ul class="clearfix">
            <li @click="switchTabs('account', '0')" :class="{'active': accountActiveName == '0'}">全部</li>
            <li @click="switchTabs('account', '99')" :class="{'active': accountActiveName == '99'}">收费条款</li>
            <li @click="switchTabs('account', '3')" :class="{'active': accountActiveName == '3'}">保证金</li>
          </ul>
        </div>
        <div class="tab-wrapper">
          <el-table
            :data="accountCurList"
            row-key="id"
            cell-class-name="account-table-cell"
            style="width: 1000px;border: 1px solid #E6E6E6;"
            :tree-props="{children: 'rights', hasChildren: 'hasChildren'}">
            <el-table-column
              label="收费项"
              width="200">
              <template slot-scope="scope">
                <span :style="{'margin-left': scope.row.rights ? '' : '23px'}">{{scope.row.subjectName}}</span>
              </template>
            </el-table-column>
            <el-table-column
              label="账期"
              width="200">
              <template slot-scope="scope">
                <span>{{scope.row.chargeStartDate}} ~ {{scope.row.chargeEndDate}}</span>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableMoney"
              min-width="240"
              label="应收金额(元)(含税)">
              <template slot-scope="scope">
                <div class="receivable">
                  <div>{{scope.row.receivableMoney}}</div>
                  <div v-if="scope.row.guaranteeRent">保底租金</div>
                  <div>
                    <el-button
                    class="btn btn-default btn-mini"
                    size="mini"
                    v-if="scope.row.operation && scope.row.operation.generate"
                    @click="refreshAmount(scope.row)">生成应收台账</el-button>
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              prop="receivableDate"
              label="应收日期"
              width="200">
            </el-table-column>
              <el-table-column
              prop="rightMonth"
              label="权责月">
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
    <cont-termination :visible="contTerminationVisible" @close="contTerminationClose" :id="detail.id"/>
  </div>
</template>
<script>
import {calculateAndSave, receivable, detail, refreshAmount, recalculate, invalid} from '@/http/contract'
import KeyValue from '@/components/KeyValue'
import { mapState } from 'vuex'
import contTermination from '../termination'
import { isEmpty } from 'lodash-es'
export default {
  data () {
    return {
      assetLayout: null,
      contractId: null,
      permission: '',
      detail: {},
      operation: {},
      baseInfo: {
        contNo: null,
        assetName: null,
        companyName: null,
        signIndustry: null,
        brandName: null,
        signLayout: null,
        rentalUnits: null
      },
      lease: {},
      rentTerms: {},
      rentalActiveName: 'first',
      propertyTerms: {},
      propertyActiveName: 'first',
      otherTerms: [],
      cashDeposits: [],
      accountList: [],
      accountCurList: [],
      accountActiveName: '0',
      contTerminationVisible: false,
      attachmentList: []
    }
  },
  watch: {
    accountActiveName: {
      handler () {
        this.accountCurList = this.accountActiveName === '0'
          ? this.accountList
          : this.accountList.filter(item => item.type === this.accountActiveName)
      }
    }
  },
  computed: mapState(['permissionList']),
  methods: {
    refreshAmount (row) {
      refreshAmount(row.id).then(res => {
        row.guaranteeRent = res.guaranteeRent
        row.receivableMoney = res.receivableMoney
        if (res.rights && res.rights.length > 0) {
          res.rights.map((child, childIndex) => {
            child.id = row.id * 1000 + childIndex + 1
          })
          row.rights = res.rights
        } else {
          row.rights = []
        }
      })
    },
    reGenerate () {
      recalculate(this.contractId).then(res => {
        if (res.code === '0') {
          window.location.reload()
        }
      })
    },
    generate () {
      calculateAndSave(this.contractId).then(res => {
        if (res.code === '0') {
          window.location.reload()
        }
      })
    },
    // 作废合同
    invalid () {
      this.$confirm('作废后您的合同将不能再使用，且相关的应收将会删除。是否继续？', '作废确认', {type: 'warning'})
        .then(() => {
          invalid(this.detail.id).then(res => {
            if (res.code === '0') {
              this.$message.success('合同已作废')
              this.getDetail()
              this.getReceivable()
            }
          })
        }).catch(() => {})
    },
    // 解约
    termination () {
      this.$confirm('解约时间后的部分应收将会作废并删除。是否继续？', '解约确认', {type: 'warning'}).then(() => {
        this.contTerminationVisible = true
      }).catch(() => {})
    },
    // 解约弹框关闭
    contTerminationClose (refresh) {
      this.contTerminationVisible = false
      if (refresh) {
        this.getDetail()
        this.getReceivable()
      }
    },
    formatDate (date) {
      return date ? date.slice(0, 10) : '-'
    },
    getDetail () {
      const dateArr = [{'value': 1, 'label': 1}, {'value': 2, 'label': 2}, {'value': 3, 'label': 3}, {'value': 4, 'label': 4}, {'value': 5, 'label': 5}, {'value': 6, 'label': 6}, {'value': 7, 'label': 7}, {'value': 8, 'label': 8}, {'value': 9, 'label': 9}, {'value': 10, 'label': 10}, {'value': 11, 'label': 11}, {'value': 12, 'label': 12}, {'value': 13, 'label': 13}, {'value': 14, 'label': 14}, {'value': 15, 'label': 15}, {'value': 16, 'label': 16}, {'value': 17, 'label': 17}, {'value': 18, 'label': 18}, {'value': 19, 'label': 19}, {'value': 20, 'label': 20}, {'value': 21, 'label': 21}, {'value': 22, 'label': 22}, {'value': 23, 'label': 23}, {'value': 24, 'label': 24}, {'value': 25, 'label': 25}, {'value': 26, 'label': 26}, {'value': 27, 'label': 27}, {'value': 28, 'label': 28}, {'value': 29, 'label': 29}, {'value': 30, 'label': 30}, {'value': 31, 'label': 31}, {'value': 32, 'label': '每月最后1天'}]
      detail(this.contractId).then(res => {
        if (res.code !== '0') {
          this.$message({
            message: res.msg,
            type: 'warning'
          })
          return
        }
        let data = res.data
        this.detail = data
        this.attachmentList = data.attachmentStrList
        this.operation = data.operation
        this.baseInfo = {
          contNo: data.contNo,
          assetName: data.assetName,
          companyName: data.companyName,
          signIndustry: data.signIndustry && data.signIndustry.name,
          brandName: data.brandName,
          signLayout: data.signLayout && data.signLayout.name,
          rentalUnits: data.rentalUnits.map(item => item.roomNo).toString()
        }
        try {
          this.rentTerms = {
            chargeTypeCode: data.rentTerms.chargeType.code,
            chargeType: data.rentTerms.chargeType.name,
            chargeForm: data.rentTerms.chargeForm.name,
            lastPayDate: dateArr[data.rentTerms.lastPayDate - 1].label,
            payCycle: data.rentTerms.payCycle.name,
            unitPriceType: data.rentTerms.unitPriceType.name,
            firstCycle: data.rentTerms.firstCycle ? [ data.rentTerms.firstCycle ] : [],
            cycles: data.rentTerms.cycles
          }
        } catch (e) {
          console.log(e)
        }
        try {
          this.propertyTerms = {
            chargeType: data.propertyTerms.chargeType.name,
            chargeForm: data.propertyTerms.chargeForm.name,
            lastPayDate: dateArr[data.propertyTerms.lastPayDate - 1].label,
            payCycle: data.propertyTerms.payCycle.name,
            unitPriceType: data.propertyTerms.unitPriceType.name,
            firstCycle: data.propertyTerms.firstCycle ? [ data.propertyTerms.firstCycle ] : [],
            cycles: data.propertyTerms.cycles
          }
        } catch (e) {
          console.log(e)
        }
        try {
          this.otherTerms = data.otherTerms.map(item => {
            return {
              subjectName: item.subjectName,
              chargeType: item.chargeType.name,
              chargeForm: item.chargeForm.name,
              lastPayDate: dateArr[item.lastPayDate - 1].label,
              payCycle: item.payCycle.name,
              unitPriceType: item.unitPriceType.name,
              cycles: item.cycles
            }
          })
        } catch (e) {
          console.log(e)
        }
        try {
          this.cashDeposits = data.cashDeposits
        } catch (e) {
          console.log(e)
        }
      })
    },
    getReceivable () {
      receivable(this.contractId).then(res => {
        let data = res.data
        if (!data) return false
        data.map((item, index) => {
          if (!isEmpty(item.rights)) {
            item.rights.map((child, childIndex) => {
              child.id = item.id * 1000 + childIndex + 1
            })
          } else {
            item.rights = null
          }
          return item
        })
        this.accountList = data
        this.accountCurList = data
      })
    },
    switchTabs (type, value) {
      switch (type) {
        case 'rent':
          this.rentalActiveName = value
          break
        case 'property':
          this.propertyActiveName = value
          break
        case 'account':
          this.accountActiveName = value
          break
        default:
          break
      }
    },
    edit () {
      const assetLayout = this.assetLayout
      const params = `${assetLayout}&${this.contractId}`
      this.$router.push(`/contract/multiplePoints/edit/${params}`)
    }
  },
  components: {
    KeyValue,
    contTermination
  },
  activated () {
    const params = this.$route.params.id
    this.assetLayout = params.split('&')[0]
    this.contractId = params.split('&')[1]
    const routeName = this.$router.history.current.meta.name
    this.permission = Number(this.permissionList[routeName].indexOf('WRITE')) === -1
    this.getDetail()
    this.getReceivable()
  }
}
</script>
<style lang="scss" scoped>
  @import '../contract.scss';
  .receivable {
    display: flex;
    flex: 1;
    line-height: 24px;
    >div{
      width: 80px;
      text-align: left;
    }
  }
  .filesdetail {
    display: flex;
    margin-bottom: 10px;
    p {
      font-size: 14px;
      color: #333;
      margin-top: 9px;
    }
    .file-list {
      flex: 1;
      .files {
        a {
          display: inline-block;
          height: 34px;
          width: 330px;
          padding: 0 10px;
          line-height: 34px;
          color: #333333;
          background: #fff;
          transition: all ease-in .4;
          font-size: 14px;
        }
        a:hover{
          box-sizing: border-box;
          background:rgba(248,245,255,1);
          border-radius:3px;
          color: #5E0EFF;
        }
      }
      span {
        margin: 6px 0 0 10px;
        display: block;
      }
    }
  }
</style>
<style lang="scss">
  @import '../unscoped.scss';
</style>

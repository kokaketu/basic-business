<template>
  <div class="sale-amount-container">
    <div class="filter-wrapper">
      <el-form :inline="true" ref="form" size="small" label-width="100px">
        <project-auto-complete
          label="项目名称："
          size="small"
          assetLayout="2"
          @select="selectProject"
          :project-id="assetId"
        />
        <el-form-item label="合同状态：">
          <el-select
            v-model="isEnter"
            placeholder="请选择合同录入情况"
            @change="chooseType('noCont')">
            <el-option
              v-for="item in [{id: 1, value: '未录入'}, {id: 2, value: '已录入'}]"
              class='select-option-selected'
              :key="item.id"
              :label="item.value"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="名称/编号：">
          <el-input v-model="identifier" @input="chooseType()"
            placeholder="请输入租户名称或合同编号" ></el-input>
        </el-form-item>
        <el-form-item label="选择月份：">
          <el-date-picker
              v-model="date"
              type="month"
              placeholder="选择月份"
              style="width: 7.5rem"
              size="small"
              @change="chooseType('date')"
            />
        </el-form-item>
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="chooseType()">搜索</el-button>
        <el-button class="btn btn-default" @click="reset()">重置</el-button>
      </div>
    </div>
    <div class="table-wrapper">
      <el-table
        :data="sales.list"
        @sort-change="sortChange"
        @row-click="importData"
      >
        <el-table-column
          prop="companyName"
          label="租户"
        >
        </el-table-column>
        <el-table-column
          prop="storeIds"
          label="铺位"
          width="110"
        >
        </el-table-column>
        <el-table-column
          prop="contNo"
          label="合同编号"
          width="130"
        >
        </el-table-column>
        <!-- <el-table-column
          prop="assetLayout"
          label="业态"
          width="60"
        >
          <template slot-scope="scope">{{scope.row.assetLayout | assetType}}</template>
        </el-table-column> -->
        <el-table-column
          prop="monthSales"
          sortable="custom"
          label="本月销售额合计(元)"
          align="right"
          class-name="set-sortable-align"
        ><template slot-scope="scope">{{scope.row.monthSales | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="yearSales"
          sortable="custom"
          label="本年销售额合计(元)"
          align="right"
          class-name="set-sortable-align"
        ><template slot-scope="scope">{{scope.row.yearSales | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="comparedSame"
          label="同比(%)"
          align="right"
        ><template slot-scope="scope">{{scope.row.comparedSame | comdify}}{{scope.row.comparedSame ? '%' : ''}}</template>
        </el-table-column>
        <el-table-column
          prop="sequential"
          label="环比(%)"
          align="right"
        ><template slot-scope="scope">{{scope.row.sequential | comdify}}{{scope.row.sequential ? '%' : ''}}</template>
        </el-table-column>
        <el-table-column
          prop="rentArea"
          sortable="custom"
          label="计租面积(㎡)"
          align="right"
          class-name="set-sortable-align"
        ><template slot-scope="scope">{{scope.row.rentArea | comdify}}</template>
        </el-table-column>
        <!-- <el-table-column
          prop="pingEffect"
          label="坪效(元/㎡)"
        >
        </el-table-column> -->
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="sales.total"
          :current-page.sync="page"
          @current-change="querySalesStatement"
        />
      </div>
    </div>
  </div>
</template>

<script>
import dayjs from 'dayjs'
import { mapState } from 'vuex'
import { ASSET_TYPEs } from '../../../components/const'
import { querySalesStatement } from '../../../http/sale'
import ProjectAutoComplete from '../../../components/ProjectAutoComplete'

export default {
  name: 'SaleAmount',
  components: { ProjectAutoComplete },
  data () {
    return {
      assetId: void 0,
      assetLayout: void 0,
      noCont: void 0, // 1/undefined
      date: new Date(),
      sales: {},
      page: 1,
      cont: '',
      identifier: '',
      isEnter: '',
      orderFiled: '',
      aos: ''
    }
  },
  computed: {
    ...mapState(['merchant']),
    yearMonth () {
      return this.date ? dayjs(this.date).format('YYYY-MM') : void 0
    }
  },
  created () {
    this.ASSET_TYPEs = ASSET_TYPEs
  },
  activated () {
    this.querySalesStatement()

    this.$watch(function () {
      return '' + this.page + this.assetId + this.assetLayout + this.identifier + this.noCont + (this.date && this.date.getTime())
    }, this.querySalesStatement)
  },
  methods: {
    querySalesStatement ({ page = this.page, orderFiled = this.orderFiled, aos = this.aos } = {}) {
      const { assetId, assetLayout, noCont, yearMonth, identifier } = this
      querySalesStatement({ page, orderFiled, aos, identifier, assetId, assetLayout, noCont, yearMonth, mainId: this.merchant.id }).then((res) => {
        this.sales = res
      })
    },
    reset () {
      this.assetId = void 0
      this.assetLayout = void 0
      this.noCont = void 0 // 1/undefined
      this.date = new Date()
      this.sales = {}
      this.page = 1
      this.cont = ''
      this.identifier = ''
      this.isEnter = ''
      // this.getList()
    },
    chooseType (type) {
      this.page = 1
      if (type === 'noCont') {
        if (this.isEnter === '未录入') {
          this.noCont = 1
        } else if (this.isEnter === '已录入') {
          this.noCont = 2
        }
      }
    },
    sortChange (column) {
      const { prop, order } = column
      // 1 本月 2本年 3同 4环 5 面积 6坪 7租
      // 1.顺序，2.逆序
      const orderFields = {
        monthSales: 1,
        yearSales: 2,
        comparedSame: 3,
        sequential: 4,
        rentArea: 5,
        pingEffect: 6,
        rentRatio: 7,
      }
      const aos = {
        ascending: 1,
        descending: 2,
      }
      // this.page = 1
      if (order) {
        this.orderFiled = orderFields[prop]
        this.aos = aos[order]
        this.querySalesStatement({ orderFiled: orderFields[prop], aos: aos[order] })
      } else {
        this.querySalesStatement()
      }
    },
    importData (row) {
      this.$router.push({
        name: 'importSale',
        query: row,
      })
    },
    selectProject ({ id }) {
      this.assetId = id

      this.chooseType('assetId')
    },
  },
}
</script>

<style scoped>
  .sale-amount-select {
    padding-bottom: 18px;
  }

  .type {
    display: inline-block;
    height: 30px;
    line-height: 30px;
    margin-right: 15px;
    padding: 0 11px;
    background-color: #F5F6F9;
    border: 1px solid #E2E3E5;
    border-radius: 2px;
  }

  .type.active {
    color: white;
    background-color: #5E0EFF;
    border-color: #5E0EFF;
  }
</style>

<style lang="scss">
  .sale-amount-upload .el-upload-list {
    display: none; /* 🤔️？*/
    position: absolute;
    right: 0;
  }

  .project-auto-sale-amount {
    display: inline-block;
    width: 180px;
    vertical-align: top;

    .el-form-item__content {
      line-height: inherit;
    }

    .el-form-item {
      margin-bottom: 0;
    }

    .el-form-item__label {
      display: none !important;
    }
  }
</style>

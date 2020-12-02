<template>
  <div id="passengerFlow" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" size="small" label-width="88px">
        <!-- <el-form-item label="项目名称：">
          <el-input v-model="query.projectName" placeholder="请输入项目名" clearable @input="search(1)"/>
        </el-form-item> -->
        <project-auto-complete
          label="项目名称："
          size="small"
          assetLayout="2"
          @select="selectProject"
          :project-id="assetId"
        />
        <el-form-item label="日期：">
          <el-date-picker
            type="month"
            placeholder="请选择月份"
            v-model="query.date"
            format="yyyy-MM"
            @input="search(1)">
          </el-date-picker>
        </el-form-item>

        <!-- <el-form-item>
          <el-button class="btn" style="margin-top: 20px" icon="el-icon-search" @click="search(1)">搜索</el-button>
          <el-button class="btn btn-default" style="margin-top: 20px" icon="el-icon-delete" @click="reset">清空</el-button>
        </el-form-item> -->
      </el-form>
      <div class="search-reset">
        <el-button class="btn" @click="search(1)">搜索</el-button>
        <el-button class="btn btn-default" @click="reset">重置</el-button>
      </div>
    </div>

    <div class="table-wrapper">
      <el-table :data="data" @row-click="rowClick">
        <el-table-column
          show-overflow-tooltip
          prop="assetName"
          label="项目"/>
        <el-table-column
          prop="passengerFlow"
          label="本月累计客流量(人)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.passengerFlow | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="yearPassengerFlow"
          label="本年累计客流量(人)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.yearPassengerFlow | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="withProportion"
          label="同比(%)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.withProportion | comdify}}{{scope.row.withProportion ? '%' : ''}}</template>
        </el-table-column>
        <el-table-column
          prop="surroundProportion"
          label="环比(%)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.surroundProportion | comdify}}{{scope.row.surroundProportion ? '%' : ''}}</template>
        </el-table-column>
        <el-table-column
          prop="operatingArea"
          label="总经营面积(㎡)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.operatingArea | comdify}}</template>
        </el-table-column>
        <el-table-column
          prop="permeability"
          label="渗透率(人/㎡/月)"
          align="right"
          class-name="set-sortable-align"
          sortable>
          <template slot-scope="scope">{{scope.row.permeability | comdify}}</template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="10"
          layout="prev, pager, next, jumper"
          :total="total"
          :current-page.sync="page"
          @current-change="search"
        />
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { getPassFlowListByMainId } from '@/http/operation'
import ProjectAutoComplete from '../../../components/ProjectAutoComplete'
export default {
  components: { ProjectAutoComplete },
  data () {
    return {
      query: {
        projectName: '',
        date: new Date()
      },
      data: [],
      total: 0,
      page: 1,
      assetId: void 0,
    }
  },
  computed: mapState(['merchant']),
  activated () {
    this.search(1)
  },
  methods: {
    reset () {
      this.page = 1
      this.query = {
        projectName: '',
        date: new Date()
      }
      this.assetId = null
      this.search(1)
    },
    search (page = this.page) {
      this.page = page
      let param = {mainId: this.merchant.id, page, limit: 10, assetId: this.assetId || ''}
      if (this.query.projectName && this.query.projectName.length > 0) {
        param.assetName = this.query.projectName
      }
      if (this.query.date != null && this.query.date instanceof Date) {
        param.yearValue = this.query.date.getFullYear().toString()
        param.monthValue = (this.query.date.getMonth() + 1).toString()
      }
      getPassFlowListByMainId(param).then(res => {
        this.data = res.list
        this.total = res.total
      })
    },
    rowClick (row) {
      this.$router.push({ path: `/operation/passengerFlow/${row.assetId}` })
    },
    selectProject ({ id }) {
      this.assetId = id
      this.search(1)
    },
  },
}
</script>
<style lang="scss" scoped>

</style>

<template>
  <div id="receivables" class="page">
    <div class="filter-wrapper">
      <el-form :inline="true" size="small" label-width="100px">
        <el-form-item label="日期范围">
          <el-date-picker
            type="daterange"
            format="yyyy-mm-dd"
            range-separator="~"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="项目名称">
          <el-input placeholder="请输入"></el-input>
        </el-form-item>

        <el-form-item label="款项名称">
          <el-input placeholder="请输入"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button class="btn" style="margin-top: 20px" @click="search()">搜索</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="table-wrapper">
      <div class="table-header clearfix">
        <el-button class="table-title" type="text">成本及费用确认列表</el-button>
        <el-button class="btn pull-right">删除</el-button>
        <el-button class="btn pull-right">新增</el-button>
        <div>共搜索到922条数据</div>
      </div>
      <el-table
        show-summary
        :summary-method="getSummaries"
        :data="tableData"
        style="width: 100%;">
        <el-table-column
          fixed="left"
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          prop="no"
          label="流水号"
          width="150">
        </el-table-column>
        <el-table-column
          prop="date"
          label="业务日期"
          width="120">
        </el-table-column>
        <el-table-column
          prop="name"
          label="项目名称"
          width="180">
        </el-table-column>
        <el-table-column
          prop="fundType"
          label="款项类别"
          width="100">
        </el-table-column>
        <el-table-column
          prop="fundName"
          label="款项名称"
          width="100">
        </el-table-column>
        <el-table-column
          prop="amount"
          label="确认金额(元)"
          sortable
          :formatter="numberFormat"
          width="140"
          align='right'>
        </el-table-column>
        <el-table-column
          prop="note"
          label="备注"
          width="180">
        </el-table-column>
        <el-table-column
          fixed="right"
          min-width="55"
          label="操作">
          <template>
            <el-button
              type="text"
              class="text-purple"
              size="small">
              编辑
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          :page-size="100"
          layout="prev, pager, next, jumper"
          :total="1000">
        </el-pagination>
      </div>
    </div>

  </div>
</template>
<script>
const comdify = function (n) {
  if (!n) return n
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1]}` : `${n1}.00`
}
export default {
  data () {
    return {
      tableData: [
        {
          no: 'CBFY001',
          date: '2020-05-10',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '工资',
          amount: 35000,
          note: '5月工资'
        },
        {
          no: 'CBFY002',
          date: '2020-05-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '水电费',
          amount: 20000,
          note: '5月水电费'
        },
        {
          no: 'CBFY003',
          date: '2020-05-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '修理费',
          amount: 200,
          note: '5月费用'
        },
        {
          no: 'CBFY004',
          date: '2020-04-10',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '工资',
          amount: 35000,
          note: '4月工资'
        },
        {
          no: 'CBFY005',
          date: '2020-04-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '水电费',
          amount: 20000,
          note: '4月水电费'
        },
        {
          no: 'CBFY006',
          date: '2020-04-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '修理费',
          amount: 200,
          note: '4月费用'
        },
        {
          no: 'CBFY007',
          date: '2020-03-10',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '工资',
          amount: 35000,
          note: '3月工资'
        },
        {
          no: 'CBFY008',
          date: '2020-03-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '水电费',
          amount: 20000,
          note: '3月水电费'
        },
        {
          no: 'CBFY009',
          date: '2020-03-01',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '修理费',
          amount: 200,
          note: '3月费用'
        },
        {
          no: 'CBFY010',
          date: '2020-02-10',
          name: '创维创新谷购物中心',
          fundType: '支出',
          fundName: '工资',
          amount: 35000,
          note: '2月工资'
        }
      ]
    }
  },
  methods: {
    numberFormat (row, column, cellValue, index) {
      return comdify(cellValue)
    },
    getSummaries (param) {
      const { columns, data } = param
      const sums = []
      columns.forEach((column, index) => {
        if (index === 1) {
          sums[index] = '本页小计(元)'
          return
        }
        if (index !== 6) {
          return
        }
        const values = data.map(item => Number(item[column.property]))
        if (!values.every(value => isNaN(value))) {
          sums[index] = comdify(values.reduce((prev, curr) => {
            const value = Number(curr)
            if (!isNaN(value)) {
              return prev + curr
            } else {
              return prev
            }
          }, 0))
        }
      })
      return sums
    }
  },
  activated () {}
}
</script>
<style lang="scss" scoped>

</style>

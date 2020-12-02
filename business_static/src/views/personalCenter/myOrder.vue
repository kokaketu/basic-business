
<template>
  <div class="my-order-body">
    <div class="title">
      我的订单
    </div>
    <el-table
      class="table-order"
      :data="orderInfos"
      border
    >
      <el-table-column
        prop="category"
        label="订单分类"
      />
      <el-table-column
        prop="signDateBegin"
        label="订单生效日"
      />
      <el-table-column
        prop="signDateEnd"
        label="到期日"
      />
    </el-table>
  </div>
</template>

<script>

import {
  listOrder,
} from '../../http/personalCenter'

export default {
  components: {},
  data () {
    return {
      orderInfos: []
    }
  },
  activated () {
    this.listOrder()
  },
  methods: {
    listOrder () {
      listOrder({
        memberId: '1945'
      }).then((res) => {
        this.orderInfos = res
      })
    }
  },
}
</script>
<style lang="scss" scoped>

.my-order-body {
  border-radius:3px;
  /*border:1px solid rgba(227,226,226,1);*/
  .title {
    line-height: 60px;
    padding: 0 20px 0 0;
    font-weight: bold;
    > .fr {
      margin-top: 12px;
    }
  }
  .table-order {
    width: auto;
    max-width: inherit;
    margin-right: -1px;
    /*border-bottom-left-radius: 3px;*/
    /*border-bottom-right-radius: 3px;*/
  }
}
</style>

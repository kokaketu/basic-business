<template>
  <div class="authority-dist-container">
    <!--<div class="title">权限分配</div>-->
    <el-table
      class="table-member"
      :data="tableData"
      row-key="name"
      :header-cell-style="{'text-align':'center'}"
    >
      <el-table-column
        :prop="header"
        :label="header"
        v-for="(header,index) in headers"
        :key="index"
      >
        <template slot-scope="scope">
          <div v-if="header === '模块'">{{scope.row.name}}</div>
          <div v-else>
            <!-- <el-checkbox
              @change="changeCheck(scope.row[header], header)"
              v-model="scope.row[header].checked"
            /> -->
            <el-checkbox-group v-model="scope.row[header].permission" @change="changeCheck(scope.row[header])">
              <el-checkbox label="READ">仅查看</el-checkbox>
              <el-checkbox label="WRITE">可修改</el-checkbox>
            </el-checkbox-group>
          </div>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { deletePermission, fetchListByMainId, permissionSave } from '../../http/authority'
import { forEach, groupBy, map } from 'lodash-es'
import { mapState } from 'vuex'
export default {
  name: 'Dist',
  data () {
    return {
      headers: [],
      tableData: []
    }
  },
  computed: mapState(['merchant']),
  activated () {
    this.fetchListByMainId()
    
  },
  methods: {
    fetchListByMainId () {
      fetchListByMainId({mainId: this.merchant.id}).then((res) => {
        
        const { table } = res || {}
        if (Array.isArray(table)) {
          const [headers = [], ...columns] = table

          this.headers = headers
          
          this.tableData = columns.map((item) => {
            if (Array.isArray(item)) {
              let [name, ...auth] = item

              auth = map(auth, (a) => {
                return typeof a === 'string' ? JSON.parse(a) : {}
              })

              auth = groupBy(auth, 'deptName')

              forEach(auth, ([ value ], key) => {
                value.checked = value.id != null
                value.permission = [value.permission] || []
                auth[key] = value
                auth.name = name
              })
              return auth
            }
            return {}
          })
        }
      })
    },
    // changeCheck (permission, a) {
    //   console.log(permission, a)
    //   const { id } = permission
    //   if (id == null) {
    //     permissionSave(permission).then((res) => {
    //       //
    //     })
    //   } else {
    //     deletePermission(id).then((res) => {
    //       //
    //     })
    //   }
    // },
    changeCheck(obj) {
      const { id } = obj
      let permission = obj.permission.pop()
      obj.permission = [permission]
      if(!permission) {
        deletePermission(id).then((res) => { })
      } else {
        
        let params = JSON.parse(JSON.stringify(obj))
        params.permission = permission
        permissionSave(params).then((res) => {
          obj.id = res
        })
      } 
    }
  },
}
</script>

<style lang="scss">
.authority-dist-container {
  color: #333;
  background-color: white;
  border-radius:3px;
  /*border:1px solid rgba(227, 226, 226, 1);*/
  .title {
    line-height: 60px;
    padding: 0 20px;
  }
  .el-checkbox {
    margin-right: 0;
    display: block;
  }
}
</style>

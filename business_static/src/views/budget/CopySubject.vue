<template>
  <div class="content-container copy-subject-container">
    <router-link to="/budget/subject" class="copy-subject-template-btn">
      <el-button type="primary">预算模版</el-button>
    </router-link>
    <el-tabs v-model="activeBudgetTemplateId" type="border-card">
      <el-tab-pane
        v-for="({id, budgetTypeName, budgetType, templateName, customDetailList}, pindex) in assetBudgetTemplateList"
        :label="templateName"
        :name="id"
        :key="id">
        <el-table
          :data="customDetailList"
          style="width: auto;max-width: inherit"
          row-key="id"
          border
          :tree-props="{children: 'child', hasChildren: 'hasChildren'}"
          default-expand-all>
          <el-table-column
            prop="budgetTypeName"
            label="科目分类">
            <template slot-scope="scope">
              <span v-show="scope.row.child">{{scope.row.budgetTypeName}}</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="budgetSubjectName"
            label="科目名称">
            <template slot-scope="scope">
              <span v-show="scope.row.subjectLevel > 1 && !scope.row.isAdd">{{scope.row.budgetSubjectName}}</span>
              <span v-show="scope.row.subjectLevel > 1 && scope.row.isAdd">
                <el-select v-model="scope.row.budgetSubjectCode" filterable placeholder="请选择">
                  <el-option
                    v-for="item in subjects"
                    class='select-option-selected'
                    :key="item.subjectCode"
                    :label="item.subjectName"
                    :value="item.subjectCode">
                  </el-option>
                </el-select>
              </span>
            </template>
          </el-table-column>
          <!--<el-table-column
            prop="subjectParentName"
            label="上级科目"
          />-->
          <el-table-column
            prop="subjectStatus"
            label="科目状态">
            <template slot-scope="scope">
              <span v-show="scope.row.subjectLevel > 1 && !scope.row.isAdd">{{scope.row.subjectStatus == 1 ? '启用' : '未启用'}}</span>
              <span v-show="scope.row.subjectLevel > 1 && scope.row.isAdd">
                <el-select v-model="scope.row.subjectStatus" placeholder="请选择">
                  <el-option
                    v-for="item in status"
                    class='select-option-selected'
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </span>
            </template>
          </el-table-column>
          <el-table-column
            prop="createdName"
            label="操作人">
            <template slot-scope="scope">
              <span v-show="scope.row.subjectLevel > 1">{{scope.row.createdName}}</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="updatedDate"
            label="最后操作日期">
            <template slot-scope="scope">
              <span v-show="scope.row.subjectLevel > 1">{{scope.row.updatedDate}}</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="name"
            label="操作">
            <template slot-scope="scope">
              <el-button
                type="text"
                icon="el-icon-circle-plus-outline"
                v-show="scope.row.subjectLevel < 2"
                @click.native="addRow(scope.row)">
              </el-button>
              <el-button
                type="text"
                v-show="scope.row.isAdd"
                icon="el-icon-remove-outline"
                @click.native="removeRow(scope.row, pindex)">
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="btn-group">
          <el-button class="btn pull-right" @click.native="save()">保存</el-button>
          <el-button class="btn btn-default pull-right" @click.native="reset()">重置</el-button>
        </div>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import { getAssetBudgetTemplateList, addAssetBudgetTemplate } from '../../http/budget'
import { getSubjectList } from '../../http/financial'
export default {
  name: 'CopySubject',
  data () {
    return {
      assetBudgetTemplateList: [],
      activeBudgetTemplateId: '',
      subjects: [],
      status: [{value: '1', label: '启用'}, {value: '0', label: '未启用'}]
    }
  },
  computed: {
    assetLayout () {
      return this.$route.query.assetLayout
    }
  },
  activated () {
    this.getAssetBudgetTemplateList()
  },
  methods: {
    getAssetBudgetTemplateList ({ budgetType } = {}) {
      getAssetBudgetTemplateList({ budgetType, assetLayout: this.assetLayout })
        .then((res) => {
          res.forEach(item => {
            item.id = `${item.id}`
          })
          this.assetBudgetTemplateList = res
          if (this.assetBudgetTemplateList.length > 0) {
            this.activeBudgetTemplateId = this.assetBudgetTemplateList[0].id
          }
        })
    },
    getSubjectList () {
      if (this.subjects.length === 0) {
        let params = {pageNum: 1, pageSize: 999}
        getSubjectList(params).then((res) => {
          this.subjects = res.list
        })
      }
    },
    addRow (row) {
      let newRow = {
        'isAdd': true,
        'budgetType': row.budgetType,
        'subjectStatus': '1',
        'subjectLevel': '2',
        'id': ''
      }
      row.child.unshift(newRow)
      this.getSubjectList()
    },
    removeRow (row, pindex) {
      this.assetBudgetTemplateList[pindex].customDetailList.forEach(element => {
        element.child.forEach((item, index) => {
          if (item === row) {
            element.child.splice(index, 1)
          }
        })
      })
    },
    handleClose (done) {
      done()
    },
    save () {
      let template = {}
      this.assetBudgetTemplateList.forEach(item => {
        if (this.activeBudgetId === item.id) {
          template = item
        }
      })
      template.customDetailList.forEach(element => {
        element.child.forEach(item => {
          this.subjects.forEach(subject => {
            if (subject.subjectCode === item.budgetSubjectCode) {
              item.budgetSubjectName = subject.subjectName
            }
          })
        })
      })
      addAssetBudgetTemplate(template).then(res => {
        if (res.code === '0') {
          this.$message({message: res.msg, type: 'success'})
          this.getAssetBudgetTemplateList()
        }
      })
    },
    reset () {
      this.getAssetBudgetTemplateList()
    }
  }
}
</script>

<style lang="scss">
  .copy-subject-container {
    position: relative;
    z-index: 1;
    .copy-subject-template-btn {
      position: absolute;
      top: 10px;
      right: 20px;
      z-index: 5;
    }
    .el-tabs__header {
      margin-bottom: 0;
    }
    .el-tabs__item {
      height: 59px;
      line-height: 59px;
      font-size: 15px;
    }
  }
</style>
<style scoped lang='scss'>
  .state-container {
    padding: 14px 20px;
  }
  .btn-group {
    margin-top: 20px;
    .btn-default{
      margin-right: 20px;
    }
  }
</style>

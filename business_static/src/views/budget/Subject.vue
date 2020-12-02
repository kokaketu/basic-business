<template>
  <div>
    <el-row>
      <el-col :span="22">&nbsp;</el-col>
      <el-col :span="2">
        <el-button type="primary" @click="copySubjectDialogVisible = true">复制修改</el-button>
      </el-col>
    </el-row>
    <div class="content-container">
      <div class="state-container">
        <el-row>
          <el-col :span="22">
            <asset-type :active="activeAssetType" :change="assetTypeChange"/>
          </el-col>
          <el-col :span="2" class="text-right">
            <router-link to="/budget/copy-subject">
              <el-button type="info">我的模版</el-button>
            </router-link>
          </el-col>
        </el-row>
      </div>
      <el-dialog
        title="模版名称"
        custom-class="copy-subject-dialog"
        :visible.sync="copySubjectDialogVisible"
        width="344px"
      >
        <el-form
          label-position="top"
          ref="copySubjectForm"
          label-width="80px"
          :model="copySubjectForm"
          hide-required-asterisk
        >
          <el-form-item
            label="请输入预算科目模版名称"
            prop="name"
            :rules="[
            { required: true, message: '预算科目模版名称不能为空'},
          ]"
          >
            <el-input v-model="copySubjectForm.name" placeholder="请输入商业预算科目模版"/>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer text-center">
          <el-button @click="copySubjectDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="copySubject('copySubjectForm')">创建模版</el-button>
        </div>
      </el-dialog>
      <el-table
        :data="tableData"
        style="margin: -1px;width: auto;max-width: inherit"
        border
        row-key="mainId"
        :tree-props="{children: 'customDetailList', hasChildren: 'hasChildren'}"
      >
        <el-table-column
          prop="budgetTypeName"
          label="科目分类"
        />
        <el-table-column
          prop="budgetSubjectName"
          label="科目名称"
        />
        <el-table-column
          prop="createdName"
          label="操作人"
        />
        <el-table-column
          prop="updatedDate"
          label="最后操作日期"
        />
      </el-table>
    </div>
  </div>
</template>

<script>
import AssetType from '../../components/AssetType'
import { getBudgetTemplateSaaSList } from '../../http/budget'

export default {
  name: 'Subject',
  components: { AssetType },
  data () {
    return {
      tableData: [],
      activeAssetType: '2',
      copySubjectDialogVisible: false,
      copySubjectForm: {
        name: ''
      }
    }
  },
  activated () {
    this.getBudgetTemplateSaaSList({ activeAssetType: this.activeAssetType })
  },
  methods: {
    getBudgetTemplateSaaSList ({ activeAssetType, budgetType }) {
      getBudgetTemplateSaaSList({ budgetType, assetLayout: activeAssetType })
        .then((res) => {
          this.tableData = res
        })
    },
    copySubject (form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          const {
            activeAssetType,
            copySubjectForm: { name }
          } = this
          this.$router.push({ name: 'CopySubject', query: { name, assetLayout: activeAssetType } })
        }
      })
    },
    assetTypeChange (activeAssetType) {
      this.activeAssetType = activeAssetType

      this.getBudgetTemplateSaaSList({ activeAssetType })
    }
  }
}
</script>

<style lang="scss">
  .copy-subject-dialog {
    .el-dialog__title {
      font-size: 16px;
      color: white;
    }

    .el-dialog__headerbtn {
      top: 16px;
    }

    .el-dialog__header {
      padding: 12px;
      background-color: #141414;
    }

    .el-dialog__body {
      padding: 10px 34px 0;
    }

    .el-dialog__footer {
      padding-top: 0;
    }
  }
</style>

<style scoped>
  .state-container {
    padding: 14px 20px;
  }
</style>

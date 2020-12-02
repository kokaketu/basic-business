<!--合同解约-->
<template>
  <el-dialog :visible="visible" :close-on-click-modal="false" @close="close(false)">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="title">合同解约</span>
      </div>
      <el-form :model="form" :rules="rules" ref="form" label-width="120px">
        <el-form-item label="解约生效日期" prop="terminationDate">
          <el-date-picker
            type="date"
            placeholder="选择日期"
            v-model="form.terminationDate"
            value-format="yyyy-MM-dd"
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item label="解约原因" prop="terminationReason">
          <el-input type="textarea" v-model="form.terminationReason" placeholder="请输入解约原因"></el-input>
        </el-form-item>
        <div class="clearfix" style="margin-top: 20px">
          <el-button type="default" @click="close(false)" class="fr" style="margin-left: 20px">取消</el-button>
          <el-button type="primary" @click="submit" class="fr">确定</el-button>
        </div>
      </el-form>
    </el-card>
  </el-dialog>
</template>
<script>
import { termination } from '@/http/contract'

export default {
  name: 'ContTermination',
  props: {
    visible: {
      type: Boolean,
      default: false,
      isRequired: true,
    },
    id: Number,
  },
  data () {
    return {
      form: {
      },
      rules: {
        terminationDate: [
          {required: true, message: '请选择解约生效日期', trigger: 'blur'},
        ],
        terminationReason: [
          {required: true, message: '请输入解约原因', trigger: 'blur'},
        ]
      }
    }
  },
  computed: {
  },
  watch: {
  },
  methods: {
    close (fresh) {
      this.$refs.form.resetFields()
      this.form = {}
      this.$emit('close', fresh)
    },
    submit () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          termination({contId: this.id, ...this.form}).then(res => {
            if (res.code === '0') {
              this.$message.success('合同已解约')
              this.close(true)
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
  },
  activated () {
  }
}
</script>

<style lang="scss" scoped>
  .title {
    font-size: 16px;
    font-weight: bold;
    color: #333;
  }

  .box-card {
    margin: -60px -20px -30px;
  }

  .update-table .el-form-item {
    margin-bottom: 0;
  }
  .btn-group{
    margin-top: 20px;
    margin-bottom: 60px;
    .el-button{
      margin-left: 10px;
    }
  }
</style>

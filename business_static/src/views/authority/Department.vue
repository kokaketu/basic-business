<template>
  <div class="authority-department-container">

    <el-dialog title="新建部门" width="480px" @close="close('departmentForm')" :visible.sync="createDepartmentFormVisible">
      <el-form :model="departmentForm" label-width="80px">
        <el-form-item label="部门名称">
          <el-input
            v-model="departmentForm.name"
            maxLength="8"
            autocomplete="off"
            placeholder="请输入部门名称，8 字以内"
          />
        </el-form-item>
        <el-form-item label="上级部门">
          <el-input
            v-model="themeName"
            disabled
          />
        </el-form-item>
        <el-form-item label="备注">
          <el-input type="textarea" v-model="departmentForm.memo" placeholder="请输入备注，50字以内"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-top: -25px">
        <el-button type="primary" @click="createDepartment">保存</el-button>
        <el-button @click="createDepartmentFormVisible = false">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑部门" width="480px" @close="close('editForm')" :visible.sync="editMemberFormVisible">
      <el-form :model="editForm" label-width="80px">
        <el-form-item label="部门名称">
          <el-input
            v-model="editForm.name"
            maxLength="8"
            autocomplete="off"
            placeholder="请输入部门名称，8 字以内"
          />
        </el-form-item>
        <el-form-item label="上级部门">
          <el-input
            v-model="themeName"
            disabled
          />
        </el-form-item>
        <el-form-item label="备注">
          <el-input type="textarea" v-model="editForm.memo" placeholder="请输入备注，50字以内"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-top: -25px">
        <el-button type="primary" @click="editDepartment">保存</el-button>
        <el-button @click="editMemberFormVisible = false">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="添加成员" width="480px" @close="close('memberForm')" :visible.sync="createMemberFormVisible">
      <el-form :model="memberForm" :rules="memberRules" ref="memberRef" label-width="52px">
        <el-form-item label="姓名" prop="name">
          <el-input
            v-model="memberForm.name"
            maxLength="30"
            autocomplete="off"
            placeholder="请输入成员名称"
          />
        </el-form-item>
        <el-form-item label="手机" prop="mobile">
          <el-input
            type="number"
            min="1"
            v-model="memberForm.mobile"
            placeholder="请输入手机号"
          />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="memberForm.sex">
            <el-radio label="0">男</el-radio>
            <el-radio label="1">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="部门" prop="deptIds">
          <el-select v-model="memberForm.deptIds" multiple placeholder="请选择" style="width: 100%;">
            <el-option
              v-for="item in sectionList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="职位">
          <el-input
            v-model="memberForm.position"
            maxLength="8"
            placeholder="请输入职位名称，8 字以内"
          />
        </el-form-item>
        <div class="switch">
          <p>设为管理员</p>
          <el-switch v-model="memberForm.delivery"></el-switch>
        </div>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-top: -25px">
        <el-button type="primary" @click="createMember">保存</el-button>
        <el-button @click="cancelAddMember">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑成员" width="480px" @close="close('editMembersForm')" :visible.sync="editMembers">
      <el-form :model="editMembersForm" :rules="memberEditRules" ref="memberEdit" label-width="52px">
        <el-form-item label="姓名" required>
          <el-input
            v-model="editMembersForm.name"
            disabled
          />
        </el-form-item>
        <el-form-item label="手机" required>
          <el-input
            v-model="editMembersForm.mobile"
            disabled
          />
        </el-form-item>
        <el-form-item label="性别" required>
          <el-radio-group v-model="editMembersForm.sex" disabled>
            <el-radio label="0">男</el-radio>
            <el-radio label="1">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="部门" prop="deptIdList">
          <el-select @change="handelChangeMember" v-model="editMembersForm.deptIdList" multiple placeholder="请选择" style="width: 100%;">
            <el-option
              v-for="item in sectionList"
              :key="item.id"
              :label="item.name"
              :value="item.id">{{item.name}}
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="职位">
          <el-input
            v-model="editMembersForm.position"
            maxLength="8"
            placeholder="请输入职位名称，8 字以内"
          />
        </el-form-item>
        <div class="switch">
          <p>设为管理员</p>
          <el-switch v-model="editMembersForm.delivery" @change="setAdministrator"></el-switch>
        </div>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-top: -25px">
        <el-button type="primary" @click="updateMember">保存</el-button>
        <el-button @click="cancelEditMember">取 消</el-button>
      </div>
    </el-dialog>

    <dl class="departments">
      <dt>
        <div class="fr" @click="createDepartmentFormVisible = true">新建部门</div>
        组织架构
      </dt>
      <dd
        class="authority-department-item"
        v-for="item in departments"
        :key="item.id"
      >
        <p @click="activeDepartmentId = item.id" :class="{active: activeDepartmentId === item.id}">{{item.name}}</p>
        <div class="child" v-for="itemChild in item.children" :key="itemChild.id" :class="{active: activeDepartmentId === itemChild.id}"
        @click.stop="activeDepartmentId = itemChild.id">
          {{itemChild.name}}
          <span class="edit" @click="editSection(itemChild)">编辑</span>

          <el-popconfirm
            title="确定删除该部门吗？"
            @onConfirm="deleteDepartment(itemChild.id)"
          >
            <div class="authority-delete-department" slot="reference" @click.stop="">删除</div>
          </el-popconfirm>
        </div>
      </dd>

    </dl>
    <div class="authority-department-body">
      <div class="title">
        <el-button
          type="primary"
          class="fr"
          style="padding: 10px 20px;"
          @click="createMemberFormVisible = true"
        >添加成员</el-button>
        部门人员
      </div>
      <el-table
        class="table-member"
        :data="members"
        border
      >
        <el-table-column
          prop="name"
          label="姓名"
        />
        <el-table-column
          prop="mobile"
          label="手机号码"
        />
        <el-table-column
          prop="sex"
          label="性别"
        >
          <template slot-scope="scope">
            {{NEWSEXNAME[scope.row.sex] || '-'}}
          </template>
        </el-table-column>
        <el-table-column
          prop="position"
          label="职位">
          <template slot-scope="scope">{{scope.row.position || '-'}}</template>
        </el-table-column>
        <!-- <el-table-column
          prop="status"
          label="状态"
        >
          <template slot-scope="scope">
            {{scope.row.status === '0' ? '正常' : '停用'}}
          </template>
        </el-table-column> -->
        <el-table-column
          prop="createdDate"
          label="创建时间"
        />
        <el-table-column
          fixed="right"
          label="操作"
          width="100">
          <template slot-scope="scope">
           <el-button type="text" size="small" @click="handelEditMembers(scope.row)">编辑</el-button>
            <!-- <el-popconfirm
              :title="`确定${scope.row.status === '0' ? '停用' : '恢复'}该会员账户吗？`"
              @onConfirm="changeMemberStatus(scope.row)"
            >
              <el-button
                type="text"
                slot="reference"
                size="small"
                :style="{color: scope.row.status === '0' ? '#f00' : '#5E0EFF'}"
              >{{scope.row.status === '0' ? '停用' : '恢复'}}</el-button>
            </el-popconfirm> -->
            <el-popconfirm
              title="确定删除该会员账户吗？"
              @onConfirm="changeMemberStatus(scope.row)"
            >
              <el-button
                type="text"
                slot="reference"
                size="small"
                style="color: #f00"
              >删除</el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import {
  createDepartment,
  createMember,
  changeMemberStatus,
  deleteDepartment,
  getByMainId,
  fetchDepartmentMember,
  fetchPositionNameList,
  sectionUpdate,
  countAdmin,
  getDetal
} from 'src/http/authority'
import { NEWSEXNAME } from '../../components/const'
import { mapState } from 'vuex'

export default {
  name: 'Department',
  data () {
    return {
      editMembers: false,
      editMembersForm: {

      },
      editForm: {
        id: void 0,
        name: void 0,
        priority: 1,
        memo: void 0,
        parentId: void 0,
      },
      parentId: void 0,
      sectionList: [],
      themeName: '',
      remark: '',
      departments: [],
      activeDepartmentId: null,
      members: [],
      createDepartmentFormVisible: false,
      departmentForm: {
        name: void 0,
        priority: 1,
        parentId: void 0,
        memo: void 0
      },
      createMemberFormVisible: false,
      editMemberFormVisible: false,
      memberForm: {deptIds: []},
      positionNameList: [],
      memberRules: {
        name: [
          { required: true, message: '请输入成员名称', trigger: 'blur' },
          { min: 1, max: 30, message: '长度在 30 个字符以内', trigger: 'blur' }
        ],
        mobile: [{ required: true, message: '请输入手机号', trigger: 'blur' }],
        deptIds: [{ required: true, message: '请选择部门', trigger: 'change' }],
        sex: [{ required: true, message: '请选择性别', trigger: 'change' }]
      },
      memberEditRules: {
        deptIdList: [{ required: true, message: '请选择部门', trigger: 'change' }]
      }
    }
  },
  computed: mapState(['merchant']),
  activated () {
    this.fetchDepartments()
    this.NEWSEXNAME = NEWSEXNAME
    // this.init()
  },
  watch: {
    activeDepartmentId (a, b) {
      if (a !== b) {
        this.fetchDepartmentMember()
      }
    },
    createMemberFormVisible (a, b) {
      if (a !== b && a === true) {
        this.fetchPositionNameList()
      }
    },
  },
  methods: {
    oneTheme (obj) {
      console.log(obj)
    },
    init () {
      let userinfo = JSON.parse(sessionStorage.getItem('userInfo'))
      let date = new Date(userinfo.expireFreshTime)
      let year = date.getFullYear()
      let month = date.getMonth() + 1
      let day = date.getDate()
      this.members = [{
        id: userinfo.memberId,
        memberId: userinfo.memberId,
        name: userinfo.name,
        mobile: userinfo.mobile,
        sex: '',
        position: '',
        status: '0',
        createdDate: `${year}-${month}-${day}`
      }]
    },
    cancelAddMember () {
      this.createMemberFormVisible = false
      this.$nextTick(() => {
        this.$refs.memberRef.clearValidate()
      })
    },
    cancelEditMember () {
      this.editMembers = false
      this.$nextTick(() => {
        this.$refs.memberEdit.clearValidate()
      })
    },
    // 更新成员
    updateMember () {
      this.$refs['memberEdit'].validate((valid) => {
        if (valid) {
          // console.log(this.editMembersForm);
          const { merchant, editMembersForm } = this
          const mainId = merchant.id
          this.editMembersForm.deptIds = this.editMembersForm.deptIdList
          this.editMembersForm.type = this.editMembersForm.delivery ? 'admin' : 'staff'

          // console.log(this.editMembersForm);
          createMember({ mainId, ...editMembersForm }).then((res) => {
            this.$message.success('更新员工成功')
            this.editMembers = false
            this.editMembersForm = {}
            this.fetchDepartmentMember()
          })
        }
      })
    },
    handelChangeMember () {
      this.$forceUpdate()
    },
    // 编辑成员
    handelEditMembers (rows) {
      let {id, memberId} = rows
      const mainId = this.merchant.id
      getDetal({id, memberId, mainId}).then(res => {
        this.editMembersForm = res.data
        this.editMembersForm.name = rows.name.replace('（管理员）', '')
        this.editMembersForm.delivery = Number(res.data.type) === 1
      })
      this.editMembers = true
    },
    setAdministrator () {
      this.$forceUpdate()
      const mainId = this.merchant.id
      console.log(this.editMembersForm.delivery)
      countAdmin(mainId).then(res => {
        if (res.data <= 1 && !this.editMembersForm.delivery) {
          this.$message('您是唯一的管理员，不可取消')
          this.$forceUpdate()
          this.editMembersForm.delivery = true
        }
      })
    },
    // 部门编辑
    editSection (obj) {
      console.log(obj)
      this.editMemberFormVisible = true
      this.editForm = {
        id: obj.id,
        name: obj.name,
        priority: 1,
        memo: obj.memo,
        parentId: this.parentId
      }
    },
    // 部门更新
    editDepartment () {
      sectionUpdate({...this.editForm}).then(res => {
        this.editMemberFormVisible = false
        this.editForm = {}
        this.$message.success('创建更新成功')
        this.fetchDepartments()
      })
    },
    fetchDepartments () {
      getByMainId(this.merchant.id)
        .then((res) => {
          // this.departments = res

          let reslut = res.filter(item => item.layer === 1)

          this.themeName = reslut[0].name
          this.parentId = reslut[0].id
          this.departmentForm.parentId = reslut[0].id

          // reslut.forEach(item => {
          //   item.child = []
          //   res.forEach(element => {
          //     if(item.id === element.parentId) {
          //       item.child.push(element)
          //     }
          //   })
          // })

          this.departments = this.toTree(res)
          // this.sectionList = this.departments[0].children
          this.sectionList = res

          if (!this.activeDepartmentId) {
            // const activeDepartmentId = ((res && res[0]) || {}).id
            const activeDepartmentId = this.parentId
            if (activeDepartmentId != null) {
              this.activeDepartmentId = activeDepartmentId
            }
          }
        })
    },
    toTree (data) {
      let cloneData = JSON.parse(JSON.stringify(data)) // 对源数据深度克隆
      let tree = cloneData.filter((father) => {
        // 循环所有项
        let branchArr = cloneData.filter((child) => {
          return Number(father.id) === Number(child.parentId) // 返回每一项的子级数组
        })
        if (branchArr.length > 0) {
          father.children = branchArr // 如果存在子级，则给父级添加一个children属性，并赋值
        }
        return Number(father.layer) === 1 // 返回第一层
      })
      return tree // 返回树形数据
    },
    fetchDepartmentMember () {
      const { activeDepartmentId } = this
      fetchDepartmentMember(activeDepartmentId)
        .then((res) => {
          res.forEach(item => {
            if (Number(item.type) === 1) {
              item.name = item.name + '（管理员）'
            }
          })
          this.members = res
        })
    },
    deleteDepartment (departmentId) {
      deleteDepartment(departmentId).then((res) => {
        if (res.code === '0') {
          this.$message.success('删除部门成功')
          const index = this.departments.findIndex(({ id }) => id === departmentId)
          this.departments.splice(index, 1)
          this.fetchDepartments()
        }
      })
    },
    createDepartment () {
      const { merchant, departmentForm } = this
      const mainId = merchant.id
      createDepartment({ mainId, ...departmentForm }).then((res) => {
        this.createDepartmentFormVisible = false
        this.departmentForm = {}
        this.$message.success('创建部门成功')
        this.fetchDepartments()
      })
    },
    fetchPositionNameList () {
      const { activeDepartmentId } = this
      fetchPositionNameList(activeDepartmentId).then((res) => {
        if (Array.isArray(res)) {
          this.positionNameList = res
        }
      })
    },
    createMember () {
      this.$refs['memberRef'].validate((valid) => {
        if (valid) {
          const { merchant, activeDepartmentId: deptId, memberForm } = this
          const mainId = merchant.id

          memberForm.delivery ? memberForm.type = 'admin' : memberForm.type = 'staff'

          createMember({ mainId, ...memberForm }).then((res) => {
            this.$message.success('创建员工成功')
            this.createMemberFormVisible = false
            this.memberForm = {}
            this.fetchDepartmentMember()
          })
        }
      })
    },
    close (form) {
      this[form] = {}
    },
    changeMemberStatus ({ memberId, status, }) {
      changeMemberStatus({
        mainId: this.merchant.id,
        deptId: this.activeDepartmentId,
        memberId,
        status: status === '0' ? '1' : '0',
        logicDelete: true
      }).then((res) => {
        // this.$message.success(status === '0' ? '会员账户已停用' : '会员账户已恢复')
        this.$message.success('删除成功')
        this.fetchDepartmentMember()
      })
    }
  }
}
</script>

<style lang="scss">
  .authority-department-container {
    display: flex;

    .departments {
      width: 280px;
      margin-right: 24px;
      background-color: white;
      border-radius: 3px;
      /*border:1px solid rgba(227,226,226,1);*/
      > {
        dt {
          height: 60px;
          line-height: 60px;
          padding: 0 20px;
          font-weight: 600;

          > .fr {
            font-weight: normal;
            font-size: 14px;
            color: #5E0EFF;
            cursor: pointer;
          }
        }

        .authority-department-item {
          line-height: 46px;
          padding: 0 20px;
          font-size: 15px;
          p {
            padding-left: 10px;
          }
          .active {
            color: white;
            background-color: #5E0EFF;
          }
          .child {
            padding-left: 30px;
            position: relative;
            padding-right: 10px;
            .edit {
              position: absolute;
              right: 45px;
              font-size: 14px;
              cursor: pointer;
              display: none;
            }
            &.active {
              color: white;
              background-color: #5E0EFF;
            }

            &:hover {
              // background-color: #F8F8F9;

              .authority-delete-department {
                display: block;
              }

              .edit {
                display: inline-block;
              }
            }
          }
          .authority-delete-department {
            display: none;
            float: right;
            font-size: 14px;
            cursor: pointer;
          }
        }
      }
    }

    .authority-department-body {
      flex: 1 1 auto;
      background-color: white;
    }

    .switch {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
  }

  .authority-department-body {
    border-radius: 3px;
    /*border:1px solid rgba(227,226,226,1);*/
    .title {
      line-height: 60px;
      padding: 0 20px 0 0;
      font-weight: bold;

      > .fr {
        margin-top: 12px;
      }
    }

    .table-member {
      width: auto;
      max-width: inherit;
      margin-right: -1px;
      /*border-bottom-left-radius: 3px;*/
      /*border-bottom-right-radius: 3px;*/
    }
  }
</style>

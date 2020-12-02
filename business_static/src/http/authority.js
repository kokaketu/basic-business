import { http } from './index'

/**
 * 查询主体下的部门列表
 * @param mainId {number} 主体 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function getByMainId (mainId) {
  return http.post('/asset-admin-web/dept/getByMainId', { mainId })
    .then((res) => {
      return res.data
    })
}

/**
 * 查询部门下的会员列表
 * @param deptId {number} 部门 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchDepartmentMember (deptId) {
  return http.post('/asset-admin-web/dept/members', { deptId })
    .then((res) => {
      return res.data
    })
}

/**
 * 获取当前主体下的用户权限信息
 */
export function userPermission ({mainId}) {
  return http.post(`/asset-admin-web/permission/userPermission?mainId=${mainId}`)
    .then((res) => {
      return res
    })
}

/**
 * 创建部门
 * @param mainId {number} 主体 id
 * @param name {string} 部门名称
 * @param priority {number} 排序序号
 * @returns {Promise<AxiosResponse<any>>}
 */
export function createDepartment ({
  mainId,
  name,
  priority = 1,
  parentId,
  memo
}) {
  return http.post('/asset-admin-web/dept/save', {
    mainId,
    name,
    priority: 1,
    parentId,
    memo
  }).then((res) => {
    if (res.code === '0') {
      return true
    }
    return Promise.reject(res)
  })
}

/**
 * 编辑部门
 */
export function sectionUpdate ({
  id,
  name,
  priority,
  memo,
  parentId
}) {
  return http.post('/asset-admin-web/dept/update', {
    id,
    name,
    priority,
    memo,
    parentId
  }).then((res) => {
    if (res.code === '0') {
      return true
    }
    return Promise.reject(res)
  })
}

/**
 * 获取部门会员信息详情
 */
export function getDetal ({
  id,
  memberId,
  mainId
}) {
  return http.post('/asset-admin-web/member/getDetal', {
    id,
    memberId,
    mainId
  }).then(res => res)
}

/**
 * 删除 部门
 * @param deptId {number} 部门 id
 * @returns {Promise<AxiosResponse<any>>}
 */
export function deleteDepartment (deptId) {
  return http.post('/asset-admin-web/dept/delete', { deptId })
}

/**
 * 获取当前主体下的管理员数，用于判断是否取消管理员的身份；
 * 如果返回为1，则已经是管理员的身份提示他不能取消管理员身份
 */
export function countAdmin (mainId) {
  return http.post(`/asset-admin-web/permission/countAdmin?mainId=${mainId}`)
    .then((res) => {
      return res
    })
}

/**
 * 查询部门下的职位列表
 * @param deptId {number} 部门 id
 * @returns {Promise<AxiosResponse<any>>}
 */
export function fetchPositionNameList (deptId) {
  return http.post('/asset-admin-web/dept/positionNameList', { deptId })
    .then((res) => {
      return res.data
    })
}

/**
 * 创建员工
 * @param mainId {number}
 * @param name {string} 名称
 * @param sex {string} 性别
 * @param mobile {number} 手机号
 * @param position {string} 职位
 * @param deptIds {number} 部门 id
 * @returns {Promise<AxiosResponse<any>>}
 */
export function createMember ({
  id,
  mainId,
  name,
  sex,
  mobile,
  position,
  deptIds,
  type
}) {
  return http.post('/asset-admin-web/member/saveByDept', {
    id,
    mainId,
    name,
    sex,
    mobile,
    position,
    deptIds,
    type
  }).then((res) => {
    if (res.code === '0') {
      return true
    }
    return Promise.reject(res)
  })
}

export function changeMemberStatus ({
  mainId,
  deptId,
  memberId,
  status,
  logicDelete
}) {
  return http.post('/asset-admin-web/member/update/status', {
    mainId,
    deptId,
    memberId,
    status,
    logicDelete
  }).then((res) => {
    if (res.code === '0') {
      return true
    }
    return Promise.reject(res)
  })
}

/**
 * 查询 主体 下的 权限列表
 * @param mainId {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchListByMainId (mainId) {
  return http.post('/asset-admin-web/permission/listByMainId', mainId)
    .then(({ data }) => data)
}

export function permissionSave ({
  id,
  deptId,
  deptName,
  menuId,
  menuName,
  permission
}) {
  return http.post('/asset-admin-web/permission/save', {
    id,
    deptId,
    deptName,
    menuId,
    menuName,
    permission
  }).then(({ data }) => data)
}

/**
 * 删除 权限
 * @param id {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function deletePermission (id) {
  return http.post(`/asset-admin-web/permission/delete/${id}`)
    .then(({ data }) => data)
}

/**
 * sso 登录
 * @param platform {string} web 固定值 CAIC
 * @param loginType {number} 登陆类型（用户登陆类型1:手机号+验证码登陆；2：手机号+密码登陆；3.微信扫码；4.邮箱）
 * @param mobile {string}
 * @param code {string}
 * @param msgSymbol {string} 验证码 固定值： 101
 * @return {Promise<AxiosResponse<any>>}
 */
export function login ({
  platform = 'CAIC',
  loginType = 1,
  mobile,
  code,
  msgSymbol = '101',
}) {
  return http.post('/sso-server/login', {
    platform,
    loginType,
    mobile,
    code,
    msgSymbol,
  }).then(res => res)
}

export function loginCheck () {
  return http.post('/sso-server/check').then(data => data || {})
}

/**
 * 退出登录
 */
export function logout () {
  return http.post('/sso-server/logout').then(res => {
    return res
  })
}

/**
 * 获取当前主体下的用户所属部门的菜单列表
 * @param {*} params
 */
export function listMenu ({ ssoMember, mainId }) {
  return http.post(`/asset-admin-web/permission/listMenu?mainId=${mainId}`).then(res => {
    return res
  })
}

/**
 * 查询会员所在的主体列表
 * @param {*} memberId
 */
export function memberMerchantList (params) {
  return http.post('/asset-admin-web/member/memberMerchantList', params).then(res => {
    return res
  })
}

/**
 * 访问鉴权
 * @param {*} params
 */
export function authentication (params) {
  return http.post('/asset-admin-web/member/authentication', params).then(res => {
    return res
  })
}

/**
 * 操作日志
 * @param {*} params
 */
export function actionLog (params) {
  return http.post('/asset-admin-web/actionLog/query', params).then(res => {
    return res.data
  })
}

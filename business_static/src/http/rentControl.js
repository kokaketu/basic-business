import { http } from './index'
/**
 * 查询楼层平面图列表
 */
export function queryData (params) {
  return http.post('/asset-basedata-web/base/floorStatement/queryData', params).then((res) => {
    return res.data
  })
}
/** queryArrears
 * 查询楼层平面图详情
 */
export function floorStatistical (params) {
  return http.post('/asset-basedata-web/bsRoom/floorStatistical', params).then((res) => {
    return res.data
  })
}

/**
 * 楼层平面图--铺位信息详情
 */
export function queryStoreDetail (params) {
  return http.post('/asset-basedata-web/bsRoom/queryStoreDetail', params).then((res) => {
    return res.data
  })
}

/**
 * 租户管理-初期化数据
 */
export function initCompany () {
  return http.post('/asset-merchants-web/merchants/company/initCompany').then(res => {
    return res.data
  })
}

/**
 * 租户管理-查询租户列表-分页
 */
export function getPageCompany (params) {
  return http.post('/asset-merchants-web/merchants/company/getPageCompanyList', params).then(res => {
    return res.data
  })
}

/**
 * 客户管理-查询租户列表-结果不分页
 */
export function getCompanyNameList (params) {
  return http.post('/asset-merchants-web/merchants/company/getCompanyList', params).then(res => {
    return res
  })
}

/**
 * 租户管理-查询租户-详情
 */
export function getCompany (params) {
  return http.post('/asset-merchants-web/merchants/company/getCompany', params).then(res => {
    return res.data
  })
}

/**
 * 租户管理-查询租户-详情
 */
export function getCompanyById (params) {
  return http.post('/asset-merchants-web/merchants/company/getCompanyById', params).then(res => {
    return res.data
  })
}
/**
 * 租户管理-查询租户-删除
 */
export function delCompany (params) {
  return http.post('/asset-merchants-web/merchants/company/delCompany', params).then(res => {
    return res
  })
}
/**
 * 租户管理-查询租户-租户管理-更新租户
 */
export function updCompany (params) {
  return http.post('/asset-merchants-web/merchants/company/updCompany', params).then(res => {
    return res
  })
}
/**
 * 租户管理-查询租户-新增
 */
export function addCompany (params) {
  return http.post('/asset-merchants-web/merchants/company/addCompany', params).then(res => {
    return res
  })
}

/**
 * 客户管理-客户列表
 */
export function getCustomerList (params) {
  return http.post('/asset-merchants-web/client/queryList', params).then(res => {
    return res
  })
}

/**
 * 客户管理-新增客户
 */
export function addCustomer (params) {
  return http.post('/asset-merchants-web/client/add', params).then(res => {
    return res
  })
}

/**
 * 客户管理-修改客户
 */
export function updateCustomer (params) {
  return http.post('/asset-merchants-web/client/update', params).then(res => {
    return res
  })
}

/**
 * 客户管理-删除客户
 */
export function deleteCustomer (params) {
  return http.post('/asset-merchants-web/client/delete', params).then(res => {
    return res
  })
}

/**
 * 客户管理-查询客户详情
 */
export function getDetail (params) {
  return http.post('/asset-merchants-web/client/getDetail', params).then(res => {
    return res
  })
}
/**
 * 客户详情--新增跟进记录
 * @param {*} params
 */
export function clientFollowUpAdd (params) {
  return http.post('/asset-merchants-web/client/clientFollowUpAdd', params).then(res => {
    return res
  })
}
/**
 * 客户详情--删除跟进记录
 * @param {*} params
 */
export function clientFollowUpDelete (params) {
  return http.post('/asset-merchants-web/client/clientFollowUpDelete', params).then(res => {
    return res
  })
}
/**
 * 招商计划列表
 * @param {*} params
 */
export function getAttractList (params) {
  return http.post('/asset-merchants-web/ibAttract/getAttractList', params).then(res => {
    return res
  })
}

/**
 * 新增招商计划
 * @param {*} params
 */
export function addAttractList (params) {
  return http.post('/asset-merchants-web/ibAttract/addAttractList', params).then(res => {
    return res
  })
}

/**
 * 招商计划 查询主体下组织架构中的人员
 * @param {*} params
 */
export function queryMemberList (mainId) {
  return http.get('/asset-merchants-web/ibAttract/queryMemberList?mainId=' + mainId).then(res => {
    return res
  })
}
/**
 * 更新招商计划
 * @param {*} params
 */
export function updAttract (params) {
  return http.post('/asset-merchants-web/ibAttract/updAttract', params).then(res => {
    return res
  })
}
/**
 * 查看招商情况详情
 * @param {*} params
 */
export function queryById (params) {
  return http.post('/asset-merchants-web/ibAttract/queryById', params).then(res => {
    return res
  })
}

/**
 * 删除招商计划
 * @param {*} params
 */
export function delAttract (params) {
  return http.post('/asset-merchants-web/ibAttract/delAttract', params).then(res => {
    return res
  })
}

/**
 * 删除招商计划跟进信息
 * @param {*} params
 */
export function delAttractMonitor (params) {
  return http.post('/asset-merchants-web/ibAttract/delAttractMonitor', params).then(res => {
    return res
  })
}

/**
 * 更新招商计划跟进信息
 * @param {*} params
 */
export function updAttractMonitor (params) {
  return http.post('/asset-merchants-web/ibAttract/updAttractMonitor', params).then(res => {
    return res
  })
}

/**
 * 新增招商计划跟进信息
 * @param {*} params
 */
export function addAttractMonitor (params) {
  return http.post('/asset-merchants-web/ibAttract/addAttractMonitor', params).then(res => {
    return res
  })
}

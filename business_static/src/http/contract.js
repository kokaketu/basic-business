import { http } from './index'

/**
 * 租户管理-筛选条件用租户名称列表 --- 列表
 * @param mainId {number} 主体 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function getRentNameList (params) {
  return http.post('/asset-merchants-web/merchants/company/getCompanyNameList', params).then((res) => {
    return res.data
  })
}
/**
 * 租户管理-合同租户查询列表 --- 详情
 * @param mainId {number} 主体 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function getContCompanyList (params) {
  return http.post('/asset-merchants-web/merchants/company/getContCompanyList', params).then((res) => {
    return res.data
  })
}

/**
 * 获取合同列表
 * @return {Promise<AxiosResponse<any>>}
 */
export function getList (params) {
  return http.post('/asset-contract-web/contract/search', params).then((res) => {
    return res.data
  })
}

/**
 * 获取租赁单元枚举
 * @return {Promise<AxiosResponse<any>>}
 */
export function getRentUnitList (params) {
  return http.post('/asset-basedata-web/bsRoom/queryList', params).then((res) => {
    return res.data
  })
}
/**
 * 款项设置-通用款项下拉框列表
 * @return {Promise<AxiosResponse<any>>}
 */
export function getSubjectDropDown (params) {
  return http.post('/asset-finance-web/finance/subject/getSubjectDropDown', params).then((res) => {
    return res.data
  })
}
/**
 *
 * 获取合同号
 */
export function getContNo (mainId) {
  return http.get('/asset-contract-web/contract/getContNo?mainId=' + mainId).then(res => {
    return res
  })
}
/**
 * 创建保存合同
 * @return {Promise<AxiosResponse<any>>}
 */
export function createContract (params) {
  return http.post('/asset-contract-web/contract/create', params).then((res) => {
    return res
  })
}
/**
 * 编辑合同
 * @return {Promise<AxiosResponse<any>>}
 */
export function editContract (params) {
  return http.post('/asset-contract-web/contract/update', params).then((res) => {
    return res
  })
}

/**
 * 台账-获取
 */
export function receivable (id) {
  return http.get('/asset-contract-web/receivable/' + id).then((res) => {
    return res
  })
}

/**
 * 台账-生成台账
 */
export function calculateAndSave (id) {
  return http.post('/asset-contract-web/receivable/calculateAndSave/' + id).then((res) => {
    return res
  })
}

/**
 * 台账-重新生成台账
 */
export function recalculate (id) {
  return http.post('/asset-contract-web/receivable/recalculate/' + id).then((res) => {
    return res
  })
}

/**
 * 合同-详情
 */
export function detail (id) {
  return http.get('/asset-contract-web/contract/detail/' + id).then((res) => {
    return res
  })
}

/**
 * 合同-刷新应收金额
 */
export function refreshAmount (id) {
  return http.post('/asset-contract-web/receivable/refreshAmount?id=' + id).then((res) => {
    return res.data
  })
}

/**
 * 合同作废
 * @param id
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function invalid (id) {
  return http.post(`/asset-contract-web/contract/${id}/invalid`).then((res) => {
    return res
  })
}

/**
 * 合同恢复作废
 * @param id
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function reinstate (id) {
  return http.post(`/asset-contract-web/contract/${id}/reinstate`).then((res) => {
    return res
  })
}

/**
 * 合同解约
 * @param id
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function termination (params) {
  return http.post(`/asset-contract-web/contract/termination`, params).then((res) => {
    return res
  })
}

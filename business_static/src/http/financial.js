import { http } from './index'

export function fetchDepositList (params) {
  return http.post('/asset-finance-web/finance/deposit/getList', params).then((res) => res)
}

/**
 * 保证金退款，保证金详情
 * @param id {number}
 * @param receivedId {number}
 * @param assetId {number}
 * @param receiveDate {string} 退款日期
 * @param paymentMethod {number} 支付方式:1.银行转账 2.现金 3.支付宝 4.微信 99.其它
 * @param type {1 | 2} 1: 保证金退款, 2: 保证金详情
 * @return {Promise<AxiosResponse<any>>}
 */
export function depositRefund ({
  id,
  receivedId,
  assetId,
  type,
  receiveDate,
  paymentMethod,
}) {
  return http.post('/asset-finance-service/finance/deposit/refund', {
    id,
    receivedId,
    assetID: assetId,
    type,
    receiveDate,
    paymentMethod,
  })
    .then((res) => {
      return res.data
    })
}

export function queryArrears ({
  subjectCode,
  mainId,
  assetId,
  assetName,
  companyId,
  minArrearsDate,
  maxArrearsDate,
  contNo,
  unitId,
  orderBy,
  page,
  limit = 10
}) {
  return http.post('/asset-finance-web/finance/receivable/queryArrears', {
    subjectCode,
    mainId,
    assetId,
    assetName,
    companyId,
    minArrearsDate,
    maxArrearsDate,
    contNo,
    unitId,
    orderBy,
    page,
    limit
  }).then((res) => res.data)
}

/**
 * 付款人查询
 * @param mainId {number} 主体 id
 * @param payerName {string?} 付款人名称
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryPayerName ({mainId, payerName}) {
  return http.post('/asset-finance-web/finance/receivable/queryPayerName', {
    mainId,
    payerName
  }).then((res) => res.data)
}

/**
 * 款项名称查询
 * @param mainId {number} 主体 id
 * @param keywords {string?} 款项名称
 * @return {Promise<AxiosResponse<any>>}
 */
export function querySubjectName ({mainId, keywords}) {
  return http.post('/asset-finance-web/finance/subject/querySubjectName', {
    mainId,
    keywords
  }).then((res) => res.data)
}

/**
 * 款项名称查询 不返回禁用的款项
 * @param mainId {number} 主体 id
 * @param keywords {string?} 款项名称
 * @return {Promise<AxiosResponse<any>>}
 */
export function getSubjectDropDown ({mainId, keywords}) {
  return http.post('/asset-finance-web/finance/subject/getSubjectDropDown', {
    mainId,
    keywords
  }).then((res) => res.data)
}

/**
 * 款项列表查询
 * @param pageNum {number}
 * @param pageSize {string?}
 * @return {Promise<AxiosResponse<any>>}
 */
export function getSubjectList (params) {
  return http.post('/asset-finance-web/finance/subject/getSubjectList', params).then((res) => res.data)
}

export function getReceivableList (params) {
  return http.post('/asset-finance-web/finance/receivable/getReceivableList', params).then((res) => res.data || {})
}

/**
 * 实收管理-删除实收
 * @param receivedId {number} 实收 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function deleteReceived (receivedId) {
  return http.post('/asset-finance-web/finance/received/delReceived', {
    receivedId,
  })
}

/**
 * 获取实付款项列表
 * @param mainId {number} 主体ID
 * @param assetName {string} 项目名
 * @param subjectName {string} 款项名
 * @param payeeName {string} 收款方
 * @param beginDate {string} 支付开始日期
 * @param endDate {string} 支付结束日期
 * @param page {number}
 * @param limit {number}
 * @return {Promise<AxiosResponse<any || Object>>}
 */
export function realPayList (params) {
  return http.post('/asset-finance-web/finance/realpay/list', params).then((res) => res.data || {})
}

/**
 * 删除实付款项
 * @param id {number} 实付 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function deleteRealPay (id) {
  return http.post(`/asset-finance-web/finance/realpay/delete/${id}`)
    .then((res) => res)
}

/**
 * 实收管理-实收列表查询
 * @param mainId {number}主体 id
 * @param assetId {number} 资产 id
 * @param payerName {string} 付款方名称
 * @param receivedNo {string} 实收流水号
 * @param receivableNo {string} 应收流水号
 * @param startDate {string} 开始日期
 * @param endDate {string} 结束日期
 * @param subjectId {number} 科目ID
 * @param subjectCode {string} 科目编码
 * @param pageNum {number}
 * @param pageSize {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function getReceivedList (params) {
  return http.post('/asset-finance-web/finance/received/getReceivedList', params).then(({data}) => data || {})
}

/**
 * 新增/修改实付款项
 * @param data {Object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function realPaySave (data) {
  return http.post('/asset-finance-web/finance/realpay/save', data)
    .then(({ data }) => data)
}

/**
 * 获取实付款项详情
 * @param id {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchRealPayDetail (id) {
  return http.get(`/asset-finance-web/finance/realpay/get/${id}`)
    .then(({ data }) => data)
}

/**
 * 应收管理-新增/更新应收 新增没有 id
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function addAndReceivable (data) {
  return http.post('/asset-finance-web/finance/receivable/addReceivable', data)
    .then(({ data }) => data)
}

/**
 * 应收管理-更新应收
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function updateReceivable (data) {
  return http.post('/asset-finance-web/finance/receivable/updReceivable', data)
    .then((res) => res)
}

/**
 * 应收管理-删除应收
 * @param receivableId {number} 应收 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function deleteReceivable (receivableId) {
  return http.post('/asset-finance-web/finance/receivable/delReceivable', {
    receivableId
  })
    .then((res) => res)
}

/**
 * 应收管理-坏账
 * @param receivableId {number} 应收 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function badReceivable (receivableId) {
  return http.post('/asset-finance-web/finance/receivable/badReceivable', {
    receivableId
  })
    .then((res) => res)
}

export function getReceivable (receivableId) {
  return http.post('/asset-finance-web/finance/receivable/getReceivable', {
    receivableId,
  }).then(({ data }) => data)
}

/**
 * 实收管理-获取实收
 * @param receivedId {number} 实收 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function getReceived (receivedId) {
  return http.post('/asset-finance-web/finance/received/getReceived', {
    receivedId,
  }).then(({ data }) => data)
}

/**
 * 实收管理-新增实收
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function addReceived (data) {
  return http.post('/asset-finance-web/finance/received/addReceived', data)
}

/**
 * 实收管理-更新实收
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function updateReceived (data) {
  return http.post('/asset-finance-web/finance/received/updReceived', data)
}


/**
 * 账单管理-获取打印账单
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function getPrintReceivable (data) {
  return http.post('/asset-finance-web/finance/receivable/getPrint', data)
}

/**
 * 账单管理-获取打印账单明细
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function getPrintDetailReceivable (data) {
  return http.post('/asset-finance-web/finance/receivable/getPrintDetail', data)
}

/**
 * 账单管理-记录
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function logPrint (data) {
  return http.post('/asset-finance-web/finance/receivable/logPrint', data)
}

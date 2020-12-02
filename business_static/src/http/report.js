import { http } from './index'

/**
 * 收缴率分析
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function collectionRateAnalysis (params) {
  return http.post('/asset-analysis-web/collectionRate/collectionRateAnalysis', params)
}

/**
 * 应收台账报表
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function receivableAnalysis (params) {
  return http.post('/asset-analysis-web/receivable/receivableAnalysis', params)
}

/**
 * 欠费分析
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function arrearageAnalysis (params) {
  return http.post('/asset-analysis-web/arrearage/arrearageAnalysis', params)
}

/**
 * 销售额报表
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function salesAnalysis (params) {
  return http.post('/asset-analysis-web/salesAnalysis/report', params)
}

/**
 * 客流报表
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function passFlowAnalysis (params) {
  return http.post('/asset-analysis-web/passFlow/analysis', params)
}

/**
 * 出租率报表-折线图
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function rentalRateReportFormChart (params) {
  return http.post('/asset-analysis-web/rentalRate/rentalRateReportFormChart', params)
}

/**
 * 出租率报表-表图数据
 * @param data {object}
 * @return {Promise<AxiosResponse<any>>}
 */
export function rentalRateReportForm (params) {
  return http.post('/asset-analysis-web/rentalRate/rentalRateReportForm', params)
}
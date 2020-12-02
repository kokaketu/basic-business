/**
 * 首页
 */
import { http } from './index'

/**
 * 获取客户数据
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getTodoClient (params) {
  return http.post('/asset-analysis-web/analysis/todo/getTodoClient', params).then(res => {
    return res.data
  })
}

/**
 * 获取招商计划数据
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getTodoAttract (params) {
  return http.post('/asset-analysis-web/analysis/todo/getTodoAttract', params).then(res => {
    return res.data
  })
}

/**
 * 获取欠费数据
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getTodoArrears (params) {
  return http.post('/asset-analysis-web/analysis/todo/getTodoArrears', params).then(res => {
    return res.data
  })
}

/**
 * 获取销售额数据
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getTodoSales (params) {
  return http.post('/asset-analysis-web/analysis/todo/getTodoSales', params).then(res => {
    return res.data
  })
}

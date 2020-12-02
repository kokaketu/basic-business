/* 预算科目设置 方法 */
import { http } from './index'

/**
 * 获取预算科目列表
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getBudgetSubjectList (params) {
  return http.post('/asset-budget-web/budgetSubject/getBudgetSubjectList', params).then((res) => {
    return res.data
  })
}

/**
 * 新增预算科目
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function addBudgetSubject (params) {
  return http.post('/asset-budget-web/budgetSubject/addBudgetSubject', params).then((res) => {
    return res
  })
}

/**
 * 删除预算科目
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function deleteBudgetSubject (params) {
  return http.post('/asset-budget-web/budgetSubject/deleteBudgetSubject', params).then((res) => {
    return res
  })
}

/**
 * 修改预算科目
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function updateBudgetSubject (params) {
  return http.post('/asset-budget-web/budgetSubject/updateBudgetSubject', params).then((res) => {
    return res
  })
}

import { http } from './index'
/**
 * 中介新增
 */
export function addContacts (params) {
  return http.post('/asset-operation-web/bsContacts/addContacts', params).then((res) => {
    return res
  })
}
/**
 * 中介编辑
 */
export function updContacts (params) {
  return http.post('/asset-operation-web/bsContacts/updContacts', params).then((res) => {
    return res
  })
}
/**
 * 中介删除
 */
export function delContacts (params) {
  return http.post('/asset-operation-web/bsContacts/delContacts', params).then((res) => {
    return res
  })
}
/**
 * 中介管理列表
 */
export function queryContactsPage (params) {
  return http.post('/asset-operation-web/bsContacts/queryContactsPage', params).then((res) => {
    return res.data
  })
}
/**
 * 经纪人列表
 */
export function queryContactsDetail (params) {
  return http.post('/asset-operation-web/bsContacts/queryContactsDetail', params).then((res) => {
    return res.data
  })
}

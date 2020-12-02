import { http } from './index'

/**
 * 发布商机
 */
export function getPushBusinessList (params) {
  return http.post('/asset-admin-web/pushBusiness/listPage', params).then(res => {
    return res
  })
}
/**
 * 创建商机
 */
export function businessCreate (params) {
  return http.post('/asset-admin-web/pushBusiness/save', params).then(res => {
    return res
  })
}

/**
 * 提交审核
 */
export function submitReview (id) {
  return http.get('/asset-admin-web/pushBusiness/push2Yl?id=' + id).then(res => {
    return res
  })
}
/**
 * 获取已上架铺位列表
 */
export function getPutAwayList (params) {
  return http.post('/asset-admin-web/pushShelves/page', params).then(res => {
    return res.data
  })
}

/**
 * 获取可以上架铺位列表
 */
export function getYepPutAwayList (params) {
  return http.post('/asset-admin-web/pushShelves/queryRentalUnit', params).then(res => {
    return res.data
  })
}

/**
 * 铺位确认上架
 */
export function storeDoConfirm (params) {
  return http.post('/asset-admin-web/pushShelves/putShelvesRental', params).then(res => {
    return res.data
  })
}

/**
 * 铺位下架
 */
export function offShelfRental (params) {
  return http.get(`/asset-admin-web/pushShelves/offShelfRental?ids=` + params).then(res => {
    return res.data
  })
}

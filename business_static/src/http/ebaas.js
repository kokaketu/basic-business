import { http } from './index'

/**
 *
 * 判断是否为Ebaas用户
 */
export function isEbaasUser () {
  return http.get('/asset-ebaas-web/ebaas/isEbaasUser').then(res => {
    return res.data
  })
}

/**
 * 获取ebaas 会员token
 */
export function getEbaasToken (params) {
  return http.post('/asset-ebaas-web/ebaas/getEbaasToken', params).then(res => {
    return res.data
  })
}

/**
 * 获取上链数据
 */
export function getChainData (params) {
  return http.post('/asset-ebaas-web/ebaas/getChainData', params).then(res => {
    return res.data
  })
}

/**
 * 更新数据上链状态
 */
export function updateChain (params) {
  return http.post('/asset-ebaas-web/ebaas/updateChain', params).then(res => {
    return res
  })
}
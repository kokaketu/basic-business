import { http } from './index'

/**
 * 获取发布商机列表
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getBusinessList (params) {
  return http.post('/asset-admin-web/pushRoom/businessQuery', params).then(res => {
    return res.data
  })
}

/**
 * 获取项目列表
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getProjectList (params) {
  return http.post('/asset-admin-web/pushRoom/businessAssetList', params).then(res => {
    return res.data
  })
}

/**
 * 选择项目后，查询项目和楼栋信息
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getMessage (params) {
  return http.post('/asset-admin-web/pushRoom/businessAssetDetail', params).then(res => {
    return res.data
  })
}

/**
 * 新增一键招商
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function handelAddBusiness (params) {
  return http.post('/asset-admin-web/pushRoom/businessRoomAddOrUp', params).then(res => {
    return res
  })
}

/**
 * 获取发布商机详情
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getBusinessDetail (params) {
  return http.post('/asset-admin-web/pushRoom/businessRoomDetail', params).then(res => {
    return res
  })
}

/**
 * 查询发布商机列表
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getBusinessCreateList (params) {
  return http.post('/asset-admin-web/pushRoom/getRoomAttractList', params).then(res => {
    return res.data
  })
}

/**
 * 批量新增
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function addBusiness (params) {
  return http.post('/asset-admin-web/pushRoom/roomTradeBatchAdd', params).then(res => {
    return res
  })
}

/**
 * 更新数据
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function updateBusiness (params) {
  return http.post('/asset-admin-web/pushRoom/roomTradeUpdate', params).then(res => {
    return res
  })
}

/**
 * 发布到小程序
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function putaway (params) {
  return http.post('/asset-admin-web/pushRoom/roomPush', params).then(res => {
    return res
  })
}

/**
 * 下架
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function soldout (params) {
  return http.post('/asset-admin-web/pushRoom/roomOffShelf', params).then(res => {
    return res
  })
}

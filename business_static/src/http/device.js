import { http } from './index'

/**
 * 查询后台设备台账列表
 * @param params
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryList (params) {
  return http.post('/asset-basedata-web/bsDevice/queryList', params).then((res) => {
    return res.data
  })
}

/**
 * 保存修改设备
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function saveDevice (params) {
  return http.post('/asset-basedata-web/bsDevice/save', params).then((res) => {
    return res
  })
}

/**
 * 查询设备明细
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function queryDetailById (params) {
  return http.post('/asset-basedata-web/bsDevice/queryDetailById', params).then((res) => {
    return res.data
  })
}

/**
 * 删除设备
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function deleteById (params) {
  return http.post('/asset-basedata-web/bsDevice/deleteById', params).then((res) => {
    return res
  })
}

/**
 * 获取序列号
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function getSequence (params) {
  return http.post('/asset-basedata-web/bsDevice/getSequence', params).then((res) => {
    return res
  })
}

/**
 * 导出设备
 * @param params
 * @returns {Promise<AxiosResponse<T> | never>}
 */
export function exportDeviceExcel (params) {
  return http.post('/asset-basedata-web/bsDevice/export', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}

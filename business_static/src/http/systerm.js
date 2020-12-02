import { http } from './index'

/**
 * 款项设置-查询款项列表
 */
export function initSubject () {
  return http.post('/asset-finance-web/finance/subject/initSubject').then((res) => {
    return res.data
  })
}

/**
 * 款项设置-查询款项列表
 */
export function getSubjectList (params) {
  return http.post('/asset-finance-web/finance/subject/getSubjectList', params).then((res) => {
    return res.data
  })
}

/**
 * 款项设置-删除款项
 */
export function delSubject (params) {
  return http.post('/asset-finance-web/finance/subject/delSubject', params).then((res) => {
    return res
  })
}
/**
 * 款项设置-废弃款项
 */
export function disSubject (params) {
  return http.post('/asset-finance-web/finance/subject/disSubject', params).then((res) => {
    return res
  })
}
/**
 * 款项设置-详情
 */
export function getSubjectById (params) {
  return http.post('/asset-finance-web/finance/subject/getSubjectById', params).then(res => {
    return res
  })
}
/**
 * 款项设置-新增
 */
export function addSubject (params) {
  return http.post('/asset-finance-web/finance/subject/addSubject', params).then(res => {
    return res
  })
}
/**
 * 款项设置-更新
 */
export function updSubject (params) {
  return http.post('/asset-finance-web/finance/subject/updSubject', params).then(res => {
    return res
  })
}

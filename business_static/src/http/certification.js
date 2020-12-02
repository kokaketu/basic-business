import { http } from './index'

export function personal2biz (params) {
  return http.post('/asset-admin-web/certification/personal2biz', params).then(res => {
    return res
  })
}

export function certificationQuickCreate (params) {
  return http.post('/asset-admin-web/certification/quickCreate', params).then(res => {
    return res
  })
}

export function certificationList (params) {
  return http.post('/asset-admin-web/certification/list', params).then(res => {
    return res
  })
}

export function mainSubjectInit (params) {
  return http.post('/asset-admin-web/certification/mainSubjectInit', params).then(res => {
    return res
  })
}

export function getImageInfo (params) {
  return http.post('/asset-admin-web/companyVerify/getImageInfo', params).then(res => {
    return res
  })
}

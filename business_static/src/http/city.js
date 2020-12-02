import { http } from './index'
/**
 * 查询省份列表
 */
export function getProvinceList () {
  return http.post('/asset-backstage-web/backstage/district/getProvinceList').then((res) => {
    return res.data
  })
}
/**
 * 查询省下市列表
 */
export function getCityList (provinceCode) {
  return http.post('/asset-backstage-web/backstage/district/getCityList', provinceCode).then((res) => {
    return res.data
  })
}
/**
 * 查询省份列表
 */
export function getDistrictList (cityCode) {
  return http.post('/asset-backstage-web/backstage/district/getDistrictList', cityCode).then((res) => {
    return res.data
  })
}

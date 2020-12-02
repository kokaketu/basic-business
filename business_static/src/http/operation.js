import { http } from './index'

/**
 * 根据主体id查询客流列表
 */
export function getPassFlowListByMainId (param) {
  return http.post('/asset-operation-web/bsPassFlow/getPassFlowListByMainId', {...param, orderBy: 'b2.passenger_flow desc'}).then(res => {
    return res.data
  })
}

/**
 * 根据项目id、年份，获取指定年份每月总客流
 */
export function getPassFlowInfoByAssetId (assetId, yearValue) {
  return http.post('/asset-operation-web/bsPassFlow/getPassFlowInfo', {assetId, yearValue}).then(res => {
    return res.data
  })
}

/**
 * 根据项目id以及日期，获取月度客流完成率
 */
export function getPassFlowCompletionRateByAssetId (mainId, assetId, yearValue, monthValue) {
  return http.post('/asset-operation-web/bsPassFlow/getPassFlowCompletionRate', {mainId, assetId, yearValue, monthValue, frequency: 3}).then(res => {
    return res.data
  })
}

/**
 * 根据项目id和年月，获取项目月度客流详情
 */
export function getPassFlowDetailInfoByAssetId (assetId, yearValue, monthValue) {
  return http.post('/asset-operation-web/bsPassFlow/getPassFlowDetailInfo', {assetId, yearValue, monthValue, frequency: 3}).then(res => {
    return res.data
  })
}

/**
 * 客流录入-按天
 */
export function addPassFlowDetail (id, mainId, assetId, passDate, passFlow, yearValue, monthValue) {
  return http.post('/asset-operation-web/bsPassFlow/addPassFlowDetail', {id, mainId, assetId, passDate, passFlow, yearValue, monthValue}).then(res => {
    return res.data
  })
}

/**
 * 客流录入-按月
 */
export function addPassFlow (id, mainId, assetId, yearValue, monthValue, passengerFlowTarget, passengerFlow) {
  return http.post('/asset-operation-web/bsPassFlow/addPassFlow', {id, mainId, assetId, frequency: 3, yearValue, monthValue, passengerFlowTarget, passengerFlow}).then(res => {
    return res.data
  })
}

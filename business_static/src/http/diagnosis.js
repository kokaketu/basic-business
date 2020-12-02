import { http } from './index'

/**
 * 查询 报告需要的数据 （写字楼）
 * @param params
 */
export function queryData (params) {
  return http.post('/asset-diagnose-web/diagnose/queryData', params).then(res => {
    return res.data
  })
}

/**
 * 新增/更新 办公项目<i>经营数据</i> <i>融资数据</i>
 * @param {*} params
 */
export function saveDiagnoseData (params) {
  return http.post('/asset-diagnose-web/diagnose/office/saveDiagnoseData', params).then(res => {
    return res
  })
}

/**
 * 查询诊断记录数据列表
 * @param {*} params
 */
export function queryDiagnoseList (params) {
  return http.post('/asset-diagnose-web/diagnose/queryDiagnoseList', params).then(res => {
    return res.data
  })
}

/**
 * 查看已提交的办公项目诊断数据
 * @param {*} params
 */
export function queryDiagnoseData (params) {
  const {projectId, year, quarter} = params
  return http.get(`/asset-diagnose-web/diagnose/office/queryDiagnoseData?projectId=${projectId}&year=${year}&quarter=${quarter}`).then(res => {
    return res.data
  })
}

/**
 * 获取 实时 报告
 * @param {*} params
 */
export function getNow (params) {
  return http.post(`/asset-diagnose-web/diagnose/getNow`, params, {responseIsfile: true}).then(res => {
    return res
  })
}

/**
 * 查询诊断报告页面 诊断季度 下拉框列表
 * @param {*} params
 */
export function queryReportDateList (projectId) {
  return http.get(`/asset-diagnose-web/diagnose/queryReportDateList?projectId=${projectId}`).then(res => {
    return res
  })
}

/**
 * 产业园诊断查询
 * @param {*} params
 */
export function queryDiagnoseParkData (projectId, year, quarter) {
  return http.get(`/asset-diagnose-web/diagnose/park/queryDiagnoseData?projectId=${projectId}&year=${year}&quarter=${quarter}`).then(res => {
    return res
  })
}

/**
 * 产业园诊断新增
 * @param {*} params
 */
export function saveDiagnoseParkData (params) {
  return http.post(`/asset-diagnose-web/diagnose/park/saveDiagnoseData`, params).then(res => {
    return res
  })
}

/**
 * 产业园获取楼栋诊断列表
 * @param {*} params
 */
export function queryBuildingData (projectId, year, quarter) {
  return http.get(`/asset-diagnose-web/diagnose/park/queryBuildingData?projectId=${projectId}&year=${year}&quarter=${quarter}`).then(res => {
    return res
  })
}
/**
 * 产业园获取楼栋诊断详情
 * @param {*} params
 */
export function getBuildingData (projectId, buildingId, year, quarter) {
  return http.get(`/asset-diagnose-web/diagnose/park/getBuildingData?projectId=${projectId}&buildingId=${buildingId}&year=${year}&quarter=${quarter}`).then(res => {
    return res
  })
}
/**
 * 保存楼栋诊断数据
 * @param {*} params
 */
export function saveBuildingData (params) {
  return http.post(`/asset-diagnose-web/diagnose/park/saveBuildingData`, params).then(res => {
    return res
  })
}

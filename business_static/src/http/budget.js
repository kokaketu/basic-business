import { http } from './index'

/**
 * 查询后台管理预算科目列表
 * @param budgetType {string} 预算类型
 * @param assetLayout {string} 业态类型
 * @return {Promise<AxiosResponse<any>>}
 */
export function getBudgetTemplateSaaSList ({ budgetType, assetLayout }) {
  return http.post('/asset-budget-web/assetBudget/getBudgetTemplateSaaSList', {
    budgetType,
    assetLayout
  }).then((res) => {
    return res.data
  })
}

export function getAssetBudgetTemplateList ({ mainId, budgetType, assetLayout }) {
  return http.post('/asset-budget-web/assetBudget/getAssetBudgetTemplateList', {
    mainId,
    budgetType,
    assetLayout
  }).then((res) => {
    return res.data
  })
}

/**
 * 查询预算编制列表
 * @param year {number} 预算年份
 * @param budgetType {string} 预算类型
 * @param assetLayout {string} 业态
 * @param mainId {number} 主体id
 * @param assetId {number} 资产id
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryPlaitList (params) {
  return http.post('/asset-budget-web/budgetDetail/queryPlaitList', params).then((res) => {
    return res
  })
}

/**
 * 修改保存预算编制
 * @param {} data
 */
export function updatePlaitList (data) {
  return http.post('/asset-budget-web/budgetDetail/updatePlaitList', data)
    .then((res) => {
      return res
    })
}

/**
 * 删除预算编制科目
 * @param {} data
 */
export function deleteBudgets (data) {
  return http.post('/asset-budget-web/budgetDetail/deleteBudgets', data)
    .then((res) => {
      return res
    })
}

export function statisticsAssetDetail ({ budgetType, mainId, assetId }) {
  return http.post('/asset-budget-web/budgetDetail/statisticsAssetDetail', {
    budgetType,
    mainId,
    assetId
  }).then((res) => {
    return res.data.data
  })
}

/**
 * 预算编制列表查询
 */
export function getBudgetMakingList (params) {
  return http.post('/asset-budget-web/budgetDetail/querySimpleList', params)
    .then((res) => {
      return res
    })
}

export function addAssetBudgetTemplate (params) {
  return http.post('/asset-budget-web/assetBudget/addAssetBudgetTemplate', params)
    .then((res) => {
      return res.data
    })
}

/** ****************** 执行分析 ********************** */

/**
 * 执行分析页面的图表
 * @param {*} params
 */
export function budgetAchievementRate (params) {
  return http.post('/asset-budget-web/budgetDetail/budgetAchievementRate', params).then((res) => {
    return res
  })
}

/**
 * 执行分析页面的列表
 * @param {*} params
 */
export function budgetedPerformance (params) {
  return http.post('/asset-budget-web/budgetDetail/budgetedPerformance', params).then((res) => {
    return res
  })
}

/**
 * 执行填报页面的列表
 * @param {*} params
 */
export function queryBudgetImplementList (params) {
  return http.post('/asset-budget-web/budgetImolement/queryBudgetImplementList', params).then((res) => {
    return res
  })
}
/**
 * 新增执行填报时查询科目列表
 * @param {*} params
 */
export function queryBudgetList (params) {
  return http.post('/asset-budget-web/budgetImolement/queryBudgetList', params).then((res) => {
    return res
  })
}

/**
 * 根据主体id查询在预算编制里面已经存在的项目列表
 * @param {*} params
 */
export function queryAssetNameList (params) {
  return http.post('/asset-budget-web/budgetImolement/queryAssetNameList', params).then((res) => {
    return res
  })
}
/**
 * 年份下拉框
 * @param {*} params
 */
export function queryBudgetYearList (params) {
  return http.post('/asset-budget-web/budgetImolement/queryBudgetYearList', params).then((res) => {
    return res
  })
}
/**
 * 新增/更新预算填报
 * @param {*} params
 */
export function addBudgetImolement (params) {
  return http.post('/asset-budget-web/budgetImolement/addBudgetImolement', params).then((res) => {
    return res
  })
}
/**
 * 预算填报详情
 * @param {*} params
 */
export function queryDetailsList (params) {
  return http.post('/asset-budget-web/budgetImolement/queryDetailsList', params).then((res) => {
    return res
  })
}
/**
 * 填充财务数据
 * @param {*} params
 */
export function fillFinancialData (params) {
  return http.post('/asset-budget-web/budgetImolement/fillFinancialData', params).then((res) => {
    return res
  })
}

/**
 * 导入预算编制
 * @param {*} params
 */
export function importBudgetExcel (params) {
  return http.post('/asset-budget-web/budgetDetail/import', params).then((res) => {
    return res
  })
}

/**
 * 导出预算编制
 * @param {*} params
 */
export function exportBudgetExcel (params) {
  return http.post('/asset-budget-web/budgetDetail/export', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}

/**
 * 导出预算执行
 * @param {*} params
 */
export function exportPerformance (params) {
  return http.post('/asset-budget-web/budgetDetail/exportPerformance', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}

/**
 * 查询项目预算分期
 * @param {*} params
 */
export function queryStagesByAssetId (params) {
  return http.post('/asset-budget-web/budgetImolement/queryStagesNameList', params).then(res => {
    return res
  })
}

import { http } from './index'

/**
 * 获取项目业态枚举
 */
export function getAssetLayoutEnumList () {
  return http.post('/asset-basedata-web/bsAsset/AssetLayoutEnumList').then(res => {
    return res.data
  })
}

/**
 * 获取经营阶段枚举
 */
export function getOperationStageEnumList () {
  return http.post('/asset-basedata-web/bsAsset/OperationStageEnumList').then(res => {
    return res.data
  })
}
/**
 *
 *  获取资产分类枚举
 */
export function getAssetStatusEnumList () {
  return http.post('/asset-basedata-web/bsAsset/AssetStatusEnumList').then(res => {
    return res.data
  })
}

/**
 *
 *  根据主体查项目名称列表
 */
export function getAssetName (params) {
  return http.post('/asset-basedata-web/bsAsset/queryAssetName', params).then(res => {
    return res.data
  })
}

/**
 *
 *  查看项目资质列表
 */
export function queryAssetStatue (params) {
  return http.post('/asset-analysis-web/bsAssetSisController/queryAssetStatus', params).then(res => {
    return res.data
  })
}

/**
 *
 *  新增项目以及关联表信息
 */
export function assetAdd (params) {
  return http.post('/asset-basedata-web/bsAsset/assetAdd', params).then(res => {
    return res
  })
}
/**
 * 更新项目
 * @param {*} params
 */
export function assetUpdate (params) {
  return http.post('/asset-basedata-web/bsAsset/assetUpdate', params).then(res => {
    return res
  })
}
/**
 *
 *  删除项目以及关联表信息
 */
export function assetDelete (params) {
  return http.post('/asset-basedata-web/bsAsset/assetDelete', params).then(res => {
    return res
  })
}
/**
 *
 * 根据项目id查询楼栋名称列表
 */
export function getBuildingNameList (params) {
  return http.post('/asset-basedata-web/bsBuilding/queryBuildingNameList', params).then(res => {
    return res.data
  })
}
/**
 *
 * 获取项目编号
 */
export function setAssetCode (params) {
  return http.post('/asset-basedata-web/bsAsset/setAssetCode', params).then(res => {
    return res
  })
}
/**
 *
 * 新增楼栋信息
 */
export function addBsBuilding (params) {
  return http.post('/asset-basedata-web/bsBuilding/addBsBuilding', params).then(res => {
    return res
  })
}

/**
 *
 * 查询分期枚举值
 */
export function queryFQByAssetId (params) {
  return http.post('/asset-basedata-web/bsAssetStages/queryByAssetId', params).then(res => {
    return res
  })
}

/**
 *
 * 更新楼栋信息
 */
export function isModifyIt (params) {
  return http.post('/asset-basedata-web/bsAsset/isModifyIt', params).then(res => {
    return res
  })
}

/**
 *
 * 更新楼栋信息
 */
export function updBsBuilding (params) {
  return http.post('/asset-basedata-web/bsBuilding/updBsBuilding', params).then(res => {
    return res
  })
}

/**
 *
 * 根据项目id查询楼栋名称列表
 */
export function getFloorNameList (params) {
  return http.post('/asset-basedata-web/bsFloor/queryFloorName', params).then(res => {
    return res.data
  })
}
/**
 * 导出楼栋列表
 */
export function exportBuildingExcel (params) {
  return http.post('/asset-basedata-web/bsBuilding/exportBuildingExcel', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}
/**
 *
 * 新增楼层信息
 */
export function addFloor (params) {
  return http.post('/asset-basedata-web/bsFloor/addFloor', params).then(res => {
    return res
  })
}

/**
 *
 * 更新楼栋信息
 */
export function updFloor (params) {
  return http.post('/asset-basedata-web/bsFloor/updFloor', params).then(res => {
    return res
  })
}

/**
 *
 * 新增楼层资源信息
 */
export function addFloorResource (params) {
  return http.post('/asset-basedata-web/bsFloor/addFloorResource', params).then(res => {
    return res
  })
}

/**
 *
 * 更新楼层资源信息
 */
export function updFloorResource (params) {
  return http.post('/asset-basedata-web/bsFloor/updFloorResource', params).then(res => {
    return res
  })
}

/**
 *
 * 删除楼层资源信息
 */
export function delFloorResource (params) {
  return http.post('/asset-basedata-web/bsFloor/delFloorResource', params).then(res => {
    return res
  })
}

/**
 * 查询项目列表
 */
export function getAssetListByMainId (params) {
  return http.post('/asset-basedata-web/bsAsset/getAssetListByMainId', params).then((res) => {
    return res.data
  })
}
/**
 * 导出项目列表
 */
export function exportExcelAssetList (params) {
  return http.post('/asset-basedata-web/bsAsset/ExportExcelAssetList', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}
/**
 * 查询项目详情
 */
export function queryResultById ({ id }) {
  return http.post('/asset-basedata-web/bsAsset/queryResultById', { id }).then(res => {
    return res.data
  })
}

/**
 * 查询楼栋列表
 */
export function getBsBuildingListByMainId (params) {
  return http.post('/asset-basedata-web/bsBuilding/getBsBuildingListByMainId', params).then((res) => {
    return res.data
  })
}

/**
 *
 * 查询楼栋详情
 */
export function queryById (params) {
  return http.post('/asset-basedata-web/bsBuilding/queryById', params).then(res => {
    return res.data
  })
}

/**
 *
 * 删除楼栋
 */
export function delBsBuilding (params) {
  return http.post('/asset-basedata-web/bsBuilding/delBsBuilding', params).then(res => {
    return res
  })
}

/**
 *
 * 删除楼层
 */
export function delFloor (params) {
  return http.post('/asset-basedata-web/bsFloor/delFloor', params).then(res => {
    return res
  })
}

/**
 *
 * 删除租赁单元
 */
export function rentalUnitDelete (params) {
  return http.post('/asset-basedata-web/rentalUnit/rentalUnitDelete', params).then(res => {
    return res
  })
}

/**
 * 查询楼层列表
 */
export function getBsFloorListByMainId (params) {
  return http.post('/asset-basedata-web/bsFloor/getBsFloorListByMainId', params).then((res) => {
    return res.data
  })
}
/**
 * 导出楼层列表
 */
export function exportFloorExcel (params) {
  return http.post('/asset-basedata-web/bsFloor/exportFloorExcel', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}
/**
 *
 * 查询楼层详情
 */
export function getQueryById (params) {
  return http.post('/asset-basedata-web/bsFloor/getQueryById', params).then((res) => {
    return res.data
  })
}
/**
 * 商业租金单元管理页面列表查询 ------- 铺位列表
 */
export function getBsStore (params) {
  return http.post('/asset-basedata-web/bsStore/query', params).then(res => {
    return res.data
  })
}

/**
 * 商业租金单元管理页面列表查询 ------- 租赁单元
 */
export function getrentalUnit (params) {
  return http.post('/asset-basedata-web/rentalUnit/query', params).then(res => {
    return res.data
  })
}
export function getrentalUnitList (params) {
  return http.post('/asset-basedata-web/bsRoom/query', params).then(res => {
    return res.data
  })
}

/**
 * 租赁单元详情
 * @param {*} params
 * @param {*} type
 */
export function bsRoomDetail (params, type) {
  return http.post('/asset-basedata-web/bsRoom/detail', params).then(res => {
    return res.data
  })
}
/**
 * 租赁单元最新编号
 * @param {*} params
 */
export function bsRoomNo (params) {
  return http.post('/asset-basedata-web/bsRoom/bsRoomNo', params).then(res => {
    return res.data
  })
}
/**
 * 商业租金单元管理页面列表查询 ------- 新增铺位--店型定位下拉
 */
export function queryStorePositioning () {
  return http.post('/asset-basedata-web/bsRoom/queryStorePositioning').then(res => {
    return res.data
  })
}
/**
 * 商业租金单元管理页面列表查询 ------- 新增铺位--店铺业态下拉列表
 */
export function queryLayoutPositioning () {
  return http.post('/asset-basedata-web/bsRoom/queryLayoutPositioning').then(res => {
    return res.data
  })
}
/**
 * 新增租赁单元
 * @param {*} params
 * @param {*} type
 */
export function bsRoomAdd (params, type) {
  return http.post('/asset-basedata-web/bsRoom/bsRoomAdd', params).then(res => {
    return res
  })
}

/**
 * 更新租赁单元
 * @param {*} params
 * @param {*} type
 */
export function bsRoomUpd (params, type) {
  return http.post('/asset-basedata-web/bsRoom/bsRoomUpd', params).then(res => {
    return res
  })
}

/**
 * 删除租赁单元
 * @param {*} params
 * @param {*} type
 */
export function bsRoomDel (params) {
  return http.post('/asset-basedata-web/bsRoom/bsRoomDel', params).then(res => {
    return res
  })
}
/**
 * 经营分析
 * @param mainId {number} 主体 id
 * @param year {number} 年份
 * @param month {number} 月份
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchAssetAnalysisBusiness ({mainId, year, month}) {
  return http.post('/asset-analysis-web/assetAnalysis/business', {mainId, year, month}).then(({ data }) => {
    if (data) {
      return data
    }
    return Promise.reject(data)
  })
}

/**
 * 收入/支出趋势分析
 * @param mainId {number} 主体id
 * @param year {number}
 * @param month {number}
 * @param assetLayout {string?} 业态
 * @param months {number?} 月数：查看多少月的数据？
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchAssetAnalysisFinanceNoi ({mainId, year, month, assetLayout, months, assetId}) {
  return http.post('/asset-analysis-web/assetAnalysis/finace/noi', {mainId, year, month, assetLayout, months, assetId}).then(({ data }) => data || {})
}

/**
 * 预算达成率分析
 * @param mainId {number} 主体id
 * @param yearMonth {string} 年月 yyyy-MM
 * @param assetLayout {number?} 业态
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchAnalysisBudget ({
  mainId,
  yearMonth,
  assetLayout,
}) {
  return http.post('/asset-analysis-web/assetAnalysis/analysisBudget', {
    mainId,
    yearMonth,
    assetLayout,
  }).then(({ data }) => data || [])
}

/**
 * 租赁分析 -- 多项目
 * @param mainId {number} 主体id
 * @param yearMonth {string} 年月 yyyy-MM
 * @param assetLayout {number?} 业态
 * @return {Promise<any | *[]>}
 */
export function fetchAnalysisRent ({
  mainId,
  yearMonth,
  assetLayout,
}) {
  return http.post('/asset-analysis-web/assetAnalysis/analysisRent', {
    mainId,
    yearMonth,
    assetLayout,
  }).then(({ data }) => data || [])
}

/**
 * 租赁分析--月度数据获取
 * @param mainId {number} 主体id
 * @param assetId {number} 资产id
 * @param yearMonth {string} 年月 yyyy-MM
 * @return {Promise<any | *[]>}
 */
export function fetchAnalysisMonthRent ({
  mainId,
  assetId,
  yearMonth,
}) {
  return http.post('/asset-analysis-web/assetAnalysis/analysisMonthRent', {
    mainId,
    assetId,
    yearMonth,
  }).then(({ data }) => data || [])
}

/**
 * 商业运营分析
 * @param mainId {number} 主体id
 * @param yearMonth {string} 年月 yyyy-MM
 * /asset-analysis-web/multiAnalysis/bizOperator
 * @return {Promise<AxiosResponse<any>>}
 */
export function fetchBizOperator ({
  mainId,
  yearMonth,
}) {
  return http.post('/asset-analysis-web/multiAnalysis/bizOperator', {
    mainId,
    yearMonth,
  }).then(({ data }) => {
    if (data) {
      return data
    }
    return Promise.reject(data)
  })
}

/**
 * 运营分析
 */
export function getOperationAnalysis ({
  mainId,
  yearMonth,
}) {
  return http.post('/asset-analysis-web/multiAnalysis/getOperationAnalysis', {
    mainId,
    yearMonth,
  }).then(({ data }) => {
    if (data) {
      return data
    }
    return Promise.reject(data)
  })
}

/**
 * 多项目经营分析 -- 商业运营分析 -- 折线图
 */
export function getPassSalesRentInfo ({
  mainId,
  assetIdList,
  dataType,
  yearValue
}) {
  return http.post('/asset-analysis-web/multiAnalysis/getPassSalesRentInfo', {
    mainId,
    assetIdList,
    dataType,
    yearValue
  }).then(({ data }) => data || [])
}

export function fetchProjects ({
  mainId,
  assetName,
}) {
  return http.post('/asset-basedata-web/bsAsset/queryAssetName', {
    mainId,
    assetName,
  }).then(({ data }) => data || [])
}

/**
 * 查询租赁单元列表信息--提供给外部调用
 * @param assetId {number?} 项目 id
 * @param buildingId {number?} 楼栋 id
 * @param floorId {number?} 楼层 id
 * @param keywords {string?} 查询关键字
 * @return {Promise<any | *[]>}
 */
export function fetchRentalUnit ({
  assetId,
  buildingId,
  floorId,
  keywords,
}) {
  return http.post('/asset-basedata-web/bsRoom/queryList', {
    assetId,
    buildingId,
    floorId,
    keywords,
  }).then(({ data }) => data || [])
}
/**
 * 导出租赁单元列表
 */
export function exportRoomExcel (params) {
  return http.post('/asset-basedata-web/bsRoom/exportRoomExcel', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}
/**
 * 查看项目基本信息
 * @param id {number} 项目 id
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryProjectAnalysis (id) {
  return http.post('/asset-analysis-web/bsAssetSisController/queryAnalysis', {
    id,
  }).then(({ data }) => data || {})
}

/**
 * 单项目分析 - 财务
 * @param mainId {number} 主体 id
 * @param assetId {number} 资产 id
 * @param yearMonth {string} 年月 yyyy-MM
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryProjectFinancial ({
  mainId,
  assetId,
  yearMonth,
  stagesId
}) {
  return http.post('/asset-analysis-web/finStatements/query', {
    mainId,
    assetId,
    yearMonth,
    stagesId
  }).then(({ data }) => data || {})
}

/**
 * 租金收入/计租面积，柱状图/饼图接口
 * @param mainId {number} 主体 id
 * @param assetId {number} 资产 id
 * @param yearMonth {string} 年月 yyyy-MM
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryProjectRentAnalysis ({
  stagesId,
  mainId,
  assetId,
  yearMonth,
}) {
  return http.post('/asset-analysis-web/assetAnalysis/rentAnalysis', {
    stagesId,
    mainId,
    assetId,
    yearMonth,
  }).then(({ data }) => data || {})
}
/**
 *
 * 上传NOI数据
 */
export function updateNoiList (params) {
  return http.post('/asset-analysis-web/assetAnalysis/noi/updateNoiList', params).then(res => {
    return res.data
  })
}
/**
 *
 * 获取NOI数据
 */
export function getNoiList (params) {
  return http.post('/asset-analysis-web/assetAnalysis/noi/getNoiList', params).then(res => {
    return res.data
  })
}

/**
 * 出租率分析
 * @param assetId {number} 资产id
 * @param currentMonthDate {string} 年月 yyyy-MM
 * @return {Promise<any | *[]>}
 */
export function getStoreRentInfo ({
  stagesId,
  assetId,
  yearMonth,
  dimension,
  assetLayout
}) {
  return http.post('/asset-analysis-web/assetAnalysis/getStoreRentInfo', {
    stagesId,
    assetId,
    yearMonth,
    dimension,
    assetLayout
  }).then(({ data }) => data || [])
}

/**
 * 销售统计
 */
export function salesAnalysis (params) {
  return http.post('/asset-analysis-web/salesAnalysis/query', params).then(res => {
    return res.data
  })
}

/**
 * 租金达成分析
 */
export function rentAnalysisQuery (params) {
  return http.post('/asset-analysis-web/rentAnalysis/query', params).then(res => {
    return res.data
  })
}

/**
 *
 * 客流销售额折线图
 */
export function querySalesAndFlow (params) {
  return http.post('/asset-analysis-web/salesAnalysis/querySalesAndFlow', params).then(res => {
    return res.data
  })
}

/**
 * 欠费分析
 */
export function getSubjectNoArrearsInfo (params) {
  return http.post('/asset-analysis-web/assetAnalysis/getSubjectNoArrearsInfo', params).then(res => {
    return res.data
  })
}

/**
 * 分期列表
 */
export function queryBsAssetStagesList (params) {
  return http.post('/asset-basedata-web/bsAssetStages/queryBsAssetStagesList', params).then(res => {
    return res.data
  })
}
/**
 * 导出分期列表
 */
export function ExportExcelAssetStagesList (params) {
  return http.post('/asset-basedata-web/bsAssetStages/ExportExcelAssetStagesList', params, {responseIsfile: true}).then(({data, fileName}) => {
    return {
      data,
      name: decodeURIComponent(fileName)
    }
  })
}

/**
 * 查看分期详情
 */
export function getStagingDetail ({ id }) {
  return http.post('/asset-basedata-web/bsAssetStages/queryById', { id }).then(res => {
    return res.data
  })
}

/**
 *  删除分期
 */
export function stagingDelete (params) {
  return http.post('/asset-basedata-web/bsAssetStages/delBsAssetStages', params).then(res => {
    return res
  })
}

/**
 *  新增分期
 */
export function stagingAdd (params) {
  return http.post('/asset-basedata-web/bsAssetStages/addBsAssetStages', params).then(res => {
    return res
  })
}

/**
 * 获取项目编号
 */
export function getAssetStagesCode (params) {
  return http.post('/asset-basedata-web/bsAssetStages/getAssetStagesCode', params).then(res => {
    return res
  })
}

/**
 *  更新分期
 */
export function updBsAssetStages (params) {
  return http.post('/asset-basedata-web/bsAssetStages/updBsAssetStages', params).then(res => {
    return res
  })
}

/**
 * 配额总数校验
 */
export function quotaTotalCheck (params) {
  return http.post('/asset-backstage-web/backstage/quota/quotaTotalCheck', params).then(res => {
    return res
  })
}
/**
 * 配额业态校验
 */
export function quotaLayoutCheck (params) {
  return http.post('/asset-backstage-web/backstage/quota/quotaLayoutCheck', params).then(res => {
    return res
  })
}

/**
 * 多经点位列表查询-分页
 * @param {*} params
 */
export function queryPage (params) {
  return http.post(`/asset-basedata-web/bsDiverse/queryPage`, params).then((res) => {
    return res
  })
}

/**
 * 多经点位-详情
 * @param {*} params
 */
export function diverseDetail (params) {
  return http.post(`/asset-basedata-web/bsDiverse/diverseDetail`, params).then((res) => {
    return res
  })
}

/**
 * 多经点位--删除
 * @param {*} params
 */
export function diverseDelete (params) {
  return http.post(`/asset-basedata-web/bsDiverse/diverseDelete`, params).then((res) => {
    return res
  })
}

/**
 * 多经点位--返回最新编号
 * @param {*} assetId
 */
export function getRoomNo (assetId) {
  return http.post(`/asset-basedata-web/bsDiverse/getRoomNo`, {assetId}).then((res) => {
    return res
  })
}

/**
 * 多经点位--新增
 * @param {*} params
 */
export function diverseAdd (params) {
  return http.post(`/asset-basedata-web/bsDiverse/diverseAdd`, params).then((res) => {
    return res
  })
}

/**
 * 多经点位--修改
 * @param {*} params
 */
export function diverseUpdate (params) {
  return http.post(`/asset-basedata-web/bsDiverse/diverseUpdate`, params).then((res) => {
    return res
  })
}

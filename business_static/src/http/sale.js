import { http } from './index'

/**
 * 销售额管理页面列表
 * @param assetId {number?}
 * @param assetLayout {string?} 项目类型(1：办公；2：商业)
 * @param contentType {string?} 合同类型
 * @param yearMonth {string?} 年月
 * @param identifier {string?} 租户名称或合同编号
 * @param noCont {number?} 1.未录入合同
 * @param orderFiled {number?} 排序：1本月 2本年 3同 4环 5 面积 6坪 7租
 * @param aos {number?} 排序：1.顺序，2.逆序
 * @param page {number}
 * @param limit {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function querySalesStatement ({
  assetId,
  assetLayout,
  contentType,
  yearMonth,
  identifier,
  noCont,
  orderFiled,
  aos,
  page,
  mainId,
  limit = 10,
}) {
  return http.post('/asset-analysis-web/salesAnalysis/querySalesStatement', {
    mainId,
    assetId,
    assetLayout,
    contentType,
    yearMonth,
    identifier,
    noCont,
    orderFiled,
    aos,
    page,
    limit
  }).then(({ data }) => data || {})
}

export function fileUpload (file) {
  const form = new FormData()
  form.append('multipartFile', file)

  return http.post('/asset-fileservice-web/filesystem/upload', form)
}

export function salesAnalysisImport (fileUrl) {
  return http.get('/asset-analysis-web/salesAnalysis/import', {
    params: {
      file: fileUrl,
    }
  })
}

/**
 * 查询该月销售额每天详情（日历）
 * @param year
 * @param month
 * @param salesMoney
 * @param contId {number} 合同id
 * @param assetId {number} 项目id
 * @param mainId {number} 主体id
 * @param companyId {number} 租户id
 * @param storeId {string?}
 * @return {Promise<AxiosResponse<any>>}
 */
export function queryMonthSales ({
  year,
  month,
  salesMoney,
  contId,
  assetId,
  mainId,
  companyId,
  storeId,
}) {
  return http.post('/asset-analysis-web/salesAnalysis/queryMonthSales', {
    year,
    month,
    salesMoney,
    contId,
    assetId,
    mainId,
    companyId,
    storeId,
  }).then(({ data }) => data || [])
}

export function queryAllSales ({
  contId,
  assetId,
  companyId,
  year,
}) {
  return http.post('/asset-analysis-web/salesAnalysis/queryAllSales', {
    contId,
    assetId,
    companyId,
    year,
  }).then(({ data }) => data || {})
}

export function saveSalesByMonth ({
  year,
  month,
  salesMoney,
  storeId,
  contId,
  assetId,
  mainId,
  companyId,
}) {
  return http.post('/asset-analysis-web/salesAnalysis/saveSalesByMonth', {
    year,
    month,
    salesMoney,
    storeId,
    contId,
    assetId,
    mainId,
    companyId,
  })
}

export function saveSalesByDay ({
  year,
  month,
  salesMoney,
  storeId,
  contId,
  assetId,
  mainId,
  companyId,
  dayData,
}) {
  return http.post('/asset-analysis-web/salesAnalysis/saveSalesByDay', {
    year,
    month,
    salesMoney,
    storeId,
    contId,
    assetId,
    mainId,
    companyId,
    dayData,
  })
}


export function updateDaySales ({
  id,
  time,
  daySalesMoney
}) {
  return http.post('/asset-analysis-web/salesAnalysis/updateDaySales', {
    id,
    time,
    daySalesMoney
  })
}
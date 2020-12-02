import { http } from './index'

/**
 * 能耗管理列表
 */
export async function deviceManageQueryList (param) {
  const res = await http.post('/asset-operation-web/deviceManage/queryList', param)
  return res.data
}

/**
 * 能耗管理编辑
 */
export async function deviceManageEditConsumption (param) {
  const res = await http.post('/asset-operation-web/deviceManage/editConsumption', param)
  return res.data
}

/**
 * 删除阶梯详情
 */
export async function deviceManageOperation1 (id) {
  const res = await http.post('/asset-operation-web/deviceManage/operation', {id})
  return res.data
}

/**
 * 生成应收
 */
export async function deviceManageOperation2 (deviceConsId) {
  const res = await http.post('/asset-operation-web/deviceManage/operation', {deviceConsId})
  return res.data
}

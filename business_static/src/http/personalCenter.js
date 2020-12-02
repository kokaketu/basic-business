import { http } from './index'

/**
 * 根据手机号获取会员信息
 * @param mobile {String} 手机号
 * @return {Promise<AxiosResponse>}
 */
export function queryByMobile (mobile) {
  return http.post('/asset-admin-web/member/rpc/queryByMobile', mobile).then((res) => {
    return res.data
  })
}

/**
 * 根据手机号查询用户登录记录
 * @param req 请求对像
 * @return {Promise<AxiosResponse<any>>}
 */
export function loginHistory (req) {
  return http.post('/asset-admin-web/member/rpc/loginHistory', req).then((res) => {
    return res.data
  })
}

/**
 * 查询会员订单列表信息
 * @param memberId {number}
 * @return {Promise<AxiosResponse<any>>}
 */
export function listOrder (memberId) {
  return http.post('/asset-admin-web/member/rpc/order/list', memberId).then((res) => {
    return res.data
  })
}

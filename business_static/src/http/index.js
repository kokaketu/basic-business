import axios from 'axios'
import { Message } from 'element-ui'
import store from '@/vuex'

let origin
if (window.location.hostname.indexOf('local') !== -1 || window.location.hostname.indexOf('dev') !== -1) {
  origin = 'http://dev.business.com'
} else if (window.location.hostname.indexOf('test') !== -1) {
  origin = 'http://test.business.com'
} else {
  origin = 'https://pro.business.com'
}

// axios 配置
const http = axios.create({
  timeout: 60000
})
// 是否是文件流
var responseIsfile = false
// 是否隐藏接口错误信息
var hideErrMsg = false

// http request 拦截器
http.interceptors.request.use(config => {
  store.dispatch('setLoading', true)
  // 装载参数
  config.headers.mainId = store.state.merchant.id
  config.timeout = 60000
  responseIsfile = config.responseIsfile
  hideErrMsg = config.hideErrMsg
  if (responseIsfile) {
    config.responseType = 'blob'
  }
  return config
}, err => {
  return Promise.reject(err)
})
// http response 拦截器
http.interceptors.response.use(response => {
  store.dispatch('setLoading', false)
  // 是否是文件流
  const content = response.headers['content-disposition']
  if (responseIsfile && content) {
    // 文件接口不统一，返回文件名字不一致处理
    const regular = content.includes('UTF') ? `filename*=UTF-8''` : `filename=`
    const filename = content.split(regular)[1]
    return {
      data: response.data,
      fileName: filename
    }
  }
  const { code } = response.data
  const isOutDate = String(code).includes('token_error')
  if (code !== '0' && !isOutDate && !hideErrMsg) {
    Message.error(response.data.msg)
  } else if (isOutDate) {
    const hostname = window.location.hostname
    const isDev = hostname.includes('test') || hostname.includes('local')
    if (process.env.EVN_FLAG === 'dev' || process.env.EVN_FLAG === 'test') {
      window.location.href = `http://${process.env.EVN_FLAG}.caicchina.com/#/login`
    } else {
      window.location.href = isDev ? 'http://dev.caicchina.com/#/login' : 'https://www.caicchina.com/#/login'
    }
    Message.error(response.data.msg)
  }
  return response.data
}, error => {
  store.dispatch('setLoading', false)
  Message.error(error)
})
export { http, origin }

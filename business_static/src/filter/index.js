import Vue from 'vue'
import currency from 'accounting'
import { ASSET_TYPEs, depositStatusName, PAY_WAYs, subjectTypeName } from '../components/const'

Vue.filter('depositStatus', function (value) {
  if (!value) {
    return '-'
  } else {
    return depositStatusName[value + '']
  }
})

Vue.filter('subjectType', function (value) {
  return subjectTypeName[value + '']
})

Vue.filter('payWay', function (value) {
  return PAY_WAYs[value + '']
})

Vue.filter('assetType', function (value) {
  /* eslint-disable */
  return (ASSET_TYPEs.find(({ code }) => code == value) || {}).name
})

Vue.filter('defaultValue', function (value) {
  return value == null ? '-' : value
})

Vue.filter('currency', function (value, symbol = '', precision = 2) {
  return value == null ? '' : currency.formatMoney(value, symbol, precision)
})
/**
 * 数字格式化 10000 to 10,000.00
 */
Vue.filter('comdify', function (n) {
  if (!n && n !== 0) return '-'
  let str = n.toString().split('.')
  let re = /\d{1,3}(?=(\d{3})+$)/g
  let n1 = str[0].replace(re, '$&,')
  return str.length > 1 && str[1] ? `${n1}.${str[1].padEnd(2,0)}` : `${n1}.00`
})

// 
Vue.filter('mosaic', function (value) {
  if(!value) return '-'
  const len = value.length / 2
  const star = '*'.repeat(len)
  let result = ''
  if(len % 2 === 0) {
    result = value.slice(0, len / 4) + star + value.slice(-len / 4)
  } else {
    result = value.slice(0, ((len-1) / 4) + 1) + star + value.slice(-(len-1) / 4)
  }
  return result
})

function formatDateByType (date, fmt) {
  date = new Date(date)
  if (typeof (fmt) === 'undefined') {
    fmt = 'yyyy-MM-dd HH:mm:ss'
  }
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
  }
  let o = {
    'M+': date.getMonth() + 1,
    'd+': date.getDate(),
    'H+': date.getHours(),
    'm+': date.getMinutes(),
    's+': date.getSeconds()
  }
  for (let k in o) {
    if (new RegExp(`(${k})`).test(fmt)) {
      let str = o[k] + ''
      fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? str : ('00' + str).substr(str.length))
    }
  }
  return fmt
};

// 定义一个时间过滤器
Vue.filter('FormatDateByType', function (date, fmt) {
  return formatDateByType(date, fmt)
})

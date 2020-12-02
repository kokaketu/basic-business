import dayjs from 'dayjs'
export * from './validateRules'

/**
 * 时间格式化
 * @param date
 * @param template {string?}
 * @return {string}
 */
export function format (date, template = 'YYYY-MM-DD') {
  return dayjs(date).format(template)
}

/**
 * 日期解析
 * @param dateStr
 * @param template {string?}
 * @return {string}
 */
export function parse (dateStr, template = 'YYYY-MM-DD') {
  return dayjs(dateStr, template).toDate()
}

/**
 * 判断元素是否为空
 * @param obj
 * @returns {boolean}
 */
export function isEmpty (obj) {
  return obj === null || obj === undefined || obj === ''
}

export function isNotEmpty (obj) {
  return !isEmpty(obj)
}

/**
 * 根据税率和含税金额计算税额， 税额 = 含税金额 - (含税金额 / (1 + 税率 / 100))
 * @param money
 * @param tax
 */
export function tax (money, tax) {
  if (isEmpty(money) || isEmpty(tax)) {
    return 0.00
  } else {
    return (money - money / (1 + tax / 100)).toFixed(2)
  }
}

/**
 * 数组转对象
 * @param options 数组
 * @param value 数组元素的唯一值
 * @param label 数组元素的title
 * @returns {{hash: {}}}
 */
export function listToHash (options, value, label) {
  var result = {hash: {}}
  options.forEach(function (option) {
    if (!option[value]) {
      return false
    }
    result.hash[option[value]] = option
    if (!option.text) {
      if (option[label]) {
        option.text = option[label]
      } else if (option.name) {
        option.text = option.name
      } else if (option.title) {
        option.text = option.title
      } else {
        option.text = '未知(name、title不存在)'
      }
    }
  })
  return result
}

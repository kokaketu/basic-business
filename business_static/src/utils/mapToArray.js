export function mapToArray (data) {
  let isObject = Object.prototype.toString.call(data) === '[object Object]'
  if (isObject) {
    let arr = []
    for (const key in data) {
      if (data.hasOwnProperty(key)) {
        arr.push({
          label: data[key],
          value: key
        })
      }
    }
    return arr
  } else {
    console.error('参数类型非对象！')
  }
}

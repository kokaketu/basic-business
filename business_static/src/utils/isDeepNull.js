class DeepNull {
  constructor (data) {
    this.result = []
    this.getResult(data)
  }
  getType (value) {
    return Object.prototype.toString.call(value).slice(8, -1)
  }
  getResult (data) {
    let type = this.getType(data)
    if (type === 'Array') {
      data.map(item => this.getResult(item))
    } else if (type === 'Object') {
      for (const key in data) {
        this.getResult(data[key])
      }
    } else {
      this.result.push(data)
    }
  }
  toString () {
    return this.result.filter(item => (Boolean(item) && !!Number(item))).length > 0
  }
}
/**
 * 对象属性都为空时转为null
 * @param {*} params
 */
export function isDeepNull (data) {
  const deepNull = new DeepNull(data)
  return deepNull.toString()
}

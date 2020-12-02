import {
  getBuildingNameList,
  getFloorNameList,
  getAssetLayoutEnumList,
  getOperationStageEnumList,
  getAssetStatusEnumList,
  getAssetName
} from '@/http/assets'
// 清空筛选条件
export function reset (object) {
  for (const key in object) {
    let type = Object.prototype.toString.call(object[key])
    type === '[object Array]' ? object[key] = [] : object[key] = ''
  }
}
/**
 * 下拉选择，对象转数组
 * @param {obj}
 */
export function objToArray (obj) {
  let isObject = Object.prototype.toString.call(obj) === '[object Object]'
  if (isObject) {
    let arr = []
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        arr.push({
          label: obj[key],
          value: key
        })
      }
    }
    return arr
  } else {
    console.error('参数类型非对象！')
  }
}
// 项目业态下拉框
export function getAssetLayoutList () {
  return new Promise((resolve, reject) => {
    getAssetLayoutEnumList().then(res => {
      resolve(res)
    })
  })
}
// 项目经营阶段
export function getOperationStageList () {
  return new Promise((resolve, reject) => {
    getOperationStageEnumList().then(res => {
      resolve(res)
    })
  })
}
// 资产分类
export function getAssetStatusList (params) {
  return new Promise((resolve, reject) => {
    getAssetStatusEnumList().then(res => {
      resolve(res)
    })
  })
}
// 根据主题查询项目名称列表
export function getAssetNameList (mainId) {
  return new Promise((resolve, reject) => {
    getAssetName({mainId}).then(res => {
      resolve(res)
    })
  })
}

// 根据项目id查询楼栋名称列表
export function getBuildingList (assetId) {
  return new Promise((resolve, reject) => {
    getBuildingNameList({assetId}).then(res => {
      resolve(res)
    })
  })
}

// 根据楼栋id查询楼层名称列表-下拉框
export function getFloorList (buildingId) {
  return new Promise((resolve, reject) => {
    getFloorNameList({buildingId}).then(res => {
      resolve(res)
    })
  })
}

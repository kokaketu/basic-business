let businessBaseInfo = [{
  hasUnit: false,
  type: 'text',
  name: '项目',
  key: 'assetName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼栋',
  key: 'buildingName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼层名称',
  key: 'floorName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '租赁单元编号',
  key: 'roomNo',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '店型定位',
  key: 'storePositioning',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '业态定位',
  key: 'layoutPositioning',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '总建筑面积',
  key: 'buildingArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '套内面积',
  key: 'innerArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '可出租面积',
  key: 'rentableArea',
  value: ''
}]

let officeBaseInfo = [{
  hasUnit: false,
  type: 'text',
  name: '项目',
  key: 'assetName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼栋',
  key: 'buildingName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼层名称',
  key: 'floorName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '租赁单元编号',
  key: 'roomNo',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '总建筑面积',
  key: 'buildingArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '套内面积',
  key: 'innerArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '可出租面积',
  key: 'rentableArea',
  value: ''
}]

let parkBaseInfo = [{
  hasUnit: false,
  type: 'text',
  name: '项目',
  key: 'assetName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼栋',
  key: 'buildingName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '楼层名称',
  key: 'floorName',
  value: ''
}, {
  hasUnit: false,
  type: 'text',
  name: '租赁单元编号',
  key: 'roomNo',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '总建筑面积',
  key: 'buildingArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '套内面积',
  key: 'innerArea',
  value: ''
}, {
  hasUnit: true,
  unit: '㎡',
  type: 'number',
  name: '可出租面积',
  key: 'rentableArea',
  value: ''
}]

const engineeringObject = {
  ceiling: [{
    value: '1',
    label: '封闭吊顶'
  },{
    value: '2',
    label: '格栅'
  },{
    value: '3',
    label: '无吊顶'
  }],
  ground: [{
    value: '1',
    label: '地砖'
  },{
    value: '2',
    label: '木地板'
  },{
    value: '3',
    label: '涂料'
  },{
    value: '4',
    label: '其他'
  }],
  strongCurrentType: [{
    value: '1',
    label: '单相'
  },{
    value: '2',
    label: '三相'
  }],
  networkInterface: [{
    value: '1',
    label: '是'
  },{
    value: '2',
    label: '否'
  }]
}

const engineeringArray = [
  {name: '天花', key: 'ceilingStr', value: ''},
  {name: '地面', key: 'groundStr', value: ''},
  {name: '结构/荷载(KN/㎡)', key: 'structure', value: ''},
  {name: '门窗(数量)', key: 'windowNum', value: ''},
  {name: '门窗大小(m)', key: 'windowSize', value: ''},
  {name: '柱距(m)', key: 'pillarSpacing', value: ''},
  {name: '门头/店招(m)', key: 'signHeight', value: ''},
  {name: '空调数量', key: 'airConditioning', value: ''},
  {name: '强电(相数)', key: 'strongCurrentTypeStr', value: ''},
  {name: '强电(功率)(KW)', key: 'strongCurrentPower', value: ''},
  {name: '弱电(网络接口)', key: 'networkInterfaceStr', value: ''},
  {name: '给水(数量)', key: 'waterSupplyNum', value: ''},
  {name: '给水(管径)(mm)', key: 'waterSupplyPipeDiameter', value: ''},
  {name: '排水(数量)', key: 'drainNum', value: ''},
  {name: '排水(管径)(mm)', key: 'drainPipeDiameter', value: ''},
  {name: '排烟(数量)', key: 'smokeExhaustNum', value: ''},
  {name: '排烟(管径)(mm)', key: 'smokeExhaustPipeDiameter', value: ''},
  {name: '天然气(数量)', key: 'naturalGasNum', value: ''},
  {name: '天然气管径(mm)', key: 'naturalGasPipeDiameter', value: ''},
  {name: '消防(喷淋头数量)', key: 'sprinkler', value: ''},
  {name: '消防(烟雾感应数量)', key: 'smokeSensor', value: ''},
  {name: '消防(温度感应数量)', key: 'temperatureSensor', value: ''}
]
export {
  businessBaseInfo,
  officeBaseInfo,
  parkBaseInfo,
  engineeringObject,
  engineeringArray
}

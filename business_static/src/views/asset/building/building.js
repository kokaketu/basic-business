let baseInfo = [
  {
    hasUnit: false,
    type: 'text',
    name: '项目',
    key: 'assetName',
    value: ''
  }, {
    hasUnit: false,
    type: 'text',
    name: '楼栋名称',
    key: 'buildingName',
    value: ''
  }
]

const cyyInfo = [
  {
    hasUnit: false,
    type: 'text',
    name: '所属分期',
    key: 'stagesName',
    value: ''
  }, {
    hasUnit: false,
    type: 'text',
    name: '建筑形态',
    key: 'buildingFormStr',
    value: ''
  }
]

const buildInfo = [
  {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '总建筑面积',
    key: 'totalBuildingArea',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '地上建筑面积',
    key: 'groundAreaUp',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '地下建筑面积',
    key: 'groundAreaDown',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '总套内面积',
    key: 'innerArea',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '总经营面积',
    key: 'businessArea',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '总可出租面积',
    key: 'rentableArea',
    value: ''
  }, {
    hasUnit: true,
    unit: 'm',
    type: 'number',
    name: '首层层高',
    key: 'firstFloorHeight',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '首层面积',
    key: 'firstFloorArea',
    value: ''
  }, {
    hasUnit: true,
    unit: 'm',
    type: 'number',
    name: '标准层层高',
    key: 'standardFloorHeight',
    value: ''
  }, {
    hasUnit: true,
    unit: '㎡',
    type: 'number',
    name: '标准层面积',
    key: 'standardFloorArea',
    value: ''
  }
]

const CQInfo = [
  {
    hasUnit: false,
    type: 'date',
    name: '竣工时间',
    key: 'beCompletedDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '交付时间',
    key: 'deliverDate',
    value: ''
  }
]

const CQInfo1 = [
  {
    hasUnit: false,
    type: 'date',
    name: '开业时间',
    key: 'openingDate',
    value: ''
  }
]

const QYInfo = [
  {
    hasUnit: false,
    type: 'date',
    name: '竣工时间',
    key: 'beCompletedDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '交付时间',
    key: 'deliverDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '开业时间',
    key: 'openingDate',
    value: ''
  }
]

const JYGSInfo = [
  {
    hasUnit: false,
    type: 'date',
    name: '竣工时间',
    key: 'beCompletedDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '交付时间',
    key: 'deliverDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '开业时间',
    key: 'openingDate',
    value: ''
  }
]

const WGGSInfo = [
  {
    hasUnit: false,
    type: 'date',
    name: '竣工时间',
    key: 'beCompletedDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '交付时间',
    key: 'deliverDate',
    value: ''
  }, {
    hasUnit: false,
    type: 'date',
    name: '开业时间',
    key: 'openingDate',
    value: ''
  }
]

export {
  baseInfo, buildInfo, CQInfo, QYInfo, JYGSInfo, WGGSInfo, cyyInfo, CQInfo1
}

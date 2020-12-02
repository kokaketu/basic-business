export const fieldData = [
  {
    id: 1,
    name: '项目基本信息',
    children: [
      {
        name: '项目名称',
        hasUnit: false,
        type: 'text',
        key: 'assetName',
        value: ''
      },
      {
        name: '其他名称',
        hasUnit: false,
        type: 'text',
        key: 'shortName',
        value: ''
      },
      {
        name: '项目现状',
        hasUnit: false,
        type: 'text',
        key: 'assetPresentSituationStr',
        value: ''
      },
      {
        name: '业态',
        hasUnit: false,
        type: 'text',
        key: 'assetLayoutStr',
        value: ''
      },
      {
        name: '竣工时间',
        hasUnit: false,
        type: 'text',
        key: 'beCompletedDateStr',
        value: ''
      },
      {
        name: '物业等级',
        hasUnit: false,
        type: 'text',
        key: 'propertyGradeStr',
        value: ''
      },
      {
        name: '项目介绍',
        hasUnit: false,
        type: 'text',
        key: 'assetIntroduce',
        value: ''
      }
    ]
  },
  {
    id: 2,
    name: '区位信息',
    children: [
      // {
      //   name: '所在城市',
      //   hasUnit: false,
      //   type: 'text',
      //   key: 'cityName',
      //   value: ''
      // },
      {
        name: '所在区域',
        hasUnit: false,
        type: 'text',
        key: 'region',
        value: ''
      },
      {
        name: '详细地址',
        hasUnit: false,
        type: 'text',
        key: 'address',
        value: ''
      },
      {
        name: '经度',
        hasUnit: false,
        type: 'text',
        key: 'latitude',
        value: ''
      },
      {
        name: '纬度',
        hasUnit: false,
        type: 'text',
        key: 'longitude',
        value: ''
      },
      {
        name: '环线位置',
        hasUnit: false,
        type: 'text',
        key: 'loopLinePosition',
        value: ''
      },
      {
        name: '所属商务区',
        hasUnit: false,
        type: 'text',
        key: 'businessName',
        value: ''
      },
      {
        name: '项目四至(东)',
        hasUnit: false,
        type: 'text',
        key: 'nearByRoadE',
        value: ''
      },
      {
        name: '项目四至(西)',
        hasUnit: false,
        type: 'text',
        key: 'nearByRoadS',
        value: ''
      },
      {
        name: '项目四至(南)',
        hasUnit: false,
        type: 'text',
        key: 'nearByRoadW',
        value: ''
      },
      {
        name: '项目四至(北)',
        hasUnit: false,
        type: 'text',
        key: 'nearByRoadN',
        value: ''
      }
    ]
  },
  {
    id: 3,
    name: '企业信息',
    children: [
      {
        name: '物业公司',
        hasUnit: false,
        type: 'text',
        key: 'property',
        value: ''
      },
      {
        name: '开发商',
        hasUnit: false,
        type: 'text',
        key: 'developers',
        value: ''
      },
      {
        name: '运营商',
        hasUnit: false,
        type: 'text',
        key: 'operators',
        value: ''
      },
      {
        name: '资产拥有方',
        hasUnit: false,
        type: 'text',
        key: 'assetOwner',
        value: ''
      }
    ]
  },
  {
    id: 4,
    name: '建筑信息',
    children: [
      {
        name: '总建筑面积',
        hasUnit: false,
        type: 'text',
        key: 'totalBuildingArea',
        value: '',
        unit: '㎡'
      },
      {
        name: '办公总栋数',
        hasUnit: false,
        type: 'text',
        key: 'officeFloorCount',
        value: '',
        unit: '栋',
        isShow: true
      },
      {
        name: '标准层面积',
        hasUnit: false,
        type: 'text',
        key: 'standardLayerArea',
        value: '',
        unit: '㎡'
      },
      {
        name: '总车位数',
        hasUnit: false,
        type: 'text',
        key: 'parkingLotNum',
        value: '',
        unit: '个'
      },
      {
        name: '占地面积',
        hasUnit: false,
        type: 'text',
        key: 'areaCovered',
        value: '',
        unit: '㎡'
      },
      {
        name: '写字楼面积',
        hasUnit: false,
        type: 'text',
        key: 'officeBuildingArea',
        value: '',
        unit: '㎡',
        isShow: true
      },
      {
        name: '得房率',
        hasUnit: false,
        type: 'text',
        key: 'occupancyRate',
        value: '',
        unit: '%'
      },
      {
        name: '地上楼层数',
        hasUnit: false,
        type: 'text',
        key: 'groundFloorUp',
        value: '',
        unit: '层'
      },
      {
        name: '地下楼层数',
        hasUnit: false,
        type: 'text',
        key: 'groundFloorDown',
        value: '',
        unit: '层'
      },
      {
        name: '环保认证',
        hasUnit: false,
        type: 'text',
        key: 'envirCertify',
        value: '',
        isShow: true
      }
    ]
  },
  {
    id: 5,
    name: '租户信息',
    children: [
      {
        name: '主力租户',
        hasUnit: false,
        type: 'text',
        key: 'mainTenant',
        value: ''
      },
      {
        name: '租户行业特征',
        hasUnit: false,
        type: 'text',
        key: 'tenantCharacteristics',
        value: ''
      }
    ]
  }
]

export const housingData = [
  {
    id: 6,
    name: '房源基础信息',
    children: [
      {
        name: '租赁单元名称',
        hasUnit: false,
        type: 'text',
        key: 'roomNo',
        value: ''
      },
      {
        name: '总建筑面积',
        hasUnit: false,
        type: 'text',
        key: 'buildingArea',
        value: '',
        unit: '㎡'
      },
      {
        name: '所在楼栋',
        hasUnit: false,
        type: 'text',
        key: 'buildingName',
        value: ''
      },
      {
        name: '所在楼层',
        hasUnit: false,
        type: 'text',
        key: 'floorNum',
        value: ''
      },
      {
        name: '朝向',
        hasUnit: false,
        type: 'text',
        key: 'orientationStr',
        value: ''
      },
      {
        name: '交付标准',
        hasUnit: false,
        type: 'text',
        key: 'deliveryStandardsStr',
        value: ''
      },
      {
        name: '是否可注册',
        hasUnit: false,
        type: 'text',
        key: 'canRegisterStr',
        value: ''
      },
      {
        name: '是否可分割',
        hasUnit: false,
        type: 'text',
        key: 'canDivisionStr',
        value: ''
      },
      {
        name: '房源亮点',
        hasUnit: false,
        type: 'text',
        key: 'advantage',
        value: ''
      }
    ]
  },
  {
    id: 7,
    name: '招商要求',
    children: [
      {
        name: '租金',
        hasUnit: false,
        type: 'text',
        key: 'rentalPrice',
        value: '',
        unit: '元/㎡/天'
      },
      {
        name: '物业费',
        hasUnit: false,
        type: 'text',
        key: 'propertyPrice',
        value: '',
        unit: '元/㎡/天'
      },
      {
        name: '业态',
        hasUnit: false,
        type: 'text',
        key: 'layoutPositioningStr',
        value: ''
      },
      // {
      //   name: '行业',
      //   hasUnit: false,
      //   type: 'text',
      //   key: 'industryStr',
      //   value: ''
      // },
      // {
      //   name: '竣工时间',
      //   hasUnit: false,
      //   type: 'text',
      //   key: 'rentDateStr',
      //   value: ''
      // },
      {
        name: '预计入驻时间',
        hasUnit: false,
        type: 'text',
        key: 'rentDateStr',
        value: ''
      },
      {
        name: '最短租期',
        hasUnit: false,
        type: 'text',
        key: 'minLeaseTerm',
        value: '',
        unit: '年'
      },
      {
        name: '佣金规则',
        hasUnit: false,
        type: 'text',
        key: 'brokerage',
        value: ''
      }
    ]
  },
  {
    id: 8,
    name: '联系人',
    children: [
      {
        name: '联系人',
        hasUnit: false,
        type: 'text',
        key: 'contactPerson',
        value: ''
      },
      {
        name: '联系电话',
        hasUnit: false,
        type: 'text',
        key: 'phone',
        value: ''
      }
    ]
  }
]

export const housingData1 = [
  {
    id: 6,
    name: '房源基础信息',
    children: [
      {
        name: '租赁单元名称',
        hasUnit: false,
        type: 'text',
        key: 'roomNo',
        value: ''
      },
      {
        name: '总建筑面积',
        hasUnit: false,
        type: 'text',
        key: 'buildingArea',
        value: '',
        unit: '㎡'
      },
      {
        name: '所在楼栋',
        hasUnit: false,
        type: 'text',
        key: 'buildingName',
        value: ''
      },
      {
        name: '所在楼层',
        hasUnit: false,
        type: 'text',
        key: 'floorNum',
        value: ''
      },
      {
        name: '朝向',
        hasUnit: false,
        type: 'text',
        key: 'orientationStr',
        value: ''
      },
      {
        name: '交付标准',
        hasUnit: false,
        type: 'text',
        key: 'deliveryStandardsStr',
        value: ''
      },
      {
        name: '是否可注册',
        hasUnit: false,
        type: 'text',
        key: 'canRegisterStr',
        value: ''
      },
      {
        name: '是否可分割',
        hasUnit: false,
        type: 'text',
        key: 'canDivisionStr',
        value: ''
      },
      {
        name: '房源亮点',
        hasUnit: false,
        type: 'text',
        key: 'advantage',
        value: ''
      }
    ]
  },
  {
    id: 7,
    name: '招商要求',
    children: [
      {
        name: '租金',
        hasUnit: false,
        type: 'text',
        key: 'rentalPrice',
        value: '',
        unit: '元/㎡/天'
      },
      {
        name: '物业费',
        hasUnit: false,
        type: 'text',
        key: 'propertyPrice',
        value: '',
        unit: '元/㎡/天'
      },
      // {
      //   name: '业态',
      //   hasUnit: false,
      //   type: 'text',
      //   key: 'layoutPositioningStr',
      //   value: ''
      // },
      {
        name: '行业',
        hasUnit: false,
        type: 'text',
        key: 'industryStr',
        value: ''
      },
      // {
      //   name: '竣工时间',
      //   hasUnit: false,
      //   type: 'text',
      //   key: 'rentDateStr',
      //   value: ''
      // },
      {
        name: '预计入驻时间',
        hasUnit: false,
        type: 'text',
        key: 'rentDateStr',
        value: ''
      },
      {
        name: '最短租期',
        hasUnit: false,
        type: 'text',
        key: 'minLeaseTerm',
        value: '',
        unit: '年'
      },
      {
        name: '佣金规则',
        hasUnit: false,
        type: 'text',
        key: 'brokerage',
        value: ''
      }
    ]
  },
  {
    id: 8,
    name: '联系人',
    children: [
      {
        name: '联系人',
        hasUnit: false,
        type: 'text',
        key: 'contactPerson',
        value: ''
      },
      {
        name: '联系电话',
        hasUnit: false,
        type: 'text',
        key: 'phone',
        value: ''
      }
    ]
  }
]

export const buildingData = [
  {
    name: '楼栋名称',
    hasUnit: false,
    type: 'text',
    key: 'buildingName',
    value: ''
  },
  {
    name: '总建面积',
    hasUnit: false,
    type: 'text',
    key: 'buildingArea',
    value: '',
    unit: '㎡'
  },
  {
    name: '标准层面积',
    hasUnit: false,
    type: 'text',
    key: 'standardFloorArea',
    value: '',
    unit: '㎡'
  },
  {
    name: '楼层数',
    hasUnit: false,
    type: 'text',
    key: 'floorNum',
    value: '',
    unit: '层'
  },
  {
    name: '得房率',
    hasUnit: false,
    type: 'text',
    key: 'occupancyRate',
    value: '',
    unit: '%'
  },
  {
    name: '净层高',
    hasUnit: false,
    type: 'text',
    key: 'netFloorHeight',
    value: '',
    unit: 'm'
  },
  {
    name: '客梯',
    hasUnit: false,
    type: 'text',
    key: 'directPassengerElevator',
    value: '',
    unit: '部'
  },
  {
    name: '货梯',
    hasUnit: false,
    type: 'text',
    key: 'cargoLift',
    value: '',
    unit: '部'
  },
  {
    name: '空调系统',
    hasUnit: false,
    type: 'text',
    key: 'airConditioningSystem',
    value: ''
  }
]

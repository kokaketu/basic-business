const project = () => import('@/views/asset/project')
const projectCreate = () => import('@/views/asset/project/create')
const projectDetail = () => import('@/views/asset/project/detail')
const projectEdit = () => import('@/views/asset/project/edit')
const importTemplate = () => import('@/views/asset/imports')
const building = () => import('@/views/asset/building')
const buildingDetail = () => import('@/views/asset/building/detail')
const buildingCreate = () => import('@/views/asset/building/create')
const buildingEdit = () => import('@/views/asset/building/edit')
const floor = () => import('@/views/asset/floor')
const floorCreate = () => import('@/views/asset/floor/create')
const floorDetail = () => import('@/views/asset/floor/detail')
const floorEdit = () => import('@/views/asset/floor/edit')
const unit = () => import('@/views/asset/rentalUnit')
const unitCreate = () => import('@/views/asset/rentalUnit/create')
const unitDetail = () => import('@/views/asset/rentalUnit/detail')
const unitEdit = () => import('@/views/asset/rentalUnit/edit')
const device = () => import('@/views/asset/device')
const deviceCreate = () => import('@/views/asset/device/create')
const deviceDetail = () => import('@/views/asset/device/detail')
const deviceEdit = () => import('@/views/asset/device/edit')
const staging = () => import('@/views/asset/staging')
const stagingCreate = () => import('@/views/asset/staging/create')
const stagingDetail = () => import('@/views/asset/staging/detail')
const stagingEdit = () => import('@/views/asset/staging/edit')

const multiplePoints = () => import('@/views/asset/multiplePoints')
const multiplePointsCreate = () => import('@/views/asset/multiplePoints/create')
const multiplePointsDetail = () => import('@/views/asset/multiplePoints/detail')
const multiplePointsEdit = () => import('@/views/asset/multiplePoints/edit')
export default [
  {
    name: 'project',
    path: '/asset/project',
    component: project,
    meta: {
      title: '项目信息',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/project',
        title: '项目信息'
      }]
    }
  },
  {
    name: '新建项目',
    path: '/asset/project/create',
    component: projectCreate,
    meta: {
      title: '新建项目',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/project',
        title: '项目信息'
      }, {
        path: '',
        title: '新建项目'
      }]
    }
  },
  {
    name: '项目详情',
    path: '/asset/project/detail/:id',
    component: projectDetail,
    meta: {
      title: '项目详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/project',
        title: '项目信息'
      }, {
        path: '',
        title: '项目详情'
      }]
    }
  },
  {
    name: '编辑项目',
    path: '/asset/project/edit/:id',
    component: projectEdit,
    meta: {
      title: '编辑项目',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/project',
        title: '项目信息'
      }, {
        path: '',
        title: '编辑项目'
      }]
    }
  },
  {
    name: '导入项目',
    path: '/asset/project/import',
    component: importTemplate,
    meta: {
      title: '项目数据导入',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/project',
        title: '项目信息'
      }, {
        path: '/asset/project/import',
        title: '项目数据导入'
      }]
    }
  },
  {
    name: 'staging',
    path: '/asset/staging',
    component: staging,
    meta: {
      title: '产业园分期',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/staging',
        title: '产业园分期'
      }]
    }
  },
  {
    name: '新建分期',
    path: '/asset/staging/create',
    component: stagingCreate,
    meta: {
      title: '新建分期',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/staging',
        title: '分期信息'
      }, {
        path: '',
        title: '新建分期'
      }]
    }
  },
  {
    name: '分期详情',
    path: '/asset/staging/detail/:id',
    component: stagingDetail,
    meta: {
      title: '分期详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/staging',
        title: '分期信息'
      }, {
        path: '',
        title: '分期详情'
      }]
    }
  },
  {
    name: '分期编辑',
    path: '/asset/staging/edit/:id',
    component: stagingEdit,
    meta: {
      title: '分期编辑',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/staging',
        title: '分期信息'
      }, {
        path: '',
        title: '分期编辑'
      }]
    }
  },
  {
    name: '导入分期',
    path: '/asset/staging/import',
    component: importTemplate,
    meta: {
      title: '导入分期',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/staging',
        title: '产业园分期'
      }, {
        path: '/asset/staging/import',
        title: '导入分期'
      }]
    }
  },
  {
    name: 'building',
    path: '/asset/building',
    component: building,
    meta: {
      title: '楼栋信息',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/building',
        title: '楼栋信息'
      }]
    }
  },
  {
    name: '新建楼栋',
    path: '/asset/building/create',
    component: buildingCreate,
    meta: {
      title: '新建楼栋',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/building',
        title: '楼栋信息'
      }, {
        path: '',
        title: '新建楼栋'
      }]
    }
  },
  {
    name: '楼栋编辑',
    path: '/asset/building/edit/:id',
    component: buildingEdit,
    meta: {
      title: '楼栋编辑',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/building',
        title: '楼栋信息'
      }, {
        path: '',
        title: '楼栋编辑'
      }]
    }
  },
  {
    name: '楼栋详情',
    path: '/asset/building/detail/:id',
    component: buildingDetail,
    meta: {
      title: '楼栋详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/building',
        title: '楼栋信息'
      }, {
        path: '',
        title: '楼栋详情'
      }]
    }
  },
  {
    name: '导入楼栋',
    path: '/asset/building/import',
    component: importTemplate,
    meta: {
      title: '楼栋数据导入',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/building',
        title: '楼栋信息'
      }, {
        path: '/asset/building/import',
        title: '楼栋数据导入'
      }]
    }
  },
  {
    name: 'floor',
    path: '/asset/floor',
    component: floor,
    meta: {
      title: '楼层信息',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/floor',
        title: '楼层信息'
      }]
    }
  },
  {
    name: '新建楼层',
    path: '/asset/floor/create',
    component: floorCreate,
    meta: {
      title: '新建楼层',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/floor',
        title: '楼层信息'
      }, {
        path: '',
        title: '新建楼层'
      }]
    }
  },
  {
    name: '楼层详情',
    path: '/asset/floor/detail/:id',
    component: floorDetail,
    meta: {
      title: '楼层详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/floor',
        title: '楼层信息'
      }, {
        path: '',
        title: '楼层详情'
      }]
    }
  },
  {
    name: '楼层编辑',
    path: '/asset/floor/edit/:id',
    component: floorEdit,
    meta: {
      title: '楼层编辑',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/floor',
        title: '楼层信息'
      }, {
        path: '',
        title: '楼层编辑'
      }]
    }
  },
  {
    name: '导入楼层',
    path: '/asset/floor/import',
    component: importTemplate,
    meta: {
      title: '楼层数据导入',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/floor',
        title: '楼层信息'
      }, {
        path: '/asset/floor/import',
        title: '楼层数据导入'
      }]
    }
  },
  {
    name: 'rentalUnit',
    path: '/asset/rentalUnit',
    component: unit,
    meta: {
      title: '租赁单元',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/rentalUnit',
        title: '租赁单元'
      }]
    }
  },
  {
    name: '新建租赁单元',
    path: '/asset/rentalUnit/create',
    component: unitCreate,
    meta: {
      title: '新建租赁单元',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/rentalUnit',
        title: '租赁单元'
      }, {
        path: '',
        title: '新建租赁单元'
      }]
    }
  },
  {
    name: '租赁单元详情',
    path: '/asset/rentalUnit/detail/:id/:assetLayout',
    component: unitDetail,
    meta: {
      title: '租赁单元详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/rentalUnit',
        title: '租赁单元'
      }, {
        path: '',
        title: '租赁单元详情'
      }]
    }
  },
  {
    name: '编辑租赁单元',
    path: '/asset/rentalUnit/edit/:id/:assetLayout',
    component: unitEdit,
    meta: {
      title: '编辑租赁单元',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/rentalUnit',
        title: '租赁单元'
      }, {
        path: '',
        title: '编辑租赁单元'
      }]
    }
  },
  {
    name: '导入租赁单元',
    path: '/asset/rentalUnit/import',
    component: importTemplate,
    meta: {
      title: '租赁单元数据导入',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/rentalUnit',
        title: '租赁单元'
      }, {
        path: '/asset/rentalUnit/import',
        title: '租赁单元数据导入'
      }]
    }
  },
  {
    name: 'multiplePoints',
    path: '/asset/multiplePoints',
    component: multiplePoints,
    meta: {
      title: '多经点位',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/multiplePoints',
        title: '多经点位'
      }]
    }
  },
  {
    name: '新建多经点位',
    path: '/asset/multiplePoints/create',
    component: multiplePointsCreate,
    meta: {
      title: '新建多经点位',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/multiplePoints',
        title: '多经点位'
      }, {
        path: '',
        title: '新建多经点位'
      }]
    }
  },
  {
    name: '多经点位详情',
    path: '/asset/multiplePoints/detail/:id',
    component: multiplePointsDetail,
    meta: {
      title: '多经点位详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/multiplePoints',
        title: '多经点位'
      }, {
        path: '',
        title: '多经点位详情'
      }]
    }
  },
  {
    name: '编辑多经点位',
    path: '/asset/multiplePoints/edit/:id',
    component: multiplePointsEdit,
    meta: {
      title: '编辑多经点位',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/multiplePoints',
        title: '多经点位'
      }, {
        path: '',
        title: '编辑多经点位'
      }]
    }
  },
  {
    name: 'device',
    path: '/asset/device',
    component: device,
    meta: {
      title: '设备台账',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/device',
        title: '设备台账'
      }]
    }
  },
  {
    name: '新建设备',
    path: '/asset/device/create',
    component: deviceCreate,
    meta: {
      title: '新建设备',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/device',
        title: '设备台账'
      }, {
        path: '',
        title: '新建设备'
      }]
    }
  },
  {
    name: '设备详情',
    path: '/asset/device/detail/:id',
    component: deviceDetail,
    meta: {
      title: '设备详情',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/device',
        title: '设备台账'
      }, {
        path: '',
        title: '设备详情'
      }]
    }
  },
  {
    name: '编辑设备',
    path: '/asset/device/edit/:id',
    component: deviceEdit,
    meta: {
      title: '编辑设备',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/device',
        title: '设备台账'
      }, {
        path: '',
        title: '编辑设备'
      }]
    }
  },
  {
    name: '导入设备',
    path: '/asset/device/import',
    component: importTemplate,
    meta: {
      title: '导入设备',
      name: 'MENU_ASSET_FILES',
      breadcrumb: [{
        path: '',
        title: '资产档案'
      }, {
        path: '/asset/device',
        title: '设备台账'
      }, {
        path: '',
        title: '导入设备'
      }]
    }
  },
]

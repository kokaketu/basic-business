export default [
  {
    name: 'diagnosis',
    path: '/diagnosis/index',
    component: () => import('@/views/diagnosis'),
    meta: {
      title: '诊断报告',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }]
    }
  },
  {
    name: 'diagnosis-office',
    path: '/diagnosis/office/create/:data',
    component: () => import('@/views/diagnosis/office/create'),
    meta: {
      title: '提交数据',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/office/create/:data',
        title: '提交数据'
      }]
    }
  },
  {
    name: 'diagnosis-office',
    path: '/diagnosis/office/detail/:data',
    component: () => import('@/views/diagnosis/office/detail'),
    meta: {
      title: '查看数据',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/office/detail/:data',
        title: '查看数据'
      }]
    }
  },
  {
    name: 'diagnosis-office-report',
    path: '/diagnosis/office/report/:data',
    component: () => import('@/views/diagnosis/office/report'),
    meta: {
      title: '预览报告',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '',
        title: '预览报告'
      }]
    }
  },

  {
    name: 'diagnosis-park',
    path: '/diagnosis/park/create/:data',
    component: () => import('@/views/diagnosis/park/create'),
    meta: {
      title: '提交数据',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/park/create/:data',
        title: '提交数据'
      }]
    }
  },
  {
    name: 'diagnosis-park',
    path: '/diagnosis/park/detail/:data',
    component: () => import('@/views/diagnosis/park/detail'),
    meta: {
      title: '查看数据',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/park/detail/:data',
        title: '查看数据'
      }]
    }
  },
  {
    name: 'diagnosis-park-report',
    path: '/diagnosis/park/report/:data',
    component: () => import('@/views/diagnosis/park/report'),
    meta: {
      title: '预览报告',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '',
        title: '预览报告'
      }]
    }
  },

  {
    name: 'diagnosis-detailc',
    path: '/diagnosis/detailc',
    component: () => import('@/views/diagnosis/detailc'),
    meta: {
      title: '诊断报告详情',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/detailc',
        title: '诊断详情'
      }]
    }
  },
  {
    name: 'diagnosis-detailw',
    path: '/diagnosis/detailw',
    component: () => import('@/views/diagnosis/detailw'),
    meta: {
      title: '诊断报告详情',
      name: 'ASSETS_DIAGNOSIS',
      breadcrumb: [{
        path: '',
        title: '资产诊断'
      }, {
        path: '/diagnosis/index',
        title: '诊断报告'
      }, {
        path: '/diagnosis/detailw',
        title: '诊断详情'
      }]
    }
  }
]

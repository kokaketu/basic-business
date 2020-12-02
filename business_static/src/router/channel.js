const intermediary = () => import('@/views/channel/intermediary')
const intermediaryDetail = () => import('@/views/channel/intermediary/detail')
const intermediaryCreate = () => import('@/views/channel/intermediary/create')
const intermediaryEdit = () => import('@/views/channel/intermediary/edit')
const business = () => import('@/views/channel/business')
const businessCreate = () => import('@/views/channel/business/create')
const businessDetail = () => import('@/views/channel/business/detail')
const businessEdit = () => import('@/views/channel/business/edit')
const customer = () => import('@/views/channel/customer')
const customerCreate = () => import('@/views/channel/customer/create')
const customerDetail = () => import('@/views/channel/customer/detail')
const customerEdit = () => import('@/views/channel/customer/edit')
const investment = () => import('@/views/channel/investment')
const investmentDetail = () => import('@/views/channel/investment/detail')
const investmentEdit = () => import('@/views/channel/investment/edit')
export default [{
  name: 'investment',
  path: '/channel/investment',
  component: investment,
  meta: {
    title: '招商计划',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }]
  }
}, {
  name: 'investmentDetail',
  path: '/channel/investment/detail/:id',
  component: investmentDetail,
  meta: {
    title: '招商计划详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }, {
      path: '',
      title: '招商计划详情'
    }]
  }
}, {
  name: 'investmentEdit',
  path: '/channel/investment/edit/:id',
  component: investmentEdit,
  meta: {
    title: '招商计划编辑',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }, {
      path: '',
      title: '招商计划编辑'
    }]
  }
}, {
  name: 'intermediary',
  path: '/channel/intermediary',
  component: intermediary,
  meta: {
    title: '渠道管理',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '',
      title: '渠道管理'
    }]
  }
}, {
  name: 'intermediaryDetail',
  path: '/channel/intermediary/detail/:id',
  component: intermediaryDetail,
  meta: {
    title: '渠道详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '渠道详情'
    }]
  }
}, {
  name: 'intermediaryCreate',
  path: '/channel/intermediary/create',
  component: intermediaryCreate,
  meta: {
    title: '新建渠道',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '新建渠道'
    }]
  }
}, {
  name: 'intermediaryEdit',
  path: '/channel/intermediary/edit/:id',
  component: intermediaryEdit,
  meta: {
    title: '编辑渠道',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '编辑渠道'
    }]
  }
}, {
  name: 'customer',
  path: '/channel/customer',
  component: customer,
  meta: {
    title: '客户管理',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }]
  }
}, {
  name: 'customerCreate',
  path: '/channel/customer/create',
  component: customerCreate,
  meta: {
    title: '客户新增',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户新增'
    }]
  }
}, {
  name: 'customerDetail',
  path: '/channel/customer/detail/:id',
  component: customerDetail,
  meta: {
    title: '客户详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户详情'
    }]
  }
}, {
  name: 'customerEdit',
  path: '/channel/customer/edit/:id',
  component: customerEdit,
  meta: {
    title: '客户编辑',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户详情'
    }]
  }
}, {
  name: 'business',
  path: '/channel/business',
  component: business,
  meta: {
    title: '一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '',
      title: '一键招商'
    }]
  }
}, {
  name: 'businessCreate',
  path: '/channel/business/create',
  component: businessCreate,
  meta: {
    title: '新增一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '新增一键招商'
    }]
  }
}, {
  name: 'businessDetail',
  path: '/channel/business/detail/:id',
  component: businessDetail,
  meta: {
    title: '一键招商详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '一键招商详情'
    }]
  }
}, {
  name: 'businessEdit',
  path: '/channel/business/edit/:id',
  component: businessEdit,
  meta: {
    title: '编辑一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '编辑一键招商'
    }]
  }
}]

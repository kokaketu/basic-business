const distribution = () => import('@/views/rentcontrol/distribution/index.vue')
const tenant = () => import('@/views/rentcontrol/tenant')
const tenantDetail = () => import('@/views/rentcontrol/tenant/detail')
const tenantCreate = () => import('@/views/rentcontrol/tenant/create')
const tenantEdit = () => import('@/views/rentcontrol/tenant/edit')

export default [{
  name: 'tenant',
  path: '/rentcontrol/tenant',
  component: tenant,
  meta: {
    title: '租户管理',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }]
  }
}, {
  name: 'tenantDetail',
  path: '/rentcontrol/tenant/detail/:id',
  component: tenantDetail,
  meta: {
    title: '租户详情',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户详情'
    }]
  }
}, {
  name: 'tenantCreate',
  path: '/rentcontrol/tenant/create',
  component: tenantCreate,
  meta: {
    title: '租户新建',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户新建'
    }]
  }
}, {
  name: 'tenantEdit',
  path: '/rentcontrol/tenant/edit/:id',
  component: tenantEdit,
  meta: {
    title: '租户编辑',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户编辑'
    }]
  }
}, {
  name: 'distribution',
  path: '/rentcontrol/distribution',
  component: distribution,
  meta: {
    title: '租控图',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/distribution',
      title: '租控图'
    }]
  }
}]

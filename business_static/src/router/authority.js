export default [
  {
    name: 'personAuthority',
    path: '/authority/index',
    component: () => import('../views/authority/Authority'),
    meta: {
      title: '组织配置',
      name:'MENU_SYSTEM_SETTING',
      breadcrumb: [{
        path: '',
        title: '系统设置'
      }, {
        path: '/authority/index',
        title: '组织配置'
      }]
    }
  },
  {
    name: 'authorityDepartment',
    path: '/authority/department',
    component: () => import('../views/authority/Department'),
    meta: {
      title: '组织配置',
      name:'MENU_SYSTEM_SETTING',
    }
  },
  {
    name: 'authorityDist',
    path: '/authority/dist',
    component: () => import('../views/authority/Dist'),
    meta: {
      title: '权限分配',
      name:'MENU_SYSTEM_SETTING',
    }
  }
]

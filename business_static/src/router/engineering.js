const energy = () => import('@/views/engineering/energy/index')
const energyDetail = () => import('@/views/engineering/energy/detail')
export default [
  {
    name: 'engineering',
    path: '/engineering/energy',
    component: energy,
    meta: {
      title: '能耗管理',
      name:'MENU_ENGIN_PROPERTY',
      breadcrumb: [{
        path: '',
        title: '工程物业'
      }, {
        path: '/engineering/energy',
        title: '能耗管理'
      }]
    }
  },
  {
    name: '编辑/详情',
    path: '/engineering/energy/detail',
    component: energyDetail,
    meta: {
      title: '能耗编辑/详情',
      name:'MENU_ENGIN_PROPERTY',
      breadcrumb: [{
        path: '',
        title: '工程物业'
      }, {
        path: '/engineering/energy',
        title: '能耗管理'
      }]
    }
  }
]

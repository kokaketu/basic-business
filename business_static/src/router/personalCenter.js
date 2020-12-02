export default [
  {
    name: 'personalCenter',
    path: '/personalCenter/index',
    component: () => import('../views/personalCenter/index'),
    meta: {
      title: '人个中心',
      breadcrumb: [{
        path: '',
        title: '系统设置'
      }, {
        path: '/personalCenter/index',
        title: '人个中心'
      }]
    }
  },
  {
    name: 'recentLogin',
    path: '/personalCenter/recentLogin',
    component: () => import('../views/personalCenter/recentLogin'),
    meta: {
      title: '最近登录'
    }
  },
  {
    name: 'myOrder',
    path: '/personalCenter/myOrder',
    component: () => import('../views/personalCenter/myOrder'),
    meta: {
      title: '我的订单'
    }
  },
  {
    name: 'releaseInfo',
    path: '/personalCenter/releaseInfo',
    component: () => import('../views/personalCenter/releaseInfo'),
    meta: {
      title: '发布上架信息'
    }
  }
]

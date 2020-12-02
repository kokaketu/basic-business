const budget = () => import('@/views/budget/index.vue')
const importTemplate = () => import('@/views/asset/imports')
export default [
  {
    name: 'budget',
    path: '/budget',
    component: budget,
    meta: {
      title: 'budget',
      name: 'MENU_BUDGET_MANAGEMENT',
    }
  },
  {
    name: 'budget-making-list',
    path: '/budget/budget-making-list',
    component: () => import('@/views/budget/budget_making_list'),
    meta: {
      title: '预算编制',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: ' 预算管理'
      }, {
        path: '',
        title: '预算编制'
      }]
    }
  },
  {
    name: 'budget-making-create',
    path: '/budget/budget-making-create',
    component: () => import('../views/budget/budget_making_create'),
    meta: {
      title: '新增预算编制',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: ' 预算管理'
      }, {
        path: '/budget/budget-making-list',
        title: '预算编制'
      }, {
        path: '',
        title: '新增预算编制'
      }]
    }
  },
  {
    name: 'budget-making-detail',
    path: '/budget/budget-making-detail',
    component: () => import('../views/budget/budget_making_detail'),
    meta: {
      title: '预算编制详情',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: ' 预算管理'
      }, {
        path: '/budget/budget-making-list',
        title: '预算编制'
      }, {
        path: '',
        title: '预算编制详情'
      }]
    }
  },
  {
    name: 'AuthorizedSubject',
    path: '/budget/subject',
    component: () => import('../views/budget/Subject'),
    meta: {
      title: '预算科目管理',
      name: 'MENU_BUDGET_MANAGEMENT',
    }
  },
  {
    name: 'CopySubject',
    path: '/budget/copy-subject',
    component: () => import('../views/budget/CopySubject'),
    meta: {
      title: '预算科目管理',
      name: 'MENU_BUDGET_MANAGEMENT',
    }
  },
  {
    name: 'budget-exec-list',
    path: '/budget/budget-exec-list',
    component: () => import('../views/budget/budget_exec_list'),
    meta: {
      title: '执行分析',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '预算管理'
      }, {
        path: '/budget/budget-exec-list',
        title: '执行分析'
      }]
    }
  },
  {
    name: 'budget-fill-list',
    path: '/budget/budget-fill-list',
    component: () => import('../views/budget/budget_fill_list'),
    meta: {
      title: '执行填报',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '预算管理'
      }, {
        path: '/budget/budget-fill-list',
        title: '执行填报'
      }]
    }
  },
  {
    name: 'budget-fill-create',
    path: '/budget/budget-fill-create',
    component: () => import('@/views/budget/budget_fill_create'),
    meta: {
      title: '新增执行填报',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '预算管理'
      }, {
        path: '/budget/budget-fill-list',
        title: '执行填报'
      }, {
        path: '',
        title: '新增执行填报'
      }]
    }
  },
  {
    name: 'budget-fill-detail',
    path: '/budget/budget-fill-detail/:data',
    component: () => import('@/views/budget/budget_fill_detail'),
    meta: {
      title: '执行填报详情',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '预算管理'
      }, {
        path: '/budget/budget-fill-list',
        title: '执行填报'
      }, {
        path: '',
        title: '执行填报详情'
      }]
    }
  },
  {
    name: '导入预算编制',
    path: '/budget/budget-making-list/import',
    component: importTemplate,
    meta: {
      title: '导入预算编制',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: ' 预算管理'
      }, {
        path: '/budget/budget-making-list',
        title: '预算编制'
      }, {
        path: '',
        title: '导入预算编制'
      }]
    }
  },
  {
    name: '导入执行填报',
    path: '/budget/budget-fill-list/import',
    component: importTemplate,
    meta: {
      title: '导入执行填报',
      name: 'MENU_BUDGET_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '预算管理'
      }, {
        path: '/budget/budget-fill-list',
        title: '执行填报'
      }, {
        path: '',
        title: '导入执行填报'
      }]
    }
  },
]

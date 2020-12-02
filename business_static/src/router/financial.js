const receivables = () => import('@/views/financial/receivable/list.vue')
const print = () => import('@/views/financial/print.vue')
const receiveds = () => import('@/views/financial/received/list.vue')
const payments = () => import('@/views/financial/payment/list.vue')
const revenueRecognition = () => import('@/views/financial/revenueRecognition.vue')
const costAndExpenseRecognition = () => import('@/views/financial/costAndExpenseRecognition.vue')
const deposits = () => import('@/views/financial/deposit/list.vue')
const arrears = () => import('@/views/financial/arrears/list.vue')

export default [
  {
    name: 'receivables',
    path: '/financial/receivables/:receivableNo?',
    component: receivables,
    meta: {
      title: '应收管理',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/receivables/:receivableNo?',
        title: '应收管理'
      }]
    }
  },
  {
    name: 'print',
    path: '/financial/print',
    component: print,
    meta: {
      title: '账单打印',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/print',
        title: '账单打印'
      }]
    }
  },
  {
    name: 'receiveds',
    path: '/financial/receiveds',
    component: receiveds,
    meta: {
      title: '实收管理',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/receiveds',
        title: '实收管理'
      }]
    }
  },
  {
    name: 'payments',
    path: '/financial/payments',
    component: payments,
    meta: {
      title: '实付管理',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/payments',
        title: '实付管理'
      }]
    }
  },
  {
    name: 'revenueRecognition',
    path: '/financial/revenueRecognition',
    component: revenueRecognition,
    meta: {
      title: '收入确认',
      name: 'MENU_FINANCE_MANAGEMENT',
    }
  },
  {
    name: 'costAndExpenseRecognition',
    path: '/financial/costAndExpenseRecognition',
    component: costAndExpenseRecognition,
    meta: {
      title: '成本及费用确认',
      name: 'MENU_FINANCE_MANAGEMENT',
    }
  },
  {
    name: 'deposits',
    path: '/financial/deposits',
    component: deposits,
    meta: {
      title: '保证金管理',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/deposits',
        title: '保证金管理'
      }]
    }
  },
  {
    name: 'arrears',
    path: '/financial/arrears',
    component: arrears,
    meta: {
      title: '欠费查询',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '财务管理'
      }, {
        path: '/financial/arrears',
        title: '欠费查询'
      }]
    }
  },
]

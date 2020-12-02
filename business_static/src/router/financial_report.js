const collectionRate = () => import('@/views/financial/analysis/collection_rate.vue')
const receivable = () => import('@/views/financial/analysis/receivable.vue')
const arrearage = () => import('@/views/financial/analysis/arrearage.vue')
const sales = () => import('@/views/report/business/sales_report.vue')
const occupancy = () => import('@/views/financial/analysis/occupancy.vue')

export default [
  {
    name: 'receivable',
    path: '/financial/analysis/receivable',
    component: receivable,
    meta: {
      title: '收入报表',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '报表管理'
      }, {
        path: '/financial/analysis/receivable',
        title: '收入报表'
      }]
    }
  },
  {
    name: 'collectionRate',
    path: '/financial/analysis/collectionRate',
    component: collectionRate,
    meta: {
      title: '收缴率分析报表',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '报表管理'
      }, {
        path: '/financial/analysis/collectionRate',
        title: '收缴率分析报表'
      }]
    }
  },
  {
    name: 'arrearage',
    path: '/financial/analysis/arrearage',
    component: arrearage,
    meta: {
      title: '欠费分析报表',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '报表管理'
      }, {
        path: '/financial/analysis/arrearage',
        title: '欠费分析报表'
      }]
    }
  },
  {
    name: 'sales',
    path: '/financial/analysis/sales',
    component: sales,
    meta: {
      title: '销售额报表',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/financial/analysis/sales',
        title: '销售额报表'
      }]
    }
  },
  {
    name: 'occupancy',
    path: '/financial/analysis/occupancy',
    component: occupancy,
    meta: {
      title: '出租率报表',
      name: 'MENU_FINANCE_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '报表管理'
      }, {
        path: '/financial/analysis/occupancy',
        title: '出租率报表'
      }]
    }
  }
]

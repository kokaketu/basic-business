const collectionRate = () => import('@/views/report/financial/collection_rate.vue')
const receivable = () => import('@/views/report/financial/receivable.vue')
const arrearage = () => import('@/views/report/financial/arrearage.vue')
const sales = () => import('@/views/report/business/sales_report.vue')
const passFlow = () => import('@/views/report/business/pass_flow.vue')
const occupancy = () => import('@/views/report/financial/occupancy.vue')

export default [
  // ===================财务报表================
  {
    name: 'receivableReport',
    path: '/report/financial/receivable',
    component: receivable,
    meta: {
      title: '收入报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/financial/analysis/receivable',
        title: '收入报表'
      }]
    }
  },
  {
    name: 'collectionRateReport',
    path: '/report/financial/collectionRate',
    component: collectionRate,
    meta: {
      title: '收缴率报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/report/financial/collectionRate',
        title: '收缴率报表'
      }]
    }
  },
  {
    name: 'arrearageReport',
    path: '/report/financial/arrearage',
    component: arrearage,
    meta: {
      title: '欠费报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/report/financial/arrearage',
        title: '欠费报表'
      }]
    }
  },

  // ==========业务报表=============
  {
    name: 'salesReport',
    path: '/report/business/sales',
    component: sales,
    meta: {
      title: '销售额报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/report/business/sales',
        title: '销售额报表'
      }]
    }
  },
  {
    name: 'passFlowReport',
    path: '/report/business/passFlow',
    component: passFlow,
    meta: {
      title: '客流报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/report/business/passFlow',
        title: '客流报表'
      }]
    }
  },
  {
    name: 'occupancy',
    path: '/financial/analysis/occupancy',
    component: occupancy,
    meta: {
      title: '出租率报表',
      name: '',
      breadcrumb: [{
        path: '',
        title: '报表'
      }, {
        path: '/financial/analysis/occupancy',
        title: '出租率报表'
      }]
    }
  },
]

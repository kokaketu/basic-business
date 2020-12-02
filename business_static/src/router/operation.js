const analysis = () => import('@/views/operation/analysis')
const passengerFlow = () => import('@/views/operation/passengerFlow')
const passengerFlowInsert = () => import('@/views/operation/passengerFlow/insert')
const SaleAmount = () => import('../views/operation/sale-amount/SaleAmount')
const ImportSale = () => import('../views/operation/sale-amount/ImportSale')

export default [
  {
    name: 'projectOperationAnalysis',
    path: '/operation/analysis',
    component: analysis,
    meta: {
      title: '经营分析',
      name: 'MENU_OPERATION_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '运营管理'
      }, {
        path: '/operation/analysis',
        title: '经营分析'
      }]
    }
  },
  {
    name: 'saleAmount',
    path: '/operation/sale-amount',
    component: SaleAmount,
    meta: {
      title: '销售额',
      name: 'MENU_OPERATION_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '运营管理'
      }, {
        path: '',
        title: '销售额'
      }]
    },
  },
  {
    name: 'importSale',
    path: '/operation/sale-import',
    component: ImportSale,
    meta: {
      title: '导入销售额',
      name: 'MENU_OPERATION_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '运营管理'
      }, {
        path: '/operation/sale-amount',
        title: '销售额'
      }, {
        path: '/operation/sale-import',
        title: '导入销售额'
      }]
    },
  },
  {
    name: '客流',
    path: '/operation/passengerFlow',
    component: passengerFlow,
    meta: {
      title: '客流',
      name: 'MENU_OPERATION_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '运营管理'
      }, {
        path: '/operation/passengerFlow',
        title: '客流'
      }]
    }
  },
  {
    name: '客流录入',
    path: '/operation/passengerFlow/:id',
    component: passengerFlowInsert,
    meta: {
      title: '客流录入',
      name: 'MENU_OPERATION_MANAGEMENT',
      breadcrumb: [{
        path: '',
        title: '运营管理'
      }, {
        path: '/operation/passengerFlow',
        title: '客流'
      }, {
        path: '',
        title: '客流录入'
      }]
    }
  }
]

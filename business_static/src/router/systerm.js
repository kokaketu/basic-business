const paymentSettings = () => import('@/views/systerm/paymentSettings')
const budgetSubjectSettings = () => import('@/views/systerm/budget_subject_settings/list')
export default [
  {
    name: 'paymentSettings',
    path: '/systerm/paymentSettings/index',
    component: paymentSettings,
    meta: {
      title: '款项设置',
      name: 'MENU_SYSTEM_SETTING',
      breadcrumb: [{
        path: '',
        title: '系统设置'
      }, {
        path: '/systerm/paymentSettings/index',
        title: '款项设置'
      }]
    }
  },
  {
    name: 'budgetSubjectSettings',
    path: '/systerm/budgetSubjectSettings/list',
    component: budgetSubjectSettings,
    meta: {
      title: '预算科目设置',
      name: 'MENU_SYSTEM_SETTING',
      breadcrumb: [{
        path: '',
        title: '系统设置'
      }, {
        path: '/systerm/budgetSubjectSettings/list',
        title: '预算科目设置'
      }]
    }
  }
]

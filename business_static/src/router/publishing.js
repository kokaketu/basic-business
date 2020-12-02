const publishing = () => import('@/views/publishing/investment')
const create = () => import('@/views/publishing/create')
const publishingBusiness = () => import('@/views/publishing/business')
const businessCreate = () => import('@/views/publishing/business/create')
export default [
  {
    name: 'publishingBusiness',
    path: '/publishing/business',
    component: publishingBusiness,
    meta: {
      title: '发布商机',
      name:'MENU_RELEASE_BUSINESS',
      breadcrumb: [{
        path: '',
        title: '发布商机'
      }, {
        path: '/publishing/business',
        title: '发布商机'
      }]
    }
  },
  {
    name: 'businessCreate',
    path: '/publishing/business/create',
    component: businessCreate,
    meta: {
      title: '创建商机',
      name:'MENU_RELEASE_BUSINESS',
      breadcrumb: [{
        path: '',
        title: '发布商机'
      }, {
        path: '/publishing/business',
        title: '发布商机'
      }, {
        path: '',
        title: '创建商机'
      }]
    }
  },
  {
    name: 'publishingInvestment',
    path: '/publishing/investment',
    component: publishing,
    meta: {
      title: '招商发布',
      name:'MENU_RELEASE_BUSINESS',
      breadcrumb: [{
        path: '',
        title: '发布商机'
      }, {
        path: '/publishing/investment',
        title: '招商发布'
      }]
    }
  },
  {
    name: 'publishingCreate',
    path: '/publishing/create',
    component: create,
    meta: {
      title: '发布上架',
      name:'MENU_RELEASE_BUSINESS',
    }
  },
]

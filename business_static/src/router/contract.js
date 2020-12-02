const list = () => import('@/views/contract/index.vue')
const create = () => import('@/views/contract/create.vue')
const detail = () => import('@/views/contract/detail.vue')
const edit = () => import('@/views/contract/edit.vue')

const mpList = () => import('@/views/contract/multiplePoints')
const mpCreate = () => import('@/views/contract/multiplePoints/create')
const mpDetail = () => import('@/views/contract/multiplePoints/detail')
const mpEdit = () => import('@/views/contract/multiplePoints/edit')

export default [{
  name: '合同管理',
  path: '/contract/index',
  component: list,
  meta: {
    title: '合同列表',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '合同管理'
    }, {
      path: '/contract/index',
      title: '合同列表'
    }]
  }
}, {
  name: '合同新建',
  path: '/contract/create',
  component: create,
  meta: {
    title: '合同新建',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '合同管理'
    }, {
      path: '/contract/index',
      title: '合同列表'
    }, {
      path: '',
      title: '合同新建'
    }]
  }
}, {
  name: '合同详情',
  path: '/contract/detail/:id',
  component: detail,
  meta: {
    title: '合同详情',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '合同管理'
    }, {
      path: '/contract/index',
      title: '合同列表'
    }, {
      path: '/contract/detail',
      title: '合同详情'
    }]
  }
}, {
  name: '合同编辑',
  path: '/contract/edit/:id',
  component: edit,
  meta: {
    title: '合同编辑',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '合同管理'
    }, {
      path: '/contract/index',
      title: '合同列表'
    }, {
      path: '',
      title: '合同编辑'
    }]
  }
}, {
  name: '多经合同',
  path: '/contract/multiplePoints/index',
  component: mpList,
  meta: {
    title: '多经合同',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '多经合同'
    }, {
      path: '/contract/multiplePoints/index',
      title: '多经合同列表'
    }]
  }
}, {
  name: '多经合同新建',
  path: '/contract/multiplePoints/create',
  component: mpCreate,
  meta: {
    title: '多经合同新建',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '多经合同管理'
    }, {
      path: '/contract/multiplePoints/index',
      title: '多经合同列表'
    }, {
      path: '',
      title: '多经合同新建'
    }]
  }
}, {
  name: '多经合同详情',
  path: '/contract/multiplePoints/detail/:id',
  component: mpDetail,
  meta: {
    title: '多经合同详情',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '多经合同管理'
    }, {
      path: '/contract/multiplePoints/index',
      title: '多经合同列表'
    }, {
      path: '',
      title: '多经合同详情'
    }]
  }
}, {
  name: '多经合同编辑',
  path: '/contract/multiplePoints/edit/:id',
  component: mpEdit,
  meta: {
    title: '多经合同编辑',
    name: 'MENU_CONTRACT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '多经合同管理'
    }, {
      path: '/contract/multiplePoints/index',
      title: '多经合同列表'
    }, {
      path: '',
      title: '多经合同编辑'
    }]
  }
}]

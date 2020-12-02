"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

var intermediary = function intermediary() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/intermediary'));
  });
};

var intermediaryDetail = function intermediaryDetail() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/intermediary/detail'));
  });
};

var intermediaryCreate = function intermediaryCreate() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/intermediary/create'));
  });
};

var intermediaryEdit = function intermediaryEdit() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/intermediary/edit'));
  });
};

var business = function business() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/business'));
  });
};

var businessCreate = function businessCreate() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/business/create'));
  });
};

var businessDetail = function businessDetail() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/business/detail'));
  });
};

var businessEdit = function businessEdit() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/business/edit'));
  });
};

var customer = function customer() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/customer'));
  });
};

var customerCreate = function customerCreate() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/customer/create'));
  });
};

var customerDetail = function customerDetail() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/customer/detail'));
  });
};

var customerEdit = function customerEdit() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/customer/edit'));
  });
};

var investment = function investment() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/investment'));
  });
};

var investmentDetail = function investmentDetail() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/investment/detail'));
  });
};

var investmentEdit = function investmentEdit() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/channel/investment/edit'));
  });
};

var _default = [{
  name: 'investment',
  path: '/channel/investment',
  component: investment,
  meta: {
    title: '招商计划',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }]
  }
}, {
  name: 'investmentDetail',
  path: '/channel/investment/detail/:id',
  component: investmentDetail,
  meta: {
    title: '招商计划详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }, {
      path: '',
      title: '招商计划详情'
    }]
  }
}, {
  name: 'investmentEdit',
  path: '/channel/investment/edit/:id',
  component: investmentEdit,
  meta: {
    title: '招商计划编辑',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/investment',
      title: '招商计划'
    }, {
      path: '',
      title: '招商计划编辑'
    }]
  }
}, {
  name: 'intermediary',
  path: '/channel/intermediary',
  component: intermediary,
  meta: {
    title: '渠道管理',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '',
      title: '渠道管理'
    }]
  }
}, {
  name: 'intermediaryDetail',
  path: '/channel/intermediary/detail/:id',
  component: intermediaryDetail,
  meta: {
    title: '渠道详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '渠道详情'
    }]
  }
}, {
  name: 'intermediaryCreate',
  path: '/channel/intermediary/create',
  component: intermediaryCreate,
  meta: {
    title: '新建渠道',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '新建渠道'
    }]
  }
}, {
  name: 'intermediaryEdit',
  path: '/channel/intermediary/edit/:id',
  component: intermediaryEdit,
  meta: {
    title: '编辑渠道',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/intermediary',
      title: '渠道管理'
    }, {
      path: '',
      title: '编辑渠道'
    }]
  }
}, {
  name: 'customer',
  path: '/channel/customer',
  component: customer,
  meta: {
    title: '客户管理',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }]
  }
}, {
  name: 'customerCreate',
  path: '/channel/customer/create',
  component: customerCreate,
  meta: {
    title: '客户新增',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户新增'
    }]
  }
}, {
  name: 'customerDetail',
  path: '/channel/customer/detail/:id',
  component: customerDetail,
  meta: {
    title: '客户详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户详情'
    }]
  }
}, {
  name: 'customerEdit',
  path: '/channel/customer/edit/:id',
  component: customerEdit,
  meta: {
    title: '客户编辑',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/customer',
      title: '客户管理'
    }, {
      path: '',
      title: '客户详情'
    }]
  }
}, {
  name: 'business',
  path: '/channel/business',
  component: business,
  meta: {
    title: '一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '',
      title: '一键招商'
    }]
  }
}, {
  name: 'businessCreate',
  path: '/channel/business/create',
  component: businessCreate,
  meta: {
    title: '新增一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '新增一键招商'
    }]
  }
}, {
  name: 'businessDetail',
  path: '/channel/business/detail/:id',
  component: businessDetail,
  meta: {
    title: '一键招商详情',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '一键招商详情'
    }]
  }
}, {
  name: 'businessEdit',
  path: '/channel/business/edit/:id',
  component: businessEdit,
  meta: {
    title: '编辑一键招商',
    name: 'MENU_ASSET_INVESTMENT',
    breadcrumb: [{
      path: '',
      title: '招商管理'
    }, {
      path: '/channel/business',
      title: '一键招商'
    }, {
      path: '',
      title: '编辑一键招商'
    }]
  }
}];
exports["default"] = _default;
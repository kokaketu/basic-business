"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

var distribution = function distribution() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/rentcontrol/distribution/index.vue'));
  });
};

var tenant = function tenant() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/rentcontrol/tenant'));
  });
};

var tenantDetail = function tenantDetail() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/rentcontrol/tenant/detail'));
  });
};

var tenantCreate = function tenantCreate() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/rentcontrol/tenant/create'));
  });
};

var tenantEdit = function tenantEdit() {
  return Promise.resolve().then(function () {
    return _interopRequireWildcard(require('@/views/rentcontrol/tenant/edit'));
  });
};

var _default = [{
  name: 'tenant',
  path: '/rentcontrol/tenant',
  component: tenant,
  meta: {
    title: '租户管理',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }]
  }
}, {
  name: 'tenantDetail',
  path: '/rentcontrol/tenant/detail/:id',
  component: tenantDetail,
  meta: {
    title: '租户详情',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户详情'
    }]
  }
}, {
  name: 'tenantCreate',
  path: '/rentcontrol/tenant/create',
  component: tenantCreate,
  meta: {
    title: '租户新建',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户新建'
    }]
  }
}, {
  name: 'tenantEdit',
  path: '/rentcontrol/tenant/edit/:id',
  component: tenantEdit,
  meta: {
    title: '租户编辑',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/tenant',
      title: '租户管理'
    }, {
      path: '',
      title: '租户编辑'
    }]
  }
}, {
  name: 'distribution',
  path: '/rentcontrol/distribution',
  component: distribution,
  meta: {
    title: '租控图',
    name: 'MENU_RENT_MANAGEMENT',
    breadcrumb: [{
      path: '',
      title: '租控管理'
    }, {
      path: '/rentcontrol/distribution',
      title: '租控图'
    }]
  }
}];
exports["default"] = _default;
"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

var _default = [{
  name: 'diagnosis',
  path: '/diagnosis/index',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis'));
    });
  },
  meta: {
    title: '诊断报告',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }]
  }
}, {
  name: 'diagnosis-office',
  path: '/diagnosis/office/create/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/office/create'));
    });
  },
  meta: {
    title: '提交数据',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/office/create/:data',
      title: '提交数据'
    }]
  }
}, {
  name: 'diagnosis-office',
  path: '/diagnosis/office/detail/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/office/detail'));
    });
  },
  meta: {
    title: '查看数据',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/office/detail/:data',
      title: '查看数据'
    }]
  }
}, {
  name: 'diagnosis-office-report',
  path: '/diagnosis/office/report/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/office/report'));
    });
  },
  meta: {
    title: '预览报告',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '',
      title: '预览报告'
    }]
  }
}, {
  name: 'diagnosis-park',
  path: '/diagnosis/park/create/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/park/create'));
    });
  },
  meta: {
    title: '提交数据',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/park/create/:data',
      title: '提交数据'
    }]
  }
}, {
  name: 'diagnosis-park',
  path: '/diagnosis/park/detail/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/park/detail'));
    });
  },
  meta: {
    title: '查看数据',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/park/detail/:data',
      title: '查看数据'
    }]
  }
}, {
  name: 'diagnosis-park-report',
  path: '/diagnosis/park/report/:data',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/park/report'));
    });
  },
  meta: {
    title: '预览报告',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '',
      title: '预览报告'
    }]
  }
}, {
  name: 'diagnosis-detailc',
  path: '/diagnosis/detailc',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/detailc'));
    });
  },
  meta: {
    title: '诊断报告详情',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/detailc',
      title: '诊断详情'
    }]
  }
}, {
  name: 'diagnosis-detailw',
  path: '/diagnosis/detailw',
  component: function component() {
    return Promise.resolve().then(function () {
      return _interopRequireWildcard(require('@/views/diagnosis/detailw'));
    });
  },
  meta: {
    title: '诊断报告详情',
    name: 'ASSETS_DIAGNOSIS',
    breadcrumb: [{
      path: '',
      title: '资产诊断'
    }, {
      path: '/diagnosis/index',
      title: '诊断报告'
    }, {
      path: '/diagnosis/detailw',
      title: '诊断详情'
    }]
  }
}];
exports["default"] = _default;
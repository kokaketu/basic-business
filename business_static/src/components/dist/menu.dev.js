"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _iconMenuAssets = _interopRequireDefault(require("../assets/icon-menu-assets.svg"));

var _iconMenuBudget = _interopRequireDefault(require("../assets/icon-menu-budget.svg"));

var _iconMenuRent = _interopRequireDefault(require("../assets/icon-menu-rent.svg"));

var _iconMenuContact = _interopRequireDefault(require("../assets/icon-menu-contact.svg"));

var _iconMenuOperation = _interopRequireDefault(require("../assets/icon-menu-operation.svg"));

var _iconMenuProject = _interopRequireDefault(require("../assets/icon-menu-project.svg"));

var _iconMenuRelease = _interopRequireDefault(require("../assets/icon-menu-release.svg"));

var _iconMenuFinancial = _interopRequireDefault(require("../assets/icon-menu-financial.svg"));

var _iconMenuSysterm = _interopRequireDefault(require("../assets/icon-menu-systerm.svg"));

var _iconMenuWorkbench = _interopRequireDefault(require("../assets/icon-menu-workbench.svg"));

var _iconMenuAnalysis = _interopRequireDefault(require("../assets/icon-menu-analysis.svg"));

var _iconMenuDiagnosis = _interopRequireDefault(require("../assets/icon-menu-diagnosis.svg"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var _default = [{
  id: '0',
  title: '工作台',
  code: '',
  icon: _iconMenuWorkbench["default"],
  child: [{
    id: '0-1',
    link: '/workbench',
    name: '工作台',
    isEdit: true
  }]
}, {
  id: '1',
  title: '资产档案',
  code: 'MENU_ASSET_FILES',
  icon: _iconMenuAssets["default"],
  child: [{
    id: '1-1',
    link: '/asset/project',
    name: '项目信息'
  }, {
    id: '1-6',
    link: '/asset/staging',
    name: '产业园分期'
  }, {
    id: '1-2',
    link: '/asset/building',
    name: '楼栋信息'
  }, {
    id: '1-3',
    link: '/asset/floor',
    name: '楼层信息'
  }, {
    id: '1-4',
    link: '/asset/rentalUnit',
    name: '租赁单元'
  }, {
    id: '1-7',
    link: '/asset/multiplePoints',
    name: '多经点位'
  }, {
    id: '1-5',
    link: '/asset/device',
    name: '设备台账'
  }]
}, {
  id: '2',
  title: '预算管理',
  code: 'MENU_BUDGET_MANAGEMENT',
  icon: _iconMenuBudget["default"],
  child: [{
    id: '2-1',
    link: '/budget/budget-making-list',
    name: '预算编制'
  }, {
    id: '2-2',
    link: '/budget/budget-fill-list',
    name: '执行填报'
  }, {
    id: '2-3',
    link: '/budget/budget-exec-list',
    name: '执行分析'
  }]
}, {
  id: '3',
  title: '租控管理',
  code: 'MENU_RENT_MANAGEMENT',
  icon: _iconMenuRent["default"],
  child: [{
    id: '3-1',
    link: '/rentcontrol/tenant',
    name: '租户管理'
  }, {
    id: '3-2',
    link: '/rentcontrol/distribution',
    name: '租控图'
  }]
}, {
  id: '8',
  title: '招商管理',
  code: 'MENU_ASSET_INVESTMENT',
  icon: _iconMenuRelease["default"],
  child: [{
    id: '8-1',
    link: '/channel/investment',
    name: '招商计划'
  }, {
    id: '8-2',
    link: '/channel/customer',
    name: '客户管理'
  }, {
    id: '8-3',
    link: '/channel/intermediary',
    name: '渠道管理'
  } // {
  //   id: '8-4',
  //   link: '/channel/business',
  //   name: '一键招商'
  // }
  ]
}, {
  id: '4',
  title: '合同管理',
  code: 'MENU_CONTRACT_MANAGEMENT',
  icon: _iconMenuContact["default"],
  child: [{
    id: '4-1',
    link: '/contract/index',
    name: '合同管理'
  }, {
    id: '4-2',
    link: '/contract/multiplePoints/index',
    name: '多经合同管理'
  }]
}, {
  id: '5',
  title: '运营管理',
  code: 'MENU_OPERATION_MANAGEMENT',
  icon: _iconMenuOperation["default"],
  child: [{
    id: '5-1',
    link: '/operation/analysis',
    name: '经营分析'
  }, {
    id: '5-2',
    link: '/operation/sale-amount',
    name: '销售额'
  }, {
    id: '5-3',
    link: '/operation/passengerFlow',
    name: '客流'
  }]
}, {
  id: '6',
  title: '财务管理',
  code: 'MENU_FINANCE_MANAGEMENT',
  icon: _iconMenuFinancial["default"],
  child: [{
    id: '6-1',
    link: '/financial/receivables',
    name: '应收管理'
  }, {
    id: '6-2',
    link: '/financial/receiveds',
    name: '实收管理'
  }, {
    id: '6-3',
    link: '/financial/payments',
    name: '实付管理'
  }, {
    id: '6-4',
    link: '/financial/arrears',
    name: '欠费查询'
  }, {
    id: '6-5',
    link: '/financial/deposits',
    name: '保证金管理'
  }, {
    id: '6-7',
    link: '/financial/print',
    name: '账单打印'
  }]
}, {
  id: '7',
  title: '工程物业',
  code: 'MENU_ENGIN_PROPERTY',
  icon: _iconMenuProject["default"],
  child: [{
    id: '7-1',
    link: '/engineering/energy',
    name: '能耗管理'
  }]
}, // {
//   id: '8',
//   title: '发布商机',
//   code: 'MENU_RELEASE_BUSINESS',
//   icon: release,
//   child: [
//     {
//       id: '8-1',
//       link: '/publishing/business',
//       name: '发布商机'
//     }
//   ]
// },
{
  id: '9',
  title: '资产诊断',
  code: 'ASSETS_DIAGNOSIS',
  icon: _iconMenuDiagnosis["default"],
  child: [{
    id: '9-1',
    link: '/diagnosis/index',
    name: '诊断报告'
  }]
}, {
  id: '10',
  title: '报表',
  code: 'MENU_REPORT_MANAGEMENT',
  icon: _iconMenuAnalysis["default"],
  child: [{
    id: '10-1',
    link: '/report/financial/arrearage',
    name: '欠费报表'
  }, {
    id: '10-2',
    link: '/report/financial/receivable',
    name: '收入报表'
  }, {
    id: '10-3',
    link: '/financial/analysis/occupancy',
    name: '出租率报表'
  }, {
    id: '10-4',
    link: '/report/financial/collectionRate',
    name: '收缴率报表'
  }, {
    id: '10-5',
    link: '/report/business/passFlow',
    name: '客流报表'
  }, {
    id: '10-6',
    link: '/report/business/sales',
    name: '销售额报表'
  }]
}, {
  id: '11',
  title: '系统设置',
  code: 'MENU_SYSTEM_SETTING',
  icon: _iconMenuSysterm["default"],
  child: [{
    id: '11-1',
    link: '/systerm/paymentSettings/index',
    name: '款项设置'
  }, {
    id: '11-2',
    link: '/authority/index',
    name: '组织配置'
  }, {
    id: '11-3',
    link: '/systerm/budgetSubjectSettings/list',
    name: '预算科目设置'
  }]
}];
exports["default"] = _default;
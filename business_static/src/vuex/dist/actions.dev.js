"use strict";

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var types = _interopRequireWildcard(require("./mutation-types"));

var _lodashEs = require("lodash-es");

var _mapToArray = require("@/utils/mapToArray");

var _financial = require("@/http/financial");

var _assets = require("@/http/assets");

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

var _default = {
  setProjectNameList: function setProjectNameList(_ref, _ref2) {
    var commit = _ref.commit,
        state = _ref.state;
    var mainId = _ref2.mainId,
        isUpdate = _ref2.isUpdate;
    return new Promise(function (resolve) {
      if ((0, _lodashEs.isEmpty)(state.projectNameList) || isUpdate) {
        (0, _assets.getAssetName)({
          mainId: mainId
        }).then(function (res) {
          commit(types.SET_PROJECT_NAME_LIST, res);
          resolve(res);
        });
      }
    });
  },
  setPayerNames: function setPayerNames(_ref3, _ref4) {
    var commit = _ref3.commit,
        state = _ref3.state;
    var payerName = _ref4.payerName;

    if ((0, _lodashEs.isEmpty)(state.payerNames)) {
      (0, _financial.queryPayerName)({
        mainId: state.merchant.id
      }).then(function (res) {
        // 设置一个非重复值 防止页面console报红
        res.forEach(function (item, index) {
          item.fid = index;
        });
        commit(types.SET_PAYER_NAMES, res);
      });
    }
  },
  setSubjectNames: function setSubjectNames(_ref5, _ref6) {
    var commit = _ref5.commit,
        state = _ref5.state;
    var refresh = _ref6.refresh;
    return new Promise(function (resolve) {
      var projects = state.projects,
          merchant = state.merchant;

      if ((0, _lodashEs.isEmpty)(state.subjectNames) || refresh) {
        (0, _financial.getSubjectDropDown)({
          mainId: merchant.id
        }).then(function (res) {
          commit(types.SET_SUBJECT_NAMES, res);
          resolve(res);
        });
      } else {
        resolve(projects);
      }
    });
  },
  setProjects: function setProjects(_ref7, _ref8) {
    var commit = _ref7.commit,
        state = _ref7.state;
    var isUpdate = _ref8.isUpdate;
    return new Promise(function (resolve) {
      var projects = state.projects,
          merchant = state.merchant;

      if ((0, _lodashEs.isEmpty)(state.projects) || isUpdate) {
        (0, _assets.fetchProjects)({
          mainId: merchant.id
        }).then(function (res) {
          commit(types.SET_PROJECTS, res);
          resolve(res);
        });
      } else {
        resolve(projects);
      }
    });
  },
  setRentalUnits: function setRentalUnits(_ref9, _ref10) {
    var commit = _ref9.commit,
        state = _ref9.state;
    var assetId = _ref10.assetId;

    if (assetId) {
      return new Promise(function (resolve) {
        (0, _assets.fetchRentalUnit)({
          mainId: state.merchant.mainId,
          assetId: assetId
        }).then(function (res) {
          commit(types.SET_RENTAL_UNITS, res);
          resolve(res);
        });
      });
    } else {
      commit(types.SET_RENTAL_UNITS, []);
    }
  },
  setRouteList: function setRouteList(_ref11, data) {
    var commit = _ref11.commit,
        state = _ref11.state;
    commit(types.SET_ROUTE_LIST, data);
  },
  setUserinfo: function setUserinfo(_ref12, userInfo) {
    var commit = _ref12.commit,
        state = _ref12.state;
    commit(types.SET_USER_INFO, userInfo);
  },
  setMerchant: function setMerchant(_ref13, merchant) {
    var commit = _ref13.commit;
    commit(types.SET_MERCHANT, merchant);
  },
  setLoading: function setLoading(_ref14, bool) {
    var commit = _ref14.commit;
    commit(types.SET_LOADING, bool);
  },
  setPermission: function setPermission(_ref15, payload) {
    var commit = _ref15.commit;
    commit(types.SET_PERMISSION, payload);
  },
  // 业态枚举
  setAssetLayoutEnum: function setAssetLayoutEnum(_ref16) {
    var commit = _ref16.commit,
        state = _ref16.state;
    return new Promise(function (resolve) {
      if ((0, _lodashEs.isEmpty)(state.assetLayoutList)) {
        (0, _assets.getAssetLayoutEnumList)().then(function (res) {
          commit(types.SET_LAYOUTENUM, (0, _mapToArray.mapToArray)(res));
          resolve(res);
        });
      }
    });
  }
};
exports["default"] = _default;
"use strict";

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var types = _interopRequireWildcard(require("./mutation-types"));

var _types$SET_PROJECT_NA;

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

var _default = (_types$SET_PROJECT_NA = {}, _defineProperty(_types$SET_PROJECT_NA, types.SET_PROJECT_NAME_LIST, function (state, projectNameList) {
  state.projectNameList = projectNameList;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_PAYER_NAMES, function (state, payerNames) {
  state.payerNames = payerNames;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_SUBJECT_NAMES, function (state, subjectNames) {
  state.subjectNames = subjectNames;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_PROJECTS, function (state, projects) {
  state.projects = projects;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_RENTAL_UNITS, function (state, units) {
  state.rentalUnits = units;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_ROUTE_LIST, function (state, data) {
  if (data.type === 'delete') {
    state.routeList = state.routeList.filter(function (_ref) {
      var name = _ref.name;
      return name !== data.route.name;
    });
  } else if (data.type === 'add') {
    if (state.routeList.length > 0) {
      var bool = state.routeList.filter(function (_ref2) {
        var name = _ref2.name;
        return name === data.route.name;
      }).length > 0;

      if (bool) {
        state.routeList.map(function (_ref3, index) {
          var name = _ref3.name;

          if (name === data.route.name) {
            state.routeList.splice(index, 1, data.route);
          }
        });
      } else {
        state.routeList.push(data.route);
      }
    } else {
      state.routeList.push(data.route);
    }
  }
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_USER_INFO, function (state, userInfo) {
  state.userInfo = userInfo;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_MERCHANT, function (state, merchant) {
  state.merchant = merchant;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_LOADING, function (state, bool) {
  state.loading = bool;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_PERMISSION, function (state, permission) {
  state.permissionList = permission;
}), _defineProperty(_types$SET_PROJECT_NA, types.SET_LAYOUTENUM, function (state, data) {
  state.assetLayoutList = data;
}), _types$SET_PROJECT_NA);

exports["default"] = _default;
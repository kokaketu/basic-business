"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _vue = _interopRequireDefault(require("vue"));

var _vueRouter = _interopRequireDefault(require("vue-router"));

var _home = _interopRequireDefault(require("./home"));

var _asset = _interopRequireDefault(require("./asset"));

var _budget = _interopRequireDefault(require("./budget"));

var _noi = _interopRequireDefault(require("./noi"));

var _risk = _interopRequireDefault(require("./risk"));

var _financial = _interopRequireDefault(require("./financial"));

var _contract = _interopRequireDefault(require("./contract"));

var _authority = _interopRequireDefault(require("./authority"));

var _operation = _interopRequireDefault(require("./operation"));

var _rentControl = _interopRequireDefault(require("./rentControl"));

var _personalCenter = _interopRequireDefault(require("./personalCenter"));

var _systerm = _interopRequireDefault(require("./systerm"));

var _engineering = _interopRequireDefault(require("./engineering"));

var _channel = _interopRequireDefault(require("./channel"));

var _diagnosis = _interopRequireDefault(require("./diagnosis"));

var _certification = _interopRequireDefault(require("./certification"));

var _report = _interopRequireDefault(require("./report"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance"); }

function _iterableToArray(iter) { if (Symbol.iterator in Object(iter) || Object.prototype.toString.call(iter) === "[object Arguments]") return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = new Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } }

_vue["default"].use(_vueRouter["default"]);

var originalPush = _vueRouter["default"].prototype.push;

_vueRouter["default"].prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject);
  return originalPush.call(this, location)["catch"](function (err) {
    return err;
  });
};

var _default = new _vueRouter["default"]({
  routes: [].concat(_toConsumableArray(_home["default"]), _toConsumableArray(_asset["default"]), _toConsumableArray(_budget["default"]), _toConsumableArray(_noi["default"]), _toConsumableArray(_risk["default"]), _toConsumableArray(_financial["default"]), _toConsumableArray(_report["default"]), _toConsumableArray(_contract["default"]), _toConsumableArray(_authority["default"]), _toConsumableArray(_operation["default"]), _toConsumableArray(_rentControl["default"]), _toConsumableArray(_personalCenter["default"]), _toConsumableArray(_systerm["default"]), _toConsumableArray(_engineering["default"]), _toConsumableArray(_channel["default"]), _toConsumableArray(_diagnosis["default"]), _toConsumableArray(_certification["default"]))
});

exports["default"] = _default;
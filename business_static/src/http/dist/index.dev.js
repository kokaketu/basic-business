"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.origin = exports.http = void 0;

var _axios = _interopRequireDefault(require("axios"));

var _elementUi = require("element-ui");

var _vuex = _interopRequireDefault(require("@/vuex"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var origin = process.env.NODE_ENV === 'development' ? 'http://test-asset.caicchina.com' : 'https://asset.caicchina.com'; // axios 配置

exports.origin = origin;

var http = _axios["default"].create({
  timeout: 60000
}); // 是否是文件流


exports.http = http;
var responseIsfile = false; // 是否隐藏接口错误信息

var hideErrMsg = false; // http request 拦截器

http.interceptors.request.use(function (config) {
  _vuex["default"].dispatch('setLoading', true); // 装载参数


  config.headers.mainId = _vuex["default"].state.merchant.id;
  config.timeout = 60000;
  responseIsfile = config.responseIsfile;
  hideErrMsg = config.hideErrMsg;

  if (responseIsfile) {
    config.responseType = 'blob';
  }

  return config;
}, function (err) {
  return Promise.reject(err);
}); // http response 拦截器

http.interceptors.response.use(function (response) {
  _vuex["default"].dispatch('setLoading', false); // 是否是文件流


  var content = response.headers['content-disposition'];

  if (responseIsfile && content) {
    // 文件接口不统一，返回文件名字不一致处理
    var regular = content.includes('UTF') ? "filename*=UTF-8''" : "filename=";
    var filename = content.split(regular)[1];
    return {
      data: response.data,
      fileName: filename
    };
  }

  var code = response.data.code;
  var isOutDate = String(code).includes('token_error');

  if (code !== '0' && !isOutDate && !hideErrMsg) {
    _elementUi.Message.error(response.data.msg);
  } else if (isOutDate) {
    var hostname = window.location.hostname;
    var isDev = hostname.includes('test') || hostname.includes('local');

    if (process.env.EVN_FLAG === 'dev' || process.env.EVN_FLAG === 'test') {
      window.location.href = "http://".concat(process.env.EVN_FLAG, ".caicchina.com/#/login");
    } else {
      window.location.href = isDev ? 'http://test.caicchina.com/#/login' : 'https://www.caicchina.com/#/login';
    }

    _elementUi.Message.error(response.data.msg);
  }

  return response.data;
}, function (error) {
  _vuex["default"].dispatch('setLoading', false);

  _elementUi.Message.error(error);
});
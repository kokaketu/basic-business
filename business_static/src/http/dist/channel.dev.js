"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.addContacts = addContacts;
exports.updContacts = updContacts;
exports.delContacts = delContacts;
exports.queryContactsPage = queryContactsPage;
exports.queryContactsDetail = queryContactsDetail;

var _index = require("./index");

function addContacts(params) {
  return _index.http.post('/asset-operation-web/bsContacts/addContacts', params).then(function (res) {
    return res;
  });
}
/**
 * 中介编辑
 */


function updContacts(params) {
  return _index.http.post('/asset-operation-web/bsContacts/updContacts', params).then(function (res) {
    return res;
  });
}
/**
 * 中介删除
 */


function delContacts(params) {
  return _index.http.post('/asset-operation-web/bsContacts/delContacts', params).then(function (res) {
    return res;
  });
}
/**
 * 中介管理列表
 */


function queryContactsPage(params) {
  return _index.http.post('/asset-operation-web/bsContacts/queryContactsPage', params).then(function (res) {
    return res.data;
  });
}
/**
 * 经纪人列表
 */


function queryContactsDetail(params) {
  return _index.http.post('/asset-operation-web/bsContacts/queryContactsDetail', params).then(function (res) {
    return res.data;
  });
}
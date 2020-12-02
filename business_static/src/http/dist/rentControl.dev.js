"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.queryData = queryData;
exports.floorStatistical = floorStatistical;
exports.queryStoreDetail = queryStoreDetail;
exports.initCompany = initCompany;
exports.getPageCompany = getPageCompany;
exports.getCompanyNameList = getCompanyNameList;
exports.getCompany = getCompany;
exports.getCompanyById = getCompanyById;
exports.delCompany = delCompany;
exports.updCompany = updCompany;
exports.addCompany = addCompany;
exports.getCustomerList = getCustomerList;
exports.addCustomer = addCustomer;
exports.updateCustomer = updateCustomer;
exports.deleteCustomer = deleteCustomer;
exports.getDetail = getDetail;
exports.clientFollowUpAdd = clientFollowUpAdd;
exports.clientFollowUpDelete = clientFollowUpDelete;
exports.getAttractList = getAttractList;
exports.addAttractList = addAttractList;
exports.queryMemberList = queryMemberList;
exports.updAttract = updAttract;
exports.queryById = queryById;
exports.delAttract = delAttract;
exports.delAttractMonitor = delAttractMonitor;
exports.updAttractMonitor = updAttractMonitor;
exports.addAttractMonitor = addAttractMonitor;

var _index = require("./index");

function queryData(params) {
  return _index.http.post('/asset-basedata-web/base/floorStatement/queryData', params).then(function (res) {
    return res.data;
  });
}
/** queryArrears
 * 查询楼层平面图详情
 */


function floorStatistical(params) {
  return _index.http.post('/asset-basedata-web/bsRoom/floorStatistical', params).then(function (res) {
    return res.data;
  });
}
/**
 * 楼层平面图--铺位信息详情
 */


function queryStoreDetail(params) {
  return _index.http.post('/asset-basedata-web/bsRoom/queryStoreDetail', params).then(function (res) {
    return res.data;
  });
}
/**
 * 租户管理-初期化数据
 */


function initCompany() {
  return _index.http.post('/asset-merchants-web/merchants/company/initCompany').then(function (res) {
    return res.data;
  });
}
/**
 * 租户管理-查询租户列表-分页
 */


function getPageCompany(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/getPageCompanyList', params).then(function (res) {
    return res.data;
  });
}
/**
 * 客户管理-查询租户列表-结果不分页
 */


function getCompanyNameList(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/getCompanyList', params).then(function (res) {
    return res;
  });
}
/**
 * 租户管理-查询租户-详情
 */


function getCompany(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/getCompany', params).then(function (res) {
    return res.data;
  });
}
/**
 * 租户管理-查询租户-详情
 */


function getCompanyById(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/getCompanyById', params).then(function (res) {
    return res.data;
  });
}
/**
 * 租户管理-查询租户-删除
 */


function delCompany(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/delCompany', params).then(function (res) {
    return res;
  });
}
/**
 * 租户管理-查询租户-租户管理-更新租户
 */


function updCompany(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/updCompany', params).then(function (res) {
    return res;
  });
}
/**
 * 租户管理-查询租户-新增
 */


function addCompany(params) {
  return _index.http.post('/asset-merchants-web/merchants/company/addCompany', params).then(function (res) {
    return res;
  });
}
/**
 * 客户管理-客户列表
 */


function getCustomerList(params) {
  return _index.http.post('/asset-merchants-web/client/queryList', params).then(function (res) {
    return res;
  });
}
/**
 * 客户管理-新增客户
 */


function addCustomer(params) {
  return _index.http.post('/asset-merchants-web/client/add', params).then(function (res) {
    return res;
  });
}
/**
 * 客户管理-修改客户
 */


function updateCustomer(params) {
  return _index.http.post('/asset-merchants-web/client/update', params).then(function (res) {
    return res;
  });
}
/**
 * 客户管理-删除客户
 */


function deleteCustomer(params) {
  return _index.http.post('/asset-merchants-web/client/delete', params).then(function (res) {
    return res;
  });
}
/**
 * 客户管理-查询客户详情
 */


function getDetail(params) {
  return _index.http.post('/asset-merchants-web/client/getDetail', params).then(function (res) {
    return res;
  });
}
/**
 * 客户详情--新增跟进记录
 * @param {*} params
 */


function clientFollowUpAdd(params) {
  return _index.http.post('/asset-merchants-web/client/clientFollowUpAdd', params).then(function (res) {
    return res;
  });
}
/**
 * 客户详情--删除跟进记录
 * @param {*} params
 */


function clientFollowUpDelete(params) {
  return _index.http.post('/asset-merchants-web/client/clientFollowUpDelete', params).then(function (res) {
    return res;
  });
}
/**
 * 招商计划列表
 * @param {*} params
 */


function getAttractList(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/getAttractList', params).then(function (res) {
    return res;
  });
}
/**
 * 新增招商计划
 * @param {*} params
 */


function addAttractList(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/addAttractList', params).then(function (res) {
    return res;
  });
}
/**
 * 招商计划 查询主体下组织架构中的人员
 * @param {*} params
 */


function queryMemberList(mainId) {
  return _index.http.get('/asset-merchants-web/ibAttract/queryMemberList?mainId=' + mainId).then(function (res) {
    return res;
  });
}
/**
 * 更新招商计划
 * @param {*} params
 */


function updAttract(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/updAttract', params).then(function (res) {
    return res;
  });
}
/**
 * 查看招商情况详情
 * @param {*} params
 */


function queryById(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/queryById', params).then(function (res) {
    return res;
  });
}
/**
 * 删除招商计划
 * @param {*} params
 */


function delAttract(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/delAttract', params).then(function (res) {
    return res;
  });
}
/**
 * 删除招商计划跟进信息
 * @param {*} params
 */


function delAttractMonitor(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/delAttractMonitor', params).then(function (res) {
    return res;
  });
}
/**
 * 更新招商计划跟进信息
 * @param {*} params
 */


function updAttractMonitor(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/updAttractMonitor', params).then(function (res) {
    return res;
  });
}
/**
 * 新增招商计划跟进信息
 * @param {*} params
 */


function addAttractMonitor(params) {
  return _index.http.post('/asset-merchants-web/ibAttract/addAttractMonitor', params).then(function (res) {
    return res;
  });
}
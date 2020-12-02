"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.queryData = queryData;
exports.saveDiagnoseData = saveDiagnoseData;
exports.queryDiagnoseList = queryDiagnoseList;
exports.queryDiagnoseData = queryDiagnoseData;
exports.getNow = getNow;
exports.queryReportDateList = queryReportDateList;
exports.queryDiagnoseParkData = queryDiagnoseParkData;
exports.saveDiagnoseParkData = saveDiagnoseParkData;
exports.queryBuildingData = queryBuildingData;
exports.getBuildingData = getBuildingData;
exports.saveBuildingData = saveBuildingData;

var _index = require("./index");

function queryData(params) {
  return _index.http.post('/asset-diagnose-web/diagnose/queryData', params).then(function (res) {
    return res.data;
  });
}
/**
 * 新增/更新 办公项目<i>经营数据</i> <i>融资数据</i>
 * @param {*} params
 */


function saveDiagnoseData(params) {
  return _index.http.post('/asset-diagnose-web/diagnose/office/saveDiagnoseData', params).then(function (res) {
    return res;
  });
}
/**
 * 查询诊断记录数据列表
 * @param {*} params
 */


function queryDiagnoseList(params) {
  return _index.http.post('/asset-diagnose-web/diagnose/queryDiagnoseList', params).then(function (res) {
    return res.data;
  });
}
/**
 * 查看已提交的办公项目诊断数据
 * @param {*} params
 */


function queryDiagnoseData(params) {
  var projectId = params.projectId,
      year = params.year,
      quarter = params.quarter;
  return _index.http.get("/asset-diagnose-web/diagnose/office/queryDiagnoseData?projectId=".concat(projectId, "&year=").concat(year, "&quarter=").concat(quarter)).then(function (res) {
    return res.data;
  });
}
/**
 * 获取 实时 报告
 * @param {*} params
 */


function getNow(params) {
  return _index.http.post("/asset-diagnose-web/diagnose/getNow", params, {
    responseIsfile: true
  }).then(function (res) {
    return res;
  });
}
/**
 * 查询诊断报告页面 诊断季度 下拉框列表
 * @param {*} params
 */


function queryReportDateList(projectId) {
  return _index.http.get("/asset-diagnose-web/diagnose/queryReportDateList?projectId=".concat(projectId)).then(function (res) {
    return res;
  });
}
/**
 * 产业园诊断查询
 * @param {*} params
 */


function queryDiagnoseParkData(projectId, year, quarter) {
  return _index.http.get("/asset-diagnose-web/diagnose/park/queryDiagnoseData?projectId=".concat(projectId, "&year=").concat(year, "&quarter=").concat(quarter)).then(function (res) {
    return res;
  });
}
/**
 * 产业园诊断新增
 * @param {*} params
 */


function saveDiagnoseParkData(params) {
  return _index.http.post("/asset-diagnose-web/diagnose/park/saveDiagnoseData", params).then(function (res) {
    return res;
  });
}
/**
 * 产业园获取楼栋诊断列表
 * @param {*} params
 */


function queryBuildingData(projectId, year, quarter) {
  return _index.http.get("/asset-diagnose-web/diagnose/park/queryBuildingData?projectId=".concat(projectId, "&year=").concat(year, "&quarter=").concat(quarter)).then(function (res) {
    return res;
  });
}
/**
 * 产业园获取楼栋诊断详情
 * @param {*} params
 */


function getBuildingData(projectId, buildingId, year, quarter) {
  return _index.http.get("/asset-diagnose-web/diagnose/park/getBuildingData?projectId=".concat(projectId, "&buildingId=").concat(buildingId, "&year=").concat(year, "&quarter=").concat(quarter)).then(function (res) {
    return res;
  });
}
/**
 * 保存楼栋诊断数据
 * @param {*} params
 */


function saveBuildingData(params) {
  return _index.http.post("/asset-diagnose-web/diagnose/park/saveBuildingData", params).then(function (res) {
    return res;
  });
}
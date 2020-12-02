import * as types from './mutation-types'
import { isEmpty } from 'lodash-es'
import { mapToArray } from '@/utils/mapToArray'
import { queryPayerName, getSubjectDropDown } from '@/http/financial'
import { fetchProjects, fetchRentalUnit, getAssetName, getAssetLayoutEnumList } from '@/http/assets'

export default {
  setProjectNameList ({commit, state}, {mainId, isUpdate}) {
    return new Promise((resolve) => {
      if (isEmpty(state.projectNameList) || isUpdate) {
        getAssetName({mainId}).then(res => {
          commit(types.SET_PROJECT_NAME_LIST, res)
          resolve(res)
        })
      }
    })
  },
  setPayerNames ({commit, state}, { payerName }) {
    if (isEmpty(state.payerNames)) {
      queryPayerName({ mainId: state.merchant.id }).then((res) => {
        // 设置一个非重复值 防止页面console报红
        res.forEach((item, index) => { item.fid = index })
        commit(types.SET_PAYER_NAMES, res)
      })
    }
  },
  setSubjectNames ({commit, state}, {refresh}) {
    return new Promise((resolve) => {
      const { projects, merchant } = state
      if (isEmpty(state.subjectNames) || refresh) {
        getSubjectDropDown({mainId: merchant.id}).then((res) => {
          commit(types.SET_SUBJECT_NAMES, res)
          resolve(res)
        })
      } else {
        resolve(projects)
      }
    })
  },
  setProjects ({commit, state}, {isUpdate}) {
    return new Promise((resolve) => {
      const { projects, merchant } = state
      if (isEmpty(state.projects) || isUpdate) {
        fetchProjects({ mainId: merchant.id }).then((res) => {
          commit(types.SET_PROJECTS, res)
          resolve(res)
        })
      } else {
        resolve(projects)
      }
    })
  },
  setRentalUnits ({commit, state}, { assetId }) {
    if (assetId) {
      return new Promise((resolve) => {
        fetchRentalUnit({mainId: state.merchant.mainId, assetId}).then((res) => {
          commit(types.SET_RENTAL_UNITS, res)
          resolve(res)
        })
      })
    } else {
      commit(types.SET_RENTAL_UNITS, [])
    }
  },
  setRouteList ({commit, state}, data) {
    commit(types.SET_ROUTE_LIST, data)
  },
  setUserinfo ({commit, state}, userInfo) {
    commit(types.SET_USER_INFO, userInfo)
  },
  setMerchant ({commit}, merchant) {
    commit(types.SET_MERCHANT, merchant)
  },
  setLoading ({commit}, bool) {
    commit(types.SET_LOADING, bool)
  },
  setPermission ({commit}, payload) {
    commit(types.SET_PERMISSION, payload)
  },
  // 业态枚举
  setAssetLayoutEnum ({commit, state}) {
    return new Promise(resolve => {
      if (isEmpty(state.assetLayoutList)) {
        getAssetLayoutEnumList().then(res => {
          commit(types.SET_LAYOUTENUM, mapToArray(res))
          resolve(res)
        })
      }
    })
  }
}

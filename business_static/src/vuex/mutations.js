import * as types from './mutation-types'

export default {
  [types.SET_PROJECT_NAME_LIST] (state, projectNameList) {
    state.projectNameList = projectNameList
  },
  [types.SET_PAYER_NAMES] (state, payerNames) {
    state.payerNames = payerNames
  },
  [types.SET_SUBJECT_NAMES] (state, subjectNames) {
    state.subjectNames = subjectNames
  },
  [types.SET_PROJECTS] (state, projects) {
    state.projects = projects
  },
  [types.SET_RENTAL_UNITS] (state, units) {
    state.rentalUnits = units
  },
  [types.SET_ROUTE_LIST] (state, data) {
    if (data.type === 'delete') {
      state.routeList = state.routeList.filter(({name}) => {
        return name !== data.route.name
      })
    } else if (data.type === 'add') {
      if (state.routeList.length > 0) {
        const bool = state.routeList.filter(({name}) => { return name === data.route.name }).length > 0
        if (bool) {
          state.routeList.map(({name}, index) => {
            if (name === data.route.name) {
              state.routeList.splice(index, 1, data.route)
            }
          })
        } else {
          state.routeList.push(data.route)
        }
      } else {
        state.routeList.push(data.route)
      }
    }
  },
  [types.SET_USER_INFO] (state, userInfo) {
    state.userInfo = userInfo
  },
  [types.SET_MERCHANT] (state, merchant) {
    state.merchant = merchant
  },
  [types.SET_LOADING] (state, bool) {
    state.loading = bool
  },
  [types.SET_PERMISSION] (state, permission) {
    state.permissionList = permission
  },
  // 业态
  [types.SET_LAYOUTENUM] (state, data) {
    state.assetLayoutList = data
  }
}

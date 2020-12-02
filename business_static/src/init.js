import { loginCheck, memberMerchantList, listMenu } from '@/http/authority'
import { isNull } from 'lodash-es'

function getUserInfo () {
  return new Promise((resolve, reject) => {
    loginCheck().then(({data}) => {
      sessionStorage.setItem('userInfo', JSON.stringify(data))
      resolve(data)
    })
  })
}

function getMerchantList (memberId, mobile) {
  return new Promise((resolve, reject) => {
    memberMerchantList({memberId, mobile}).then(({data}) => {
      const userId = JSON.parse(sessionStorage.getItem('userInfo')).memberId
      if (!sessionStorage.getItem('merchant' + userId)) {
        if (!isNull(data)) {
          sessionStorage.setItem('merchant' + userId, JSON.stringify(data[0]))
        } else {
          sessionStorage.setItem('merchant' + userId, null)
        }
      }
      resolve()
    })
  })
}

function getMenuList () {
  const memberId = JSON.parse(sessionStorage.getItem('userInfo')).memberId
  const id = JSON.parse(sessionStorage.getItem('merchant' + memberId)).id
  return new Promise((resolve, reject) => {
    const params = {
      ssoMember: memberId,
      mainId: id
    }
    listMenu(params).then(res => {
      if (res.code === '0') {
        const permList = {}
        res.data && res.data.map(it => {
          permList[it.code] = it.permission
        })
        sessionStorage.setItem('permList', JSON.stringify(permList))
      }
      resolve()
    })
  })
}

export default function init () {
  return new Promise((resolve, reject) => {
    getUserInfo().then(res => {
      const memberId = res.memberId
      const mobile = res.mobile
      getMerchantList(memberId, mobile).then(() => {
        getMenuList().then(() => {
          resolve()
        })
      })
    })
  })
}

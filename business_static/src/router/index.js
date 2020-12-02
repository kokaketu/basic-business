import Vue from 'vue'
import Router from 'vue-router'
import home from './home'
import asset from './asset'
import budget from './budget'
import noi from './noi'
import risk from './risk'
import financial from './financial'
import contract from './contract'
import authority from './authority'
import operation from './operation'
import rentControl from './rentControl'
import personalCenter from './personalCenter'
import systerm from './systerm'
import engineering from './engineering'
// import publishing from './publishing'
import channel from './channel'
import diagnosis from './diagnosis'
import certification from './certification'
import report from './report'
Vue.use(Router)
const originalPush = Router.prototype.push
Router.prototype.push = function push (location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}
export default new Router({
  routes: [
    ...home,
    ...asset,
    ...budget,
    ...noi,
    ...risk,
    ...financial,
    ...report,
    ...contract,
    ...authority,
    ...operation,
    ...rentControl,
    ...personalCenter,
    ...systerm,
    ...engineering,
    // ...publishing,
    ...channel,
    ...diagnosis,
    ...certification
  ]
})

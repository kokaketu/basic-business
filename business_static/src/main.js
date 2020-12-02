// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'babel-polyfill'
import Vue from 'vue'
import BaiduMap from 'vue-baidu-map'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import store from './vuex'
import init from './init'
import './filter'
import '../theme/index.css'
import '@/styles/common.scss'
import '@/styles/animate.css'
Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(BaiduMap, {
  ak: 'Uj5VGvIpkWfD4u4RAOeyE2wA3sICEqyB'
})
/* eslint-disable no-new */
init().then(() => {
  new Vue({
    el: '#app',
    router,
    store,
    components: { App },
    template: '<App/>'
  })
})

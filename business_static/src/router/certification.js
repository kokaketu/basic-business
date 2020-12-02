const certificationNormal = () => import('@/views/certification/normal')
const certificationQuick = () => import('@/views/certification/quick')
const certificationProcessing = () => import('@/views/certification/processing')
const certificationSuccess = () => import('@/views/certification/success')
const certificationFailure = () => import('@/views/certification/failure')
export default [
  {
    name: 'certificationNormal',
    path: '/certification/normal',
    component: certificationNormal,
    meta: {
      title: '提交资料',
      breadcrumb: [{
        path: '',
        title: '企业认证'
      }, {
        path: '',
        title: '提交资料'
      }]
    }
  },
  {
    name: 'certificationQuick',
    path: '/certification/quick',
    component: certificationQuick,
    meta: {
      title: '快速认证',
      breadcrumb: [{
        path: '',
        title: '企业认证'
      }, {
        path: '',
        title: '快速认证'
      }]
    }
  },
  {
    name: 'certificationProcessing',
    path: '/certification/processing',
    component: certificationProcessing,
    meta: {
      title: '审核中',
      breadcrumb: [{
        path: '',
        title: '企业认证'
      }, {
        path: '',
        title: '审核中'
      }]
    }
  },
  {
    name: 'certificationSuccess',
    path: '/certification/success',
    component: certificationSuccess,
    meta: {
      title: '审核成功',
      breadcrumb: [{
        path: '',
        title: '企业认证'
      }, {
        path: '',
        title: '审核成功'
      }]
    }
  },
  {
    name: 'certificationFailure',
    path: '/certification/failure',
    component: certificationFailure,
    meta: {
      title: '审核失败',
      breadcrumb: [{
        path: '',
        title: '企业认证'
      }, {
        path: '',
        title: '审核失败'
      }]
    }
  },
]

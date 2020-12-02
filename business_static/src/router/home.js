const home = () => import('../views/home/projectsAnalyseValue/ProjectsAnalyseValue')
const test = () => import('../views/test')
export default [
  {
    path: '/',
    component: home,
    redirect: '/workbench',
    meta: {
      title: 'budget'
    }
  },
  {
    name: 'home_old',
    path: '/home_old',
    component: home,
    meta: {
      title: '首页'
    }
  },
  {
    name: 'test',
    path: '/test',
    component: test,
    meta: {
      title: '测试'
    }
  },
  {
    name: 'home',
    path: '/workbench',
    component: () => import('../views/home/home'),
    meta: {
      title: '工作台'
    }
  }
]

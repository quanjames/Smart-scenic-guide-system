import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'


Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
  {
    path:'/',
    name:'用户界面',
    component:()=>import('../views/ClientView/ClientMange.vue'),
    redirect: "/spot",
    children:[
      {path: 'spot', name:'SpotHome',component:()=>import('../views/ClientView/Spot.vue')},
      {path:'article',name:"文章公告",component:()=>import('../views/ClientView/Article.vue')},
      {path:'articleDetail',name:"文章公告详情",component:()=>import('../views/ClientView/ArticleDetail.vue')},
      {path:'show',name:"景点节目",component:()=>import('../views/ClientView/Show.vue')},
      {path:'spotIntroduce',name:"景点介绍",component:()=>import('../views/ClientView/SpotIntroduce.vue')},
      {path:'showDetail',name:"景点节目详情",component:()=>import('../views/ClientView/ShowDetail.vue')},
      {path:'clientUser',name:"个人信息",component:()=>import('../views/ClientView/ClientUser.vue')},
      {path:'clientUserPassword',name:"个人信息",component:()=>import('../views/ClientView/ClientUserPassword.vue')},
    ]
  },
  {
    path: '/manage',
    name: '首页',
    component: () => import('../views/MangeView/Manage.vue'),

    children: [
      { path: 'home', name: '首页', component: () => import('../views/MangeView/Home.vue') },
      { path: 'user', name: '用户管理', component: () => import('../views/MangeView/User.vue') },
      { path: 'person', name: '个人信息', component: () => import('../views/MangeView/Person.vue') },
      { path: 'file', name: '文件信息', component: () => import('../views/MangeView/File.vue') },
      { path: 'spotManage', name: '景点信息', component: () => import('../views/MangeView/SpotManage.vue') },
      { path: 'articleManage', name: '景点公告', component: () => import('../views/MangeView/ArticleManage') },
      { path: 'articleCommentManage', name: '景点公告评论管理', component: () => import('../views/MangeView/ArticleCommentManage') },
      { path: 'showManage', name: '景点节目', component: () => import('../views/MangeView/ShowManage.vue') },
      { path: 'showCommentManage', name: '景点节目评论管理', component: () => import('../views/MangeView/ShowCommentManage.vue') },

    ]
  },
  {
    path:'/login',
    name:'登录',
    component:()=>import('../views/Login.vue'),
  },
  {
    path:'/register',
    name:'注册',
    component:()=>import('../views/Register.vue'),
  },

  {
    path:'/adminlogin',
    name:'登录',
    component:()=>import('../views/MangeView/AdminLogin'),
  },

  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})


// 路由守卫
// 路由守卫
// router.beforeEach((to, from, next) => {
//   localStorage.setItem("currentPathName", to)  // 设置当前的路由名称，为了在Header组件中去使用
//   store.commit("setPath")  // 触发store的数据更新
//   next()  // 放行路由
// })


export default router

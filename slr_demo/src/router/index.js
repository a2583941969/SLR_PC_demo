import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../components/index.vue';
// 解决重复点击相同按钮跳转同一页面报错问题

const originalPush = VueRouter.prototype.push

VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
Vue.use(VueRouter);

const routes = [{
        path: '/',
        name: 'index',
        component: index
    },
    {
        path: '/product',
        name: 'product',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () =>
            import ( /* webpackChunkName: "product" */ '../components/product.vue')
    },
    {
        path: '/details',
        name: 'details',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () =>
            import ( /* webpackChunkName: "product" */ '../components/details.vue')
    }
]

const router = new VueRouter({
    routes
})

export default router
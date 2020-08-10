import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import myHeader from './components/myHeader.vue';
import myFoot from './components/myFoot.vue';
import axios from 'axios';

Vue.prototype.$axios = axios;
axios.defaults.baseURL = 'http://127.0.0.1:3000';


Vue.config.productionTip = false;
Vue.component("my-header", myHeader);
Vue.component("my-foot", myFoot);

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
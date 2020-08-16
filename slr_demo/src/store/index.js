import Vue from 'vue';
import Vuex from 'vuex';
import $axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {//保存数据
    isLogin:localStorage.getItem('isLogin')||false,
    phoneNum:localStorage.getItem('phoneNum')||'',
    uid:localStorage.getItem('uid')||'',
    addShop:localStorage.getItem('addShop')||[],
  },
  mutations: {//修改state中的数据
    set_isLogin(state,bool){
      state.isLogin=bool;
    },
    set_phoneNum(state,p){
      state.phoneNum=p;
    },
    set_uid(state,id){
      state.uid=id;
    },
    set_addShop(state,obj){
      if(state.addShop === []){
        console.log(123)
        state.addShop=JSON.parse(state.addShop);
      }
      state.addShop.push(obj)
    }
  }, 
  actions: {//发送异步函数

  }, 
  modules:{}
});
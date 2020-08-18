import Vue from 'vue';
import Vuex from 'vuex';
import $axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {//保存数据
    isLogin:localStorage.getItem('isLogin')||false,
    phoneNum:localStorage.getItem('phoneNum')||'',
    uid:localStorage.getItem('uid')||'',
    // 页面刷新后，直接将从缓存里拿到的数据解析为 数组，方便调用
    addShop:JSON.parse(localStorage.getItem('addShop'))||[], 
  },  
  getters:{
    getCount(state){
      var count=0;
      state.addShop.forEach(e => {
        count +=e.scount;
      });
      return count;
    }
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
    set_addShop(state,obj,cb){
      if(state.addShop === []){
        console.log(123)
        state.addShop=JSON.parse(state.addShop);
      }
      if(cb=="push"){
        state.addShop.push(obj)
      }else{
        console.log(state.addShop,"这是vuex");
        state.addShop.unshift(obj)
      }
      if(obj==""){
        state.addShop.splice(0);
      }
    }
  }, 
  actions: {//发送异步函数

  }, 
  modules:{}
});
import Vue from 'vue';
import Vuex from 'vuex';
import $axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {//保存数据
    isLogin:localStorage.getItem('isLogin')||false,
    phoneNum:localStorage.getItem('phoneNum')||'',
    uid:localStorage.getItem('uid')||''
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
    }
  }, 
  actions: {//发送异步函数
    // login_is(context,user){
    //   $axios.post('/user/login',`phoneNum=${user.phoneNum}&upwd=${user.upwd}`).then(result=>{
    //     if(result.code!==undefined){
    //       context.commit('set_isLogin',true);
    //       context.commit('set_phoneNum',result.phoneNum);
    //       context.commit('set_uid',result.uid);
    //       localStorage.setItem('isLogin',)
    //       localStorage.setItem('phoneNum',result.phoneNum)
    //       localStorage.setItem('uid',result.uid)
    //     }
    //   });
    // }
  }, 
  modules:{}
});
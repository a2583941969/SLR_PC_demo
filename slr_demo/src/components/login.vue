<template>
  <div class="login page_body">
    <div class="login-bg">
      <img src="../assets/login/login-gruppe.png" alt />
      <div>
        <p>会员登录</p>
        <p>Login</p>
      </div>
    </div>
    <div class="login-content">
      <div class="login-left">
        <div>
          <!-- 手机号 -->
          <div class="phoneNum">
            <label>
              手机号
              <span>*</span>
            </label>
            <div>
              <input
                type="text"
                name="phoneNum"
                id="tel"
                placeholder="请输入您的手机号"
                maxlength="11"
                v-model="phone"
                @blur="tel"
              />
              <span :class="[ishint]">{{phoneMsg}}</span>
            </div>
          </div>
          <!-- 密码 -->
          <div class="pwd">
            <label>
              登录密码
              <span>*</span>
            </label>
            <div>
              <input
                type="password"
                name="upwd"
                id="upwd"
                placeholder="请输入您的密码"
                v-model="pwd"
                @blur="password"
                maxlength="16"
              />
              <span :class="[pwdStyle]">{{upwdMsg}}</span>
            </div>
          </div>
          <!-- 验证码 -->
          <div class="verify">
            <label>
              验证码
              <span>*</span>
            </label>
            <div>
              <input type="text" name="verify" placeholder="请输入图片验证码" />
              <span id="verify-msg"></span>
            </div>
            <div>
              <img src="../assets/login/botdetectcaptcha.jpg" alt />
              <a href="javascript:;">
                <i></i>
              </a>
            </div>
          </div>
          <!-- 记住用户名 -->
          <div class="remember">
            <label>
              <input type="checkbox" />
              <span>记住用户名</span>
            </label>
            <a href="#">忘记密码</a>
          </div>
          <!-- 登录按钮 -->
          <div class="btn">
            <a @click="login_is">登录</a>
          </div>
          <!-- 第三方账号登录 -->
          <div class="third-party">
            <p>第三方账号登录</p>
            <div>
              <a href="#">
                <i></i>
              </a>
              <a href="#">
                <i></i>
              </a>
              <a href="#">
                <i></i>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="login-right">
        <h3>还不是会员?</h3>
        <div class="lr-content">
          <p>注册成为双立人会员有哪些好处?</p>
          <dl>
            <dt>双立人会员专享：</dt>
            <dd>获取会员专属优惠及赠品</dd>
            <dd>添加喜爱的商品至收藏夹</dd>
            <dd>保存个人地址簿，购物更加便捷</dd>
          </dl>
          <div>
            <router-link to="/registration">立即注册</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations} from 'vuex' 
export default {
  data(){
    return{
      // 用户号码
      phone:'',
      phoneMsg:'',
      ishint:'',
      // 用户密码
      pwd:'',
      upwdMsg:'',
      pwdStyle:'',
      // 
    }
  },
  methods:{
    ...mapMutations(['set_isLogin','set_phoneNum','set_uid']),
    // msg-hint
    tel(){
      let reg=/^1[3-9]\d{9}$/;
      if(this.phone==''){
        this.phoneMsg="请输入电话号码";
        this.ishint='msg-hint'
      }else if(!reg.test(this.phone.trim())){
        this.phoneMsg="手机号码格式不正确";
        this.ishint='msg-hint'
      }else{
        this.phoneMsg='';
        this.ishint=''
      }
    },
    password(){
      let reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
      if(this.pwd==''){
        this.upwdMsg='请输入密码';
        this.pwdStyle="msg-hint"
      }else if(!reg.test(this.pwd.trim())){
        this.upwdMsg='密码需为至少6位至多16位并同时包括数字和字母';
        this.pwdStyle='msg-hint';
      }else{
        this.upwdMsg='';
        this.pwdStyle='';
      }
    },
    login_is(){
      this.$axios.post('/user/login',`phoneNum=${this.phone}&upwd=${this.pwd}`).then(result=>{

        console.log(result.data[0].code);
        console.log(result.data[0])

        if(result.data[0].code==undefined){
          console.log(1)
          localStorage.setItem('isLogin',true);
          localStorage.setItem('phoneNum',result.data[0].phoneNum);
          localStorage.setItem('uid',result.data[0].uid);

          this.set_isLogin(true);
          this.set_phoneNum(result.data[0].phoneNum);
          this.set_uid(result.data[0].uid);
          this.$router.push('/');
        }else{
          this.upwdMsg='用户名或密码错误';
          this.pwdStyle='msg-hint';
        }
      });
    }
  }
};
</script>

<style>
.login-bg {
  width: 100%;
  min-width: 1200px;
  position: relative;
}
.login-bg > img {
  min-height: 180px;
  max-width: 100%;
}
.login-bg > div {
  width: auto;
  position: absolute;
  margin-left: -230px;
  left: 50%;
  top: 25%;
  text-align: center;
}
.login-bg > div > p:first-child {
  font-size: 24px;
  color: #333;
  letter-spacing: 0;
  line-height: 20px;
}
.login-bg > div > p:last-child {
  margin-top: 6px;
  font-size: 16px;
  color: #999;
  letter-spacing: 1.14px;
}
div.login-content {
  width: 100%;
  max-width: 990px;
  margin: 0 auto;
  position: relative;
  padding-bottom: 100px;
}
div.login-content > div {
  background: #fff;
  box-shadow: 1px 2px 20px 0 rgba(0, 0, 0, 0.3);
  margin-top: -66px;
}
div.login-content::after {
  content: "";
  display: block;
  clear: both;
}
div.login-left {
  float: left;
  width: 62%;
  padding-bottom: 30px;
}
div.login-left::before {
  content: "";
  display: table;
}
div.login-left > div {
  max-width: 400px;
  margin: 30px auto 0;
}
div.login-left div div label {
  font-size: 14px;
  color: #999;
  letter-spacing: 0.58px;
  margin-bottom: 12px;
  line-height: 20px;
  display: inline-block;
}
div.login-left div div label span {
  color: red;
}
div.login-left div div div input {
  border: 1px solid #e1e1e1;
  border-radius: 2px;
  padding: 5px 10px;
  width: 100%;
  height: 40px;
  font-size: 14px;
  color: #333;
  box-sizing: border-box;
  outline: 0;
}
div.login-left div div div span {
  display: block;
  font-size: 12px;
  color: #ee1c25;
}
div.login-left div div div span.msg-hint {
  height: 35px;
  line-height: 35px;
}
div.pwd,
div.verify {
  margin-top: 20px;
  position: relative;
}
div.verify input {
  max-width: 260px;
}
div.verify > div:last-child {
  position: absolute;
  left: 270px;
  top: 30px;
}
div.verify > div:last-child img {
  vertical-align: middle;
}
div.verify > div:last-child a i {
  width: 20px;
  height: 20px;
  display: inline-block;
  background: url("../assets/icon.png") -586px -352px no-repeat;
  margin-left: 10px;
}
div.remember {
  line-height: 17px;
  margin-top: 14px;
}

div.remember > label > input {
  vertical-align: middle;
}

div.login-left div div.remember > label > span {
  display: inline-block;
  font-size: 12px;
  color: #807c77;
  letter-spacing: 0.5px;
  line-height: 17px;
}
div.remember a {
  float: right;
  font-size: 12px;
  color: #807c77;
  letter-spacing: 1px;
  text-decoration: underline;
}
div.third-party {
  padding-top: 20px;
}
div.third-party p {
  font-size: 14px;
  color: #807c77;
  letter-spacing: 0;
}
div.third-party div {
  margin-top: 14px;
}
div.third-party div a {
  margin-right: 40px;
}
div.third-party div a i {
  width: 24px;
  height: 24px;
  display: inline-block;
  background: url("../assets/icon.png") -120px -544px no-repeat;
}
div.third-party div a:nth-child(2) i {
  background-position: -90px -544px;
}
div.third-party div a:last-child i {
  background-position: -420px -544px;
}
div.login-right {
  float: right;
  width: 34%;
}
div.login-right > h3 {
  font-size: 20px;
  color: #333;
  letter-spacing: 0;
  line-height: 20px;
  text-align: center;
  border-bottom: 1px solid #e1e1e1;
  padding: 29px 0;
}
div.login-right div {
  max-width: 234px;
  margin: 0 auto;
}
div.login-right div > p {
  font-size: 16px;
  color: #807c77;
  letter-spacing: 0;
  line-height: 16px;
  padding-top: 27px;
}
div.login-right div dl dt {
  font-size: 14px;
  color: #333;
  letter-spacing: 0;
  padding: 30px 0 12px;
  font-weight: 400;
}
div.login-right div dl dd {
  font-size: 14px;
  color: #999;
  letter-spacing: 0;
  line-height: 30px;
  position: relative;
  padding-left: 10px;
}
div.login-right div dl dd::before {
  content: "";
  width: 5px;
  height: 5px;
  display: block;
  border-radius: 50%;
  background: #ee1c25;
  position: absolute;
  top: 12px;
  left: 0;
}
div.login-right div div {
  text-align: center;
  margin: 43px 0 49px;
}
div.login-right div div a {
  display: inline-block;
  height: 40px;
  width: 128px;
  border: 1px solid #807c77;
  color: #807c77;
  line-height: 38px;
  box-sizing: border-box;
  border-radius: 2px;
}
</style>
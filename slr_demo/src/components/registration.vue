<template>
  <div class="reg page_body">
    <div class="reg-bg">
      <img src="../assets/login/login-gruppe.png" alt />
      <div>
        <p>会员注册</p>
        <p>Registration</p>
      </div>
    </div>
    <div class="reg-content">
      <div>
        <!-- nav -->
        <div class="ptogress-tit">
          <label class="active" id="phone">
            <i></i>
            <span>手机验证</span>
          </label>
          <label class id="pwd">
            <i></i>
            <span>设置密码</span>
          </label>
          <label id="information">
            <i></i>
            <span>完善资料</span>
          </label>
        </div>
        <div class="inps">
          <!-- 第一步页面 -->
          <div class="inp show" data-nav="phone">
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
                <span id="phone-msg" :class="[ishint]">{{phoneMsg}}</span>
              </div>
            </div>
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
            <div class="note">
              <label>
                短信验证
                <span>*</span>
              </label>
              <div>
                <input type="text" name="note" maxlength="6" />
                <span id="note-msg"></span>
              </div>
              <span>获取验证码</span>
            </div>
            <!-- 下一步 -->
            <div class="btn">
              <a @click="nextStep">下一步</a>
            </div>
            <div class="isvip">
              已经是会员?
              <router-link to="/login">去登陆</router-link>
            </div>
          </div>
          <!-- 第二步页面 -->
          <div class="inp" data-nav="pwd">
            <div class="pwd">
              <label>
                输入密码
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
            <div class="pwdtwo">
              <label>
                再次输入密码
                <span>*</span>
              </label>
              <div>
                <input
                  type="password"
                  placeholder="请输入您的密码"
                  maxlength="16"
                  v-model="pwdTwo"
                  @blur="pwdFit"
                />
                <span :class="[pwdTwostyle]">{{pwdTwomsg}}</span>
              </div>
            </div>
            <!-- 用户协议 -->
            <div class="user-deal">
              <label>
                <input type="checkbox" />
                <span>
                  我已知晓双立人的
                  <a href="javascript:;">用户协议</a>
                  及
                  <a href="javascript:;">隐私政策</a>
                </span>
              </label>
            </div>
            <div class="btn">
              <button @blur="register">完成注册</button>
            </div>
            <!-- 下一步 -->
            <div class="descri-txt">
              您还可以继续
              <a @click="nextStep">下一步</a>
              完善个人信息，获取专属优惠券。
            </div>
          </div>
          <!-- 第三步页面 -->
          <div class="inp" data-nav="information">
            <div class="uname">
              <label>姓名</label>
              <div>
                <input type="text" name="uname" id="uname" placeholder="请输入您的姓名" />
              </div>
            </div>
            <div class="gender">
              <label>性别</label>
              <div>
                <label>
                  <input type="radio" name="gender" value="1" />男
                </label>
                <label>
                  <input type="radio" name="gender" value="0" />女
                </label>
              </div>
            </div>
            <div class="email">
              <label>邮箱</label>
              <div>
                <input type="text" name="email" id="email" placeholder="请输入您的邮箱" />
              </div>
            </div>
            <div class="btn">
              <a href="javascript:;">完成编辑</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      phone: "",
      phoneMsg: "",
      ishint: "",
      isOccupy: "",

      pwd: "",
      upwdMsg: "",
      pwdStyle: "",

      pwdTwo:'',
      pwdTwostyle:'',
      pwdTwomsg:''
    };
  },
  methods: {
    nextStep(e) {
      if (e.target.nodeName == "A") {
        let divEle = e.target.parentNode.parentNode;
        let divEle_next = divEle.nextSibling;
        divEle.className = "inp";
        divEle_next.className = "inp show";
        let lab = document.getElementById(divEle_next.dataset.nav);
        console.log(lab);
        lab.className = "active";
        if (lab.id == "pwd") {
          lab.children[0].style.backgroundPosition = "-586px -404px";
        } else if (lab.id == "information") {
          lab.children[0].style.backgroundPosition = "-614px 0";
        }
      }
    },
    tel() {
      let reg = /^1[3-9]\d{9}$/;
      if (this.phone == "") {
        this.phoneMsg = "请输入电话号码";
        this.ishint = "msg-hint";
      } else if (!reg.test(this.phone.trim())) {
        this.phoneMsg = "手机号码格式不正确";
        this.ishint = "msg-hint";
      } else {
        this.phoneMsg = "";
        this.ishint = "";
        // 如果手机号合法发送请求判断是否被占用
        this.$axios
          .post("/user/reg", `phoneNum=${this.phone}`)
          .then((result) => {
            if (result.data.code == 0) {
              this.phoneMsg = "号码已被占用";
              this.ishint = "msg-hint";
            }
          });
      }
    },
    // 验证密码
    password() {
      let reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
      if (this.pwd == "") {
        this.upwdMsg = "请输入密码";
        this.pwdStyle = "msg-hint";
      } else if (!reg.test(this.pwd.trim())) {
        this.upwdMsg = "密码需为至少6位至多16位并同时包括数字和字母";
        this.pwdStyle = "msg-hint";
      } else {
        this.upwdMsg = "";
        this.pwdStyle = "";
      }
    },
    // 检查两次密码输入是否一致
    pwdFit(){
      if( this.pwdTwo==''){
        this.pwdTwomsg="再次输入密码";
        this.pwdTwostyle="msg-hint"
      }
      else if(this.pwd!==this.pwdTwo ){
        this.pwdTwomsg="两次密码不一致";
        this.pwdTwostyle="msg-hint"
      }else{
        this.pwdTwostyle='';
        this.pwdTwomsg='';
      }
    },
    // 完成注册
    register(){
      if(this.pwdTwo==this.pwd && this.pwd!=''){
        this.$axios.post('/user/reg',`phoneNum=${this.phone}&upwd=${this.pwd}`).then(result=>{
          console.log(result.data);
        })
      }
    }
  },
  mounted() {},
};
</script>
<style>
.reg-bg {
  width: 100%;
  min-width: 1200px;
  position: relative;
}
.reg-bg > img {
  min-height: 180px;
  max-width: 100%;
}
.reg-bg > div {
  width: 100%;
  position: absolute;
  top: 25%;
}
.reg-bg > div > p {
  text-align: center;
}
.reg-bg > div > p:first-child {
  font-size: 24px;
  color: #333;
  letter-spacing: 0;
  line-height: 20px;
}
.reg-bg > div > p:last-child {
  margin-top: 6px;
  font-size: 16px;
  color: #999;
  letter-spacing: 1.14px;
}
div.reg-content {
  width: 990px;
  margin: 0 auto 100px;
  background: #fff;
  box-shadow: 1px 2px 20px 0 rgba(0, 0, 0, 0.3);
  position: relative;
}
div.reg-content > div {
  margin-top: -66px;
}
div.reg-content > div > div {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px 0 20px;
}

div.ptogress-tit {
  text-align: center;
  margin-bottom: 30px;
}
div.ptogress-tit label {
  display: inline-block;
}
div.ptogress-tit label span {
  display: block;
  width: 120px;
  font-size: 12px;
  margin-top: 5px;
  color: #e1e1e1;
}
div.ptogress-tit label.active span {
  color: #807c77;
}
div.ptogress-tit label i {
  display: inline-block;
  width: 20px;
  height: 20px;
  background: url(../assets/icon.png) -586px -456px no-repeat;
}
div.ptogress-tit label:not(:last-child) i::after {
  content: "";
  display: block;
  width: 100px;
  height: 2px;
  background: #e1e1e1;
  margin-left: 20px;
  margin-top: 9px;
}
div.ptogress-tit label:nth-child(2) i {
  background-position: -614px -26px;
}
div.ptogress-tit label.active i::after {
  background: #807c77;
}
div.ptogress-tit label:nth-child(3) i {
  background-position: -586px -482px;
}
div.inps {
  position: relative;
  height: 410px;
}
div.inp {
  width: 100%;
  position: absolute;
  background: #fff;
  display: none;
}

div.show {
  display: block;
}
div.inp div label {
  font-size: 14px;
  color: #999;
  letter-spacing: 0.58px;
  margin-bottom: 12px;
  line-height: 20px;
  display: inline-block;
}
div.inp div label span {
  color: red;
}
div.inp div div > input {
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
div.inp div div span {
  display: block;
  font-size: 12px;
  color: #ee1c25;
}

div.inp div div span.msg-hint {
  height: 35px;
  line-height: 35px;
}
div.pwdtwo{
  margin-top:10px;
}
div.verify{
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
div.note {
  margin-top: 20px;
  position: relative;
}
div.note div input {
  padding: 5px 108px 5px 9px;
}
div.note > span {
  position: absolute;
  width: auto;
  margin-left: 0;
  top: 45px;
  right: 0;
  font-size: 14px;
  color: #333;
  letter-spacing: 0.58px;
  cursor: pointer;
  border-left: 1px solid #ccc;
  min-width: 97px;
  text-align: center;
}

div.isvip {
  color: #807c77;
  letter-spacing: 0;
  margin-top: 15px;
  font-size: 14px;
}
div.isvip a {
  text-decoration: underline;
}

div.user-deal {
  margin-top: 14px;
}
div.user-deal label input {
  vertical-align: middle;
}
div.inp div.user-deal label span {
  font-size: 12px;
  color: #807c77;
  letter-spacing: 0.5px;
  line-height: 17px;
}
div.user-deal label span a {
  text-decoration: underline;
}
div.descri-txt {
  margin: 18px 0 20px;
  font-size: 12px;
  color: #807c77;
  letter-spacing: 0;
}
div.descri-txt a {
  text-decoration: underline;
}
div.gender {
  margin-top: 20px;
}
div.gender > div label {
  margin-right: 20px;
}
</style>
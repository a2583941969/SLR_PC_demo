<template>
  <div class="myfooter">
    <div class="myfooter_content">
      <div class="mf_left">
        <ul>
          <li>
            <a href="#">购买帮助</a>
            <ul>
              <li><a href="#">常见问题</a></li>
            </ul>
          </li>
          <li>
            <a href="#">查询信息</a>
            <ul>
              <li><a href="#">订单查询</a></li>
              <li><a href="#">线下门店</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="mf_right">
        <div>
          <span>订阅邮件时刻关注双立人最新资讯</span>
          <div class="email_input">
            <input type="text" maxlength="60" placeholder="请输入您的邮箱地址">
            <a href="#">立即订阅</a>
          </div>
        </div>
        <div>
          <div>
            <span>关注我们</span>
            <a href="#">
            <i></i>
            <i></i>
            </a>
          </div>
          <div>
            <span>联系我们</span>
            <a href="#">
              <i></i>
              在线客服(9:00-22:00,周一至周日)
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="mf_foot">
      <div>
        <ul>
          <li>Copyright © Zwilling, Inc. </li>
          <li><a href="#">使用条款</a></li>
          <li><a href="#">隐私政策</a></li>
        </ul>
      </div>
      <div>
        <ul>
          <li><a href="#">沪ICP备06051557号</a></li>
          <li><a href="#">
            <i></i>
            沪公网安备 备案中</a></li>
          <li><a href="#">
            <img src="../assets/head_foot/business.png" alt="">
            电子营业执照</a></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style>
.myfooter{
  width: 100%;
  border-top: 1px solid #ccc;
}
.myfooter>div.myfooter_content{
  width: 1020px;
  margin: 0 auto;
  display: flex;
  padding: 50px 0;
}
.myfooter>div.myfooter_content>div{
  width: 50%;
}

.myfooter>div.myfooter_content>div.mf_left>ul>li{
  width: 33.33%;
  float: left;
}
.myfooter>div.myfooter_content>div.mf_left>ul>li>a{
  color: #333;
  line-height: 24px;
  border-left:4px solid red ;
  padding-left: 10px;
}
.myfooter>div.myfooter_content>div.mf_left>ul>li>ul{
  margin-top: 22px;
}
.myfooter>div.myfooter_content>div.mf_left>ul>li>ul>li>a{
  display: block;
  padding: 10px 14px;
  font-size: 14px;
  color: #807c77;
}
.myfooter>div.myfooter_content>div.mf_right{
  padding-left: 108px;
  border-left: 1px solid #aaa;
}
.myfooter>div.myfooter_content>div.mf_right>div>div.email_input{
  width: 403px;
  margin-top:17px;
  position: relative;
}
.myfooter>div.myfooter_content>div.mf_right>div>div.email_input>input{
  width: 380px;
  height: 40px;
  border: 0;
  outline: 0;
  padding: 0 135px 0 6px;
  box-sizing: border-box;
}
.myfooter>div.myfooter_content>div.mf_right>div>div.email_input>a{
  display: block;
  width: 128px;
  height: 40px;
  color: #fff;
  font-size: 14px;
  text-align: center;
  line-height: 40px;
  background-color: #807c77;
  border-radius: 0.25rem;
  position: absolute;
  top: 0;
  right: 0;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child{
  display: flex;
  margin: 20px 0;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child>div:first-child{
width: 40%;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child>div>a{
  display: flex;
  margin-top: 20px;
  font-size: 14px;
  line-height: 20px;
  color:#999;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child>div:first-child>a>i{
  width: 24px;
  height: 24px;
  display: inline-block;
  margin-right: 30px;
  background: url('../assets/icon.png') -450px -544px no-repeat;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child>div:first-child>a>i:last-child{
  background-position-x: -480px;
}
.myfooter>div.myfooter_content>div.mf_right>div:last-child>div:last-child>a>i{
  width: 20px;
  height: 20px;
  display: inline-block;
  background: url('../assets/icon.png') -586px -378px no-repeat;
  margin-right: 5px;
}





.myfooter>div.mf_foot{
  height: 35px;
  background: #807c77;
  display: flex;
  justify-content: center;
  font-size: 12px; 
}
.myfooter>div.mf_foot>div>ul>li{
  float: left;
  line-height: 35px;
  color: #ccc;
}
.myfooter>div.mf_foot>div>ul>li>a{
    padding:2px 15px;
  color: #ccc;
}
.myfooter>div.mf_foot>div:first-child>ul>li:not(:first-child)>a{
  border-right:1px solid #ccc ;
}
.myfooter>div.mf_foot>div>ul>li>a>img{
  width: 14px;
  vertical-align: middle;
}
.myfooter>div.mf_foot>div>ul>li>a>i{
  display: inline-block;
  width: 14px;
  height: 15px;
  background: url('../assets/icon.png') 0 -601px no-repeat;
}
</style>
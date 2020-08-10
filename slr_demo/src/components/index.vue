<template>
  <div class="myindex page_body">
    <!-- 模块一 -->
    <div class="banner">
      <div @mouseenter="stop" @mouseleave="play">
        <ul id="ban" >
          <li>
            <a href="#">
              <img src="../assets/index/banner_01.jpg" alt="" >
            </a>
          </li>
          <li>
            <a href="#">
              <img src="../assets/index/banner02.jpg" alt=""  >
            </a>
          </li>
          <li>
            <a href="#">
              <img src="../assets/index/banner_01.jpg" alt=""  >
            </a>
          </li>
        </ul>
        <ul id="i_index">
          <li class="active_a"></li>
          <li></li>
        </ul>
      </div>
      <div>
        <a href="#">
          <img src="../assets/index/15913468645769200.jpg" alt="">
        </a>
      </div>
    </div>
    <!-- 模块二 -->
    <div class="intro">
      <div>
        <div>
          <h2>旗下品牌</h2>
          <p>德国双立人旗下包括德国ZWILLING双立人不锈钢刀具、锅具、法国STAUB珐宝珐琅铸铁锅、意大利BALLARINI巴拉利尼环保不粘锅三大品牌的厨具产品，并致力于拓展厨房小家电市场，带给消费者高质量，具有实用性的产品。</p>
        </div>
        <div>
          <ul>
            <li>
              <img src="../assets/index/15882473651171188.png" alt="">
            </li>
            <li>
              <img src="../assets/index/15882473923348693.png" alt="">
            </li>
            <li>
              <img src="../assets/index/15882474092033788.png" alt="">
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 模块三   暂未完成-->
    <div class="carsouel module_head">
      <div>
        <h1>
          <span>发现最爱</span>
          <span>DISCOVER YOUR FAVOURITE</span>
          <a href="#">
            查看更多
            <i></i>
          </a>
        </h1>
      </div>
      <div></div>
    </div>
    <!-- 模块四 -->
    <div class="sales ">
      <div>
        <a href="#">
          <img src="../assets/index/15934108677966176.jpg" alt="">
        </a>
      </div>
      <div>
         <a href="#">
          <img src="../assets/index/15919507424745224.jpg" alt="">
        </a>
      </div>
    </div>
    <!-- 模块五 人气No.1 -->
    <div class="module_head index_pro">
      <div>
        <h1>
          <span>人气 No.1</span>
          <span>THE MOST POPULAR</span>
          <a href="#">
            查看更多
            <i></i>
          </a>
        </h1>
      </div>
      <div class="pro_show">
        <div>
          <div class="move_up" v-for="(p,i) of pro" :key="i">
            <div>
              <router-link :to="`/details?pid=${p.pid}`"><img :src="p.idx_img" alt=""></router-link>
              <span>热卖</span>
            </div>
            <div>
              <a href="#">
                <span>{{p.brand}}</span>
                <span>{{p.pname}}</span>
              </a>
              <div>
                <span>
                  ￥{{(p.price*p.discount).toFixed(2)}}
                  <del>￥{{p.price}}</del>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div>
          <ul @click="move" id="parent_ul">
            <li ></li>
            <li ></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 模块五 -->
    <div class="story">
      <div></div>
      <div>
        <h2>品牌故事</h2>
        <span>SINCE 1731.</span>
        <p>德国双立人，1731年诞生于刀剑之城索林根，凭借独特的钢材配方和精湛的制刀工艺蜚声世界。双立人摩登厨房产品线，囊括了专业厨师及烹饪爱好者从厨房到餐桌，挥洒厨艺灵感的一切需求。</p>
        <a href="#">查看更多</a>
      </div>
    </div>
    <!-- 模块六 -->
    <div class="prefecture-box">
      <div>
        <div class="move_up" v-for="(obj,i) of pre" :key="i">
          <a href="#">
            <img :src="obj.bigimg" alt="">
            <div>
              <img :src="obj.smimg" alt="">
            </div>
          </a>
          <a href="#">
            <div>
              <p>{{obj.text}}</p>
            </div>
          </a>
        </div>
      </div>
    </div>
    <!-- 模块七 -->
    <div class="module_head serve">
      <div>
        <h1>
          <span>我们的服务</span>
          <span>OUR SERVICES</span>
        </h1>
      </div>
      <ul>
        <li class="move_up">
          <a href="#">
            <i></i>
            <div>
              <h5>售后服务</h5>
              <p>双立人服务中心提供多渠道优质售后服务，让您长久拥有良好的用户体验。</p>
            </div>
          </a>
        </li>
        <li class="move_up">
          <a href="#">
            <i></i>
            <div>
              <h5>售后服务</h5>
              <p>双立人服务中心提供多渠道优质售后服务，让您长久拥有良好的用户体验。</p>
            </div>
          </a>
        </li>
        <li class="move_up">
          <a href="#">
            <i></i>
            <div>
              <h5>售后服务</h5>
              <p>双立人服务中心提供多渠道优质售后服务，让您长久拥有良好的用户体验。</p>
            </div>
          </a>
        </li>
      </ul>
    </div>

  </div>
</template>
<script>
export default {
  data(){
    return{
      timer:"",
      pro:[],
      pre:[
        {
          bigimg:require("../assets/index/15317176974206874.jpg"),
          smimg:require("../assets/index/15317177002594466.png"),
          text:"摩登厨房体验的延伸，帮助时髦人士获取实用烹饪技巧，惊喜发现自己的切配烹煮天赋。让一群人用做一顿饭代替吃一顿饭，感受厨房社交的乐趣。"
      },
      {
          bigimg:require("../assets/index/15317176974206874.jpg"),
          smimg:require("../assets/index/15317177002594466.png"),
          text:"摩登厨房体验的延伸，帮助时髦人士获取实用烹饪技巧，惊喜发现自己的切配烹煮天赋。让一群人用做一顿饭代替吃一顿饭，感受厨房社交的乐趣。"
      },
      {
          bigimg:require("../assets/index/15317176974206874.jpg"),
          smimg:require("../assets/index/15317177002594466.png"),
          text:"摩登厨房体验的延伸，帮助时髦人士获取实用烹饪技巧，惊喜发现自己的切配烹煮天赋。让一群人用做一顿饭代替吃一顿饭，感受厨房社交的乐趣。"
      }
      ]
    }
  },
  methods:{
    banner(){
      var ul=document.getElementById("ban");
      var i_index=document.getElementById("i_index");
      var li=i_index.children;
      var move=0;
        return setInterval(()=>{
          move -= 100;
          ul.className = "ani";
          if(move<=-300){
            ul.className = "";
            move = 0;
          }
          ul.style.marginLeft =  move+'vw';
          move<=-100 && move>-200?li[1].className="active_a":li[1].className='';
           move>-100 || move<= -200? li[0].className="active_a":li[0].className='';
        },2000);
      },
      stop(e){
        clearInterval( this.timer)
      },
      play(){
        this.timer=this.banner();
    },
    move(e){
      let pro_=document.getElementsByClassName("pro_show")[0].children[0];
      let parent_ul=document.getElementById("parent_ul").children;
      if(e.target.nodeName == "LI"){
        if(e.target == parent_ul[1]){
          pro_.style.marginLeft = -100+"%";
          parent_ul[1].style.backgroundColor="red";
          parent_ul[0].style.backgroundColor="#aeadaa";
        }else if(e.target == parent_ul[0]){
          pro_.style.marginLeft = 0;
           parent_ul[1].style.backgroundColor="";
          parent_ul[0].style.backgroundColor="red";
        }
      }
    },
  },

  mounted(){
    // 模块一轮播图
    this.timer=this.banner();
    // 使用axios 请求数据
    this.$axios.get('/index/pro').then(result=>{
      this.pro=result.data;
    }).catch(err=>{
      console.log(err)
    });
  }
  
}
</script>

<style>
.myindex{
  width: 100%;
}
div.banner{
  margin-bottom:60px;
}
div.banner>div{
  width: 100%;
  overflow: hidden;
}
div.banner>div>ul:first-child{
  width: 300vw;
  min-width: 3600px;
}
.ani{
  transition: margin 0.5s ;
}
div.banner>div>ul::after{
  content: "";
  display: block;
  clear: both;
}
div.banner>div>ul:first-child>li{
  width: 100vw;
  min-width: 1200px;
  float: left;
}
div.banner>div>ul>li>a>img{
  width: 100%;
}
#i_index{
  width: 36px;
  position: relative;
  top: -70px;
  margin: 0 auto;
}
#i_index>li{
  float: left;
  margin-right: 10px;
  width: 8px;
  height: 8px;
  background: #fff;
  cursor: pointer;
}
#i_index li.active_a{
  background: red;
}
div.banner>div:last-child{
  width: 32%;
margin-left: 68%;
margin-top: -100px;
}
div.banner>div:last-child>a>img{
  max-width: 100%;
}

div.intro{
  width: 100%;
}
div.intro>div{
  width:65%;
  min-width: 1200px;
  margin: 0 auto;
  display: flex;
  padding: 40px;
  box-sizing: border-box;
}
div.intro>div>div:first-child{
  width: 42%;
  margin: 48px 0;
  position: relative;
}
div.intro>div>div>h2{
  width: 202px;
  line-height: 55px;
  text-align: center;
  font-size: 30px;
  color: #fff;
  background: #363029;
  position: absolute;
  top:-40px;
  left: -70px;
}
div.intro>div>div>p{
  font-size: 14px;
  color: #807c77;
  line-height: 24px;
}
div.intro>div>div>p::before{
  content: "";
  display: block;
  width: 30px;
  height: 2px;
  background: red;
  margin:40px 0 20px;
}
div.intro>div>div:last-child{
  width: 52%;
  padding-top:100px ;
}
div.intro>div>div>ul{
  display: flex;
  align-items: center;
}
div.intro>div>div>ul>li{
  width: 33%;
  text-align: center;
}
div.intro>div>div>ul>li:first-child>img{
  width: 74px;
}
div.intro>div>div>ul>li:nth-child(2)>img{
  width: 94px;
}
div.intro>div>div>ul>li:last-child>img{
  width: 96px;
}
div.carsouel>div:last-child{
  height: 550px;
  background-color: pink;
}
div.module_head{
  width: 65%;
  min-width: 1200px;
  margin: 0 auto;
  margin-bottom:48px ;
}
div.module_head>div:first-child>h1{
  text-align: center;
  position: relative;
  z-index: 0;
}
div.module_head>div:first-child>h1>span{
  display: block;
}
div.module_head>div:first-child>h1>span:first-child{
  font-size: 30px;
  color: #000;
  margin-bottom: 7px;
}
div.module_head>div:first-child>h1>span+span{
  font-size: 20px;
  color:#aeadaa;
}
div.module_head>div:first-child>h1>a{
  position: absolute;
  right: 0;
  top: 50%;
}
div.module_head>div:first-child>h1>a>i{
  display: inline-block;
  width: 6px;
  height: 9px;
  background: url("../assets/icon.png") -147px -449px no-repeat;
}
/* 模块四 CSS */
div.sales{
  width: 65%;
  min-width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}
div.sales>div{
  width: 49%;
  margin-bottom: 48px;
}
div.sales>div>a>img{
  max-width: 100%;
}


div.index_pro>div.pro_show{
  width: 100%;
  margin-top: 30px;
  overflow: hidden;
}
div.index_pro>div.pro_show>div{
  width: 210%;
  transition: margin 1s;
  display: flex;
  margin-top: 20px;
}
.pro_show>div>div{
  width: 290px;
  height: 406px;
  box-sizing: border-box;
  padding: 0 10px;
  margin:0 8px;
}
div.index_pro>div.pro_show>div>div>div:first-child{
  text-align: center;
  margin-top:10px;
  position: relative;
}
div.index_pro>div.pro_show>div>div>div:first-child>span{
  position: absolute;
  top: 20px;
  left: 20px;
}
div.index_pro>div.pro_show>div>div>div:first-child img{
  width: 96%;
}
div.index_pro>div.pro_show>div>div>div span{
  font-size: 14px;
  color:#807c77;
  display: block;
}
div.index_pro>div.pro_show>div>div>div:last-child{
  padding: 15px 0;
}
div.index_pro>div.pro_show>div>div>div:last-child span{
  padding: 5px 0;
  color: #333;
}
div.index_pro>div.pro_show>div>div>div:last-child div{
  margin-top:20px;
}
div.index_pro>div.pro_show>div>div>div:last-child div>span{
  color: red;
  font-size: 18px;
}
div.index_pro>div.pro_show>div>div>div:last-child div>span>del{
  color: #807c77;
  font-size: 14px;
}
div.index_pro>div.pro_show>div:last-child{
  width: 40px;
  margin: 30px auto;
}
div.index_pro>div.pro_show>div:last-child>ul>li{
  width: 8px;
  height: 8px;
  float: left;
  margin-right: 8px;
  background-color: #aeadaa;
}
div.index_pro>div.pro_show>div:last-child>ul>li:first-child{
  background-color: red;
}
/* 模块五 */
div.story{
  width: 100%;
  min-width: 1200px;
  height: 430px;
  background: url("../assets/index/pic-banner2.jpg") center center no-repeat;
  position: relative;
}
div.story>div:first-child{
  width: 45%;
  border-bottom: 430px solid #333;
  border-right: 150px solid transparent;
  opacity: 0.7;
}
div.story>div:last-child{
  width: 382px;
  position: absolute;
  top: 64px;
  left: 320px;
    color:#fff;
}
div.story>div>h2{
  font-size: 28px;
  line-height: 36px;
  margin-bottom: 32px;
  letter-spacing:3;
}
div.story>div>h2::after{
  content:"";
  display: block;
  width: 40px;
  height: 2px;
  background: #fff;
  margin-top: 13px;
}
div.story>div>span{
  font-size: 26px;
  line-height: 1;
}
div.story>div>p{
  font-size: 14px;
  line-height: 24px;
  margin: 11px 0 30px;
  letter-spacing:1;
}
div.story>div>a{
  color: #fff;
  font-size: 14px;
  border: 1px solid #fff;
  padding: 12px 40px;
  border-radius: 0.25rem;
}
div.story>div>a:hover{
  background-color: red;
  border-color: red;
}
div.prefecture-box{
  width: 65%;
  min-width: 1200px;
  margin: 0 auto;
  padding: 50px 0;
}

div.prefecture-box>div::after{
  content: "";
  display: block;
  clear: both;
}
div.prefecture-box>div>div{
  width: 31%;
  float: left;
  margin-right:2% ;
}
div.prefecture-box>div>div>a:first-child{
  position: relative;
  display: block;
}
div.prefecture-box>div>div>a:first-child:after{
  content: "";
  display: none;
  width: 80%;
  height: 200px;
  border:1px solid #fff;
  position: absolute;
  top: 20px;
  left: 10%;
}
div.prefecture-box>div>div>a>img{
  width: 100%;
}
div.prefecture-box>div>div>a:first-child>div{
  position: absolute;
  top: 22%;
  left: 50%;
  transform: translate(-50%,0);
}
div.prefecture-box>div>div>a>div>img{
  width: 208px;
}
div.prefecture-box>div>div>a:last-child{
  display: block;
}
div.prefecture-box>div>div>a:last-child>div{
  width: 100%;
  padding: 20px 52px;
  box-sizing: border-box;
}
div.prefecture-box>div>div>a:last-child>div>p{
    height: 103px;
    color: #595959;
    font-size: 14px;
    letter-spacing: 1.5px;
    line-height: 20px;
}
div.prefecture-box>div>div:hover>a::after{
  display: block;
}

/* 模块七 */

div.serve>div{
  margin-bottom: 20px;
}
div.serve>ul::after{
  content: "";
  display: block;
  clear: both;
}
div.serve>ul>li{
  float: left;
  width: 31%;
  margin-right: 2%;
  text-align: center;
}
div.serve>ul>li>a{
  display: block;
  padding:30px 0 20px;
}
div.serve>ul>li>a>i{
  width: 64px;
  height: 64px;
  display: inline-block;
  background: url("../assets/icon.png") -380px 0 no-repeat;
}
div.serve>ul>li>a div{
  padding: 0 50px;
  box-sizing: border-box;
}
div.serve>ul>li>a h5{
  font-size: 24px;
  margin: 24px 0 16px;
  color: #333;
}
div.serve>ul>li>a p{
  font-size: 14px;
  color: #999;
  line-height: 20px;
  height: 70px;
  letter-spacing: 1px;
}
div.serve>ul>li:hover>a i{
  background-position: -196px -56px;
}
</style>
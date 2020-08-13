<template>
  <div class="details page_body">
    <!-- 顶部面包屑导航 -->
    <div class="bread_nav">
      <div>
        <ul>
          <li>
            <router-link to="/product?kw=">所有产品</router-link>
          </li>
          <li>
            <i></i>
          </li>
          <li>刀具</li>
          <li>
            <i></i>
          </li>
          <li>刀具</li>
          <li>
            <i></i>
          </li>
          <li>刀具</li>
        </ul>
      </div>
    </div>
    <div class="article_width">
      <div>
        <div class="product-details-left">
          <!-- 左侧小图 -->
          <div class="left-sm">
            <div v-for="(value,i) of imgUrl" :key="i">
              <div>
                <a href="javascript:;">
                  <img :src="value.sm" :data-img="value.mm" alt @click="changeImg" />
                </a>
              </div>
            </div>
          </div>
          <!-- 右侧大图 -->
          <div class="right-mm">
            <div>
              <a href="#">
                <img :src="img_M" alt />
              </a>
            </div>
            <!-- 放大镜效果位置 -->
          </div>
        </div>
        <div class="product-details-right">
          <!-- 商品标题 -->
          <div class="pro-tit">
            <h1>{{ detail_obj.brand}}</h1>
            <h2>{{ detail_obj.pname}}</h2>
            <p>产品编号：{{detail_obj.pro_num}}</p>
          </div>
          <!-- 商品折扣活动 -->
          <div class="pro-promotion">
            <p>注册赠10元无门槛优惠券</p>
            <p>周年庆第一周满5000减500优惠券</p>
          </div>
          <!-- 商品价格 -->
          <div class="pro-price">
            <span>￥{{parseInt(price).toFixed(2)}}</span>
            <del v-if="detail_obj.discount!==1">￥{{parseInt(detail_obj.price).toFixed(2)}}</del>
            <del v-else></del>
          </div>
          <!-- 商品选择 -->
          <div class="pro-color">
            <div v-if="detail_obj.pcolors!=null">
              <p>颜色选择：{{pcolors[0].pcolor}}</p>
              <ul @click="changeColor">
                <li v-for="(cObj,i) of pcolors" :key="i">
                  <a href="#" class="" >
                    <span :data-color="cObj.pcolor" :style="`background-color:${cObj.bg}`"></span>
                  </a>
                </li>
              </ul>
            </div>
            <div v-else></div>
          </div>
          <div class="pro-sku">
            <div>
              <p>规格选择：</p>
              <a href="#">{{detail_obj.spec}}</a>
            </div>
            <div>
              <p>数量选择：</p>
              <p>
                <button @click="minus">
                  <i></i>
                </button>
                <input type="text" v-model="count" maxlength="3" />
                <button @click="add">
                  <i></i>
                </button>
              </p>
            </div>
          </div>
          <!-- 加入购物车/立即购买 -->
          <div class="pro-btn">
            <a href="#">加入购物车</a>
            <a href="#">立即购买</a>
          </div>
          <!-- 收藏夹 -->
          <div class="pro-collection">
            <a href="#">
              <i></i>
              <span>添加至收藏夹</span>
            </a>
          </div>
          <!-- 分享 -->
          <div class="pro-share">
            <ul>
              <li>
                <i></i>
                <span>分享：</span>
              </li>
              <li>
                <a href="#">
                  <i></i>
                </a>
              </li>
              <li>
                <a href="#">
                  <i></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- 商品详情图 -->
    <div class="details-img">
      <div class="details-img-header">
        <a href="#">产品介绍</a>
      </div>
      <div class="details-img-content">
        <div>
          <img :src="detail_obj.pro_del" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pid:'',
      // 保存商品详细信息的对象
      detail_obj: {},
      // 保存商品所有颜色的数组
      pcolors: [],
      // 保存商品颜色与图片路径的数组
      imgUrl: [],
      // 保存第一张的大图
      img_M:'',
      // 商品数量
      count:1,
    };
  },
  methods: {
    // 封装一个按顺序执行axios请求的函数
    promise(url) {
      return new Promise((resolve, reject) => {
        this.$axios.get(url).then((result) => {
          // 收到响应数据后，将数据赋值给商品详情数组
          this.detail_obj = result.data[0];
          console.log(this.detail_obj);
          // 判断商品颜色属性是否为空
          if (this.detail_obj.pcolors !== null) {
            // 不为空,则将颜色切割成数组，并将数组中的第一个元素传入到下一步执行的异步事件
            this.pcolors = this.detail_obj.pcolors;
            // 将JSON字符串转换为对象形式
            this.pcolors = JSON.parse(this.pcolors);
            console.log(this.pcolors);
            resolve(this.pcolors[0].pcolor);
          } else {
            // 如果为空,则直接进入下一个异步事件
            this.pcolors = [];
            resolve();
          }
        });
      }).then((color) => {
        // 当color的值为undefined时，说明上一个异步函数执行完毕后没有传参，商品颜色属性为空，则直接查询商品的所有图片
        if (color == undefined) {
          color = "";
        }
        console.log(color);
        this.$axios.get(url + "&color=" + color).then((result) => {
          this.imgUrl = result.data;
          this.img_M=this.imgUrl[0].mm;
          console.log(result.data);
        });
      });
    },
    // 购物车商品数量减少函数
    minus(){
      if(this.count>1){
        this.count--;
      }
    },
    // 购物车商品数量增加函数
    add(){
      this.count++;
    },
    // 切换商品图片函数
    changeImg(e){
      if(e.target.nodeName=='IMG'){
        this.img_M=e.target.getAttribute("data-img");
      }
    },
    changeColor(e){
      if(e.target.nodeName=="SPAN"){
        let color=e.target.dataset.color;
        console.log(color);
        this.$axios.get(`/detail/del?pid=${this.pid}&color=${color}`).then(result=>{
          this.imgUrl=result.data;
          this.img_M=this.imgUrl[0].mm;
        });

      }
    }
  },
  computed: {
    price() {
      return (
        parseFloat(this.detail_obj.price) * parseFloat(this.detail_obj.discount)
      );
    },
  },
  mounted() {
    this.pid = this.$route.query.pid;
    this.promise("/detail/del?pid=" + this.pid);
  },
};
</script>

<style>
div.details {
  width: 100%;
}
div.bread_nav {
  width: 68%;
  min-width: 1200px;
  margin: 0 auto;
}
div.bread_nav > div {
  padding: 30px 0;
}
div.bread_nav > div > ul::after {
  content: "";
  display: block;
  clear: both;
}
div.bread_nav > div > ul > li {
  float: left;
  margin-right: 10px;
  font-size: 14px;
}
div.bread_nav > div > ul > li > i {
  width: 9px;
  height: 15px;
  display: inline-block;
  background: url("../assets/icon.png") -569px -544px no-repeat;
}
div.article_width {
  width: 70%;
  min-width: 1200px;
  margin: 0 auto;
}
div.article_width > div::after {
  content: "";
  display: block;
  clear: both;
}
div.article_width > div > div {
  float: left;
}
div.article_width > div > div.product-details-left {
  width: 53%;
  display: flex;
}
div.product-details-left > div.left-sm {
  width: 21%;
  padding-right: 20px;
}
div.product-details-left > div.left-sm > div {
  margin-bottom: 20px;
}
div.product-details-left > div.left-sm > div > div {
  border: 1px solid #e1e1e1;
}

div.product-details-left > div.right-mm > div:first-child {
  border-radius: 0.25rem;
}
/* 右边详情页介绍 */
div.product-details-right {
  width: 46%;
  padding-left: 80px;
  box-sizing: border-box;
}

div.pro-tit h1 {
  font-size: 24px;
  color: #333;
  margin-bottom: 10px;
}
div.pro-tit h2 {
  font-size: 20px;
  color: #333;
  line-height: 24px;
}
div.pro-tit p {
  font-size: 14px;
  color: #807c77;
  line-height: 14px;
  margin-top: 6px;
}
div.pro-promotion {
  margin-top: 10px;
  position: relative;
  background: #f8f8f8;
  padding: 11px;
  font-size: 14px;
  color: #333;
}
div.pro-promotion p {
  line-height: 18px;
}
div.pro-price {
  margin: 15px 0;
}
div.pro-price span {
  font-size: 28px;
  color: red;
  line-height: 30px;
}
div.pro-price del {
  font-size: 16px;
  color: #cccbc9;
  letter-spacing: 0;
  margin-left: 10px;
}
div.pro-color {
  margin-top: 19px;
}
div.pro-color p {
  font-size: 14px;
  color: #333;
  line-height: 14px;
  margin-bottom: 12px;
}
div.pro-color ul::after ,div.pro-share ul::after{
  content: "";
  display: block;
  clear: both;
}
div.pro-color ul li {
  float: left;
  margin-right: 12px;
  margin-bottom: 19px;
}
div.pro-color ul li a {
  display: block;
  width: 30px;
  height: 30px;
  background: #fff;
  border: 1px solid #e1e1e1;
  border-radius: 50%;
  text-align: center;
}
div.pro-color ul li a.is-active {
  border: 1px solid #ee1d25;
  width: 40px;
  height: 40px;
  line-height: 40px;
}
div.pro-color ul li a.is-active span {
  width: 34px;
  height: 34px;
  margin: 3px;
}
div.pro-color ul li a span {
  display: inline-block;
  width: 24px;
  height: 24px;
  margin: 8px;
  border-radius: 50%;
}
div.pro-sku > div p {
  font-size: 14px;
  color: #333;
  letter-spacing: 0;
  line-height: 16px;
  margin-bottom: 10px;
}
div.pro-sku > div:first-child > a {
  padding: 5px 30px;
  border: 1px solid red;
  font-size: 14px;
  color: #333;
  letter-spacing: 0;
  line-height: 30px;
}
div.pro-sku > div:last-child p {
  margin-top: 15px;
}
div.pro-sku > div:last-child > p:last-child {
  background: #fff;
  border: 1px solid #e1e1e1;
  width: 98px;
  height: 30px;
  box-sizing: border-box;
}
div.pro-sku > div:last-child > p:last-child > input {
  width: 36px;
  text-align: center;
  height: 28px;
  line-height: 28px;
  outline: 0;
  border: 0;
  padding: 0;
}
div.pro-sku > div:last-child > p:last-child > button {
  width: 30px;
  height: 28px;
  border: 0;
  outline: 0;
  vertical-align: middle;
  padding-bottom: 8px;
}
div.pro-sku > div:last-child > p:last-child > button:last-child {
  padding: 0;
  padding-top: 2px;
}
div.pro-sku > div:last-child > p:last-child > button > i {
  display: inline-block;
  width: 14px;
  height: 2px;
  background: url("../assets/icon.png") -450px -409px no-repeat;
}
div.pro-sku > div:last-child > p:last-child > button:last-child > i {
  height: 15px;
  background-position: -40px -601px;
}
div.pro-btn {
  margin-top: 20px;
}
div.pro-btn > a {
  display: inline-block;
  width: 196px;
  height: 40px;
  border: 1px solid red;
  margin-right: 12px;
  border-radius: 0.25rem;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
  color: #807c77;
}
div.pro-btn > a:last-child {
  background-color: red;
  color: #fff;
}
div.pro-collection {
  margin-top: 20px;
}
div.pro-collection a {
  font-size: 14px;
  color: #333;
  letter-spacing: 0;
}
div.pro-collection a i {
  display: inline-block;
  width: 19px;
  height: 17px;
  background: url("../assets/icon.png") -614px -377px no-repeat;
  vertical-align: middle;
  margin: -2px 6px 0 0;
}
div.pro-share{
  margin-top: 20px;
}
div.pro-share ul li{
  float: left;
  line-height: 24px;
}
div.pro-share ul li span{
  font-size: 14px;
  display: inline-block;
  margin: 0 10px 0 6px;
}
div.pro-share ul li a{
      margin-right: 30px;
}
div.pro-share ul li i{
   display: inline-block;
  background-image: url("../assets/icon.png");
}
div.pro-share ul li:first-child i{
    background-position: -614px -353px;
    width: 18px;
    height: 18px;
    vertical-align: middle;
}
div.pro-share ul li+li i{
    width: 24px;
    height: 24px;
}
div.pro-share ul li:nth-child(2) i{
  background-position: -450px -544px;
}
div.pro-share ul li:last-child i{
  background-position: -480px -544px;
}
div.details-img{
  width: 68%;
  min-width: 1200px;
  margin: 0 auto;
}
div.details-img>div.details-img-header{
  margin-top: 50px;
}
div.details-img-header>a{
  display: block;
  width: 178px;
  margin: 0 auto;
  color: red;
  line-height: 24px;
  padding: 10px 0;
  text-align: center;
  border-bottom:3px solid red ;
}
div.details-img-content{
  margin-top:20px ;
}
div.details-img-content>div{
  padding: 0 20px;
  max-width: 1030px;
  margin: 0 auto;
  text-align: center;
}

</style>
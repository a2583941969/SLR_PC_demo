<template>
  <div class="shopping_car page_body">
    <div class="shop-bg">
      <img src="../assets/shopping/header-bg.png" alt />
      <div>
        <p>我的购物车</p>
        <p>SHOPPING CART</p>
      </div>
    </div>
    <div class="shop-content">
      <div>
        <!-- 左侧内容 -->
        <div class="shop-left">
          <!-- 商品信息分类 -->
          <div>
            <div>
              <label>
                <input type="checkbox" name id />
                <span>全选</span>
              </label>
            </div>
            <div>
              <ul>
                <li>
                  <span>商品信息</span>
                </li>
                <li>
                  <span>数量</span>
                </li>
                <li>
                  <span>价格</span>
                </li>
              </ul>
            </div>
          </div>
          <!-- 商品列表 -->
          <div class="shop-list" @click="handler">
            <!-- v-for循环的div -->
            <div v-for="(item,i) of shopcart" :key="i">
              <input type="checkbox" v-model="item.is_checked" />
              <div class="shopcart-img">
                <a href="javascript:;">
                  <img :src="item.idx_img" alt />
                </a>
              </div>
              <div class="pro-msg">
                <a href="javascript:;">{{item.brand}}</a>
                <p>{{item.pname}}</p>
                <!-- 规格 -->
                <div>
                  <p>
                    颜色：
                    <span>{{item.pro_color}}</span>
                  </p>
                  <p>
                    规格：
                    <span>{{item.spec}}</span>
                  </p>
                </div>
              </div>
              <div class="pro-count">
                <p>
                  <button :data-i="i" data-n="-1">
                    <i :data-i="i" data-n="-1"></i>
                  </button>
                  <input type="text" maxlength="3" v-model="item.scount" />
                  <button :data-i="i" data-n="+1">
                    <i :data-i="i" data-n="+1"></i>
                  </button>
                </p>
              </div>
              <div class="pro-price">
                <p>￥{{(item.price*item.discount*item.scount).toFixed(2)}}</p>
                <del v-if="item.discount<1">￥{{(item.price*item.scount).toFixed(2)}}</del>
                <del v-else></del>
              </div>
              <div class="pro-icon">
                <ul>
                  <li>
                    <a href="javascript:;">
                      <i></i>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;" :data-i="i">
                      <i :data-i="i" data-icon="×"></i>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!-- 右侧内容 -->
        <div class="shop-right">
          <!-- 活动 -->
          <div>
            <p>
              <span>全场包邮</span>
            </p>
            <p>
              <span>8月10日至8月16日享2档满额赠礼</span>
            </p>
          </div>
          <!-- 价格计算 -->
          <div>
            <p>
              商品小计:
              <span>1件已选</span>
            </p>
            <p>
              商品总价:
              <span>￥{{totalprice.toFixed(2)}}</span>
            </p>
            <p>
              运费:
              <span>￥0.00</span>
            </p>
            <p>
              总计应付:
              <span>￥{{totalprice.toFixed(2)}}</span>
            </p>
            <p>
              <a href="javascript:;">立即结算</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapMutations } from "vuex";
export default {
  data() {
    return {
      shopcart: JSON.parse(localStorage.getItem("addShop")) || [],
      // 保存请求状态
      isAxios: localStorage.getItem('isAxios') || true,
    };
  },
  methods: {
    ...mapMutations(["set_addShop"]),
    handler(e) {
      if (e.target.nodeName == "BUTTON" || e.target.nodeName == "I") {
        if (e.target.dataset.icon == "×") {
          this.shopcart.splice(e.target.dataset.i, 1);
        } else {
          let i = e.target.dataset.i;
          if (this.shopcart[i].scount > 1 || e.target.dataset.n == 1) {
            this.shopcart[i].scount += parseInt(e.target.dataset.n);
          }
        }
      }
    },
  },
  mounted() {
    console.log(localStorage.getItem("addShop"));
    if (localStorage.getItem("uid") !== null && this.isAxios != 'false') {
      this.isAxios = false;
      localStorage.setItem("isAxios", this.isAxios);
      this.$axios
        .get("/detail/shop?uid=" + this.$store.state.uid)
        .then((result) => {
          result.data.forEach((value) => {
            // 将从数据库取回的商品信息中的是否被选中属性修改为 bool值
            if (value.is_checked == 1) {
              value.is_checked = true;
            } else {
              value.is_checked = false;
            }
            this.shopcart.push(value);
            
            this.set_addShop(value);
          });
          // 将数据转为JSON字符串之后，存入 localStorage 缓存

          let shopcartJson = JSON.stringify(this.shopcart);
     
          
          localStorage.setItem("addShop", shopcartJson);
          console.log(this.shopcart);
        });
    }
  },
  computed: {
    totalprice() {
      let sum = 0;
      for (let p of this.shopcart) {
        if (p.is_checked) {
          sum += p.price * p.discount * p.scount;
        }
      }
      return sum;
    },
  },
};
</script>

<style>
div.shop-bg {
  width: 100%;
  position: relative;
}
div.shop-bg > img {
  width: 100%;
  min-height: 150px;
}
div.shop-bg > div {
  position: absolute;
  width: 100%;
  top: 25%;
  text-align: center;
}
div.shop-bg > div > p:first-child {
  font-size: 24px;
  color: #333;
}
div.shop-bg > div > p:last-child {
  margin-top: 4px;
  font-size: 16px;
  color: #807c77;
  letter-spacing: 1.14px;
}
div.shop-content {
  width: 100%;
}
div.shop-content > div {
  width: 70%;
  min-width: 1200px;
  margin: -40px auto 0;
  position: relative;
}
div.shop-content > div::after {
  content: "";
  display: block;
  clear: both;
}
div.shop-left {
  background-color: #fff;
  float: left;
  width: 70%;
}
div.shop-left > div:first-child {
  position: relative;
  padding: 12px 41px 12px 164px;
  font-size: 14px;
  background: #fff;
  color: #333;
}
div.shop-left > div:first-child::after {
  content: "";
  display: block;
  clear: both;
}
div.shop-left > div:first-child > div {
  float: left;
}
div.shop-left > div:first-child > div:first-child {
  position: absolute;
  left: 20px;
}
div.shop-left > div:first-child > div:last-child {
  width: 100%;
}
div.shop-left > div:first-child > div:last-child > ul::after {
  content: "";
  display: block;
  clear: both;
}
div.shop-left > div:first-child > div:last-child > ul > li:first-child {
  float: left;
  width: 32%;
}
div.shop-left > div:first-child > div:last-child > ul > li:not(:first-child) {
  width: 30%;
  float: left;
  text-align: center;
}
div.shop-list > div {
  position: relative;
  padding: 10px 41px 10px 164px;
  margin: 10px 0;
}
div.shop-list > div > input {
  position: absolute;
  left: 21px;
  top: 50%;
  transform: translate(0, -50%);
}
div.shopcart-img {
  width: 100px;
  position: absolute;
  left: 50px;
  top: 50%;
  transform: translate(0, -50%);
}
div.shopcart-img > a > img {
  width: 100%;
}
div.shop-list > div > div + div {
  float: left;
}

div.shop-list > div::after {
  content: "";
  display: block;
  clear: both;
}
div.pro-msg {
  width: 32%;
}
div.pro-count,
div.pro-price {
  width: 30%;
  text-align: center;
}
div.pro-msg > a {
  display: inline-block;
  font-size: 14px;
  color: #333;
  margin-bottom: 8px;
}
div.pro-msg > p {
  font-size: 14px;
  color: #333;
  line-height: 16px;
  margin-bottom: 12px;
}
div.pro-msg > div {
  font-size: 12px;
  color: #999;
}
div.pro-msg > div > p:first-child {
  margin-bottom: 4px;
}
div.pro-msg > div > p:last-child {
  line-height: 30px;
}
div.pro-count {
  margin-top: 35px;
}
div.pro-count > p {
  background: #fff;
  border: 1px solid #e1e1e1;
  width: 98px;
  height: 30px;
  margin: 0 auto;
  box-sizing: border-box;
}
div.pro-count > p > input {
  width: 36px;
  text-align: center;
  height: 28px;
  line-height: 28px;
  outline: 0;
  border: 0;
  padding: 0;
}
div.pro-count > p > button {
  width: 30px;
  height: 28px;
  border: 0;
  outline: 0;
  vertical-align: middle;
  padding-bottom: 8px;
}
div.pro-count > p > button > i {
  display: inline-block;
  width: 14px;
  height: 2px;
  background: url("../assets/icon.png") -450px -409px no-repeat;
}
div.pro-count > p > button:last-child {
  padding-top: 6px;
}
div.pro-count > p > button:last-child > i {
  height: 15px;
  background-position: -40px -601px;
}
div.pro-price {
  margin-top: 32px;
}
div.pro-price > p {
  color: #333;
  line-height: 1;
  letter-spacing: 0;
  margin-bottom: 8px;
  font-size: 14px;
}
div.pro-price > del {
  display: inline-block;
  color: #939393;
  letter-spacing: 0;
  line-height: 17px;
}
div.pro-icon {
  position: absolute;
  right: 0;
  top: 50%;
  transform: translate(0, -50%);
}
div.pro-icon > ul > li {
  width: 40px;
  height: 40px;
  line-height: 40px;
  text-align: center;
}
div.pro-icon > ul > li > a > i {
  display: inline-block;
  width: 16px;
  height: 14px;
  background: url("../assets/icon.png") -367px -575px no-repeat;
}
div.pro-icon > ul > li:last-child > a > i {
  background-position: -489px -574px;
}

div.shop-right {
  width: 27%;
  float: right;
}
div.shop-right > div:first-child {
  font-size: 14px;
  color: #333;
  line-height: 20px;
  padding: 24px;
  background: #fff;
}
div.shop-right > div:first-child p {
  position: relative;
}
div.shop-right > div:first-child p:first-child {
  margin-bottom: 18px;
}
div.shop-right > div:first-child p::before {
  content: "";
  display: inline-block;
  width: 4px;
  height: 4px;
  background: #ee1c25;
  position: absolute;
  top: 8px;
  left: 0;
}
div.shop-right > div:first-child p span {
  margin-left: 12px;
}
div.shop-right > div:last-child {
  margin-top: 10px;
  background: #fff;
  padding: 24px;
}
div.shop-right > div:last-child p {
  font-size: 18px;
  color: #333;
  line-height: 40px;
}
div.shop-right > div:last-child p span {
  float: right;
}
div.shop-right > div:last-child p:nth-child(2) span,
div.shop-right > div:last-child p:nth-child(3) span {
  font-size: 14px;
  font-weight: 600;
}
div.shop-right > div:last-child p:nth-child(4) span {
  color: red;
  font-size: 14px;
  font-weight: 600;
}
div.shop-right > div:last-child p:last-child a {
  display: block;
  width: 100%;
  text-align: center;
  background-color: red;
  border-radius: 0.25rem;
  color: #fff;
  font-size: 14px;
  letter-spacing: 0.58px;
  margin-top: 24px;
}
</style>
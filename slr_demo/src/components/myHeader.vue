<template>
  <div class="header">
    <div class="header01">
      <div>
        <span>
          注册会员即赠10元券
          <a href="javascript:;">点击注册</a>
        </span>
        <ul>
          <li>
            <i></i>
            <a href="javascript:;">在线客服</a>
          </li>
          <li v-if="!this.$store.state.isLogin">
            <i></i>
            <router-link to="/login">登录 |</router-link>
            <router-link to="/registration">注册</router-link>
          </li>
          <li v-else>
            <i></i>
            <a href="javascript:;">{{this.$store.state.phoneNum}} |</a>
            <a @click="clearStorage">注销</a>
          </li>
          <li>
            <i></i>
            <router-link to='/shopping'>( {{n}} )</router-link>
          </li>
        </ul>
      </div>
    </div>
    <div class="header02">
      <div>
        <div class="search">
          <a href="javascript:;" @click="show"></a>
          <div class="search_par">
            <div>
              <ul>
                <li>
                  <button @click="serach"></button>
                  <input
                    type="text"
                    name="p_search"
                    v-model="kw"
                    id="dSearch"
                    placeholder="搜索"
                    @input="ipt_serach"
                    @keyup.13="serach"
                  />
                  <button @click="shut"></button>
                </li>
                <li v-for="(name,i) of search_arr" :key="i+'A'">
                  <a href="javascript:;">{{name.pname}}</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="nav">
          <ul>
            <li>
              <router-link to="/">首页</router-link>
            </li>
            <li>
              <a href="javascript:;">
                <span>双立人</span>
                <b>ZWLLING</b>
              </a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(obj,i) of zwlling" :key="i">
                        <a href="javascript:;">
                          <img :src="obj.url" alt="/" />
                          <span>{{obj.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(name,i) of obj.class" :key="i">
                            <a href="javascript:;">{{name}}</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
                <div>
                  <a href="javascript:;">
                    <i></i>
                    探索双立人
                    <i></i>
                  </a>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript:;">
                <span>珐宝</span>
                <b>STAUB</b>
              </a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(obj,i) of staub" :key="i+'B'">
                        <a href="javascript:;">
                          <img :src="obj.url" alt="/" />
                          <span>{{obj.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(name,i) of obj.class" :key="i+'Ba'">
                            <a href="javascript:;">{{name}}</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
                <div>
                  <a href="javascript:;">
                    <i></i>
                    探索双立人
                    <i></i>
                  </a>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript">
                <span>巴拉利尼</span>
                <b>BALLARINI</b>
              </a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(obj,i) of ballarini" :key="i">
                        <a href="javascript:;">
                          <img :src="obj.url" alt="/" />
                          <span>{{obj.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(name,i) of obj.class" :key="i">
                            <a href="javascript:;">{{name}}</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
                <div>
                  <a href="javascript:;">
                    <i></i>
                    探索双立人
                    <i></i>
                  </a>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript:;">热销分类</a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(obj,i) of sales" :key="i+'C'">
                        <a href="javascript:;">
                          <span>{{obj.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(name,i) of obj.class" :key="i+'Ca'">
                            <a href="javascript:;">{{name}}</a>
                          </li>
                        </ul>
                      </li>
                      <li v-for="(value,i) of sales_1" :key="i+'D'">
                        <a href="javascript:;">
                          <span>{{value.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(n,m) of value.class" :key="m+'Ca'">
                            <img v-if="n!=='查看全部'" :src="n.url" alt />
                            <a v-else href="javascript:;">{{n}}</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript:;">精彩双立人</a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(value,i) of community" :key="i+'E'">
                        <a href="javascript:;">
                          <span>{{value.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(n,m) of value.class" :key="m+'Ea'">
                            <img :src="n" alt />
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript:;">双立人故事</a>
              <div class="sub_menus">
                <div>
                  <div>
                    <ul>
                      <li v-for="(value,i) of community" :key="i+'F'">
                        <a href="javascript:;">
                          <span>{{value.name}}</span>
                        </a>
                        <ul>
                          <li v-for="(n,m) of value.class" :key="m+'Fa'">
                            <img :src="n" alt />
                          </li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <a href="javascript:;">美食学院</a>
            </li>
            <li>
              <img src="../assets/head_foot/TWINSCT.png" alt />
            </li>
            <li>
              <img src="../assets/head_foot/header_zwilling_logo.png" alt />
            </li>
          </ul>
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
      // 存放购物车数量
      n: 0,
      // 存放搜索联想的数组
      search_arr: [
        { pname: "双立人刀具" },
        { pname: "套装" },
        { pname: "小家电" },
      ],
      // 存放双立人导航栏分类详细信息的数组
      zwlling: [
        {
          url: require("../assets/head_foot/dao2x.png"), //图标
          name: "刀具", //主分类
          // 详细分类
          class: [
            "中式片刀",
            "中式片刀",
            "中式片刀",
            "中式片刀",
            "中式片刀",
            "其他全部",
          ],
        },
        {
          url: require("../assets/head_foot/guo.png"),
          name: "不锈钢锅具",
          class: [
            "中式炒锅",
            "中式炒锅",
            "中式炒锅",
            "中式炒锅",
            "中式炒锅",
            "其他全部",
          ],
        },
        {
          url: require("../assets/head_foot/menu_Small Appliances@2x.png"),
          name: "小家电",
          class: [
            "三合一电水壶",
            "榨汁机",
            "榨汁机",
            "榨汁机",
            "榨汁机",
            "其他全部",
          ],
        },
        {
          url: require("../assets/head_foot/menu_other@2x.png"),
          name: "其他",
          class: [
            "西餐具/刀叉",
            "炊具/厨房小工具",
            "侍酒好物",
            "玻璃器皿",
            "其他全部",
          ],
        },
      ],

      staub: [
        {
          url: require("../assets/head_foot/staub-tie@2x.png"),
          name: "铸铁产品",
          class: [
            "汤锅/炖锅",
            "艺术造型锅",
            "中式炒锅",
            "异国风情",
            "查看全部",
          ],
        },
        {
          url: require("../assets/head_foot/menu_pot@2x_20180614164803 (1).png"),
          name: "陶瓷产品",
          class: [
            "迷你炖盅",
            "碗",
            "烤盘/沙拉碗",
            "烤盘/沙拉碗",
            "烤盘/沙拉碗",
            "查看全部",
          ],
        },
        {
          url: require("../assets/head_foot/menu_other@2x.png"),
          name: "心选配件",
          class: ["盖滴", "锅垫", "炊具", "查看全部"],
        },
      ],
      // 保存精彩双立人的数组
      ballarini: [
        {
          url: require("../assets/head_foot/menu_中式炒锅@2x.png"),
          name: "中式炒锅",
          class: [],
        },
        {
          url: require("../assets/head_foot/menu_pot平底煎锅@2x.png"),
          name: "平底煎锅",
          class: [],
        },
        {
          url: require("../assets/head_foot/menu_小奶锅@2x.png"),
          name: "装饰锅及炊具",
          class: [],
        },
        {
          url: require("../assets/head_foot/menu_pot汤锅@2x.png"),
          name: "不粘锅套装",
          class: [],
        },
      ],
      // 保存热销分类的数组
      sales: [
        {
          name: "发现最爱",
          class: [
            "馈赠佳礼",
            "馈赠佳礼",
            "馈赠佳礼",
            "馈赠佳礼",
            "馈赠佳礼",
            "馈赠佳礼",
            "查看全部",
          ],
        },
        {
          name: "热销分类",
          class: ["刀具", "刀具", "刀具", "刀具", "刀具", "刀具", "查看全部"],
        },
      ],
      // 保存热销分类的数组
      sales_1: [
        {
          name: "人气No.1",
          class: [
            { url: require("../assets/head_foot/RXFL01.png") },
            "查看全部",
          ],
        },
        {
          name: "精选套装",
          class: [
            { url: require("../assets/head_foot/RXFL02.jpg") },
            "查看全部",
          ],
        },
      ],
      //
      community: [
        {
          name: "视频专区",
          class: [require("../assets/head_foot/CDSPZQ.jpg")],
        },
        {
          name: "视频专区",
          class: [require("../assets/head_foot/CDSPZQ.jpg")],
        },
        {
          name: "视频专区",
          class: [require("../assets/head_foot/CDSPZQ.jpg")],
        },
      ],
      // 搜索框双向绑定的变量
      kw: "",
      time: null,
    };
  },
  methods: {
    ...mapMutations(["set_isLogin", "set_phoneNum", "set_uid"]),

    // 控制搜索框输入后下方li的高度
    show() {
      var div = document.getElementsByClassName("search_par")[0];
      // 判断搜索框输入后返回的数据是否为0
      var h =
        (this.search_arr.length == 0
          ? 75
          : this.search_arr.length * 35 + 20 + 75) + "px";
      div.style.height = h;
    },
    // 关闭搜索框时的高度
    shut() {
      var div = document.getElementsByClassName("search_par")[0];
      div.style.height = "0px";
    },
    // 搜索函数
    serach() {
      this.$router.push("/product?kw=" + this.kw);
    },
    ipt_serach() {
      if (this.time !== null) {
        clearTimeout(this.time);
      }
      this.time = setTimeout(() => {
        if (this.kw.trim() !== "") {
          this.$axios.get("/detail/pro?kw=" + this.kw).then((result) => {
            this.search_arr = result.data;
            this.show();
          });
        }
      }, 500);
    },
    // 注销登录
    clearStorage() {
      localStorage.clear();
      this.set_isLogin(false);
      this.set_phoneNum('');
      this.set_uid('');   
    },
  },
};
</script>

<style>
div.header {
  width: 100%;
  position: fixed;
  top: 0;
  z-index: 100;
}
div.header > .header01 {
  width: 100%;
  height: 35px;
  background-color: #807c77;
}
div.header > .header01 > div {
  width: 65vw;
  min-width: 1200px;
  margin: 0 auto;
  text-align: center;
  color: #fff;
  font-size: 12px;
  line-height: 35px;
  position: relative;
}
div.header > .header01 > div > span > a {
  text-decoration: underline;
  margin-left: 10px;
}
div.header > .header01 > div a {
  color: #fff;
}
div.header > .header01 > div > ul {
  position: absolute;
  top: 0;
  right: 0;
}
div.header > .header01 > div > ul > li {
  float: left;
}
div.header > .header01 > div > ul > li:not(:first-child) {
  margin-left: 20px;
}
div.header > .header01 > div > ul > li i {
  width: 24px;
  height: 24px;
  display: inline-block;
  background: url("../assets/icon.png") -210px -544px no-repeat;
  vertical-align: middle;
  margin-right: 5px;
}
div.header > .header01 > div > ul > li:last-child i {
  background-position: -180px -544px;
}
div.header > .header01 > div > ul > li:nth-child(2) > i {
  background-position: -270px -544px;
}
div.header > .header02 {
  width: 100%;
  background-color: #fff;
  position: absolute;
}
div.header > .header02 > div {
  width: 65%;
  min-width: 1200px;
  height: 54px;
  padding-top: 32px;
  margin: 0 auto;
  display: flex;
}
div.header > .header02 > div > div.search {
  width: 24px;
  height: 24px;
}
div.header > .header02 > div > div.search > a {
  width: 24px;
  height: 24px;
  display: inline-block;
  background: url("../assets/icon.png") -550px -512px no-repeat;
}
div.header > .header02 > div > div.search > div.search_par {
  width: 100vw;
  height: 0px;
  overflow: hidden;
  position: absolute;
  left: 0;
  top: 86px;
  background: #fff;
  box-shadow: 0px 5px 7px 0px rgba(0, 0, 0, 0.2);
  transition: height 0.5s;
}
div.header > .header02 > div > div.search > div.search_par > div {
  width: 580px;
  margin: 0 auto;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li:first-child {
  height: 44px;
  border-bottom: 1px solid #666;
  margin-bottom: 10px;
  position: relative;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li:first-child
  + li {
  margin-top: 20px;
}
div.header > .header02 > div > div.search > div.search_par > div > ul > li {
  line-height: 35px;
  cursor: pointer;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li:last-child {
  margin-bottom: 30px;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li
  > button {
  width: 24px;
  height: 24px;
  border: none;
  background: url("../assets/icon.png") -30px -544px no-repeat;
  outline: 0;
  position: absolute;
  top: 10px;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li
  > button:last-child {
  background-position: -610px -545px;
  right: 0;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li
  > input {
  width: 518px;
  height: 40px;
  border: 0;
  padding-left: 10px;
  outline: 0;
  position: absolute;
  left: 24px;
}
div.header > .header02 > div > div.search > div.search_par > div > ul > li > a {
  font-size: 14px;
  color: #999;
}
div.header
  > .header02
  > div
  > div.search
  > div.search_par
  > div
  > ul
  > li:hover
  > a {
  color: red;
}
div.header > .header02 > div > div.nav > ul > li:first-child {
  margin-left: 40px;
}
div.header > .header02 > div > div.nav > ul > li {
  float: left;
  margin: 0 20px;
}
div.header > .header02 > div > div.nav > ul > li:first-child > a {
  margin-left: 40px;
}
div.header > .header02 > div > div.nav > ul > li:hover > a {
  color: red;
}
div.header > .header02 > div > div.nav > ul > li:first-child::before,
div.header > .header02 > div > div.nav > ul > li:last-child::before {
  content: "";
  display: block;
  width: 1px;
  height: 20px;
  background-color: #999;
  float: left;
}
div.header > .header02 > div > div.nav > ul > li:last-child > img {
  margin: -15px 0 0 45px;
}
div.header > .header02 > div > div.nav > ul > li > a {
  display: flex;
  flex-direction: column;
  height: 45px;
  position: relative;
}
div.header > .header02 > div > div.nav > ul > li > a b {
  font-size: 0.5rem;
  font-weight: normal;
}
div.header > .header02 > div > div.nav > ul > li > a::after {
  content: "";
  display: block;
  width: 0;
  height: 4px;
  background-color: red;
  position: absolute;
  bottom: 0;
  transition: width 0.5s;
}
div.header > .header02 > div > div.nav > ul > li:hover > a::after {
  width: 100%;
}
div.header > .header02 > div > div.nav > ul > li > div.sub_menus {
  width: 100vw;
  height: 0;
  overflow: hidden;
  background: #fff;
  position: absolute;
  z-index: 50;
  top: 86px;
  left: 0;
  transition: height 0.3s linear;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(2):hover
  > a
  + div.sub_menus,
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(3):hover
  > a
  + div.sub_menus {
  height: 362px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(4):hover
  > a
  + div.sub_menus {
  height: 162px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(5):hover
  > a
  + div.sub_menus {
  height: 348px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(6):hover
  > a
  + div.sub_menus,
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li:nth-child(7):hover
  > a
  + div.sub_menus {
  height: 269px;
}

div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul {
  display: flex;
  justify-content: center;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div::after {
  content: "";
  display: block;
  width: 100%;
  height: 1px;
  background-color: #ccc;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li {
  margin-right: 130px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > a {
  display: block;
  padding: 20px 0 10px;
  border-bottom: 1px solid #ccc;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > ul
  > li {
  text-align: left;
  line-height: 30px;
  font-size: 14px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > ul
  > li:last-child
  > a {
  text-decoration: underline;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > ul
  > li
  > a {
  color: #666;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > ul
  > li:hover
  a {
  color: red;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > ul {
  margin: 20px 0 30px;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div
  > div
  > ul
  > li
  > a
  > img {
  width: 40px;
  vertical-align: middle;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div:last-child {
  padding: 20px 0;
  text-align: center;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div:last-child
  > a {
  display: flex;
  justify-content: center;
  align-items: center;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div:last-child
  > a
  > i:first-child {
  width: 20px;
  height: 20px;
  margin-right: 10px;
  display: inline-block;
  background: url("../assets/icon.png") -586px -508px no-repeat;
}
div.header
  > .header02
  > div
  > div.nav
  > ul
  > li
  > div.sub_menus
  > div:last-child
  > a
  > i:last-child {
  width: 6px;
  height: 12px;
  margin-left: 10px;
  display: inline-block;
  background: url("../assets/icon.png") -60px -601px no-repeat;
}
</style>
<template>
  <div class="pro page_body">
    <!-- 面包屑导航 -->
    <div class="bread_nav">
      <div>
        <ul>
          <li>
            <router-link to='/product?kw='>所有产品</router-link>
          </li>
          <li>
            <i></i>
          </li>
          <li>{{bigClass}}</li>
          <li>
            <i></i>
          </li>
          <li>{{smallClass}}</li>
        </ul>
      </div>
    </div>
    <!-- 商品列表 -->
    <div class="product">
      <!-- 左侧筛选导航栏 -->
      <div class="left_nav">
        <div>
          <span>筛选</span>
          <router-link to='/product?kw='>重置筛选</router-link>
        </div>
        <ul>
          <li @click="show_ul" class="bli">
            <span>产品类别</span>
            <i></i>
            <ul @click="show_li">
              <li class="isLI" v-for="(bValue,i) of pro_class" :data-bC="bValue.bC" :key="i">
                <i></i>
                <router-link :to="'/product?kw='+bValue.bC">{{bValue.bC}}</router-link>
                <ul class="active">
                  <li data-scli="li" :data-sC="sV" v-for="(sV,i) of bValue.sC" :key="i">{{sV}}</li>
                </ul>
              </li>
            </ul>
          </li>
          <li>
            <span>产地</span>
            <i></i>
          </li>
          <li>
            <span>材质</span>
            <i></i>
          </li>
          <li>
            <span>价格区间</span>
            <i></i>
          </li>
          <li>
            <span>所属品牌</span>
            <i></i>
          </li>
        </ul>
      </div>
      <!-- 右侧商品显示区 -->
      <div class="right_pro">
        <div>
          <div class="aside-title">
            <span>
              所有产品(
              <span v-text="count"></span>
              )
            </span>
          </div>
          <div class="pro_list">
            <div class="move_up" v-for="(p,i) of pro_arr" :key="i">
              <div>
                <router-link :to="'/details?pid='+p.pid">
                  <img :src="p.idx_img" alt />
                </router-link>
              </div>
              <div>
                <a href="#">
                  <span>{{p.brand}}</span>
                  <span>{{p.pname}}</span>
                </a>
                <div>
                  <span>
                    ￥{{(p.price*p.discount).toFixed(2)}}
                    <del v-if="p.discount<1">￥{{p.price}}</del>
                    <del v-else></del>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <div class="page_number">
            <div>
              <a href="javascript:;" @click="prve">
                <i></i>
                上一页
              </a>
            <ul>
              <li v-for="(value,index) of total_page" :key="index">
                <a class="" href="javascript:;" @click="changePage(value)">{{value}}</a>
              </li>
            </ul>
              <a href="javascript:;" @click="next">
                下一页
                <i></i>
              </a>
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
      bigClass: "",
      smallClass: "",
      // 产品类别
      pro_class: [
        {
          // 大类
          bC: "刀具",
          // 小类
          sC: [
            "所有刀具",
            "中式片刀",
            "中式砍刀",
            "多用刀",
            "厨师刀",
            "切片刀",
            "牛排刀",
            "水果刀",
            "刀具套装",
          ],
        },
        {
          // 大类
          bC: "不锈钢锅具",
          // 小类
          sC: [
            "所有不锈钢锅具",
            "中式炒锅",
            "平底煎锅",
            "压力锅",
            "蒸笼",
            "汤锅",
            "锅具套装",
          ],
        },
        {
          // 大类
          bC: "小家电",
          // 小类
          sC: [
            "所有小家电",
            "三合一电水壶",
            "电饭煲",
            "多功能厨师机",
            "多用料理机",
            "榨汁机",
            "电磁炉",
          ],
        },
        {
          // 大类
          bC: "其他",
          // 小类
          sC: [
            "所有其他",
            "西餐具/刀叉",
            "炊具/厨房小工具",
            "保温器皿",
            "侍酒好物",
            "玻璃器皿",
          ],
        },
      ],
      // 控制左侧筛选导航栏的高度
      height: "170px",
      // 保存请求商品数据的数组
      pro_arr: [],
      // 分页变量
      page: 1,
      total_page:"",
      // 搜索关键字变量
      kw: "",
      // 商品总数
      count:''
    };
  },
  methods: {
    // 控制产品类别三级菜单的显示与隐藏
    show_li(e) {
      if (e.target.nodeName == "LI" && e.target.className == "isLI") {
        this.height = "auto";
        e.target.parentNode.parentNode.style.height = this.height;
        var ul = e.target.parentNode.getElementsByTagName("ul");
        var self_ul = e.target.children[2];
        if (self_ul.className == "") {
          self_ul.className = "active";
        } else {
          self_ul.className = "";
          for (let n of ul) {
            if (n.className == "" && n !== self_ul) {
              n.className = "active";
            }
          }
        }
        this.bigClass = e.target.dataset.bc;
      }

      if (e.target.getAttribute("data-scLi") == "li") {
        this.smallClass=e.target.dataset.sc;
        console.log(this.smallClass)
      }
    },

    show_ul(e) {
      var par_li = e.target.parentNode;
      if (e.target.nodeName == "LI" && e.target.className == "bli") {
        if (
          e.target.style.height == "auto" ||
          e.target.style.height == "170px"
        ) {
          e.target.style.height = "49px";
        } else {
          e.target.style.height = this.height;
        }
      } else if (e.target.nodeName == "SPAN" || e.target.nodeName == "I") {
        if (par_li.style.height == "auto" || par_li.style.height == "170px") {
          par_li.style.height = "49px";
        } else {
          par_li.style.height = this.height;
        }
      }
    },
    // 发生请求的函数
    loadMore() {
       // 当kw为空字符串时，直接发送查询所有商品信息的请求，携带分页信息
      if (this.kw == "") {
        this.$axios.get("/detail/pro?page="+this.page).then((result) => {
          this.pro_arr = result.data.result;
          this.total_page=result.data.totalpage;
          this.count=result.data.count;
        });
        // 否则，将kw以及当前页码作为参数并发送请求
      } else {
        this.$axios.get("/detail/pro?page="+this.page+"&kw=" + this.kw).then((result) => {
          this.pro_arr = result.data.result;
          this.total_page=result.data.totalpage;
          this.count=result.data.count;
        });
      }
    },
    // 改变页码
    changePage(i){
      this.page=i;
    },
    // 上一页
    prve(){
      if(this.page>1){
        // 触发事件后，先将page的值减1，再发送请求
        this.page--;
        this.loadMore();
      }
    },
    // 下一页
    next(){
      if(this.page!==this.total_page){
        // 触发事件后，先将page的值加1，再发送请求
        this.page++;
        this.loadMore();
      }
    },
    // 重置筛选点击函数
    reset(){
      // 重置筛选时，使kw值为空字符串
      this.kw="";
      // 当kw为空字符串时，直接发送查询所有商品信息的请求，携带分页信息
      this.loadMore();
    }
  },
  watch: {
    $route() {
    // 监听地址栏变化，当用户再次搜索后，地址栏kw发生变化，再次发送请求
      this.kw = this.$route.query.kw;
      this.loadMore();
    },
    // 监听page变化，每变化一次发送一次请求
    page(){
        this.loadMore();
    }
  },
  mounted() {
    // 当用户从首页跳转过来时，获取kw的值，并在本页面发送请求，
    this.kw = this.$route.query.kw;
    this.loadMore();
  },

};
</script>

<style>
div.pro {
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
div.product {
  width: 70%;
  min-width: 1200px;
  margin: 0 auto;
  display: flex;
}
div.product > div.left_nav {
  width: 232px;
  height: auto;
  /* position: fixed; */
}
div.product > div.left_nav > div {
  line-height: 49px;
}
div.product > div.left_nav > div > span {
  font-size: 18px;
  font-weight: 600;
  color: #333;
  margin-left: 16px;
}
div.product > div.left_nav > div > a {
  border: 0;
  float: right;
  margin: 17px 18px 0 0;
  font-size: 12px;
  color: #807c77;
  line-height: 15px;
  border-bottom: 1px solid #807c77;
}
div.product > div.left_nav > ul > li {
  height: 49px;
  overflow: hidden;
  line-height: 49px;
  padding-left: 16px;
  position: relative;
  transition: height 0.5s;
  cursor: pointer;
}
div.product > div.left_nav > ul > li > span {
  font-size: 14px;
  color: #333;
}
div.product > div.left_nav > ul > li > i {
  width: 14px;
  height: 14px;
  display: inline-block;
  position: absolute;
  top: 16px;
  right: 16px;
}
div.product > div.left_nav > ul > li > i::after,
div.product > div.left_nav > ul > li > i::before {
  content: "";
  display: inline-block;
  background: #999;
  position: absolute;
}
div.product > div.left_nav > ul > li > i::after {
  width: 2px;
  height: 14px;
  left: 50%;
  margin-left: -1px;
}
div.product > div.left_nav > ul > li > i::before {
  width: 14px;
  height: 2px;
  top: 50%;
  margin-top: -1px;
}
div.product > div.left_nav > ul > li:first-child li {
  font-size: 12px;
  line-height: 30px;
}
div.product > div.left_nav > ul > li:first-child > ul > li:hover {
  color: red;
}
div.product > div.left_nav > ul > li:first-child > ul > li > i {
  display: inline-block;
  width: 0;
  height: 0;
  border-left: 5px solid #999;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  margin-right: 5px;
}
div.product > div.left_nav > ul > li:first-child > ul > li:hover > i {
  border-left: 5px solid red;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
}
div.product > div.left_nav > ul > li:first-child > ul > li > ul {
  margin-left: 13px;
  color: #333;
}
div.product > div.left_nav > ul > li:first-child > ul > li > ul > li {
  line-height: 28px;
}
.active {
  display: none;
}
div.right_pro {
  width: 100%;
}
div.right_pro > div {
  margin-left: 20px;
}
div.aside-title {
  width: 100%;
  height: 40px;
  margin-bottom: 50px;
}
div.aside-title span {
  font-size: 18px;
  font-weight: 600;
  color: #333;
  line-height: 40px;
}

div.pro_list {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}
/* 解决商品只有一个时鼠标移入外层div高度会改变的问题 */
div.pro_list::after{
  content: "";
  display: block;
  height: 393px;
}
div.pro_list > div {
  width: 250px;
  height: 373px;
  box-sizing: border-box;
  padding: 0 12px;
  margin-bottom: 20px;
  margin-right: 20px;
}

div.pro_list > div > div > a > img {
  width: 100%;
}
div.pro_list > div > div > a >span{
  font-size: 14px;
  color:#807c77;
  display: block;
  padding: 5px 0;
}
div.pro_list > div > div > div{
  margin-top: 30px;
}
div.pro_list > div > div > div>span{
  color: red;
  font-size: 18px;
}
div.pro_list > div > div > div>span>del{
  color: #807c77;
  font-size: 14px;
}
div.page_number{
  margin-bottom: 50px;
  position: relative;
}
div.page_number>div{
  padding: top 10px; ;
  position: absolute;
  right: 30px;
  font-size: 12px;
}
div.page_number::after{
  content: "";
  display: block;
  clear: both;
  
}
div.page_number a{
  display: block;
  float: left;
  color: #807c77;
  padding: 5px 8px;
  border-radius: 0.25rem;
}
div.page_number a>i{
  display: inline-block;
  border-right: 1px solid #807c77;
  border-bottom: 1px solid #807c77;
  width: 6px;
  height: 6px;
}
div.page_number>div>a:first-child>i{
  transform: rotate(135deg);
  margin-right: 6px;
}
div.page_number>div>a:last-child>i{
  transform:rotate(-45deg) ;
}
div.page_number ul>li{
  float: left;
  margin-right: 10px;
}
div.page_number ul>li>a{
  color:#fff;
background-color: #807c77;
}
div.page_number ul{
  float: left;
  margin-left:10px;
}
</style>
<template>
  <div class="shopping_car page_body">
    <div class="shop-bg">
      <img src="../assets/shopping/header-bg.png" alt />
      <div>
        <p>我的购物车</p>
        <p>SHOPPING CART</p>
      </div>
    </div>
  </div>
</template>
<script>
export default {};
</script>

<style>
div.shop-bg {
  width: 100%;
  position: relative;
}
div.shop-bg > img {
  width: 100%;
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
</style>
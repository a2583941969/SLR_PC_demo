<template>
  <div id="app">
    <my-header></my-header>

    <router-view/>

    <my-foot></my-foot>
  </div>
</template>

<style>

a{
  text-decoration: none;
  color: #333;
}

.page_body{
  margin-top: 121px;
}
.move_up{
  transition: margin 0.5s;
}
.move_up:hover{
  /* margin-bottom: 28px; */
  margin-top:-8px;
  box-shadow: 0px 0px 30px -10px #555;
}

div.btn {
  margin-top: 30px;
}

div.btn > a,div.btn > button {
  background-color: #ee1c25;
  color: #fff;
  height: 40px;
  line-height: 40px;
  width: 128px;
  box-sizing: border-box;
  border-radius: 2px;
  text-align: center;
  border:0;
  display: block;
  outline: 0;
}
</style>

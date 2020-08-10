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
#app{
 
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
</style>

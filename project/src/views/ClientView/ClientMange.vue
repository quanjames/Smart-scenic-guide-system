<template>
  <div class="modifyClass">
    <!--    头部-->
    <div style="display: flex; height: 80px; line-height: 80px; border-bottom: 1px solid #eee">
      <div style="width: 300px; display: flex; padding-left: 30px">
        <div style="width: 60px">
          <img src="../../assets/island.png"  style="width: 50px; position: relative; top: 5px; right: 0">
        </div>
        <div style="flex: 1" class="title">智慧景区</div>
      </div>
      <div style="flex: 1"  >


        <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" router>
          <el-menu-item index="/spot"><img src="../../assets/travel-bag.png"style="width: 24px; position: relative;display: inline-block "/>景区</el-menu-item>
          <el-menu-item index="/article">景区公告</el-menu-item>
          <el-menu-item index="/show">景点节目</el-menu-item>
          <el-menu-item index="/spotIntroduce" >景点介绍</el-menu-item>

        </el-menu>
      </div>
      <div style="width: 200px">
        <div v-if="!user.username" style="text-align: right; padding-right: 30px">
          <el-button @click="$router.push('/login')">登录</el-button>
          <el-button @click="$router.push('/register')">注册</el-button>
        </div>
        <div v-else>
          <el-dropdown style="width: 150px; cursor: pointer; text-align: right">
            <div style="display: inline-block">
              <img :src="user.avatarUrl" alt=""
                   style="width: 30px; border-radius: 50%; position: relative; top: 10px; right: 5px">
              <span>{{ user.nickname }}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
            </div>
            <el-dropdown-menu slot="dropdown" style="width: 100px; text-align: center">
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <router-link to="/clientUserPassword">修改密码</router-link>
              </el-dropdown-item>
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <router-link to="/clientUser">个人信息</router-link>
              </el-dropdown-item>
              <el-dropdown-item style="font-size: 14px; padding: 5px 0">
                <span style="text-decoration: none" @click="logout">退出</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </div>

    <div style="width: 100% ;height: 100%; margin: 0 auto ">
      <router-view @refreshUser="getUser" />
    </div>
  </div>
</template>

<script>
export default {
  name: "Front",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {

  },
  methods: {
    logout() {
      this.$router.push("/login")
      localStorage.removeItem("user")
      this.$message.success("退出成功")
    },
    getUser() {
      let username = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : ""
      if (username) {
        // 从后台获取User数据
        this.request.get("http://localhost:9090/user/username/" + username).then(res => {
          // 重新赋值后台的最新User数据
          this.user = res.data
        })
      }
    }
  }
}
</script>
<style lang="less">

.modifyClass {
  .el-menu {
    height: 80px;

  }

  //.el-menu.el-menu--horizontal {
  //  border-bottom: none;
  //}

  .el-menu--horizontal > .el-menu-item {
    line-height: 80px;


  }

   .el-menu-item {
    font-size: 18px;
     font-family: "Roboto";
     font-weight: bold;

  }
}

</style>
<style lang="less" >

.title{
  font-family: "Roboto";
  /*background-color: #eee;*/
  font-weight: bold;
  color:#808A87 ;
  font-size: 20px;
}


.text{
  font-family: "Roboto";
  /*background-color: #eee;*/
  font-weight: bold;
  color:#808A87 ;
  font-size: 20px;


}
.my-icon {
  display: inline-block;
  vertical-align: middle;
  width: 24px;
  height: 24px;
  background-image: url("../../assets/travel-bag.png");

  }
.item{
  display: inline-block;
  width: 100px;

  text-align: center;
  cursor: pointer
}
.item a {
  color: 	#1E90FF;
}
.item:hover{
  background-color: 	LightPink;
}
</style>

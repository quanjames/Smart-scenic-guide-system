<template>
  <div  style="font-size: 12px; line-height: 50px; display: flex">

      <div style="flex: 12;">

        <span :class="collapseBtnClass" style="cursor: pointer; font-size: 20px"  @click="collapse"></span>

        <el-breadcrumb separator="/" style="display: inline-block; margin-left: 10px">
          <el-breadcrumb-item :to="'/'" >首页</el-breadcrumb-item>
          <!-- <el-breadcrumb-item>{{ currentpathName }}</el-breadcrumb-item> -->
        </el-breadcrumb>
      </div>


    <el-dropdown style="width: 150px; cursor: pointer">
      <div style="display: inline-block" >

        <img :src="admin.avatarUrl" alt=""
             style="width: 30px; border-radius: 50%; position: relative; top: 10px; right: 15px">
        <span>{{admin.adminNickname}}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
      </div>
      <el-dropdown-menu slot="dropdown" style="width: 100px; text-align: center" >
        <el-dropdown-item style="font-size: 14px; padding: 5px 0">
        <router-link to="/manage/person">个人信息</router-link>
        </el-dropdown-item>
        <el-dropdown-item style="font-size: 14px; padding: 5px " >
          <span style="text-decoration: none" @click="logout">退出</span>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>

  </div>
</template>

<script>

export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    collapse: Boolean,
    currentpathName:String,
    admin:Object
  },
  data() {
    return {

    }
  },
  create(){
    console.log($this.$router)
    console.log(admin.avatarUrl)
    this.getAdmin()
  },
  methods:{
    logout() {
      this.$router.push("/adminlogin")
      localStorage.removeItem("admin")
      this.$message.success("退出成功")
    },

  }
}
</script>

<style scoped>

</style>
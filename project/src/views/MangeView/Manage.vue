<template>
  <el-container style="min-height: 100vh">

    <el-aside :width="sideWidth + 'px'" style="box-shadow: 2px 0 6px rgb(0 21 41 /35%);">
      <Aside :isCollapse="isCollapse" :logoTextShow="logoTextShow"></Aside>
    </el-aside>

    <el-container>
      <el-header style=" border-bottom: 1px solid #ccc;">

        <Header :collapseBtnClass="collapseBtnClass" :collapse="collapse" :admin="admin"></Header>

      </el-header>

      <el-main>

      <router-view @refreshAdmin="getAdmin"/>

      </el-main>

    </el-container>
  </el-container>
</template>

<script>
import Aside from "@/components/Aside";
import Header from "@/components/Header"

export default {
  name: 'Home',
  data() {

    return {

      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,

     admin:{}


    }
  },

  components:{
      Aside,
      Header
  },
  created() {
    this.getAdmin()
  },
  methods: {
    collapse() {  // 点击收缩按钮触发
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) {  // 收缩
        this.sideWidth = 64
        this.collapseBtnClass = 'el-icon-s-unfold'
        this.logoTextShow = false
      } else {   // 展开
        this.sideWidth = 200
        this.collapseBtnClass = 'el-icon-s-fold'
        this.logoTextShow = true
      }
    },
    getAdmin(){
       let name = localStorage.getItem("admin") ? JSON.parse(localStorage.getItem("admin")).name : ""

      // 从后台获取User数据
      this.request.get("http://localhost:9090/admin/adminname/"+name).then(res=>{
        this.admin = res.data
        console.log(this.admin)

      })
    }

  }
}
</script>


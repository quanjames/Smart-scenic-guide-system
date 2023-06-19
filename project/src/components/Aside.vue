<template>
  <el-menu :default-openeds="['1', '3']" style="min-height: 100%; overflow-x: hidden"
           background-color="rgb(48, 65, 86)"
           text-color="#fff"
           active-text-color="#ffd04b"
           :collapse-transition="false"
           :collapse="isCollapse"
           router
           @select="handleSelect"
  >
    <div style="height: 60px; line-height: 60px; text-align: center">
      <img src="../assets/logo.png" alt="" style="width: 20px; position: relative; top: 5px; right: 5px">
      <b style="color: white" v-show="logoTextShow">景区后台管理</b>
    </div>
    <el-menu-item index="/manage/home">
      <template slot="title">
        <i class="el-icon-house"></i>
        <span slot="title">主页</span>
      </template>
    </el-menu-item>
    <el-submenu index="2">
      <template slot="title">
        <i class="el-icon-menu"></i>
        <span slot="title">系统管理</span>
      </template>
      <el-menu-item index="/manage/user">
        <i class="el-icon-s-custom"></i>
        <span slot="title">用户管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/file">
        <i class="el-icon-folder-opened"></i>
        <span slot="title">文件管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/spotManage">
        <i class="el-icon-place"></i>
        <span slot="title">景点管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/articleManage">
        <i class="el-icon-reading"></i>
        <span slot="title">公告管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/articleCommentManage">
        <i class="el-icon-notebook-1"></i>
        <span slot="title">公告评论管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/showManage">
        <i class="el-icon-orange"></i>
        <span slot="title">节目管理</span>
      </el-menu-item>
      <el-menu-item index="/manage/showCommentManage">
        <i class="el-icon-notebook-1"></i>
        <span slot="title">节目评论管理</span>
      </el-menu-item>
    </el-submenu>
  </el-menu>
</template>

<script>
export default {
  name: "Aside",
  props:{
    isCollapse:Boolean,
    logoTextShow:Boolean
  },
  methods: {
    handleSelect(index) {
      console.log(index);
      console.log(this.$router.options.routes)
    
    }
  }
}
</script>

<style scoped>

</style>
<template>
<el-card style="width: 500px;padding: 50px">
  <el-form label-width="80px" size="small">
    <el-upload
        class="avatar-uploader"
        action="http://localhost:9090/file/upload"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
    >
      <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
  </el-form>
    <el-form label-width="80px" size="small">
      <el-form-item label="用户名">
        <el-input v-model="form.adminName" disabled  autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="form.adminNickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input type="password" v-model="form.adminPassword" show-password autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="save">确 定</el-button>
      </el-form-item>

  </el-form>
</el-card>

</template>

<script>
export default {
  name: "Person",
  data(){
    return{
      form:{},
       admin:localStorage.getItem("admin")?JSON.parse(localStorage.getItem("admin")):{}
    }
},
  created() {
    this.getAdmin().then(res => {
      console.log(res)
      this.form = res
      console.log(this.form)


    })
  },
  methods:{
    async getAdmin() {
      return (await this.request.get("http://localhost:9090/admin/adminname/" + this.admin.name)).data
    },
    save() {
      this.request.post("http://localhost:9090/admin", this.form).then(res => {
        if (res) {
          this.$message.success("保存成功")
          // 刷新界面 很好的解决方法
          // location.reload()


          // 触发父级更新Admin的方法
          this.$emit("refreshAdmin")


        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAvatarSuccess(res){
      this.form.avatarUrl =res
    }

  }
}
</script>

<style>
.avatar-uploader {
  text-align: center;
  padding-bottom: 10px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
}
.avatar {
  width: 138px;
  height: 138px;
  display: block;
}
</style>
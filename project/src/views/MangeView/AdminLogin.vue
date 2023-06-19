<template>
  <div class="wrapper">
    <div style="margin: 200px auto; background-color: #fff; width: 350px; height: 300px; padding: 20px; border-radius: 10px">
      <div style="margin: 20px 0; text-align: center; font-size: 24px"><b>管理员登录</b></div>
      <el-form :model="admin" :rules="rules" ref="adminForm">
        <el-form-item prop="name">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-user" v-model="admin.name"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-lock" show-password v-model="admin.password"></el-input>
        </el-form-item>
        <el-form-item style="margin: 10px 0; text-align: right">
          <el-button type="primary" size="small"  autocomplete="off" @click="$router.push('/login')">返回</el-button>
          <el-button type="primary" size="small"  autocomplete="off" @click="login">登录</el-button>

        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      admin: {},
      rules: {
        name: [
          { required: true, message: '请输入用户名', trigger: 'blur' },// blur 失焦时触发 ， username 与上面的prop 对应
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    login: function () {
      this.$refs['adminForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          this.request.post("http://localhost:9090/admin/login", this.admin).then(res => {
            console.log(res)
            if (res.code === '200') {
              console.log(res)
              localStorage.setItem("DL","地龙兽")
              localStorage.setItem("admin", JSON.stringify(res.data))


              this.$router.push("/manage")
              this.$message.success("登录成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    }
  }
}
</script>

<style>
.wrapper {
  height: 100vh;
  background-image: linear-gradient(to bottom right, #C0C0C0 , #3F5EFB);
  overflow: hidden;
}
</style>
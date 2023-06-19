<template>
<div>


  <div style="margin: 10px 0">
    <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="username"></el-input>
    <el-input style="width: 200px" placeholder="请输入邮箱" suffix-icon="el-icon-message" v-model="email" class="ml-5"></el-input>
    <el-input style="width: 200px" placeholder="请输入地址" suffix-icon="el-icon-position" v-model="address" class="ml-5"></el-input>
    <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
    <el-button class="ml-5" type="danger" @click="reset">重置</el-button>
  </div>

  <div style="margin: 10px 0">
    <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
    <el-button type="danger" @click="delBatch">批量删除 <i class="el-icon-remove-outline"></i></el-button>


    <el-upload action="http://localhost:9090/user/import" :show-file-list=false accept="xlsx":on-success="handleImportSuccess" style='display: inline-block'>
    <el-button type="primary" @click="" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
    </el-upload>


    <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
  </div>

  <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
    <el-table-column
        type="selection"
        width="55"></el-table-column>
    <el-table-column prop="id" label="ID" width="80"></el-table-column>
    <el-table-column prop="username" label="用户名" width="140"></el-table-column>
    <el-table-column prop="nickname" label="昵称" width="120"></el-table-column>
    <el-table-column prop="email" label="邮箱"></el-table-column>
    <el-table-column prop="phone" label="电话"></el-table-column>
    <el-table-column prop="address" label="地址"></el-table-column>
    <el-table-column label="操作"  width="200" align="center">
      <template slot-scope="scope">
        <el-button type="success" @click="handelEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
        <el-popconfirm
            class="ml-5"
            confirm-button-text='确定'
            cancel-button-text='我再想想'
            icon="el-icon-info"
            icon-color="red"
            title="您确定删除吗？"
            @confirm="handleDel(scope.row.id)"
        >
          <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
        </el-popconfirm>
      </template>
    </el-table-column>
  </el-table>
  <!--        // 分页Element-->
  <div style="padding: 10px 0">
    <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pageNum"
        :page-sizes="[2, 5, 10, 20]"
        :page-size="2"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>
  </div>

  <!--          添加功能 对话框-->
  <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" >
    <el-form label-width="80px" size="small">
      <el-form-item label="用户名">
        <el-input v-model="form.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="form.nickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input v-model="form.address" autocomplete="off"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">取 消</el-button>
      <el-button type="primary" @click="save">确 定</el-button>
    </div>
  </el-dialog>
</div>
</template>

<script>
export default {
  name: "User.vue",
  data(){
    return{
      tableData: [],
      total:0,
      pageNum:1,
      pageSize:10,
      username:"",
      email:"",
      address:"",
      form:{},
      multipleSelection: [], // 多选框，选定时的内容
      dialogFormVisible:false, // 增加功能对话框默认不展示
      headerBg: 'headerBg',
    }
  },
  created() {
    this.load()
  },
  methods:{
    load(){

      this.request.get("http://localhost:9090/user/page",{
        params:{
          pageNum:this.pageNum,
          pageSize:this.pageSize,
          username:this.username,
          email:this.email,
          address:this.address

        }
      }).then(
          res=>{
            console.log(res)
            this.tableData = res.records // records 请看控制台的输出
            this.total = res.total

          }
      )
    },
    exp(){
      window.open("http://localhost:9090/user/export")
    },
    handleImportSuccess(){
      this.$message.success("导入成功")
      this.load()
    },
    handleSelectionChange(val){
      this.multipleSelection=val

    },
    delBatch(){
      let ids = this.multipleSelection.map(v =>v.id) // [{} , {} , {} ] 转变成 [1 2 3] 形式的数据
      this.request.post("http://localhost:9090/user/del/batch",ids).then(res=>{
        if (res) {
          this.$message.success("删除成功")

          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleDel(id){
      this.request.delete("http://localhost:9090/user/"+id).then(res=>{
        if (res) {
          this.$message.success("删除成功")

          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handelEdit(row){
      this.form = row
      this.dialogFormVisible=true
    },
    save() {
      this.request.post("http://localhost:9090/user", this.form).then(res => {
        if (res) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    reset(){ // 重置
      this.username = ""
      this.email = ""
      this.address = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    }
  }

}
</script>

<style>
.headerBg {
  background: #eee!important;
}
</style>
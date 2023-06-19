<template>
<div>
  <div style="margin: 10px 0">
    <el-input style="width: 200px" placeholder="请输入景点" suffix-icon="el-icon-search" v-model="touristname"></el-input>

    <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
    <el-button class="ml-5" type="danger" @click="reset">重置</el-button>

  </div>
  <div style="margin: 10px 0">
    <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
    <el-button type="danger" @click="delBatch">批量删除 <i class="el-icon-remove-outline"></i></el-button>


<!--    <el-upload action="http://localhost:9090/spot/import" :show-file-list=false accept="xlsx":on-success="handleImportSuccess" style='display: inline-block'>-->
<!--      <el-button type="primary" @click="" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--    </el-upload>-->


<!--    <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
  </div>
  <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
    <el-table-column
        type="selection"
        width="55"></el-table-column>
    <el-table-column prop="id" label="ID" width="80"></el-table-column>
    <el-table-column prop="touristname" label="景点名" width="140"></el-table-column>
    <el-table-column prop="lng" label="经度" width="120"></el-table-column>
    <el-table-column prop="lat" label="维度"></el-table-column>
    <el-table-column prop = "iconUrl" label="图标url">
      <template slot-scope="scope">.
        <img :src="scope.row.iconUrl" alt="" style="width: 100px; border-radius: 0%; position: relative; top: 10px; right: 15px">
      </template>
    </el-table-column>
    <el-table-column prop="imageUrl" label="图片url">
      <template slot-scope="scope">.
        <img :src="scope.row.imageUrl" alt="" style="width: 100px; border-radius: 0%; position: relative; top: 5px; right: 15px">
      </template>

    </el-table-column>
    <el-table-column prop="description" label="景点描述"></el-table-column>
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
  <el-dialog title="景点信息" :visible.sync="dialogFormVisible" width="30%">
    <el-form label-width="80px" size="small">
      <el-form-item label="景点名">
        <el-input v-model="form.touristname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="经度">
        <el-input v-model="form.lng" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="纬度">
        <el-input v-model="form.lat" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="图标url">

        <el-upload
            class="avatar-uploader"
            action="http://localhost:9090/file/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
        >
          <img v-if=" form.iconUrl" :src="form.iconUrl"  class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
      <el-form-item label="景点url">
        <el-upload
            class="avatar-uploader"
            action="http://localhost:9090/file/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess1"
        >
          <img v-if=" form.imageUrl" :src="form.imageUrl"  class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
      <el-form-item label="景点描述">
        <el-input v-model="form.description" autocomplete="off"></el-input>
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
import request from "../../utils/request";

export default {
  name: "Spot",
  data(){
    return{
      tableData:[],
      touristname:"",
      total:0,
      pageNum:1,
      pageSize:8,
      form:{},
      multipleSelection: [], // 多选框，选定时的内容
      dialogFormVisible:false, // 增加功能对话框默认不展示
      headerBg: 'headerBg',
      loaded:false,

    }
  },
  methods:{
     load(){

      this.request.get("http://localhost:9090/spot/page",{
        params:{
          pageNum:this.pageNum,
          pageSize:this.pageSize,
          touristname:this.touristname


        }
      }).then(
          res=>{
            console.log(res)
            this.tableData = res.records // records 请看控制台的输出
            this.total = res.total
            console.log(res)
          }
      )
    },
    handleAvatarSuccess(res) {
      this.form.iconUrl = res;
      this.loaded = true; // 设置图片已上传完成
      console.log(this.form.iconUrl);
    },

    handleAvatarSuccess1(res) {
      this.form.imageUrl = res;
      this.loaded = true; // 设置图片已上传完成
      console.log(this.form.imageUrl);
    },

    save(){
      this.request.post("http://localhost:9090/spot",this.form).then(res=>{
      if(res){
        this.$message.success("保存成功")
        this.dialogFormVisible=false
        this.load()
      }else{
        this.$message.error("保存失败")
      }

      })
    },
    handleAdd(){
      this.dialogFormVisible=true;
      this.form={}
    },
    handelEdit(row) {
      this.form = {
        touristname: row.touristname,
        lng: row.lng,
        lat: row.lat,
        iconUrl: row.iconUrl, // 添加这行代码，将图标URL赋值给form.iconUrl
        imageUrl: row.imageUrl, // 添加这行代码，将图片URL赋值给form.imageUrl
        description: row.description
      };
      this.dialogFormVisible = true;
    },

    delBatch(){
      let ids = this.multipleSelection.map(v => v.id)
      console.log(ids)
      this.request.post("http://localhost:9090/spot/del/batch", ids).then(res => {
        if (res) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },

    handleDel(id){
     this.request.delete("http://localhost:9090/spot/"+id).then(res=>{
       if (res) {
         this.$message.success("删除成功")

         this.load()
       } else {
         this.$message.error("删除失败")
       }
     })
    },
    reset(){
      this.touristname=""
      this.load()
    },
    handleSelectionChange(val){
      this.multipleSelection=val

    },
    handleSizeChange(pageSize){
      this.pageSize=pageSize;
      this.load();

    },
    handleCurrentChange(pageNum){
      this.pageNum=pageNum;
      this.load();
    }
  },
  created() {
    this.load()
  }
}
</script>

<style scoped>
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
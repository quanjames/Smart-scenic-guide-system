<template>
  <div>

    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入评论信息" suffix-icon="el-icon-search" v-model="content"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="danger" @click="reset">重置</el-button>

    </div>
    <div style="margin: 10px 0">
      <el-button type="danger" @click="delBatch">批量删除 <i class="el-icon-remove-outline"></i></el-button>
    </div>
    <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="content" label="评论内容" width="100"></el-table-column>
      <el-table-column prop="userId" label="用户编号" width="250"></el-table-column>
      <el-table-column prop="time" label="评论时间"></el-table-column>
      <el-table-column prop="pid" label="评论父级编号"></el-table-column>
      <el-table-column prop="origin_id" label="最上级评论id"></el-table-column>
      <el-table-column prop="articleId" label="关联公告编号id"></el-table-column>

      <el-table-column label="操作"  width="200" align="center">
        <template slot-scope="scope">

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



  </div>
</template>

<script>
import request from "../../utils/request";

export default {
  name: "CommentManage",
  data(){
    return{
      tableData:[],
      time:'',
      name:"",
      total:0,
      pageNum:1,
      pageSize:8,

      multipleSelection: [], // 多选框，选定时的内容
      dialogFormVisible:false, // 增加功能对话框默认不展示
      headerBg: 'headerBg',
      content:'',


    }
  },
  methods:{


    load(){

      this.request.get("http://localhost:9090/comment/page",{
        params:{
          pageNum:this.pageNum,
          pageSize:this.pageSize,
          content:this.content,



        }
      }).then(
          res=>{
            console.log(res)
            this.tableData = res.data.records // records 请看控制台的输出
            this.total = res.data.total
            console.log(this.tableData)

            console.log(res)
          }
      )
    },



    delBatch(){
      let ids = this.multipleSelection.map(v => v.id)
      console.log(ids)
      this.request.post("http://localhost:9090/comment/del/batch", ids).then(res => {
        if (res) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },

    handleDel(id){
      this.request.delete("http://localhost:9090/comment/"+id).then(res=>{
        if (res) {
          this.$message.success("删除成功")

          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    reset(){
      this.name=""
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

  },
  mounted(){

  }
}
</script>

<style scoped>

</style>
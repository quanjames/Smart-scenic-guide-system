<template>
  <div>
  <div class="container">
    <div class="card"  >

      <img class="card-image" :src="show.imageUrl" />
      <div class="card-body">
        <h5 class="card-title" >{{show.name}}</h5>

        <div class="card-content">


          <div>举办时间:{{show.begainTime}}</div>
          <div style="margin-top: 10px">举办地点：{{show.position}}</div>
        </div>

      </div>
    </div>
  </div>

    <div style="width: 1000px; height: 100%;margin: 10px auto;       ">
      <div style="margin: 10px 0">
        <div style="border-bottom: 1px solid orangered; padding: 10px 0; font-size: 20px">评论</div>
        <div style="padding: 10px 0">
          <el-input size="small" type="textarea" v-model="showCommentForm.content"></el-input>
        </div>
        <div class="pd-10" style="text-align: right">
          <el-button type="primary" size="small" @click="save">评论</el-button>
        </div>
      </div>

      <!--      评论列表-->
      <div>
        <div v-for="item in showComments" :key="item.id" style="border-bottom: 1px solid #ccc; padding: 10px 0; ">
          <div style="display: flex">
            <div style="width: 100px; text-align: center">
              <el-image :src="item.avataUrl" style="width: 50px; height: 50px; border-radius: 50%"></el-image>
            </div> <!--  头像-->
            <div style="flex: 1; font-size: 14px; padding: 5px 0; line-height: 25px">
              <b>{{ item.nickname }}：</b>
              <span>{{ item.content }}</span>

              <div style="display: flex; line-height: 20px; margin-top: 5px">
                <div style="width: 200px;">
                  <i class="el-icon-time"></i><span style="margin-left: 5px">{{ item.time }}</span>
                </div>
                <div style="text-align: right; flex: 1">
                  <el-button style="margin-left: 5px" type="text" @click="handleReply(item.id)">回复</el-button>
                  <el-button type="text" style="color: red" @click="del(item.id)" v-if="user.id === item.userId">删除</el-button>
                </div>
              </div>
            </div>   <!--  内容-->
          </div>

          <div v-if="item.children.length"  style="padding-left: 200px;">
            <div v-for="subItem in item.children" :key="subItem.id"  style="background-color: #f0f0f0; padding: 5px 20px">
              <!--          回复列表-->
              <div style="font-size: 14px; padding: 5px 0; line-height: 25px">
                <div>
                  <b style="color: #3a8ee6" v-if="subItem.pnickname">@{{ subItem.pnickname }}</b>
                </div>
                <div style="padding-left: 5px">
                  <b>{{ subItem.nickname }}：</b>
                  <span>{{ subItem.content }}</span>
                </div>

                <div style="display: flex; line-height: 20px; margin-top: 5px; padding-left: 5px">
                  <div style="width: 200px;">
                    <i class="el-icon-time"></i><span style="margin-left: 5px">{{ subItem.time }}</span>
                  </div>
                  <div style="text-align: right; flex: 1">
                    <el-button style="margin-left: 5px" type="text" @click="handleReply(subItem.id)">回复</el-button>
                    <el-button type="text" style="color: red" @click="del(subItem.id)" v-if="user.id === subItem.userId">删除</el-button>
                  </div>
                </div>
              </div>   <!--  内容-->
            </div>

          </div>


        </div>
      </div>
    </div>
<!--    </div>-->

    <el-dialog title="回复" :visible.sync="dialogFormVisible" width="50%" >
      <el-form label-width="80px" size="small">
        <el-form-item label="回复内容">
          <el-input type="textarea" v-model="showCommentForm.contentReply" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false" size="small">取 消</el-button>
        <el-button type="primary" @click="save"  size="small">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "ShowDetail",
  data(){
    return{
      show: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      showComments: [],
      showCommentForm: {},
      id: this.$route.query.id,
      dialogFormVisible: false
    }
  },
  methods:{
    load() {
      this.request.get("http://localhost:9090/show/" + this.id).then(res => {
        this.show = res.data
        console.log(this.show)
      })
    },
    loadComment() {
      this.request.get("http://localhost:9090/showcomment/tree/" + this.id).then(res => {
        this.showComments = res.data
        console.log(this.showComments)
      })
    },
    save() {
      if (!this.user.id) {
        console.log(this.user.id)
        this.$message.warning("请登录后操作")
        return
      }
      this.showCommentForm.showId = this.id
      if (this.showCommentForm.contentReply) {
        this.showCommentForm.content = this.showCommentForm.contentReply
      }
      this.request.post("http://localhost:9090/showcomment", this.showCommentForm).then(res => {
        if (res.code === '200') {
          this.$message.success("评论成功")
          this.showCommentForm = {}  // 初始化评论对象内容
          this.loadComment()
          this.dialogFormVisible = false
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    del(id) {
      this.request.delete("http://localhost:9090/showcomment/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.loadComment()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleReply(pid) {
      this.showCommentForm = { pid: pid }
      this.dialogFormVisible = true
    }
  },

  created() {
  this.load()
    this.loadComment()
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Serif+Display:wght@400;500;600;700&display=swap');

body {
  background-color: #f0f0f0;
  font-family: 'Quicksand', sans-serif;
}

.container{
  display: flex;
  justify-content: center;
  align-items: center;

  width: 1000px;
  margin: 0 auto ;
  color: #666 ;
}

main {
  padding: 32px;
}

section {
  display: flex;
  justify-content: center;
}

.card {
  padding-top: 0px;
  display: inline-block;

  align-items: center; /* 水平居中对齐 */
  background-color: #ffffff;
  margin: 24px;
  padding: 16px;
  width: 312px;
  /*height: 256px; !* 添加相同的高度 *!*/

  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  transition: .4s;
}


.card:hover {
  box-shadow: none;
}



.card-image {

  width: 100%;
  height: 256px;

  border-radius: 8px;


  box-shadow: 16px 4px 24px 0 rgba(0, 0, 0, 0.2);
  transition: .4s;
  object-fit: cover;
}

.card-body {
  padding: 8px;
  height: 80px;
}

.card-title {
  font-size: 32px;
  margin: 12px 0;
  transition: .4s;
  font-family: 'DM Serif Display', serif;
  font-weight: 600;
  letter-spacing: 2px;
}

.card-content {
  font-size: 14px;
  margin-bottom: 8px;
  /*height: 80px;*/
  display: flex;
  flex-direction: column; /* 修改为垂直排列 */
  -webkit-line-clamp: 2; /* 设置显示的行数 */
  -webkit-box-orient: vertical;
  overflow: hidden;
}


</style>
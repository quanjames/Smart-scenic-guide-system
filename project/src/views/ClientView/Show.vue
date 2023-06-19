<template>
  <div >
    <div style=" padding-left:10px; margin: 10px 0">
      <el-input size="small" style="width: 300px" placeholder="请输入节目" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load" size="small">搜索</el-button>
      <el-button type="warning" @click="reset" size="small">重置</el-button>
    </div>
    <div class="card" v-for="data in localData" >
      <img class="card-image" :src="data.imageUrl" />
      <div class="card-body">
        <h5 class="card-title" >{{data.name}}</h5>

        <div class="card-content">

          <div  @click="speak(data.content)" >
            <img src="../../assets/voice.png"  style="width: 30px; position: relative; top: 5px; right: 0">:{{data.content}}</div>


        </div>
<!--        <div> <el-button type="primary" round  @click="$router.push('showDetail?id=' + data.id)" >主要按钮</el-button></div>-->
        <el-button type="primary" round  @click="$router.push('showDetail?id=' + data.id)" >了解详情</el-button>

      </div>
    </div>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, prev, pager, next"
          :total="total">
      </el-pagination>
    </div>

  </div>


</template>

<script>
export default {
  name: "Show",
  data(){
    return {
      text: '',

      localData: [],
      pageNum: 1,
      pageSize: 8,
      total: 0,
      name:'',
    };
  },
  methods:{
    speak(content) {
      const utterance = new SpeechSynthesisUtterance(content);
      speechSynthesis.speak(utterance);
    },
    load(){
      this.request.get("http://localhost:9090/show/page",{
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(
          res=>{
            console.log(res)
            this.localData =res.records
            this.total = res.total



          }
      )
    },
    reset() {
      this.name = ""
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
    },
  },
  mounted() {
    // console.log(this.$refs.square.offsetHeight)
    this.load()
  }
}
</script>

<style scoped>

.el:hover {
  transform: scale(0.9, 0.9);
  box-shadow: 5px 5px 30px 15px rgba(0,0,0,0.25),
  -5px -5px 30px 15px rgba(0,0,0,0.22);
}
.title{
  font-size: 25px;
  font-weight: 500;
  color: steelblue;
  margin-bottom: 1.5rem;
}

@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Serif+Display:wght@400;500;600;700&display=swap');

body {
  background-color: #f0f0f0;
  font-family: 'Quicksand', sans-serif;
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
  -webkit-line-clamp: 2; /* 设置显示的行数 */
  -webkit-box-orient: vertical;
  overflow: hidden;
}

</style>
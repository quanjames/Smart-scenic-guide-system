<template>
 <div >
   <el-row>
     <el-col :span="12">
       <div id="main" style="width: 500px; height: 400px"></div>
     </el-col>
     <el-col :span="12">
       <div id="pie" style="width: 500px; height: 400px"></div>
     </el-col>
   </el-row>



 </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name: "Home",
  data(){
    return{

    }
  },
  mounted() { // 页面元素渲染之后再触发


    var option;

    option = {
      title: {
        text: '景区四个季度注册用户统计',
        subtext: 'Fake Data',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      xAxis: {
        type: 'category',
        data: ["第一季度","第二季度","第三季度","第四季度"]
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [],
          type: 'line'
        },
        {
          data: [],
          type: 'bar'
        },
      ]
    };

    var chartDom = document.getElementById('main')
    var myChart = echarts.init(chartDom);

    this.request.get("http://localhost:9090/echarts/members").then(res =>{
     // option.xAxis.data = res.data.x;
      option.series[0].data = res.data;
      option.series[1].data = res.data;
      myChart.setOption(option)
      console.log(res)

      pieOption.series[0].data=[
        {name:"第一季度",value: res.data[0]},
        {name:"第二季度",value: res.data[1]},
        {name:"第三季度",value: res.data[2]},
        {name:"第四季度",value: res.data[3]},
      ]
      pieChart.setOption(pieOption)
    })





    var pieOption = {
      title: {
        text: '智慧景区各个季度注册人数扇形图',
        subtext: 'Fake Data',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: '50%',
          label:{
            formatter:'{d}%'
          },
          data: [
            { value: 1048, name: 'Search Engine' },
            { value: 735, name: 'Direct' },
            { value: 580, name: 'Email' },
            { value: 484, name: 'Union Ads' },
            { value: 300, name: 'Video Ads' }
          ],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    };
    var pieDom = document.getElementById('pie')
    var pieChart = echarts.init(pieDom);
    pieChart.setOption(pieOption)
  },
  methods:{
    load(){

    }
  }

}
</script>

<style scoped>

</style>
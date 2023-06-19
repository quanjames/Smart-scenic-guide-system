<template>
  <div class="facontainer">
    <div id="container" class="container" >
      <div id="panel"  ></div>
    </div>

  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";

window._AMapSecurityConfig = {
  // 安全密钥
  securityJsCode: "请填写你申请的高德地图安全密钥",
};

export default {
  name: "TestIndex",
  data() {
    return {
      // 地图实例
      map: null,
      // 标记点
      marker: "",
      makerP: [],
      localData: [],
      imgUrl: [],
      start: [113.05477, 28.234865],
      walking: null,
    };
  },
  methods: {
    async initMap() {
      const AMap = await AMapLoader.load({
        // 你申请的Key
        key: "高德地图Key",
        version: "2.0",
        // 需要用到的插件
        plugins: [
          "AMap.LabelMarker",
          "AMap.Walking",
          "AMap.ElasticMarker",
          "AMap.Polyline",
        ],
        AMapUI: {
          // 是否加载 AMapUI，缺省不加载
          version: "1.1", // AMapUI 缺省 1.1
          plugins: ["overlay/SimpleMarker", "misc/PathSimplifier"], // 需要加载的 AMapUI ui插件
        },
      });

      this.map = new AMap.Map("container", {
        viewMode: "3D",
        zoom: 17,
        center: [113.054669, 28.238277],
        features: ["bg", "road"],
      });
      // const walking = new AMap.Walking({
      //   map: this.map,
      // });
      var walkOption = {
        map: this.map,
        panel: "panel",
        hideMarkers: false,
        isOutline: true,
        outlineColor: "#ffeeee",
        autoFitView: true,
      };

      const walking = new AMap.Walking(walkOption);

      let layer = new AMap.LabelsLayer({
        zooms: [3, 20],
        zIndex: 1000,
        // 开启标注避让，默认为开启，v1.4.15 新增属性
        collision: true,
        // 开启标注淡入动画，默认为开启，v1.4.15 新增属性
        animation: true,
      });
      for (let i = 0; i < this.localData.length; i++) {
        const marker = new AMap.LabelMarker({
          name: this.localData[i].touristname,
          position: [this.localData[i].lng, this.localData[i].lat],
          icon: {
            type: "image",
            image: this.localData[i].iconUrl,

            size: [64, 64],
            //size:[131,170],
            anchor: "bottom-top",
            angel: 0,
            retina: true,
          },
          text: {
            content: this.localData[i].touristname,
            zooms: [16,17,18,19,20],
            direction: "top",
            offset: [0, 0],
            style: {
              fontSize: 13,
              fontWeight: "normal",
              fillColor: "#fff",
              padding: "2, 5",
              backgroundColor: "#22884f",
            },
          },
        });
        layer.add(marker);

        this.map.add(marker);

        marker.on("click", () => {
          const infoWindowContent = document.createElement("div");
          infoWindowContent.style.width = "300px";
          infoWindowContent.style.height = "200px";

          // 添加标题
          const title = document.createElement("h3");
          title.style.margin = "0";
          title.style.padding = "10px";
          title.style.backgroundColor = "#f00";
          title.style.color = "#fff";
          title.textContent = this.localData[i].touristname;
          infoWindowContent.appendChild(title);

          // 添加图片
          const img = document.createElement("img");
          img.style.width = "50%";
          img.style.height = "50%";
          img.style.objectFit = "cover";
          img.src = this.localData[i].imageUrl;
          infoWindowContent.appendChild(img);

          // 创建按钮
          const button = document.createElement("button");
          button.textContent = "到这";

          // 为按钮添加点击事件
          button.addEventListener("click", () => {
            // 在这里编写按钮的点击事件处理逻辑
            // 例如：获取该图标的经纬度

            const position = marker.getPosition();

            console.log(position);
            console.log(position.lng);
            console.log(position.lat);
            const end = [position.lng, position.lat];
            this.start = [113.05477, 28.234865];

            if (walking) {
              walking.clear();
            }
            // 步行导航

            walking.search(this.start, end, (status, result) => {
              if (status === "complete" && result.info === "OK") {
                // 绘制路线

                this.walkingRoute = result.routes[0];
                const path = this.walkingRoute.path.map((p) => [p.lng, p.lat]);
                const polyline = new AMap.Polyline({
                  map: this.map,
                  path,
                  showDir: true,
                  strokeColor: "#28F",
                  strokeWeight: 6,
                  strokeOpacity: 0.8,
                });
                this.polyline = polyline;
                this.map.add(polyline);
              }
            });
          });

          // 将按钮添加到信息窗口中
          infoWindowContent.appendChild(button);

          // 创建信息窗口
          const infoWindow = new AMap.InfoWindow({
            content: infoWindowContent,
            offset: new AMap.Pixel(0, -30),
          });

          // 显示信息窗口
          infoWindow.open(this.map, marker.getPosition());
        });

        marker.on("mouseover", () => {
          // marker.setOffset(new AMap.Pixel(-10, -10));
          marker.setIcon({
            type: "image",
            image: this.localData[i].iconUrl,
            size: [84, 84],
            anchor: "bottom-center",
            angel: 0,
            retina: true,
          });
        });

        marker.on("mouseout", () => {
          // marker.setOffset(new AMap.Pixel(0, 0));
          marker.setIcon({
            type: "image",
            image: this.localData[i].iconUrl,
            size: [64, 64],
            anchor: "bottom-top",
            angel: 0,
            retina: true,
          });
        });
      }
    },
    load() {
      this.request.get("http://localhost:9090/spot").then((res) => {
        console.log(res);
        this.localData = res;
      });

    },
    clearRoute() {
      if (this.polyline != null) {
        this.polyline.setMap(null);
        this.polyline = null;
        this.walkingRoute = null;
        this.walking.clear(); // 清除步行路线规划结果
      }
    },
  },

  mounted() {
    this.initMap();
    this.load();

  },
  created() {},
};
</script>
<style>
.container {
  width: 1200px;
  height: 900px;

  display: inline-block; /* 设置子元素为 inline-block */
}
#panel {
  position: fixed;
  background-color: white;
  max-height: 90%;
  overflow-y: auto;
  top: 90px;
  right: 10px;
  width: 280px;
  /*padding-top: 90px;*/
}
#panel .amap-call {
  background-color: #009cf9;
  border-top-left-radius: 50px;
  border-top-right-radius: 4px;

}
#panel .amap-lib-walking {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}
.facontainer{
  margin-top: 5px;
  text-align: center; /* 设置父元素 text-align 属性为 center */
}
</style>


/*
 Navicat Premium Data Transfer

 Source Server         : 12
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : graduate

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/06/2023 09:09:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名称',
  `admin_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `admin_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员头像url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '景区管理员', 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (21, '关于建设智能化景区的建议', '# 智能景区要求一定要智能化\n其相关建议如下\n![pin 1.png](http://localhost:9090/file/ac2ef07ff69e4376bfac4f4c5d66d81e.png)', '景区管理员', '2023-05-24 19:16:25');
INSERT INTO `article` VALUES (22, '给广大游客的一封信', '# 这里真好玩\n\n![surf.png](http://localhost:9090/file/9fb76cb57d214f998e4c396bafc35698.png)', '景区管理员', '2023-05-24 19:17:12');
INSERT INTO `article` VALUES (23, '测试案例一号', '111111![parking 1.png](http://localhost:9090/file/a57c13dd194f4e0481dce2cd08e3ee1a.png)', '景区管理员', '2023-05-24 19:17:41');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT 1 COMMENT '是否删除链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (16, 'cute.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (17, 'cute - 11.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (18, 'cute - 11.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (19, '用户信息.xlsx', 'xlsx', 8, 'http://localhost:9090/file/2ee0d4f445d9483f828f6fc30a025041.xlsx', '135457ddb1f900354586fa1eed0d7f02', 1, 1);
INSERT INTO `sys_file` VALUES (20, '用户信息 (3).xlsx', 'xlsx', 4, 'http://localhost:9090/file/0578c3ba82cb4aa396d6e00a4ddc21f6.xlsx', 'cd8e97de8ff9b17be5b71734364bfce6', 1, 1);
INSERT INTO `sys_file` VALUES (21, '用户信息 (3).xlsx', 'xlsx', 4, 'http://localhost:9090/file/0578c3ba82cb4aa396d6e00a4ddc21f6.xlsx', 'cd8e97de8ff9b17be5b71734364bfce6', 1, 1);
INSERT INTO `sys_file` VALUES (22, '用户信息 (3).xlsx', 'xlsx', 4, 'http://localhost:9090/file/0578c3ba82cb4aa396d6e00a4ddc21f6.xlsx', 'cd8e97de8ff9b17be5b71734364bfce6', 1, 1);
INSERT INTO `sys_file` VALUES (23, 'cuteMan.jpg', 'jpg', 6, 'http://localhost:9090/file/de62114e29e840f3b4bd70c38dce0ec8.jpg', '464c91c404402a469df6f65d733cec09', 1, 1);
INSERT INTO `sys_file` VALUES (24, 'boy.jpg', 'jpg', 128, 'http://localhost:9090/file/3935e396496345d699aa312a61428375.jpg', '49c45ba3de37d991227b11a92d1ee26f', 1, 1);
INSERT INTO `sys_file` VALUES (25, 'cute.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (26, 'cuteMan.jpg', 'jpg', 6, 'http://localhost:9090/file/de62114e29e840f3b4bd70c38dce0ec8.jpg', '464c91c404402a469df6f65d733cec09', 1, 1);
INSERT INTO `sys_file` VALUES (27, 'cute - 11.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (28, 'cute - 11.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (29, '3935e396496345d699aa312a61428375.jpg', 'jpg', 128, 'http://localhost:9090/file/3935e396496345d699aa312a61428375.jpg', '49c45ba3de37d991227b11a92d1ee26f', 1, 1);
INSERT INTO `sys_file` VALUES (30, '1b28096eae354f29bea2bf8fd9eab04d.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (31, '3935e396496345d699aa312a61428375.jpg', 'jpg', 128, 'http://localhost:9090/file/3935e396496345d699aa312a61428375.jpg', '49c45ba3de37d991227b11a92d1ee26f', 1, 1);
INSERT INTO `sys_file` VALUES (32, '1b28096eae354f29bea2bf8fd9eab04d.jpg', 'jpg', 8, 'http://localhost:9090/file/1b28096eae354f29bea2bf8fd9eab04d.jpg', '7ecd3bd1f22e4b7efc92a187176f51de', 1, 1);
INSERT INTO `sys_file` VALUES (33, '3935e396496345d699aa312a61428375.jpg', 'jpg', 128, 'http://localhost:9090/file/3935e396496345d699aa312a61428375.jpg', '49c45ba3de37d991227b11a92d1ee26f', 1, 1);
INSERT INTO `sys_file` VALUES (34, 'de62114e29e840f3b4bd70c38dce0ec8.jpg', 'jpg', 6, 'http://localhost:9090/file/de62114e29e840f3b4bd70c38dce0ec8.jpg', '464c91c404402a469df6f65d733cec09', 1, 1);
INSERT INTO `sys_file` VALUES (35, '商家店铺.png', 'png', 11, 'http://localhost:9090/file/c82f4f8b2eba43db8452252ad44dbdda.png', '9b7940d8fc7e9a320f8666f15fc4f937', 1, 1);
INSERT INTO `sys_file` VALUES (36, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (37, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (38, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (39, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (40, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (41, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (42, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (43, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (44, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (45, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (46, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (47, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (48, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (49, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (50, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (51, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 1, 1);
INSERT INTO `sys_file` VALUES (52, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (53, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (54, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 1, 1);
INSERT INTO `sys_file` VALUES (55, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (56, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (57, '商家店铺.png', 'png', 11, 'http://localhost:9090/file/c82f4f8b2eba43db8452252ad44dbdda.png', '9b7940d8fc7e9a320f8666f15fc4f937', 1, 1);
INSERT INTO `sys_file` VALUES (58, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (59, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (60, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (61, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 1, 1);
INSERT INTO `sys_file` VALUES (62, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 1, 1);
INSERT INTO `sys_file` VALUES (63, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (64, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 1, 1);
INSERT INTO `sys_file` VALUES (65, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (66, '景点.png', 'png', 6, 'http://localhost:9090/file/e0bddea4f1e546b7a6baec369f351787.png', '08811a084af3760283a2b4e6af588214', 1, 1);
INSERT INTO `sys_file` VALUES (67, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (68, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (69, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (70, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (71, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 1, 1);
INSERT INTO `sys_file` VALUES (72, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (73, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (74, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (75, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (76, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (77, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (78, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (79, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (80, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (81, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (82, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (83, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (84, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (85, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (86, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (87, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 1, 1);
INSERT INTO `sys_file` VALUES (88, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (89, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (90, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (91, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (92, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (93, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 1, 1);
INSERT INTO `sys_file` VALUES (94, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (95, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (96, 'park.png', 'png', 23, 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png', 'e6cf9cf1655c1f3c39546fca565e15d2', 1, 1);
INSERT INTO `sys_file` VALUES (97, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 1, 1);
INSERT INTO `sys_file` VALUES (98, 'icon1.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (99, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (100, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (101, 'garage.png', 'png', 36, 'http://localhost:9090/file/cde1eb1e4b78471abc40e7fc4fbe5765.png', 'f878d091de39314b4226a3119bfe62d7', 1, 1);
INSERT INTO `sys_file` VALUES (102, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (103, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (104, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (105, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (106, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 1, 1);
INSERT INTO `sys_file` VALUES (107, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (108, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 1, 1);
INSERT INTO `sys_file` VALUES (109, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 1, 1);
INSERT INTO `sys_file` VALUES (110, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (111, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (112, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 1, 1);
INSERT INTO `sys_file` VALUES (113, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 1, 1);
INSERT INTO `sys_file` VALUES (114, 'garage.png', 'png', 36, 'http://localhost:9090/file/cde1eb1e4b78471abc40e7fc4fbe5765.png', 'f878d091de39314b4226a3119bfe62d7', 0, 1);
INSERT INTO `sys_file` VALUES (115, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (116, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (117, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (118, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (119, 'images1.jpg', 'jpg', 3, 'http://localhost:9090/file/221de99f04ba43c1aab6f7056d9b92a5.jpg', '4dbdf60417623dfa3d8dc97eae902480', 0, 1);
INSERT INTO `sys_file` VALUES (120, 'images2.jpg', 'jpg', 4, 'http://localhost:9090/file/54f9fa952c4c4e50a32377b4fbcfd89f.jpg', 'c0a47195d3ee3a73669fe6d4248e545a', 0, 1);
INSERT INTO `sys_file` VALUES (121, '景点.png', 'png', 6, 'http://localhost:9090/file/e0bddea4f1e546b7a6baec369f351787.png', '08811a084af3760283a2b4e6af588214', 0, 1);
INSERT INTO `sys_file` VALUES (122, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 0, 1);
INSERT INTO `sys_file` VALUES (123, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 0, 1);
INSERT INTO `sys_file` VALUES (124, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (125, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 0, 1);
INSERT INTO `sys_file` VALUES (126, 'garage.png', 'png', 36, 'http://localhost:9090/file/cde1eb1e4b78471abc40e7fc4fbe5765.png', 'f878d091de39314b4226a3119bfe62d7', 0, 1);
INSERT INTO `sys_file` VALUES (127, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 0, 1);
INSERT INTO `sys_file` VALUES (128, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 0, 1);
INSERT INTO `sys_file` VALUES (129, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (130, 'island.png', 'png', 69, 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png', '931b1b993641d4dfabf9e3735c165a6c', 0, 1);
INSERT INTO `sys_file` VALUES (131, 'family.png', 'png', 35, 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png', '1c7680309f06b06b270b8a8092bae8df', 0, 1);
INSERT INTO `sys_file` VALUES (132, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (133, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (134, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (135, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (136, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (137, '37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'ico', 178, 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'a41a57f7e5fe670aa2e18d622cb52de0', 0, 1);
INSERT INTO `sys_file` VALUES (138, 'route.png', 'png', 42, 'http://localhost:9090/file/18e9d523c87946d9ad6bd4ae8c23490a.png', 'e268b60540f842c409c6ba65134303ab', 0, 1);
INSERT INTO `sys_file` VALUES (139, 'scenic.png', 'png', 31, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '2ceb8d6b60da413fc244b6bd04a6752d', 0, 1);
INSERT INTO `sys_file` VALUES (140, 'travel-bag.png', 'png', 18, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '23a954f6c63e71cfcb3308de382a823a', 0, 1);
INSERT INTO `sys_file` VALUES (141, '商家店铺.png', 'png', 11, 'http://localhost:9090/file/c82f4f8b2eba43db8452252ad44dbdda.png', '9b7940d8fc7e9a320f8666f15fc4f937', 0, 1);
INSERT INTO `sys_file` VALUES (142, 'acne.png', 'png', 25, 'http://localhost:9090/file/3128509934f6477dacbdddfe8a2c2abf.png', '5bbf8e587d325d719d4586567fb1013d', 0, 1);
INSERT INTO `sys_file` VALUES (143, 'four-spot-skimmer-dragonfly.png', 'png', 22, 'http://localhost:9090/file/9524fa2508fe45a3b3c8a84d680d4385.png', 'c909dfddd9873700a817df2b49f7476e', 0, 1);
INSERT INTO `sys_file` VALUES (144, 'pin.png', 'png', 26, 'http://localhost:9090/file/088b1ad8b5df49889da9812008df9ada.png', 'a8715c90ae74882e75e90538be3a1175', 0, 1);
INSERT INTO `sys_file` VALUES (145, 'spotted-cat.png', 'png', 42, 'http://localhost:9090/file/34f09b0e815b4eeebe9951ddc78a8318.png', 'ec0995446eeb504d9aa060852b2a8ac2', 0, 1);
INSERT INTO `sys_file` VALUES (146, 'parking (1).png', 'png', 15, 'http://localhost:9090/file/a57c13dd194f4e0481dce2cd08e3ee1a.png', 'f82bc470ba7dbea5490c1fc225d9be05', 0, 1);
INSERT INTO `sys_file` VALUES (147, 'parking.png', 'png', 10, 'http://localhost:9090/file/f830a4dd003f4792b4744fed8c0e9310.png', 'ee35a120a7723653b50b86cb68f8cd4a', 0, 1);
INSERT INTO `sys_file` VALUES (148, 'pin (1).png', 'png', 30, 'http://localhost:9090/file/ac2ef07ff69e4376bfac4f4c5d66d81e.png', '48fab4b43a0fe2766cc8648b520359d0', 0, 1);
INSERT INTO `sys_file` VALUES (149, 'surf.png', 'png', 29, 'http://localhost:9090/file/9fb76cb57d214f998e4c396bafc35698.png', '77e963f965035fdb055d05c0e26f18a5', 0, 1);
INSERT INTO `sys_file` VALUES (150, 'cashier.png', 'png', 18, 'http://localhost:9090/file/53f4f7a54c92496799bf7e60ca78c32c.png', 'cb4879af405425bf6e2a795ccffb0aaa', 0, 1);
INSERT INTO `sys_file` VALUES (151, 'online-shop (1).png', 'png', 23, 'http://localhost:9090/file/04165f278791442cbe97750edfff2ee9.png', 'd157c5da54a6b03c7f52b8d0ae7d3201', 0, 1);
INSERT INTO `sys_file` VALUES (152, 'carrots.png', 'png', 78, 'http://localhost:9090/file/496e91c2f53b474da424e81a547dbc5c.png', '898ad727ffc0706e04473f1c34b9b690', 0, 1);
INSERT INTO `sys_file` VALUES (153, 'dog-house.png', 'png', 78, 'http://localhost:9090/file/3b8b316b5b3744f686ece5cebc8c4789.png', 'f943d209dccbf47fbe9f2dd486552d79', 0, 1);
INSERT INTO `sys_file` VALUES (154, 'farmer.png', 'png', 56, 'http://localhost:9090/file/c7a16a7fe0204b07bcab0c4b90c09b52.png', '1b9c824a71c56d18be33278ec19510d3', 0, 1);
INSERT INTO `sys_file` VALUES (155, 'pig.png', 'png', 61, 'http://localhost:9090/file/14f0fb412dc94b69b6d92958145628a6.png', '906fb5ddea77c044e8478fe778a01531', 0, 1);
INSERT INTO `sys_file` VALUES (156, 'fence.png', 'png', 85, 'http://localhost:9090/file/578c25662e1d444a8953a6ba4b659856.png', '4b8ee0b8b636107f529f7db3a6773b6d', 0, 1);
INSERT INTO `sys_file` VALUES (157, 'trees.png', 'png', 97, 'http://localhost:9090/file/e42c0e332c134f589098e6fb4117966c.png', '08fceddc90f040307a5f4b78ca98abf3', 0, 1);
INSERT INTO `sys_file` VALUES (158, 'sunlight.png', 'png', 54, 'http://localhost:9090/file/02903b04dca34d3890aeb147242754c8.png', '4558b526c29b497eb27d7d0d9419ec75', 0, 1);
INSERT INTO `sys_file` VALUES (159, 'wheelbarrow.png', 'png', 53, 'http://localhost:9090/file/2d73cbe71c0a4e65b1e60bad62587b6c.png', 'd751f8955fb7269fa52ec08820676668', 0, 1);
INSERT INTO `sys_file` VALUES (160, 'shopping-list.png', 'png', 13, 'http://localhost:9090/file/86093885ed1e409b8fe990a505288508.png', 'fc97ff8b2e45a099553453570d52ba5a', 0, 1);
INSERT INTO `sys_file` VALUES (161, 'spot-lights.png', 'png', 30, 'http://localhost:9090/file/c4ba72ccbe8247e491b69078556783d6.png', '59fb6e0582610d3a866066f1d85fee94', 0, 1);
INSERT INTO `sys_file` VALUES (162, 'four-spot-skimmer-dragonfly.png', 'png', 22, 'http://localhost:9090/file/9524fa2508fe45a3b3c8a84d680d4385.png', 'c909dfddd9873700a817df2b49f7476e', 0, 1);
INSERT INTO `sys_file` VALUES (163, 'pin (1).png', 'png', 30, 'http://localhost:9090/file/ac2ef07ff69e4376bfac4f4c5d66d81e.png', '48fab4b43a0fe2766cc8648b520359d0', 0, 1);
INSERT INTO `sys_file` VALUES (164, 'surf.png', 'png', 29, 'http://localhost:9090/file/9fb76cb57d214f998e4c396bafc35698.png', '77e963f965035fdb055d05c0e26f18a5', 0, 1);
INSERT INTO `sys_file` VALUES (165, 'parking (1).png', 'png', 15, 'http://localhost:9090/file/a57c13dd194f4e0481dce2cd08e3ee1a.png', 'f82bc470ba7dbea5490c1fc225d9be05', 0, 1);
INSERT INTO `sys_file` VALUES (166, 'pin (1).png', 'png', 30, 'http://localhost:9090/file/ac2ef07ff69e4376bfac4f4c5d66d81e.png', '48fab4b43a0fe2766cc8648b520359d0', 0, 1);
INSERT INTO `sys_file` VALUES (167, 'tower-bridge.png', 'png', 21, 'http://localhost:9090/file/d04522b05fbe4a4cace8646e6d3a1071.png', 'b31022171a5e7cc76e2dd0236cd57414', 0, 1);
INSERT INTO `sys_file` VALUES (168, 'police-dog.png', 'png', 40, 'http://localhost:9090/file/a84d462418354c3da109e39d3f76d3fc.png', '9a86c8ca076fe75fac1bbd19976b1ca8', 0, 1);
INSERT INTO `sys_file` VALUES (169, 'police-dog.png', 'png', 40, 'http://localhost:9090/file/a84d462418354c3da109e39d3f76d3fc.png', '9a86c8ca076fe75fac1bbd19976b1ca8', 0, 1);
INSERT INTO `sys_file` VALUES (170, 'image1.jpg', 'jpg', 9, 'http://localhost:9090/file/2e2a1c276a6e4978a3a4ecea5c250192.jpg', '50570deb18f9e1008c7fe3cb282a6060', 0, 1);
INSERT INTO `sys_file` VALUES (171, 'image7.jpg', 'jpg', 9, 'http://localhost:9090/file/7d9066d6738d4f7588eb9ce5880ba929.jpg', 'c43cb9a90f26eb31355f88a02c56e40e', 0, 1);
INSERT INTO `sys_file` VALUES (172, 'images1.jpg', 'jpg', 3, 'http://localhost:9090/file/221de99f04ba43c1aab6f7056d9b92a5.jpg', '4dbdf60417623dfa3d8dc97eae902480', 0, 1);
INSERT INTO `sys_file` VALUES (173, 'image6.jpg', 'jpg', 9, 'http://localhost:9090/file/2fab3210bb134d2b86b663c4064f65ff.jpg', '14f08cfd3f11b549808b5a52bb17824b', 0, 1);
INSERT INTO `sys_file` VALUES (174, 'image7.jpg', 'jpg', 9, 'http://localhost:9090/file/7d9066d6738d4f7588eb9ce5880ba929.jpg', 'c43cb9a90f26eb31355f88a02c56e40e', 0, 1);
INSERT INTO `sys_file` VALUES (175, 'images1.jpg', 'jpg', 3, 'http://localhost:9090/file/221de99f04ba43c1aab6f7056d9b92a5.jpg', '4dbdf60417623dfa3d8dc97eae902480', 0, 1);
INSERT INTO `sys_file` VALUES (176, 'image6.jpg', 'jpg', 9, 'http://localhost:9090/file/2fab3210bb134d2b86b663c4064f65ff.jpg', '14f08cfd3f11b549808b5a52bb17824b', 0, 1);
INSERT INTO `sys_file` VALUES (177, 'image7.jpg', 'jpg', 9, 'http://localhost:9090/file/7d9066d6738d4f7588eb9ce5880ba929.jpg', 'c43cb9a90f26eb31355f88a02c56e40e', 0, 1);
INSERT INTO `sys_file` VALUES (178, 'image3.jpg', 'jpg', 7, 'http://localhost:9090/file/e680e1cb86204b959b7fcf26dbff0d46.jpg', 'ca6fe37f103f2d18e9b2f5ee528f3d1b', 0, 1);
INSERT INTO `sys_file` VALUES (179, 'image4.jpg', 'jpg', 9, 'http://localhost:9090/file/bd94615b18d74d48b32b665d4708c560.jpg', '5f2d80dc1ed0e1cafa4a178cb24f7a6c', 0, 1);

-- ----------------------------
-- Table structure for sys_scenic_spot
-- ----------------------------
DROP TABLE IF EXISTS `sys_scenic_spot`;
CREATE TABLE `sys_scenic_spot`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '景点id',
  `touristname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '景点名',
  `lng` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地点坐标：经度',
  `lat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地点坐标：维度',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标url',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标url',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createtime` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_scenic_spot
-- ----------------------------
INSERT INTO `sys_scenic_spot` VALUES (0000000001, '欢乐吧', '113.054287', '28.237381', 'http://localhost:9090/file/e0bddea4f1e546b7a6baec369f351787.png', 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '中元集团欢迎您', '2023-04-30 18:08:44');
INSERT INTO `sys_scenic_spot` VALUES (0000000002, '约会吧', '113.053429', '28.238109', 'https://cdn-icons-png.flaticon.com/128/3113/3113438.png', 'http://localhost:9090/file/54f9fa952c4c4e50a32377b4fbcfd89f.jpg', '一起来约会', '2023-04-30 18:10:10');
INSERT INTO `sys_scenic_spot` VALUES (0000000003, '动物园', '113.053611', '28.239357', 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico', 'http://localhost:9090/file/221de99f04ba43c1aab6f7056d9b92a5.jpg', '一起来看哲地兽', '2023-04-30 18:12:07');
INSERT INTO `sys_scenic_spot` VALUES (0000000018, '黄土坡', '113.052093', '28.237934', 'http://localhost:9090/file/3128509934f6477dacbdddfe8a2c2abf.png', NULL, '欢迎大家来游玩', '2023-05-24 14:13:24');
INSERT INTO `sys_scenic_spot` VALUES (0000000019, '黄龙家园', '113.052833', '28.240061', 'http://localhost:9090/file/9524fa2508fe45a3b3c8a84d680d4385.png', NULL, '这里很好玩', '2023-05-24 14:14:22');
INSERT INTO `sys_scenic_spot` VALUES (0000000020, '摄影馆', '113.054861', '28.240553', 'http://localhost:9090/file/088b1ad8b5df49889da9812008df9ada.png', NULL, '摄像师很帅', '2023-05-24 14:15:18');
INSERT INTO `sys_scenic_spot` VALUES (0000000021, '猫咪馆', '113.056363', '28.240193', 'http://localhost:9090/file/34f09b0e815b4eeebe9951ddc78a8318.png', NULL, '喵喵喵喵，这里真好玩啊，还想再来', '2023-05-24 14:18:01');
INSERT INTO `sys_scenic_spot` VALUES (0000000022, '车辆博物馆', '113.058262 ', '28.239154', 'http://localhost:9090/file/a57c13dd194f4e0481dce2cd08e3ee1a.png', NULL, '这里真好玩呀，我还想再来！！', '2023-05-24 14:19:14');
INSERT INTO `sys_scenic_spot` VALUES (0000000023, '情人坡', '113.057264', '28.237783', 'http://localhost:9090/file/f830a4dd003f4792b4744fed8c0e9310.png', NULL, '这里为你提供最佳的约会地点，欢迎大家来游玩', '2023-05-24 14:20:43');
INSERT INTO `sys_scenic_spot` VALUES (0000000024, '爬山体验馆', '113.058208', '28.236583', 'http://localhost:9090/file/ac2ef07ff69e4376bfac4f4c5d66d81e.png', NULL, '这里真好玩，这里真棒棒哒', '2023-05-24 14:21:58');
INSERT INTO `sys_scenic_spot` VALUES (0000000025, '珠穆朗玛小山', '113.055612', '28.239192', 'http://localhost:9090/file/9fb76cb57d214f998e4c396bafc35698.png', NULL, '这里真好玩，我还想再次来游玩', '2023-05-24 14:23:53');
INSERT INTO `sys_scenic_spot` VALUES (0000000026, '智慧小超市', '113.055419', '28.238256', 'http://localhost:9090/file/53f4f7a54c92496799bf7e60ca78c32c.png', NULL, '智慧小超市，欢迎您', '2023-05-24 14:39:26');
INSERT INTO `sys_scenic_spot` VALUES (0000000027, '迷你蛋糕馆', '113.056062', '28.236398', 'http://localhost:9090/file/04165f278791442cbe97750edfff2ee9.png', NULL, '这里的蛋糕真好吃，快来尝尝啊', '2023-05-24 14:41:02');
INSERT INTO `sys_scenic_spot` VALUES (0000000028, '萝卜馆', '113.055301', '28.237911', 'http://localhost:9090/file/496e91c2f53b474da424e81a547dbc5c.png', NULL, '这里的萝卜真好吃啊！！！', '2023-05-24 14:57:40');
INSERT INTO `sys_scenic_spot` VALUES (0000000029, '宠物馆', '113.055226', '28.237438', 'http://localhost:9090/file/3b8b316b5b3744f686ece5cebc8c4789.png', NULL, '小狗真的很乖啊！！受不了了', '2023-05-24 14:58:50');
INSERT INTO `sys_scenic_spot` VALUES (0000000030, '农耕体验馆', '113.055708', '28.237155', 'http://localhost:9090/file/c7a16a7fe0204b07bcab0c4b90c09b52.png', NULL, '这里好好玩啊！！', '2023-05-24 14:59:57');
INSERT INTO `sys_scenic_spot` VALUES (0000000031, '小猪佩奇', '113.056459', '28.236342', 'http://localhost:9090/file/14f0fb412dc94b69b6d92958145628a6.png', NULL, '猪猪好乖啊', '2023-05-24 15:00:45');
INSERT INTO `sys_scenic_spot` VALUES (0000000032, '木头馆', '113.056374', '28.235671', 'http://localhost:9090/file/578c25662e1d444a8953a6ba4b659856.png', NULL, '这里真好玩啊啊啊啊', '2023-05-24 15:01:23');
INSERT INTO `sys_scenic_spot` VALUES (0000000033, '果林', '113.056427', '28.235586', 'http://localhost:9090/file/e42c0e332c134f589098e6fb4117966c.png', NULL, '这里的果子真好吃啊啊', '2023-05-24 15:02:34');
INSERT INTO `sys_scenic_spot` VALUES (0000000034, '小苗馆', '113.057243', '28.235929', 'http://localhost:9090/file/02903b04dca34d3890aeb147242754c8.png', NULL, '这里真好玩', '2023-05-24 15:03:28');
INSERT INTO `sys_scenic_spot` VALUES (0000000035, '玩泥巴咯', '113.057607', '28.235778', 'http://localhost:9090/file/2d73cbe71c0a4e65b1e60bad62587b6c.png', NULL, '这里的泥巴真好玩', '2023-05-24 15:04:23');
INSERT INTO `sys_scenic_spot` VALUES (0000000038, '智慧景区导航厅', '113.05477', '28.234865', 'http://localhost:9090/file/d04522b05fbe4a4cace8646e6d3a1071.png', 'http://localhost:9090/file/a84d462418354c3da109e39d3f76d3fc.png', '管理总厅', '2023-05-24 20:24:54');
INSERT INTO `sys_scenic_spot` VALUES (0000000039, '思维创新馆', '113.056942', '28.23505', 'http://localhost:9090/file/c4ba72ccbe8247e491b69078556783d6.png', 'http://localhost:9090/file/2e2a1c276a6e4978a3a4ecea5c250192.jpg', '家人们，快来体验啊，这里真好玩', '2023-05-25 09:15:37');
INSERT INTO `sys_scenic_spot` VALUES (0000000046, '购物吧', '113.057253', '28.235376', 'http://localhost:9090/file/86093885ed1e409b8fe990a505288508.png', 'http://localhost:9090/file/7d9066d6738d4f7588eb9ce5880ba929.jpg', '这里的购物吧是很优惠啊，家人们', '2023-05-25 09:18:55');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createtime` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avata_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'wengquan', 'wengquan', '智慧景区总体设计负责人', '12345613@qq.com', '133199584102', 'ChinA', '2023-05-18 22:52:47', NULL);
INSERT INTO `sys_user` VALUES (3, 'sun', NULL, '孙悟空', '235qq.com', NULL, NULL, '2023-03-25 19:34:55', NULL);
INSERT INTO `sys_user` VALUES (4, 'bbb', NULL, NULL, NULL, NULL, NULL, '2023-02-01 09:53:03', NULL);
INSERT INTO `sys_user` VALUES (5, 'ccc', NULL, NULL, NULL, NULL, NULL, '2023-03-26 09:53:16', NULL);
INSERT INTO `sys_user` VALUES (6, 'ddd', NULL, NULL, NULL, NULL, NULL, '2023-03-26 09:53:23', NULL);
INSERT INTO `sys_user` VALUES (7, 'eee', '123', '哲帝兽', '456@qq.com', '15111025211', '北京', '2023-03-26 09:53:31', 'http://localhost:9090/file/de62114e29e840f3b4bd70c38dce0ec8.jpg');
INSERT INTO `sys_user` VALUES (9, '帝龙兽', NULL, NULL, NULL, NULL, NULL, '2023-03-27 12:01:35', 'www.aaa.com');
INSERT INTO `sys_user` VALUES (15, 'dl', '123', '1哲帝兽bb', '231', '11231', '111', '2023-03-30 22:00:17', 'www.aaa.com');
INSERT INTO `sys_user` VALUES (19, '哲北兽', '123', '123', '456', '13222', '13', '2023-08-01 22:41:36', '13');
INSERT INTO `sys_user` VALUES (20, '哲北兽', '123', '123', '456', '13222', '13', '2023-03-30 22:43:16', '13');
INSERT INTO `sys_user` VALUES (21, '哲王兽', '123', '123', '456', '13222', '13', '2023-09-01 22:43:53', '13');
INSERT INTO `sys_user` VALUES (24, '哲东兽', '123', '123', '456', '13222', '13', '2023-11-01 22:48:56', '13');
INSERT INTO `sys_user` VALUES (25, 'admin', 'admin', '北龙兽', 'qweqw', '151110102301', 'wqeqwe', '2023-03-31 13:09:33', 'http://localhost:9090/file/0d75d1b301a946f588a9a59685fbc9c3.png');
INSERT INTO `sys_user` VALUES (26, 'aaa', 'aaa', NULL, NULL, NULL, NULL, '2023-04-01 15:14:37', NULL);
INSERT INTO `sys_user` VALUES (28, 'd', 'aa', 'aa', NULL, NULL, NULL, '2023-12-01 17:12:36', NULL);
INSERT INTO `sys_user` VALUES (34, NULL, NULL, '天北兽', NULL, NULL, NULL, '2023-05-04 16:41:06', NULL);
INSERT INTO `sys_user` VALUES (35, NULL, NULL, '问请问', '', '阿松大', '大四', '2023-05-04 16:42:51', 'http://localhost:9090/file/5c11259c90fe4f3eb7a0f25ac97b786d.png');
INSERT INTO `sys_user` VALUES (37, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-04 21:18:12', 'http://localhost:9090/file/37bad8531c8145d4a8f2ca43ab0eaf35.ico');
INSERT INTO `sys_user` VALUES (41, 'admin1', '123456', '天地龙王兽', 'wengquaa', '1511102010', 'none', '2023-05-04 21:32:48', 'http://localhost:9090/file/279aab422ca747d8a78960654108b061.png');
INSERT INTO `sys_user` VALUES (42, 'wq123456', '123456', '测试一号', '123456@qq.com', '1511102821241', '湖南省长沙市', '2023-05-24 19:13:36', 'http://localhost:9090/file/9524fa2508fe45a3b3c8a84d680d4385.png');
INSERT INTO `sys_user` VALUES (43, 'wq456789', '123456', '测试二号', NULL, NULL, NULL, '2023-05-24 19:28:13', 'http://localhost:9090/file/a84d462418354c3da109e39d3f76d3fc.png');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论内容',
  `user_id` int(0) DEFAULT NULL COMMENT '评论人id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int(0) DEFAULT NULL COMMENT '父id',
  `origin_id` int(0) DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int(0) DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (37, '你好', 25, '2023-05-17 21:33:22', NULL, NULL, 5);
INSERT INTO `t_comment` VALUES (38, '你好', 25, '2023-05-17 21:33:27', NULL, NULL, 5);
INSERT INTO `t_comment` VALUES (39, '你好总设计人员', 25, '2023-05-19 21:50:16', NULL, NULL, 5);
INSERT INTO `t_comment` VALUES (40, '你好吗？？', 25, '2023-05-19 21:50:36', 39, 39, 5);
INSERT INTO `t_comment` VALUES (41, '这里真的很好玩吗？', 42, '2023-05-24 19:23:42', NULL, NULL, 22);
INSERT INTO `t_comment` VALUES (42, '这里真的很好玩信我的', 43, '2023-05-24 20:36:00', 41, 41, 22);
INSERT INTO `t_comment` VALUES (44, '智慧景区，真的很好玩', 43, '2023-05-24 20:36:22', NULL, NULL, 22);

-- ----------------------------
-- Table structure for t_show
-- ----------------------------
DROP TABLE IF EXISTS `t_show`;
CREATE TABLE `t_show`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '节目id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节目名称',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节目内容',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节目地点',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节目图片',
  `begain_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '节目开始时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_show
-- ----------------------------
INSERT INTO `t_show` VALUES (4, '中元撒大苏打撒', '王中元，李忠霸，到底是中元还是中霸.王中元，李忠霸，到底是中元还是中霸.王中元，李忠霸，到底是中元还是中霸', NULL, 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '2023 年 5 月 17 日 0 点 0 分');
INSERT INTO `t_show` VALUES (5, '欢乐演唱会', '这里真好玩6666', '欢乐酒吧', 'http://localhost:9090/file/bd94615b18d74d48b32b665d4708c560.jpg', '2023年5月');
INSERT INTO `t_show` VALUES (6, '111wqeqeq', '11', 'wqeqwe', 'http://localhost:9090/file/c7943b802c3d4233adf4b2c86b9494bc.png', '11');
INSERT INTO `t_show` VALUES (7, '1111111111', '111111111', NULL, 'http://localhost:9090/file/5f539b32daf743ed88cdd3a16a09d826.png', '11111111111111');
INSERT INTO `t_show` VALUES (8, '演唱会', '这里有明星来，这里真的很好玩', '小猪吧', 'http://localhost:9090/file/e680e1cb86204b959b7fcf26dbff0d46.jpg', '2023年5月23日');

-- ----------------------------
-- Table structure for t_show_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_show_comment`;
CREATE TABLE `t_show_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论内容',
  `user_id` int(0) DEFAULT NULL COMMENT '评论人id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int(0) DEFAULT NULL COMMENT '父id',
  `origin_id` int(0) DEFAULT NULL COMMENT '最上级评论id',
  `show_id` int(0) DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_show_comment
-- ----------------------------
INSERT INTO `t_show_comment` VALUES (1, '中元书店真好玩', 1, NULL, NULL, NULL, 4);
INSERT INTO `t_show_comment` VALUES (40, NULL, 25, '2023-05-19 21:17:50', NULL, NULL, NULL);
INSERT INTO `t_show_comment` VALUES (42, '你好啊', 25, '2023-05-19 22:47:08', NULL, NULL, NULL);
INSERT INTO `t_show_comment` VALUES (44, '6666', 25, '2023-05-19 23:09:32', NULL, NULL, 4);
INSERT INTO `t_show_comment` VALUES (45, '你好啊，北方的龙帝兽\n', 25, '2023-05-19 23:09:56', 44, 44, 4);
INSERT INTO `t_show_comment` VALUES (46, '中元书店老板到此一游', 25, '2023-05-19 23:10:20', 1, 1, 4);

SET FOREIGN_KEY_CHECKS = 1;

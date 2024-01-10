/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : product

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 07/01/2024 23:57:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commentTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 'iphone12', '成', '2021-01-10 15:22:16', '真快啊！');
INSERT INTO `comments` VALUES (2, '华为手环', '金', '2021-01-10 15:36:29', '真不错！');
INSERT INTO `comments` VALUES (4, '华为手环', '金', '2021-01-10 22:00:11', '可以测心率，血氧饱和度，很方便！！！');
INSERT INTO `comments` VALUES (5, '荷兰乳牛奶粉', '金', '2021-01-11 11:12:55', '奶味很浓，好喝');
INSERT INTO `comments` VALUES (6, 'Ipad Air3', 'jin', '2021-01-11 11:16:59', '玩游戏很流畅，看视频很舒服');
INSERT INTO `comments` VALUES (7, '荷兰乳牛奶粉', 'jin', '2021-01-11 11:17:44', '每天一杯真不错');
INSERT INTO `comments` VALUES (8, 'iphone12', 'jin', '2021-01-11 11:19:04', '流畅，比iphone11好用');
INSERT INTO `comments` VALUES (10, 'iphone12', '金', '2021-01-11 20:38:19', '刚买的手机，感觉很不错，体验极佳！');
INSERT INTO `comments` VALUES (12, 'iphone12', '金', '2021-02-09 20:13:06', '看见好看好看好看就');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `mid` int(0) NOT NULL,
  `mpassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mtel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, '1', '1234567890');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(0) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `orderTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `feedback` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (5, 'jin', '235', 'Ipad Air3', '2', '2021-01-07 14:58:09', '已发货', '已确认收货');
INSERT INTO `orders` VALUES (14, '金', '238', '荷兰乳牛奶粉', '2', '2021-01-09 17:49:35', '已发货', '已确认收货');
INSERT INTO `orders` VALUES (1016, 'jin', '238', '荷兰乳牛奶粉', '2', '2021-01-11 11:15:27', '已发货', '已确认收货');
INSERT INTO `orders` VALUES (1019, '金', '101', 'iphone12', '1', '2021-01-11 20:34:23', '已发货', '已确认收货');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(0) NOT NULL,
  `pname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stock` smallint(0) NULL DEFAULT NULL,
  `price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `picture` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (101, 'iphone12', '数码电子', 1000, '6999', 'statics/front/images/1.png');
INSERT INTO `products` VALUES (102, '华为手环', '数码电子', 111, '399', 'statics/front/images/手环.png');
INSERT INTO `products` VALUES (103, 'airpods蓝牙耳机', '数码电子', 1010, '588', 'statics/front/images/4.png');
INSERT INTO `products` VALUES (106, '三只松鼠芒果干', '食品', 79, '21.9', 'statics/front/images/芒果干.png');
INSERT INTO `products` VALUES (110, '三只松鼠蛋黄酥', '食品', 99, '20.5', 'statics/front/images/蛋黄酥.png');
INSERT INTO `products` VALUES (222, '充电宝', '数码电子', 221, '108', 'statics/front/images/充电宝.png');
INSERT INTO `products` VALUES (235, 'Ipad Air3', '数码电子', 199, '3500', 'statics/front/images/2.png');
INSERT INTO `products` VALUES (238, '荷兰乳牛奶粉', '食品', 99, '59.9', 'statics/front/images/荷兰乳牛.png');
INSERT INTO `products` VALUES (260, '晨光无线装订本', '文具', 106, '3.8', 'statics/front/images/晨光笔记本.png');
INSERT INTO `products` VALUES (325, '百草味麻薯', '食品', 291, '22', 'statics/front/images/麻薯.png');
INSERT INTO `products` VALUES (888, '黑色中性笔', '文具', 320, '10.5', 'statics/front/images/黑笔.png');
INSERT INTO `products` VALUES (988, '洁柔抽纸', '生活用品', 655, '56', 'statics/front/images/洁柔.png');
INSERT INTO `products` VALUES (1028, '学生背包', '生活用品', 22, '111', 'statics/front/images/背包.png');
INSERT INTO `products` VALUES (7567, '蓝月亮洗衣液6斤装', '生活用品', 56, '78', 'statics/front/images/蓝月亮.png');
INSERT INTO `products` VALUES (8900, '周黑鸭鸭脖', '食品', 99, '22.9', 'statics/front/images/周黑鸭.png');

-- ----------------------------
-- Table structure for sysdiagrams
-- ----------------------------
DROP TABLE IF EXISTS `sysdiagrams`;
CREATE TABLE `sysdiagrams`  (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `principal_id` int(0) NOT NULL,
  `diagram_id` int(0) NOT NULL AUTO_INCREMENT,
  `version` int(0) NULL DEFAULT NULL,
  `definition` longblob NULL,
  PRIMARY KEY (`diagram_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `upassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `utel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `valid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '启用',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('jin', 2, '1', '123456', '广州天河区迎龙路', '启用');
INSERT INTO `users` VALUES ('金', 9, '111', '123456789', '广东省广州市天河区迎龙路161号', '启用');
INSERT INTO `users` VALUES ('成', 10, '1', '11212323', '奥斯卡的海口市', '启用');

SET FOREIGN_KEY_CHECKS = 1;

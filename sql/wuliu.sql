/*
 Navicat Premium Data Transfer

 Source Server         : nativeMySQL
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 192.168.179.132:3306
 Source Schema         : wuliu

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 07/04/2022 10:47:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentId` int NOT NULL,
  `level` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'level  0表示省  ，1表示市' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (26, '山西', -1, '省');
INSERT INTO `area` VALUES (27, '运城', 26, '市');
INSERT INTO `area` VALUES (28, '大同', 26, '市');
INSERT INTO `area` VALUES (29, '甘肃', -1, '省');
INSERT INTO `area` VALUES (30, '银川', 29, '市');
INSERT INTO `area` VALUES (31, '山东', -1, '省');
INSERT INTO `area` VALUES (32, '青岛', 31, '市');
INSERT INTO `area` VALUES (33, '济南', 31, '市');
INSERT INTO `area` VALUES (34, '烟台', 31, '市');
INSERT INTO `area` VALUES (35, '辽宁', -1, '省');
INSERT INTO `area` VALUES (36, '本溪', 35, '市');
INSERT INTO `area` VALUES (37, '河北', -1, '省');
INSERT INTO `area` VALUES (38, '唐山', 37, '市');
INSERT INTO `area` VALUES (39, '海南', -1, '省');
INSERT INTO `area` VALUES (40, '海口', 39, '市');

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cid` int NULL DEFAULT NULL,
  `bankname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `banknumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_2`(`Cid`) USING BTREE,
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`Cid`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES (2, 2, '工商银行', '14252545255454');
INSERT INTO `bank` VALUES (5, 2, '12', '12');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cid` int NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_4`(`Cid`) USING BTREE,
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`Cid`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (4, 3, '全日制教育');
INSERT INTO `business` VALUES (27, 2, '121212');
INSERT INTO `business` VALUES (28, 2, '121212');
INSERT INTO `business` VALUES (29, 2, '121212');
INSERT INTO `business` VALUES (30, 2, 'as');

-- ----------------------------
-- Table structure for cartype
-- ----------------------------
DROP TABLE IF EXISTS `cartype`;
CREATE TABLE `cartype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `car_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cartype
-- ----------------------------
INSERT INTO `cartype` VALUES (1, '解放', '座');
INSERT INTO `cartype` VALUES (2, '斯太尔', '吨');
INSERT INTO `cartype` VALUES (3, '威铃', '座');
INSERT INTO `cartype` VALUES (6, '江铃', '座');
INSERT INTO `cartype` VALUES (9, 'sfs', '座');
INSERT INTO `cartype` VALUES (10, '大卡车', '方');
INSERT INTO `cartype` VALUES (12, '测试1', '座');

-- ----------------------------
-- Table structure for comdocument
-- ----------------------------
DROP TABLE IF EXISTS `comdocument`;
CREATE TABLE `comdocument`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cid` int NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_3`(`Cid`) USING BTREE,
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`Cid`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comdocument
-- ----------------------------
INSERT INTO `comdocument` VALUES (8, 2, '网络文化经营许可证', '2154545455');
INSERT INTO `comdocument` VALUES (9, 2, '先进企业', '64646466');
INSERT INTO `comdocument` VALUES (10, 2, '企业法人营业执照', '213123123');
INSERT INTO `comdocument` VALUES (11, 2, '荣誉证书', '3423423434');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int NULL DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `corporation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `property` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_1`(`aid`) USING BTREE,
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`aid`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (2, 27, '华迪', '1245445', 'xxxx', 'IT公司，培训公司', '私企', 2, '2016-10-07 00:00:00');
INSERT INTO `company` VALUES (3, 27, '中北大学', '8454544', 'xxxx', '大学', '国企', 1, '2016-10-31 11:21:22');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int NULL DEFAULT NULL,
  `Cid` int NULL DEFAULT NULL,
  `truename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phonenumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcart` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `property` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_5`(`Cid`) USING BTREE,
  INDEX `FK_Relationship_6`(`aid`) USING BTREE,
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`Cid`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`aid`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, 40, 3, '李四', '24324', '女', '5484551', '私企', '1.jpg', 20);
INSERT INTO `emp` VALUES (2, 26, 2, '张三', '18435258658', '女', '14025545854545', '司机', '2.png', 20);
INSERT INTO `emp` VALUES (3, 26, 2, 'ew', '123123', '男', '123123123123', '213', '3.jpg', 32);
INSERT INTO `emp` VALUES (4, 40, NULL, 'aa', '213', '1', '12', 'ls', '20220103143443.jpg', 2);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NULL DEFAULT NULL,
  `goods_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Relationship_8`(`cid`) USING BTREE,
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`cid`) REFERENCES `cartype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 10, '石油', '1000');
INSERT INTO `goods` VALUES (2, 1, '烧焦类', '12');

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics`  (
  `l_id` int NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `to_Address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `way` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL,
  `money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kinds` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态种类',
  `l_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deliver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送员',
  `logisticsAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `done` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0未完成，1已完成',
  PRIMARY KEY (`l_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'logistics表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logistics
-- ----------------------------
INSERT INTO `logistics` VALUES (1, '重庆市,,黄花路', 'user', '15712435678', '北京市,黄桦路', 'admin', '15723345678', '服务点自寄', 2, '2.5', '1', '120220207171146131', NULL, '', '', '0');
INSERT INTO `logistics` VALUES (3, '河北省,,北路', '张三', '18012345678', '辽宁省,南路', '李四', '15712345678', '服务点自寄', 2, '0.0', '2', '120220217162757871', NULL, '王师傅1', NULL, '0');
INSERT INTO `logistics` VALUES (4, '辽宁省,,panmian', 'zhang1', '19012345678', '天津市,hedong', 'lihe', '15078786655', '服务点自寄', 2, '0.0', '1', '120220217165131716', NULL, NULL, NULL, '0');
INSERT INTO `logistics` VALUES (5, '天津市,,jinnan', '张2', '18012345678', '湖北省,武汉', '张2', '18023456789', '服务点自寄', 2, '0.0', '1', '120220217170352697', NULL, NULL, NULL, '0');
INSERT INTO `logistics` VALUES (7, '上海市,,huanpu', 'zhan3', '19012345678', '天津市,dongli', 'zhang3', '18677700043', '服务点自寄', 5, '0.0', '4', '120220217172525647', '自付', '王师傅1', NULL, '1');
INSERT INTO `logistics` VALUES (8, '上海市,,luwang', 'a', '18012345678', '北京市,dc', 'b', '15712435678', '服务点自寄', 5, '0.0', '1', '120220323152042201', '自付', NULL, NULL, '0');
INSERT INTO `logistics` VALUES (9, '上海市,,1', 'a', '12312341341', '山东省,1', 'b', '12414341243', '服务点自寄', 3, '3.0', '2', '120220323152147579', '1', 'admin', NULL, '0');
INSERT INTO `logistics` VALUES (10, '北京市,,1', '', '', '上海市,2', '', '', '服务点自寄', 1, '1.0', '1', '120220330111919955', '', NULL, NULL, '0');

-- ----------------------------
-- Table structure for logistics_log
-- ----------------------------
DROP TABLE IF EXISTS `logistics_log`;
CREATE TABLE `logistics_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `l_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logistics_log
-- ----------------------------
INSERT INTO `logistics_log` VALUES (56, '120220207171146132', '快递订单已被配送员:王师傅1扫件，正在火速配送，如有疑问，请联系：123456', NULL, '2022-01-01 14:07:52', NULL);
INSERT INTO `logistics_log` VALUES (57, '120220217172525647', '快递订单已被配送员:王师傅1扫件，正在火速配送，如有疑问，请联系：123456', NULL, '2022-01-01 15:10:10', NULL);
INSERT INTO `logistics_log` VALUES (58, '120220217172525647', '快递订单已到达上海配送员:王师傅1扫件，正在配送的路上，请耐心等待，如有疑问，请联系：123456', NULL, '2022-01-02 12:12:10', NULL);
INSERT INTO `logistics_log` VALUES (59, '120220217172525647', '快递订单已到达:上海市,,huanpu服务站，快递小哥：王师傅1扫件，正在火速派送，如有疑问，请联系：123456', NULL, '2022-01-02 17:13:15', NULL);
INSERT INTO `logistics_log` VALUES (60, '120220217172525647', '您的快递订单显示已被签收，操作人：王师傅1，如有疑问，请联系：123456', NULL, '2022-01-02 19:14:58', NULL);
INSERT INTO `logistics_log` VALUES (61, '120220217171613359', '快递订单已被配送员:admin扫件，正在火速配送，如有疑问，请联系：13366', NULL, '2022-03-07 15:32:50', NULL);
INSERT INTO `logistics_log` VALUES (62, '120220323152147579', '快递订单已被配送员:admin扫件，正在火速配送，如有疑问，请联系：13366', NULL, '2022-03-23 15:33:02', NULL);
INSERT INTO `logistics_log` VALUES (63, '120220217162757871', '快递订单已被配送员:王师傅1扫件，正在火速配送，如有疑问，请联系：123456', NULL, '2022-03-30 11:57:26', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mess` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (2, '张三', '123456789@qq.com', '18000000000', '虎虎生威，越来越好', '2022-01-01 15:31:05');
INSERT INTO `message` VALUES (11, 'admin', '123@qq.com', '12345', '虎虎生威', '2022-03-23 11:57:43');

-- ----------------------------
-- Table structure for order_price
-- ----------------------------
DROP TABLE IF EXISTS `order_price`;
CREATE TABLE `order_price`  (
  `op_id` int NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `op_weight` int NULL DEFAULT NULL,
  `op_kinds` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `op_price` double NULL DEFAULT NULL,
  PRIMARY KEY (`op_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'order_price表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_price
-- ----------------------------
INSERT INTO `order_price` VALUES (1, 1, NULL, 1);
INSERT INTO `order_price` VALUES (2, 2, NULL, 2);
INSERT INTO `order_price` VALUES (3, 3, NULL, 3);
INSERT INTO `order_price` VALUES (4, 4, NULL, 4);
INSERT INTO `order_price` VALUES (5, 5, NULL, 5);
INSERT INTO `order_price` VALUES (6, 6, NULL, 6);
INSERT INTO `order_price` VALUES (7, 7, NULL, 7);
INSERT INTO `order_price` VALUES (36, 8, NULL, 8);
INSERT INTO `order_price` VALUES (37, 9, NULL, 9);
INSERT INTO `order_price` VALUES (38, 10, NULL, 10);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `o_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_date` timestamp NULL DEFAULT NULL,
  `o_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_s_id` int NULL DEFAULT NULL,
  `o_price` double NULL DEFAULT NULL,
  `o_uId` int NULL DEFAULT NULL,
  `o_weight` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'orders表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (12, '120220217172525647', '2021-12-31 17:25:25', '1', NULL, 0, 1, NULL, NULL);
INSERT INTO `orders` VALUES (14, '120220323152147579', '2022-03-23 15:21:47', '1', NULL, 3, 1, NULL, NULL);
INSERT INTO `orders` VALUES (15, '120220330111919955', '2022-03-30 11:19:19', '1', NULL, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for page_address
-- ----------------------------
DROP TABLE IF EXISTS `page_address`;
CREATE TABLE `page_address`  (
  `id` int NOT NULL COMMENT 'id主键',
  `p_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `p_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `u_id` int NULL DEFAULT NULL COMMENT 'user的主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'page_address表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of page_address
-- ----------------------------

-- ----------------------------
-- Table structure for roleright
-- ----------------------------
DROP TABLE IF EXISTS `roleright`;
CREATE TABLE `roleright`  (
  `RRID` int NOT NULL AUTO_INCREMENT,
  `ROLEID` int NULL DEFAULT NULL,
  `FUNID` int NULL DEFAULT NULL,
  PRIMARY KEY (`RRID`) USING BTREE,
  INDEX `FK_Relationship_10`(`ROLEID`) USING BTREE,
  INDEX `FK_Relationship_9`(`FUNID`) USING BTREE,
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`ROLEID`) REFERENCES `sysrole` (`ROLEID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`FUNID`) REFERENCES `sysfunction` (`FUNID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roleright
-- ----------------------------
INSERT INTO `roleright` VALUES (156, 1, 1);
INSERT INTO `roleright` VALUES (157, 1, 4);
INSERT INTO `roleright` VALUES (158, 1, 5);
INSERT INTO `roleright` VALUES (159, 1, 32);
INSERT INTO `roleright` VALUES (160, 1, 15);
INSERT INTO `roleright` VALUES (161, 1, 19);
INSERT INTO `roleright` VALUES (162, 1, 20);
INSERT INTO `roleright` VALUES (163, 1, 21);
INSERT INTO `roleright` VALUES (164, 1, 30);
INSERT INTO `roleright` VALUES (165, 1, 31);
INSERT INTO `roleright` VALUES (166, 1, 33);
INSERT INTO `roleright` VALUES (167, 2, 1);
INSERT INTO `roleright` VALUES (168, 2, 37);
INSERT INTO `roleright` VALUES (169, 2, 15);
INSERT INTO `roleright` VALUES (170, 2, 19);
INSERT INTO `roleright` VALUES (171, 2, 20);
INSERT INTO `roleright` VALUES (172, 2, 21);
INSERT INTO `roleright` VALUES (173, 2, 30);
INSERT INTO `roleright` VALUES (174, 2, 31);
INSERT INTO `roleright` VALUES (175, 2, 33);
INSERT INTO `roleright` VALUES (176, 2, 38);
INSERT INTO `roleright` VALUES (177, 3, 1);
INSERT INTO `roleright` VALUES (178, 3, 37);
INSERT INTO `roleright` VALUES (179, 3, 20);
INSERT INTO `roleright` VALUES (180, 3, 21);
INSERT INTO `roleright` VALUES (181, 3, 30);
INSERT INTO `roleright` VALUES (182, 3, 31);
INSERT INTO `roleright` VALUES (183, 3, 33);
INSERT INTO `roleright` VALUES (184, 3, 38);

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site`  (
  `s_id` int NULL DEFAULT NULL COMMENT 'id主键',
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `s_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `s_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'site表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of site
-- ----------------------------

-- ----------------------------
-- Table structure for sysfunction
-- ----------------------------
DROP TABLE IF EXISTS `sysfunction`;
CREATE TABLE `sysfunction`  (
  `FUNID` int NOT NULL AUTO_INCREMENT,
  `FUNNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FUNURL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FUNPID` int NULL DEFAULT NULL,
  `FUNSTATE` int NULL DEFAULT NULL,
  PRIMARY KEY (`FUNID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sysfunction
-- ----------------------------
INSERT INTO `sysfunction` VALUES (1, '系统管理', NULL, -1, 1);
INSERT INTO `sysfunction` VALUES (2, '用户管理', 'user/listuser', 1, 0);
INSERT INTO `sysfunction` VALUES (3, '菜单管理', 'function/list', 1, 1);
INSERT INTO `sysfunction` VALUES (4, '职位管理', 'role/list', 1, 1);
INSERT INTO `sysfunction` VALUES (5, '基本信息', NULL, -1, 1);
INSERT INTO `sysfunction` VALUES (6, '地域管理', 'area/list', 5, 0);
INSERT INTO `sysfunction` VALUES (7, '公司管理', 'company/list', 5, 0);
INSERT INTO `sysfunction` VALUES (9, '员工管理', 'emp/list', 5, 0);
INSERT INTO `sysfunction` VALUES (15, '车辆管理', NULL, -1, 1);
INSERT INTO `sysfunction` VALUES (17, '车型', 'cartype/list', 15, 0);
INSERT INTO `sysfunction` VALUES (18, '货物基本信息', 'goods/list', 15, 0);
INSERT INTO `sysfunction` VALUES (19, '车辆信息查询', 'car/list', 15, 1);
INSERT INTO `sysfunction` VALUES (20, '留言管理', NULL, -1, 1);
INSERT INTO `sysfunction` VALUES (21, '客户留言', 'message/list', 20, 1);
INSERT INTO `sysfunction` VALUES (24, '配送点', NULL, -1, 0);
INSERT INTO `sysfunction` VALUES (25, '配送点列表', 'distributionSites/list', 24, 1);
INSERT INTO `sysfunction` VALUES (26, '查看配送范围', 'distributionSites/area', 24, 1);
INSERT INTO `sysfunction` VALUES (30, '订单', NULL, -1, 1);
INSERT INTO `sysfunction` VALUES (31, '订单信息', 'order/list', 30, 1);
INSERT INTO `sysfunction` VALUES (32, '员工管理', 'user/listuser', 5, 1);
INSERT INTO `sysfunction` VALUES (33, '物流信息', 'order/logistics', 30, 1);
INSERT INTO `sysfunction` VALUES (37, '个人设置', 'user/personalSetting', 1, 1);
INSERT INTO `sysfunction` VALUES (38, '已完成订单', 'order/doneLogistics', 30, 1);

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole`  (
  `ROLEID` int NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLESTATE` int NULL DEFAULT NULL,
  `ROLEDESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLEID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES (-1, '系统管理', 1, '拥有最大的权限');
INSERT INTO `sysrole` VALUES (1, '公司管理', 1, '普通管理员');
INSERT INTO `sysrole` VALUES (2, '站点管理', 0, '站点');
INSERT INTO `sysrole` VALUES (3, '司机', 1, '配送司机');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `USERID` int NOT NULL AUTO_INCREMENT,
  `ROLEID` int NULL DEFAULT NULL,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERPWD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERTRUENAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERSTATE` int NULL DEFAULT NULL,
  `USERPHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` int NULL DEFAULT NULL COMMENT '1男 0女',
  PRIMARY KEY (`USERID`) USING BTREE,
  INDEX `FK_Relationship_11`(`ROLEID`) USING BTREE,
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`ROLEID`) REFERENCES `sysrole` (`ROLEID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES (1, -1, 'admin', '123', 'admin', NULL, '2345', 0);
INSERT INTO `sysuser` VALUES (2, 1, 'manage', '123', '高管', 1, '000000', 1);
INSERT INTO `sysuser` VALUES (4, 3, 'siji', '123', '王师傅1', 1, '123456', 1);
INSERT INTO `sysuser` VALUES (8, 3, 'deliver', '123', '王司机', 1, '12345124', 0);
INSERT INTO `sysuser` VALUES (9, 3, 'zhangsan', '123', '张三', 1, '18012345678', 1);

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `adminId` int NOT NULL COMMENT '管理员id，主键',
  `adminName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `adminPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `adminAge` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员年龄',
  `adminCid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员身份证',
  `adminType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员类型',
  `adminPower` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员权限地点',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'name', '123456', 'age', 'idcard', '1', 'guanliyuan');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car`  (
  `carId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆编号',
  `buytime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时间',
  `manufacturer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `carType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `carOwner` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车主',
  `aLoadWeight` int NULL DEFAULT NULL COMMENT '已装重量',
  `loadWeight` int NULL DEFAULT NULL COMMENT '载重量',
  `nowStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态',
  PRIMARY KEY (`carId`) USING BTREE,
  INDEX `FK_Relationship_7`(`buytime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('桂A-0001', '2022-01-12', '比亚迪', '长4.2米×宽1.9米×高1.8米', '王师傅1', NULL, NULL, '1');
INSERT INTO `t_car` VALUES ('桂A-0002', '2021-12-16', '福建制造', '长4.2米×宽1.9米×高1.8米', '王司机', NULL, NULL, '0');
INSERT INTO `t_car` VALUES ('桂A-0003', '2022-01-12', '比亚迪', '长4.2米×宽1.9米×高1.8米', '张三', NULL, NULL, '1');
INSERT INTO `t_car` VALUES ('桂A-0004', '2022-01-12', '福建制造', '长4.2米×宽1.9米×高1.8米', '周文', NULL, NULL, '0');

-- ----------------------------
-- Table structure for t_delivery
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery`;
CREATE TABLE `t_delivery`  (
  `deliveryId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封单号,主键',
  `sendSite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收寄地',
  `distributionSite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送地',
  `carId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆编号',
  `employeeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编号',
  `goodsWeight` double NULL DEFAULT NULL COMMENT '物品重量',
  `goodsVolume` double NULL DEFAULT NULL COMMENT '物品体积',
  `receiveAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `status` int NULL DEFAULT NULL COMMENT '交接单状态：1交接中，2配送中，3已签收',
  PRIMARY KEY (`deliveryId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交接单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for t_distribution_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_distribution_scope`;
CREATE TABLE `t_distribution_scope`  (
  `distributionScopeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配送范围编号,主键',
  `distributionScopeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送范围名字',
  `firstWeight` double NULL DEFAULT NULL COMMENT '首公斤价格',
  `secondWeight` double NULL DEFAULT NULL COMMENT '次公斤价格',
  `distributionTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送时间',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `distributionSiteId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送点编号，外键',
  PRIMARY KEY (`distributionScopeId`) USING BTREE,
  INDEX `pk`(`distributionSiteId`) USING BTREE,
  CONSTRAINT `pk` FOREIGN KEY (`distributionSiteId`) REFERENCES `t_distribution_site` (`distributionSiteId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配送范围表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_distribution_scope
-- ----------------------------
INSERT INTO `t_distribution_scope` VALUES ('dd11', '玉林', 3, 4, NULL, NULL, 'd11');

-- ----------------------------
-- Table structure for t_distribution_site
-- ----------------------------
DROP TABLE IF EXISTS `t_distribution_site`;
CREATE TABLE `t_distribution_site`  (
  `distributionSiteId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配送点编号',
  `distributionSiteName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送点名称',
  `distributionSiteAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送点所在地址',
  `distributionSiteScale` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送点规模',
  `remark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`distributionSiteId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配送点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_distribution_site
-- ----------------------------
INSERT INTO `t_distribution_site` VALUES ('d11', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d12', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d13', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d14', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d15', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d16', 'tanzhou', 'tanzhoushiqu', 'fujian', 'free');
INSERT INTO `t_distribution_site` VALUES ('d33', 'xiamen', 'xiamen', 'kuashen', 'work');
INSERT INTO `t_distribution_site` VALUES ('d34', 'xiamen', 'xiamen', 'kuashen', 'work');
INSERT INTO `t_distribution_site` VALUES ('d99', 'longyan', 'longyanshi', 'fujian', 'free');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `employeeId` int NOT NULL COMMENT '员工编号，主键',
  `employeeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `employeeSex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工性别',
  `employeePhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工电话',
  `employeePost` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工职位',
  `employeeStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工状态：离职，配调中，未配调',
  PRIMARY KEY (`employeeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `orderId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号，主键',
  `sendSite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收寄地',
  `sendName` int NULL DEFAULT NULL COMMENT '寄件人姓名',
  `sendPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人电话',
  `sendAddress` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人地址',
  `distributionSite` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送地',
  `receiveName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receivePhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `receiveAddress` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `goodsName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品名称',
  `goodsWeight` double NULL DEFAULT NULL COMMENT '物品重量',
  `goodsVolume` double NULL DEFAULT NULL COMMENT '物品体积',
  `status` int NULL DEFAULT NULL COMMENT '订单状态：1已配送，2未配送，3退订',
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'user表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '123@qq.com', '12345', '1');
INSERT INTO `user` VALUES (2, 'user', '123', '123@qq.com', '12345', '1');
INSERT INTO `user` VALUES (3, 'admin1', 'Aadmin1*', '123@qq.com', '18022233333', '1');

SET FOREIGN_KEY_CHECKS = 1;

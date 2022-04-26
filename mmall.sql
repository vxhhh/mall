/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : mmall

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 26/04/2022 15:56:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` float NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`product_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (9, 1, 2, 200, 61, '2022-04-08 21:27:24', '2022-04-08 21:27:24');

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
INSERT INTO `m_blog` VALUES (1, 1, '生活就像海洋，只有意志坚强的人才能到达彼岸', '这里是摘要哈哈哈', '内容？？？', '2020-05-21 22:08:42', 0);
INSERT INTO `m_blog` VALUES (2, 1, '最值得学习的博客项目eblog', 'eblog是一个基于Springboot2.1.2开发的博客学习项目，为了让项目融合更多的知识点，达到学习目的，编写了详细的从0到1开发文档。主要学习包括：自定义Freemarker标签，使用shiro+redis完成了会话共享，redis的zset结构完成本周热议排行榜，t-io+websocket完成即时消息通知和群聊，rabbitmq+elasticsearch完成博客内容搜索引擎等。值得学习的地方很多！', '**推荐阅读：**\r\n\r\n[分享一套SpringBoot开发博客系统源码，以及完整开发文档！速度保存！](https://mp.weixin.qq.com/s/jz6e977xP-OyaAKNjNca8w)\r\n\r\n[Github上最值得学习的100个Java开源项目，涵盖各种技术栈！](https://mp.weixin.qq.com/s/N-U0TaEUXnBFfBsmt_OESQ)\r\n\r\n[2020年最新的常问企业面试题大全以及答案](https://mp.weixin.qq.com/s/lR5LC5GnD2Gs59ecV5R0XA)', '2020-05-28 09:36:38', 0);
INSERT INTO `m_blog` VALUES (3, 1, '关注公众号JavaCat，回复xshell或navicat获取破解对应工具', '视频中所用到的xshell和navicat直接获取哈！', '### 工具获取\n\n* xshell 6 绿色破解版：关注公众号：JavaCat，回复 xshell 获取\n* Navicat 11 简体中文版：关注公众号：JavaCat，回复 navicat 获取\n\n公众号二维码：\n\n![JavaCat](//image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/20201020/7fa16a1f957f4cfebe7be1f6675f6f36.png \"JavaCat\")\n\n直接扫码回复对应关键字\n\n**推荐阅读：**\n\n[B站86K播放量，SpringBoot+Vue前后端分离完整入门教程！](https://mp.weixin.qq.com/s/jGEkHTf2X8l-wUenc-PpEw)\n\n[分享一套SpringBoot开发博客系统源码，以及完整开发文档！速度保存！](https://mp.weixin.qq.com/s/jz6e977xP-OyaAKNjNca8w)\n\n[Github上最值得学习的100个Java开源项目，涵盖各种技术栈！](https://mp.weixin.qq.com/s/N-U0TaEUXnBFfBsmt_OESQ)\n\n[2020年最新的常问企业面试题大全以及答案](https://mp.weixin.qq.com/s/lR5LC5GnD2Gs59ecV5R0XA', '2020-10-20 05:05:31', 0);
INSERT INTO `m_blog` VALUES (7, 1, '你真的会写单例模式吗?', '单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。', '> 作者：吃桔子的攻城狮 来源：http://www.tekbroaden.com/singleton-java.html\n\n\n单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。\n\n饿汉法\n===\n\n顾名思义，饿汉法就是在第一次引用该类的时候就创建对象实例，而不管实际是否需要创建。代码如下：\n\n```\npublic class Singleton {  \n    private static Singleton = new Singleton();\n    private Singleton() {}\n    public static getSignleton(){\n        return singleton;\n    }\n}\n\n```\n\n这样做的好处是编写简单，但是无法做到延迟创建对象。但是我们很多时候都希望对象可以尽可能地延迟加载，从而减小负载，所以就需要下面的懒汉法：\n', '2020-05-22 00:42:44', 0);
INSERT INTO `m_blog` VALUES (9, 1, '真正理解Mysql的四种隔离级别@', '事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n\n事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。', '### 什么是事务  \n\n> 事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n> \n> 事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。\n\n**事务的 ACID**\n\n事务具有四个特征：原子性（ Atomicity ）、一致性（ Consistency ）、隔离性（ Isolation ）和持续性（ Durability ）。这四个特性简称为 ACID 特性。\n\n> 1 、原子性。事务是数据库的逻辑工作单位，事务中包含的各操作要么都做，要么都不做\n> \n> 2 、一致性。事 务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。因此当数据库只包含成功事务提交的结果时，就说数据库处于一致性状态。如果数据库系统 运行中发生故障，有些事务尚未完成就被迫中断，这些未完成事务对数据库所做的修改有一部分已写入物理数据库，这时数据库就处于一种不正确的状态，或者说是 不一致的状态。', '2020-05-22 22:04:46', 0);
INSERT INTO `m_blog` VALUES (10, 1, '博客项目eblog讲解视频上线啦，长达17个小时！！', '1. 慕课网免费资源好久都没更新了，新教程大都付费\n2. B站上的视频繁多，通过收藏和弹幕数量通常很容易判断出视频是否优质\n3. 讲真，B站的弹幕文化，让我觉得，我不是一个在学习，自古人才出评论。哈哈哈\n4. B站视频通常广告少，up主的用心录制，通常只为了你关注他', 'ok，再回到我们的eblog项目，源码、文档、视频我都开源出来了。来些基本操作：github上给个star，B站视频给个三连支持咧。\n\neblog源码：https://github.com/MarkerHub/eblog\n\n点击这里：[10+篇完整开发文档](https://mp.weixin.qq.com/mp/homepage?__biz=MzIwODkzOTc1MQ==&hid=1&sn=8e512316c3dfe140e636d0c996951166)\n\n![](//image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/20200508/c290d945b7d24c79b172759bdb5b94e0.png)\n\n视频讲解：（记得关注我噢！）\n\nhttps://www.bilibili.com/video/BV1ri4y1x71A\n\n![](//image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/20200508/983b5abc1c934360a1a1362347a275f7.png)\n\n项目其实还很多bug的，哈哈，我还需要进行二次迭代，到时候再发迭代文档出来。\n\n关注下我的B站，作为一个自媒体的自由职业者，没有什么比涨粉更让我开心的了，嘻嘻。\n\n近期即将推出的视频教程：\n\n1. 搭建脚手架，前后端分离首秀\n2. Shiro入门到精通教程\n3. SpringBoot2.2.6最新入门教程', '2020-05-22 22:05:49', 0);
INSERT INTO `m_blog` VALUES (19, 1, '666', '666', '666', '2022-03-28 06:08:29', 0);
INSERT INTO `m_blog` VALUES (20, 1, 'hhh', 'llllll', '222', '2022-03-28 19:42:26', 0);
INSERT INTO `m_blog` VALUES (21, 2, '111', '111', '111111', '2022-03-28 19:42:27', 0);
INSERT INTO `m_blog` VALUES (22, 2, '444', '4444', '44444444444444', '2022-03-28 19:42:28', 0);
INSERT INTO `m_blog` VALUES (23, 2, '444', '444', '44444444444444444', '2022-03-28 19:42:29', 0);
INSERT INTO `m_blog` VALUES (24, 2, '111', '666666666666666', '111111111', '2022-03-28 19:42:29', 0);
INSERT INTO `m_blog` VALUES (25, 2, 'hhh', 'hhhhhhhhhh', 'hhhhhhhhh\n\n**老俞大傻子**![手绘圣诞节礼盒礼品盒礼物包装盒2.png](1)', '2022-03-28 19:42:30', 0);
INSERT INTO `m_blog` VALUES (26, 2, '222', '2222222', '![bg1.jpg](1)\nhhhh\n庞杨铠傻逼', '2022-03-28 19:42:31', 0);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单主键',
  `product_id` int(11) NOT NULL COMMENT '商品主键',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `cost` float NOT NULL COMMENT '消费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 740, 4, 632);
INSERT INTO `order_detail` VALUES (2, 1, 743, 2, 1178);
INSERT INTO `order_detail` VALUES (3, 2, 734, 3, 459);
INSERT INTO `order_detail` VALUES (4, 3, 755, 1, 8596);
INSERT INTO `order_detail` VALUES (5, 4, 756, 1, 5966);
INSERT INTO `order_detail` VALUES (6, 4, 735, 1, 152);
INSERT INTO `order_detail` VALUES (7, 5, 746, 1, 963);
INSERT INTO `order_detail` VALUES (8, 6, 743, 1, 589);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `cost` float NULL DEFAULT NULL COMMENT '总金额',
  `serialnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 61, 'test03', '软件园', 1810, 'F4340A014F35B2EE324CF3EE3A787248', '2022-03-23 16:41:22', '2022-03-23 16:41:22');
INSERT INTO `orders` VALUES (2, 61, 'test03', 'newAddress', 459, 'BB4DCAF6A7C642F2EE2219CB06325B42', '2022-03-23 18:22:40', '2022-03-23 18:22:40');
INSERT INTO `orders` VALUES (3, 61, 'test03', 'newAddress', 8596, 'F8163EFB684877C3BF531836CA34C115', '2022-03-23 18:28:34', '2022-03-23 18:28:34');
INSERT INTO `orders` VALUES (4, 61, 'test03', '1234', 6118, 'D1F4FFE8988687DB886A23D16542D85D', '2022-03-23 18:48:14', '2022-03-23 18:48:14');
INSERT INTO `orders` VALUES (5, 61, 'test03', '123456', 963, 'C798E8B1212B7E7A0ED395BC40FB74DB', '2022-03-23 18:56:32', '2022-03-23 18:56:32');
INSERT INTO `orders` VALUES (6, 61, 'test03', '123456', 589, '46F30B663F41497B684B27375F0EA3DC', '2022-03-23 19:10:26', '2022-03-23 19:10:26');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `price` float NOT NULL COMMENT '价格',
  `stock` int(11) NOT NULL COMMENT '库存',
  `categorylevelone_id` int(11) NULL DEFAULT NULL COMMENT '分类1',
  `categoryleveltwo_id` int(11) NULL DEFAULT NULL COMMENT '分类2',
  `categorylevelthree_id` int(11) NULL DEFAULT NULL COMMENT '分类3',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___94F6E55132E0915F`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '切铝工业型材锯片', '铝工业型材专用、铝合金锯切', 100, 98, 1, 5, 6, '416_0.jpg');
INSERT INTO `product` VALUES (2, '超薄铝合金锯片', '切割铝合金，铝材、铝型材、铝管、铝棒铝板、铝合金型材等', 150, 100, 1, 5, 6, '507_0.jpg');
INSERT INTO `product` VALUES (3, '富士薄切铝锯片', '切面光滑无毛刺', 100, 100, 1, 5, 8, '408_0.jpg');
INSERT INTO `product` VALUES (4, '切薄壁铝管锯片', '切面光滑无毛刺，铝材专用', 150, 100, 1, 5, 6, '497_0.jpg');
INSERT INTO `product` VALUES (5, '汽车发动机缸盖专用锯片', '锯切稳定、切面光滑无毛刺， 铝铸件专用、汽车发动机缸盖专用', 200, 100, 1, 5, 7, '500_0.jpg');
INSERT INTO `product` VALUES (6, '汽车轮毂专用锯片', '锯切稳定、切面光滑无毛刺，铝铸件专用、汽车轮毂专用', 250, 100, 1, 5, 7, '499_0.jpg');
INSERT INTO `product` VALUES (7, '铝模板切割锯片', '铝模板切割锯片，建筑铝模板专用锯片，铝材专用', 399, 123, 1, 5, 7, '498_0.jpg');
INSERT INTO `product` VALUES (8, '推台锯专用锯片', '推台锯锯片、木工专用锯片', 299, 122, 1, 5, 8, '431_0.jpg');
INSERT INTO `product` VALUES (9, '抗倍特板专用锯片', '切抗倍特板专用锯片、康贝特板切割锯片', 349, 260, 1, 5, 8, '434_0.jpg');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级目录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '级别(1:一级 2：二级 3：三级)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___9EC2A4E236B12243`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '锯片', 0, 1);
INSERT INTO `product_category` VALUES (2, '金属原材料', 0, 1);
INSERT INTO `product_category` VALUES (3, '电机', 0, 1);
INSERT INTO `product_category` VALUES (4, '滑轨', 0, 1);
INSERT INTO `product_category` VALUES (5, '金属锯片', 1, 2);
INSERT INTO `product_category` VALUES (6, '铝型材锯片', 5, 3);
INSERT INTO `product_category` VALUES (7, '铝合金压铸件行业', 5, 3);
INSERT INTO `product_category` VALUES (8, '富士木工合金锯片', 5, 3);
INSERT INTO `product_category` VALUES (9, '其他锯片', 1, 2);
INSERT INTO `product_category` VALUES (10, '切塑料锯片', 9, 3);
INSERT INTO `product_category` VALUES (11, '门窗幕墙锯片', 9, 3);
INSERT INTO `product_category` VALUES (12, '汽车配件行业锯片', 9, 3);
INSERT INTO `product_category` VALUES (13, '太阳能光伏行业锯片', 9, 3);
INSERT INTO `product_category` VALUES (14, '金刚石', 2, 2);
INSERT INTO `product_category` VALUES (15, '铝合金', 2, 2);
INSERT INTO `product_category` VALUES (16, '金刚石微粉', 14, 3);
INSERT INTO `product_category` VALUES (17, '金刚石颗粒', 14, 3);
INSERT INTO `product_category` VALUES (18, '铝板材', 15, 3);
INSERT INTO `product_category` VALUES (19, '锯片电机', 3, 2);
INSERT INTO `product_category` VALUES (20, '大型', 19, 3);
INSERT INTO `product_category` VALUES (21, '小型', 19, 3);
INSERT INTO `product_category` VALUES (22, '锯片滑轨', 4, 2);
INSERT INTO `product_category` VALUES (23, '大型', 22, 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___C96109CC3A81B327`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (58, 'test', '张三', 'b3472e734711122a5c892c3a93705ed11d1513d59b107d57', 1, '123@test.com', '13312345678', '3.jpg', '2021-11-18 12:55:37', '2021-11-18 12:55:37');
INSERT INTO `user` VALUES (59, 'test2', '张三', 'f1bc53d58d67b98a3d41a247a94f5b11de5aa2bc61596723', 1, '123@test.com', '13312345678', NULL, '2021-11-18 13:00:07', '2021-11-18 13:00:07');
INSERT INTO `user` VALUES (61, 'test03', '里斯', '03ab23a92d2fa21a8183f02704f527274240c0af26631926', 1, '123@test.com', '13344445555', NULL, '2022-03-19 13:50:11', '2022-03-19 13:50:11');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isdefault` int(11) NULL DEFAULT 0 COMMENT '是否是默认地址（1:是 0否）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (49, 56, 'IT园', '公司', 0, '2020-05-21 15:55:24', '2020-07-29 11:22:13');
INSERT INTO `user_address` VALUES (50, 56, '软件园', '公司', 0, '2020-05-22 15:11:07', '2020-07-25 09:14:19');
INSERT INTO `user_address` VALUES (57, 56, '测试', '测试', 0, '2021-11-17 18:04:49', '2021-11-17 18:04:49');
INSERT INTO `user_address` VALUES (59, 59, '软件园', '公司', 0, '2021-11-18 13:01:19', '2021-11-18 13:01:19');
INSERT INTO `user_address` VALUES (60, 61, '软件园', '公司', 0, '2022-03-23 15:29:34', '2022-03-23 15:29:38');
INSERT INTO `user_address` VALUES (61, 61, '1234', '1234', 0, '2022-03-23 18:48:14', '2022-03-23 18:48:14');
INSERT INTO `user_address` VALUES (62, 61, '123456', '12', 1, '2022-03-23 18:56:32', '2022-03-23 18:56:32');

SET FOREIGN_KEY_CHECKS = 1;

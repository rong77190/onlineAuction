/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : onlineauction

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-08-27 22:50:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rough_address` varchar(100) DEFAULT NULL,
  `detail_address` varchar(100) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `is_default` int(4) DEFAULT '0' COMMENT '是否默认（0：普通地址,1:默认地址）',
  `postcode` int(6) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1');

-- ----------------------------
-- Table structure for deposit
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL COMMENT '押金',
  `state` int(4) DEFAULT '0' COMMENT '状态(返还 0:1)',
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES ('1', '1', '1', '2016-08-08 00:52:33', '12.00', '0');
INSERT INTO `deposit` VALUES ('2', '2', '1', '2016-08-08 00:52:37', '13.00', '0');
INSERT INTO `deposit` VALUES ('3', '3', '1', '2016-08-21 11:36:12', '14.00', '0');
INSERT INTO `deposit` VALUES ('4', '4', '1', '2016-08-02 12:24:22', '15.00', '0');
INSERT INTO `deposit` VALUES ('5', '1', '2', null, '20.88', '0');
INSERT INTO `deposit` VALUES ('6', '1', '2', '2016-08-24 13:01:05', '20.88', '0');
INSERT INTO `deposit` VALUES ('9', '1', '2', '2016-08-24 15:33:55', '20.88', '0');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int(10) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) DEFAULT NULL COMMENT '小类id',
  `good_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `price` double(10,2) DEFAULT NULL COMMENT '一口价',
  `curr_price` double(10,2) DEFAULT NULL COMMENT '当前价',
  `begin_price` double(10,0) DEFAULT NULL COMMENT '起拍价',
  `image` varchar(50) DEFAULT NULL COMMENT '图片',
  `introduction` varchar(50) DEFAULT NULL COMMENT '简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` int(10) DEFAULT '0' COMMENT '是否删除(1是：0否默认为0)',
  `up_time` datetime DEFAULT NULL COMMENT '上架时间',
  `good_state` varchar(50) DEFAULT NULL COMMENT '状态(“0：未审核”1：审核过，上架 2：下架)',
  `complete_time` datetime DEFAULT NULL COMMENT '结束时间',
  `buyer_id` int(11) DEFAULT NULL COMMENT '出价人',
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '1', '1123', '10000.00', '119.23', '11', null, null, '2016-08-02 02:35:14', '0', '2016-08-16 12:31:18', '1', '2016-09-01 02:35:07', '1', null);
INSERT INTO `good` VALUES ('2', '1', '1', '10000.00', '0.00', '2', null, null, '2016-08-23 12:31:12', '0', '2016-08-23 12:31:22', '1', '2016-09-01 12:31:31', null, null);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `sys_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `manager_email` varchar(50) DEFAULT NULL,
  `freeze` int(4) DEFAULT NULL,
  `role` int(4) DEFAULT NULL,
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(20) NOT NULL COMMENT '学号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `password` varchar(40) NOT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `createDate` varchar(10) DEFAULT NULL,
  `stuclass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'jack', '1234565', '男', '2016-04-04', null, '2班7吧1');
INSERT INTO `student` VALUES ('2', 'tom2', '2231132ddd', '女', '2016-02-15', null, '软件2班');

-- ----------------------------
-- Table structure for sub_category
-- ----------------------------
DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_category
-- ----------------------------
INSERT INTO `sub_category` VALUES ('1', '1', '1', '2016-08-02 12:27:41');

-- ----------------------------
-- Table structure for torder
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `order_price` double(10,2) DEFAULT NULL,
  `order_state` int(4) DEFAULT NULL,
  `pay_way` int(4) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of torder
-- ----------------------------
INSERT INTO `torder` VALUES ('1', null, null, null, null, '1.77', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_image` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `balance` double(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `freeze` int(4) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1', null, '1', '1', '1', '1', '2016-07-05 17:41:57', '196.96', '0');
INSERT INTO `user` VALUES ('2', '12312', '123', null, '12137098', null, null, '12918312908', '2016-07-12 17:41:57', '91.00', '0');
INSERT INTO `user` VALUES ('3', '1232', '123', null, '12137098', null, '2016-07-22', '12918312908', '2016-07-22 17:41:57', '1.00', '0');
INSERT INTO `user` VALUES ('4', '3', '1234567', null, null, null, null, '12918312908', '2016-07-22 17:49:26', '15.00', '0');
INSERT INTO `user` VALUES ('5', '123213', '12132123', null, null, null, null, null, '2016-08-07 21:40:58', '0.00', '0');
INSERT INTO `user` VALUES ('6', '1cfefa', '12321', null, null, null, null, '140656', '2016-08-08 22:03:08', '0.00', '0');
INSERT INTO `user` VALUES ('7', 'xcr1', '123', null, null, null, null, null, '2016-08-08 22:04:15', '1.23', '0');
INSERT INTO `user` VALUES ('8', null, null, null, null, null, null, null, null, '89.00', '0');
INSERT INTO `user` VALUES ('9', null, null, null, null, null, null, null, null, '100.00', '0');
INSERT INTO `user` VALUES ('10', 'fadsfasdfasdfa', '123', null, null, null, null, null, '2016-08-24 01:22:07', '0.00', '0');

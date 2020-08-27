/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : heima_ssm

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 27/08/2020 07:10:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES (1, '张三', '三儿', '13065186666', '552176426@qq.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` int(255) NOT NULL,
  `travellerId` int(255) NULL DEFAULT NULL,
  INDEX `orderId`(`orderId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES (1, 1);
INSERT INTO `order_traveller` VALUES (1, 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `orderTime` timestamp(0) NULL DEFAULT NULL,
  `peopleCount` int(255) NULL DEFAULT NULL,
  `orderDesc` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `payType` int(255) NULL DEFAULT NULL,
  `orderStatus` int(255) NULL DEFAULT NULL,
  `productId` int(255) NULL DEFAULT NULL,
  `memberId` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `memberId` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '001', '2020-08-26 16:19:01', 15, 'desc', 2, 0, 2, 1);
INSERT INTO `orders` VALUES (2, '002', '2020-08-27 06:50:47', 5, 'desc', 1, 1, 1, 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'p1', 'url1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `cityName` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `departureTime` timestamp(0) NULL DEFAULT NULL,
  `productPrice` double(10, 2) NULL DEFAULT NULL,
  `productDesc` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `productStatus` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '1', '1', '南昌', '2020-08-27 00:00:00', 10000.00, 'desc', 1);
INSERT INTO `product` VALUES (2, '2', '一日游', '南昌', '2020-03-10 00:00:00', 1000.00, '123', 0);
INSERT INTO `product` VALUES (3, '3', '一日游', '北京', '2020-08-27 06:58:02', 2000.00, '北京一日游', 1);
INSERT INTO `product` VALUES (4, '4', '七日游', '美国', '2020-08-27 06:58:28', 8000.00, '美国七日游', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'USER', 'ROLE_USER');
INSERT INTO `role` VALUES (2, 'ADMIN', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int(255) NOT NULL AUTO_INCREMENT,
  `roleId` int(255) NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `permissionId` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `executionTime` int(255) NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (2, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (3, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (4, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (5, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (6, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (7, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (8, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 80, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (9, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 48, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (10, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (11, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (12, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (13, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (14, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (15, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 45, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (16, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (17, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (18, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (19, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (20, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (21, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (22, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (23, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (24, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (25, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (26, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (27, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (28, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (29, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 5, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (30, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (31, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (32, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (33, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 3, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (34, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (35, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 15, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (36, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (37, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (38, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (39, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (40, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (41, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (42, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (43, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 9, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (44, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById.do', 3, '[类名]com.itheima.controller.PermissionController[方法]findById');
INSERT INTO `syslog` VALUES (45, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 13, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (46, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (47, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (48, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (49, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 27, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (50, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 25, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (51, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (52, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 25, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (53, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 16, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (54, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 19, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (55, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 18, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (56, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (57, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (58, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (59, '2020-08-26 00:00:00', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 13, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (60, '2020-08-26 17:04:10', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 30, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (61, '2020-08-26 17:07:40', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 35, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (62, '2020-08-26 17:08:22', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 31, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (63, '2020-08-26 17:10:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 28, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (64, '2020-08-26 17:10:57', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (65, '2020-08-26 17:12:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 50, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (66, '2020-08-26 17:15:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (67, '2020-08-26 17:15:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 12, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (68, '2020-08-26 17:15:17', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (69, '2020-08-26 17:15:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (70, '2020-08-26 17:15:49', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 2, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (71, '2020-08-26 17:15:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 10, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (72, '2020-08-26 17:16:02', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (73, '2020-08-26 17:16:03', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById.do', 3, '[类名]com.itheima.controller.PermissionController[方法]findById');
INSERT INTO `syslog` VALUES (74, '2020-08-26 17:16:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (75, '2020-08-26 17:16:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (76, '2020-08-26 17:16:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 49, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (77, '2020-08-26 17:16:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 17, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (78, '2020-08-26 17:16:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (79, '2020-08-26 17:17:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (80, '2020-08-26 17:17:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (81, '2020-08-26 17:17:22', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (82, '2020-08-26 17:20:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (83, '2020-08-26 17:20:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (84, '2020-08-26 17:20:05', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 2, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (85, '2020-08-26 17:20:09', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 12, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (86, '2020-08-26 17:20:15', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (87, '2020-08-26 17:20:16', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (88, '2020-08-26 17:20:17', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (89, '2020-08-26 17:20:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (90, '2020-08-26 17:21:38', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (91, '2020-08-26 17:24:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (92, '2020-08-26 17:24:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (93, '2020-08-26 17:29:52', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 55, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (94, '2020-08-26 17:31:36', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 51, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (95, '2020-08-26 17:31:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 13, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (96, '2020-08-26 17:34:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 54, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (97, '2020-08-26 17:34:31', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (98, '2020-08-26 17:35:25', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 153589, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (99, '2020-08-26 17:38:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18542, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (100, '2020-08-26 17:38:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (101, '2020-08-26 17:38:35', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 43206, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (102, '2020-08-26 17:40:49', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4865, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (103, '2020-08-26 17:42:11', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 61, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (104, '2020-08-26 17:42:26', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 12, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (105, '2020-08-26 17:42:27', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 12, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (106, '2020-08-26 17:42:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 12, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (107, '2020-08-26 17:42:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (108, '2020-08-26 17:42:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (109, '2020-08-26 17:42:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (110, '2020-08-26 17:46:24', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 68, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (111, '2020-08-26 17:46:34', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (112, '2020-08-26 17:46:35', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (113, '2020-08-26 17:46:36', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (114, '2020-08-26 17:46:37', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (115, '2020-08-26 17:46:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (116, '2020-08-26 17:46:40', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (117, '2020-08-26 17:46:41', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (118, '2020-08-26 17:46:41', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (119, '2020-08-26 17:46:42', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (120, '2020-08-26 17:46:43', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (121, '2020-08-26 17:46:43', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (122, '2020-08-26 17:46:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (123, '2020-08-26 17:46:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (124, '2020-08-26 17:46:45', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (125, '2020-08-26 17:46:46', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (126, '2020-08-26 17:46:46', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (127, '2020-08-26 17:46:46', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (128, '2020-08-26 17:46:46', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (129, '2020-08-26 17:46:47', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (130, '2020-08-26 17:46:47', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (131, '2020-08-26 17:46:48', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (132, '2020-08-26 17:46:48', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (133, '2020-08-26 17:46:49', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (134, '2020-08-26 17:46:50', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (135, '2020-08-26 17:46:50', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (136, '2020-08-26 17:46:50', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (137, '2020-08-26 17:46:50', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (138, '2020-08-26 17:46:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (139, '2020-08-26 17:46:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (140, '2020-08-26 17:46:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (141, '2020-08-26 17:46:51', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (142, '2020-08-26 17:46:52', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (143, '2020-08-26 17:46:52', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (144, '2020-08-26 17:46:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (145, '2020-08-26 17:46:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (146, '2020-08-26 17:46:54', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (147, '2020-08-26 17:46:58', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (148, '2020-08-26 17:46:58', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (149, '2020-08-26 17:47:05', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (150, '2020-08-26 17:47:06', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (151, '2020-08-26 17:47:07', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (152, '2020-08-26 17:47:07', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (153, '2020-08-26 17:47:08', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (154, '2020-08-26 17:47:10', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (155, '2020-08-26 17:47:11', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (156, '2020-08-26 17:47:13', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (157, '2020-08-26 17:47:14', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (158, '2020-08-26 17:47:16', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (159, '2020-08-26 17:47:17', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (160, '2020-08-26 17:47:18', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (161, '2020-08-26 17:47:19', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (162, '2020-08-26 17:47:19', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (163, '2020-08-26 17:47:20', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (164, '2020-08-26 17:47:22', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (165, '2020-08-26 17:47:23', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (166, '2020-08-26 17:47:24', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (167, '2020-08-26 17:47:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (168, '2020-08-26 17:47:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (169, '2020-08-26 17:47:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 4, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (170, '2020-08-26 17:47:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (171, '2020-08-26 17:47:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (172, '2020-08-26 17:47:29', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (173, '2020-08-26 17:47:30', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (174, '2020-08-26 17:47:30', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (175, '2020-08-26 17:47:30', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (176, '2020-08-26 17:47:32', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (177, '2020-08-26 17:47:35', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (178, '2020-08-26 17:48:21', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 56, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (179, '2020-08-26 17:48:27', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (180, '2020-08-26 17:48:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (181, '2020-08-26 17:48:31', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (182, '2020-08-26 17:48:34', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 15, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (183, '2020-08-26 17:48:39', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (184, '2020-08-26 17:48:43', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (185, '2020-08-26 17:48:44', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.itheima.controller.SysLogController[方法]findAll');
INSERT INTO `syslog` VALUES (186, '2020-08-26 18:00:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 20, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (187, '2020-08-26 18:00:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (188, '2020-08-26 18:01:16', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 10, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (189, '2020-08-26 18:01:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (190, '2020-08-26 18:02:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 11, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (191, '2020-08-26 18:02:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 3, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (192, '2020-08-26 18:02:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (193, '2020-08-26 18:02:32', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (194, '2020-08-26 18:02:40', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (195, '2020-08-26 18:03:07', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (196, '2020-08-26 18:07:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (197, '2020-08-26 18:07:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (198, '2020-08-26 18:07:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (199, '2020-08-26 18:08:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (200, '2020-08-26 18:10:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 55, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (201, '2020-08-26 18:10:33', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (202, '2020-08-26 18:13:32', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (203, '2020-08-26 18:13:35', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 12, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (204, '2020-08-26 18:14:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 55, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (205, '2020-08-26 18:14:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 13, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (206, '2020-08-26 18:14:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (207, '2020-08-26 18:14:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (208, '2020-08-26 18:14:56', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (209, '2020-08-26 18:15:10', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (210, '2020-08-26 18:18:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 82, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (211, '2020-08-26 18:18:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 13, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (212, '2020-08-26 18:18:09', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 11, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (213, '2020-08-26 18:18:53', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 9, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (214, '2020-08-26 18:18:58', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (215, '2020-08-26 18:18:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (216, '2020-08-26 18:19:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (217, '2020-08-26 18:19:06', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (218, '2020-08-26 18:19:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (219, '2020-08-26 18:19:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (220, '2020-08-26 18:19:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (221, '2020-08-26 18:19:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 15, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (222, '2020-08-26 18:19:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (223, '2020-08-26 18:19:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 11, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (224, '2020-08-26 18:20:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (225, '2020-08-26 18:20:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (226, '2020-08-26 18:20:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (227, '2020-08-26 18:22:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 10, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (228, '2020-08-26 18:22:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (229, '2020-08-26 18:22:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 6, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (230, '2020-08-26 18:22:46', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (231, '2020-08-26 18:22:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (232, '2020-08-26 18:23:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (233, '2020-08-26 18:23:07', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (234, '2020-08-26 18:23:38', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (235, '2020-08-26 18:23:48', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (236, '2020-08-26 18:24:04', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (237, '2020-08-26 18:24:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (238, '2020-08-26 18:24:25', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (239, '2020-08-26 18:24:26', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (240, '2020-08-26 18:24:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (241, '2020-08-26 18:24:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (242, '2020-08-26 18:24:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (243, '2020-08-26 18:24:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (244, '2020-08-26 18:24:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (245, '2020-08-26 18:24:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (246, '2020-08-26 18:24:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (247, '2020-08-26 18:24:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (248, '2020-08-26 18:24:33', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (249, '2020-08-26 18:24:34', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (250, '2020-08-26 18:24:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (251, '2020-08-26 18:24:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (252, '2020-08-26 18:25:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (253, '2020-08-26 18:25:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 9, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (254, '2020-08-26 18:25:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (255, '2020-08-26 18:25:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (256, '2020-08-26 18:25:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 10, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (257, '2020-08-26 18:25:15', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (258, '2020-08-26 18:25:26', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (259, '2020-08-26 18:25:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 10, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (260, '2020-08-26 18:25:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (261, '2020-08-26 18:25:50', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 83, '[类名]com.itheima.controller.UserController[方法]save');
INSERT INTO `syslog` VALUES (262, '2020-08-26 18:25:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (263, '2020-08-26 18:25:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 6, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (264, '2020-08-26 18:26:01', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 13, '[类名]com.itheima.controller.UserController[方法]addRoleToUser');
INSERT INTO `syslog` VALUES (265, '2020-08-26 18:26:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (266, '2020-08-26 18:26:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 9, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (267, '2020-08-26 18:26:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (268, '2020-08-26 18:26:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 4, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (269, '2020-08-26 18:26:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (270, '2020-08-26 18:26:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 7, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (271, '2020-08-26 18:26:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (272, '2020-08-26 18:27:12', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (273, '2020-08-26 18:27:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (274, '2020-08-26 18:27:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (275, '2020-08-26 18:27:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 7, '[类名]com.itheima.controller.RoleController[方法]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (276, '2020-08-26 18:27:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (277, '2020-08-26 18:27:18', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 7, '[类名]com.itheima.controller.RoleController[方法]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (278, '2020-08-26 18:27:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (279, '2020-08-26 18:27:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (280, '2020-08-26 18:27:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (281, '2020-08-26 18:27:25', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (282, '2020-08-26 18:27:25', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (283, '2020-08-26 18:27:29', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (284, '2020-08-26 18:27:43', 'admin', '0:0:0:0:0:0:0:1', '/role/save.do', 6, '[类名]com.itheima.controller.RoleController[方法]save');
INSERT INTO `syslog` VALUES (285, '2020-08-26 18:27:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (286, '2020-08-26 18:27:44', 'admin', '0:0:0:0:0:0:0:1', '/role/deleteRole', 13, '[类名]com.itheima.controller.RoleController[方法]deleteRole');
INSERT INTO `syslog` VALUES (287, '2020-08-26 18:27:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (288, '2020-08-26 18:27:58', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (289, '2020-08-26 18:28:00', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (290, '2020-08-26 18:28:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (291, '2020-08-26 18:28:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (292, '2020-08-26 18:28:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 7, '[类名]com.itheima.controller.RoleController[方法]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (293, '2020-08-26 18:28:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (294, '2020-08-26 18:28:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (295, '2020-08-26 18:28:09', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (296, '2020-08-26 18:28:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 5, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (297, '2020-08-26 18:28:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (298, '2020-08-26 18:28:20', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 9, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (299, '2020-08-26 18:28:47', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (300, '2020-08-26 18:28:49', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (301, '2020-08-26 18:28:50', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById.do', 2, '[类名]com.itheima.controller.PermissionController[方法]findById');
INSERT INTO `syslog` VALUES (302, '2020-08-26 18:28:51', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (303, '2020-08-26 18:28:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (304, '2020-08-26 18:29:00', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 11, '[类名]com.itheima.controller.UserController[方法]findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (305, '2020-08-26 18:29:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (306, '2020-08-26 18:29:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (307, '2020-08-26 18:29:12', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 6, '[类名]com.itheima.controller.RoleController[方法]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (308, '2020-08-26 18:29:13', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (309, '2020-08-26 18:29:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 4, '[类名]com.itheima.controller.RoleController[方法]findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (310, '2020-08-26 18:29:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (311, '2020-08-26 18:29:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 3, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (312, '2020-08-26 18:29:21', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (313, '2020-08-26 18:29:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 3, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (314, '2020-08-26 18:30:51', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 51, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (315, '2020-08-26 18:30:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (316, '2020-08-26 18:30:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (317, '2020-08-26 18:30:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (318, '2020-08-26 18:31:01', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (319, '2020-08-26 18:31:13', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 10, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (320, '2020-08-26 18:31:14', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findById');
INSERT INTO `syslog` VALUES (321, '2020-08-26 18:31:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (322, '2020-08-26 18:31:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (323, '2020-08-26 18:31:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (324, '2020-08-26 18:31:42', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (325, '2020-08-26 18:31:46', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (326, '2020-08-26 18:32:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (327, '2020-08-26 18:32:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (328, '2020-08-26 18:32:08', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (329, '2020-08-26 18:32:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (330, '2020-08-26 18:32:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 10, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (331, '2020-08-26 18:32:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (332, '2020-08-26 18:32:14', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (333, '2020-08-26 18:32:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 5, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (334, '2020-08-26 18:32:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (335, '2020-08-26 18:32:18', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (336, '2020-08-26 18:32:20', 'admin', '0:0:0:0:0:0:0:1', '/permission/findById.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findById');
INSERT INTO `syslog` VALUES (337, '2020-08-26 18:32:26', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (338, '2020-08-26 18:32:33', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (339, '2020-08-26 18:32:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (340, '2020-08-26 18:32:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 5, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (341, '2020-08-26 18:32:40', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (342, '2020-08-26 18:32:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 6, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (343, '2020-08-26 18:32:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (344, '2020-08-26 18:32:47', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (345, '2020-08-26 18:32:48', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (346, '2020-08-26 18:32:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (347, '2020-08-26 18:40:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (348, '2020-08-26 18:40:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 16, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (349, '2020-08-26 18:40:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (350, '2020-08-26 18:41:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (351, '2020-08-26 18:41:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 8, '[类名]com.itheima.controller.UserController[方法]findById');
INSERT INTO `syslog` VALUES (352, '2020-08-26 18:41:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (353, '2020-08-26 18:41:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (354, '2020-08-26 21:42:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (355, '2020-08-26 21:43:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (356, '2020-08-26 21:43:17', 'admin', '0:0:0:0:0:0:0:1', '/product/save.do', 23, '[类名]com.itheima.controller.ProductController[方法]save');
INSERT INTO `syslog` VALUES (357, '2020-08-26 21:43:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (358, '2020-08-26 21:43:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (359, '2020-08-26 21:43:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (360, '2020-08-26 21:43:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (361, '2020-08-26 21:43:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 82, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (362, '2020-08-26 21:43:46', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (363, '2020-08-26 21:43:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (364, '2020-08-26 21:44:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (365, '2020-08-26 21:44:22', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (366, '2020-08-26 21:44:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (367, '2020-08-26 21:44:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (368, '2020-08-26 21:45:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (369, '2020-08-26 21:46:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (370, '2020-08-26 21:46:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (371, '2020-08-26 21:47:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (372, '2020-08-26 21:47:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (373, '2020-08-26 21:47:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (374, '2020-08-26 21:47:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (375, '2020-08-26 21:47:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (376, '2020-08-26 21:48:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (377, '2020-08-26 21:48:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (378, '2020-08-26 21:48:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (379, '2020-08-26 21:48:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (380, '2020-08-26 21:49:46', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (381, '2020-08-26 21:49:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (382, '2020-08-26 21:49:58', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (383, '2020-08-26 21:56:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (384, '2020-08-26 21:56:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (385, '2020-08-26 21:56:27', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (386, '2020-08-26 21:58:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 56, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (387, '2020-08-26 21:58:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (388, '2020-08-26 21:58:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 78, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (389, '2020-08-26 22:00:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 67, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (390, '2020-08-26 22:00:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 0, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (391, '2020-08-26 22:00:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 73, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (392, '2020-08-26 22:00:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (393, '2020-08-26 22:00:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 13, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (394, '2020-08-26 22:01:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (395, '2020-08-26 22:01:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (396, '2020-08-26 22:01:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (397, '2020-08-26 22:01:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (398, '2020-08-26 22:02:33', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 54, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (399, '2020-08-26 22:02:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (400, '2020-08-26 22:06:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 4, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (401, '2020-08-26 22:07:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 3, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (402, '2020-08-26 22:07:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 3, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (403, '2020-08-26 22:07:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (404, '2020-08-26 22:08:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 3, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (405, '2020-08-26 22:08:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 82, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (406, '2020-08-26 22:09:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 4, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (407, '2020-08-26 22:10:24', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 62, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (408, '2020-08-26 22:10:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 17, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (409, '2020-08-26 22:12:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 14, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (410, '2020-08-26 22:12:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 20239, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (411, '2020-08-26 22:12:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 710468, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (412, '2020-08-26 22:24:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 36, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (413, '2020-08-26 22:25:31', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 15, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (414, '2020-08-26 22:25:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (415, '2020-08-26 22:25:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (416, '2020-08-26 22:28:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (417, '2020-08-26 22:28:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (418, '2020-08-26 22:30:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (419, '2020-08-26 22:30:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (420, '2020-08-26 22:30:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (421, '2020-08-26 22:30:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (422, '2020-08-26 22:31:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 13, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (423, '2020-08-26 22:31:45', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 16, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (424, '2020-08-26 22:32:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (425, '2020-08-26 22:32:35', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (426, '2020-08-26 22:32:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 10, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (427, '2020-08-26 22:32:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (428, '2020-08-26 22:34:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 49, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (429, '2020-08-26 22:34:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (430, '2020-08-26 22:36:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 53, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (431, '2020-08-26 22:37:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 60, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (432, '2020-08-26 22:41:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 65, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (433, '2020-08-26 22:41:07', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 14, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (434, '2020-08-26 22:41:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 17, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (435, '2020-08-26 22:41:35', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 11, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (436, '2020-08-26 22:41:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (437, '2020-08-26 22:42:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (438, '2020-08-26 22:42:21', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (439, '2020-08-26 22:42:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (440, '2020-08-26 22:42:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (441, '2020-08-26 22:42:33', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (442, '2020-08-26 22:42:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (443, '2020-08-26 22:42:46', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (444, '2020-08-26 22:42:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (445, '2020-08-26 22:43:32', 'admin', '0:0:0:0:0:0:0:1', '/product/save.do', 15, '[类名]com.itheima.controller.ProductController[方法]save');
INSERT INTO `syslog` VALUES (446, '2020-08-26 22:43:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (447, '2020-08-26 22:43:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (448, '2020-08-26 22:43:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (449, '2020-08-26 22:43:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (450, '2020-08-26 22:44:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (451, '2020-08-26 22:45:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (452, '2020-08-26 22:45:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (453, '2020-08-26 22:45:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (454, '2020-08-26 22:45:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (455, '2020-08-26 22:46:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (456, '2020-08-26 22:46:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (457, '2020-08-26 22:46:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (458, '2020-08-26 22:46:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (459, '2020-08-26 22:47:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (460, '2020-08-26 22:47:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (461, '2020-08-26 22:47:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (462, '2020-08-26 22:48:02', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (463, '2020-08-26 22:48:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (464, '2020-08-26 22:48:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (465, '2020-08-26 22:48:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (466, '2020-08-26 22:48:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (467, '2020-08-26 22:48:06', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (468, '2020-08-26 22:48:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (469, '2020-08-26 22:48:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (470, '2020-08-26 22:49:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (471, '2020-08-26 22:50:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (472, '2020-08-26 22:50:49', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (473, '2020-08-26 22:50:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (474, '2020-08-26 22:50:51', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (475, '2020-08-26 22:51:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (476, '2020-08-26 22:51:27', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (477, '2020-08-26 22:51:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (478, '2020-08-26 22:51:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (479, '2020-08-26 22:51:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (480, '2020-08-26 22:52:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (481, '2020-08-26 22:52:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (482, '2020-08-26 22:52:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (483, '2020-08-26 22:52:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (484, '2020-08-26 22:52:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (485, '2020-08-26 22:52:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (486, '2020-08-26 22:53:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (487, '2020-08-26 22:53:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (488, '2020-08-26 22:53:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (489, '2020-08-26 22:53:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (490, '2020-08-26 22:54:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (491, '2020-08-26 22:54:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (492, '2020-08-26 22:54:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (493, '2020-08-26 22:54:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (494, '2020-08-26 22:55:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (495, '2020-08-26 22:55:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (496, '2020-08-26 22:55:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (497, '2020-08-26 22:55:19', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (498, '2020-08-26 22:55:21', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (499, '2020-08-26 22:55:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (500, '2020-08-26 22:55:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (501, '2020-08-26 22:55:41', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (502, '2020-08-26 22:55:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (503, '2020-08-26 22:55:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (504, '2020-08-26 22:56:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (505, '2020-08-26 22:56:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (506, '2020-08-26 22:57:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (507, '2020-08-26 22:57:44', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (508, '2020-08-26 22:57:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (509, '2020-08-26 22:57:54', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (510, '2020-08-26 22:58:07', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (511, '2020-08-26 22:58:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 10, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (512, '2020-08-26 22:58:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (513, '2020-08-26 22:58:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (514, '2020-08-26 23:00:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (515, '2020-08-26 23:00:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (516, '2020-08-26 23:01:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (517, '2020-08-26 23:01:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (518, '2020-08-26 23:01:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (519, '2020-08-26 23:01:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (520, '2020-08-26 23:03:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (521, '2020-08-26 23:03:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (522, '2020-08-26 23:04:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (523, '2020-08-26 23:04:05', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (524, '2020-08-26 23:04:11', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 20, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (525, '2020-08-26 23:04:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (526, '2020-08-26 23:04:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (527, '2020-08-26 23:13:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (528, '2020-08-26 23:18:49', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (529, '2020-08-26 23:19:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (530, '2020-08-26 23:19:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (531, '2020-08-26 23:20:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (532, '2020-08-26 23:21:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (533, '2020-08-26 23:21:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (534, '2020-08-26 23:21:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (535, '2020-08-26 23:21:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (536, '2020-08-26 23:21:25', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (537, '2020-08-26 23:34:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 54, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (538, '2020-08-26 23:34:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (539, '2020-08-26 23:34:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (540, '2020-08-26 23:35:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (541, '2020-08-26 23:36:05', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (542, '2020-08-26 23:36:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (543, '2020-08-26 23:37:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (544, '2020-08-26 23:37:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (545, '2020-08-26 23:41:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 54, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (546, '2020-08-26 23:43:05', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (547, '2020-08-26 23:43:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (548, '2020-08-26 23:43:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (549, '2020-08-26 23:45:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (550, '2020-08-26 23:45:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 35, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (551, '2020-08-26 23:46:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 52, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (552, '2020-08-26 23:46:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 1, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (553, '2020-08-26 23:47:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 2, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (554, '2020-08-26 23:48:28', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 196, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (555, '2020-08-26 23:48:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 814, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (556, '2020-08-26 23:49:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (557, '2020-08-26 23:49:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (558, '2020-08-26 23:49:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (559, '2020-08-26 23:49:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (560, '2020-08-26 23:49:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (561, '2020-08-26 23:49:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (562, '2020-08-26 23:49:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (563, '2020-08-26 23:49:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (564, '2020-08-26 23:49:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (565, '2020-08-26 23:50:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (566, '2020-08-26 23:50:18', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (567, '2020-08-26 23:50:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (568, '2020-08-26 23:50:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (569, '2020-08-26 23:50:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (570, '2020-08-26 23:51:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (571, '2020-08-26 23:52:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 55, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (572, '2020-08-26 23:52:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 1, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (573, '2020-08-26 23:52:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 0, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (574, '2020-08-26 23:55:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 1, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (575, '2020-08-26 23:57:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 2, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (576, '2020-08-26 23:59:33', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 65, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (577, '2020-08-26 23:59:34', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 3, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (578, '2020-08-27 00:00:39', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (579, '2020-08-27 00:00:43', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (580, '2020-08-27 00:00:44', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (581, '2020-08-27 00:01:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 56, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (582, '2020-08-27 00:01:28', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (583, '2020-08-27 00:04:27', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 6, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (584, '2020-08-27 00:04:28', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 9, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (585, '2020-08-27 00:06:37', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 6, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (586, '2020-08-27 00:06:51', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (587, '2020-08-27 00:09:31', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (588, '2020-08-27 00:09:33', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (589, '2020-08-27 00:18:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 62, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (590, '2020-08-27 00:18:48', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (591, '2020-08-27 00:18:56', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 6, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (592, '2020-08-27 00:19:30', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 6, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (593, '2020-08-27 00:19:34', 'admin', '0:0:0:0:0:0:0:1', '/product/edit_submit.do', 94, '[类名]com.itheima.controller.ProductController[方法]editSubmit');
INSERT INTO `syslog` VALUES (594, '2020-08-27 00:23:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 53, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (595, '2020-08-27 00:23:39', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (596, '2020-08-27 00:23:42', 'admin', '0:0:0:0:0:0:0:1', '/product/edit_submit.do', 10, '[类名]com.itheima.controller.ProductController[方法]editSubmit');
INSERT INTO `syslog` VALUES (597, '2020-08-27 00:23:42', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (598, '2020-08-27 00:23:48', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (599, '2020-08-27 00:23:50', 'admin', '0:0:0:0:0:0:0:1', '/product/edit_submit.do', 7, '[类名]com.itheima.controller.ProductController[方法]editSubmit');
INSERT INTO `syslog` VALUES (600, '2020-08-27 00:23:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (601, '2020-08-27 00:24:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (602, '2020-08-27 00:24:47', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (603, '2020-08-27 00:25:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 23, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (604, '2020-08-27 05:42:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (605, '2020-08-27 05:42:18', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (606, '2020-08-27 05:42:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (607, '2020-08-27 05:42:23', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 5, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (608, '2020-08-27 05:42:25', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (609, '2020-08-27 05:42:27', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 3, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (610, '2020-08-27 05:42:56', 'admin', '0:0:0:0:0:0:0:1', '/product/edit_submit.do', 9, '[类名]com.itheima.controller.ProductController[方法]editSubmit');
INSERT INTO `syslog` VALUES (611, '2020-08-27 05:42:56', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (612, '2020-08-27 05:42:58', 'admin', '0:0:0:0:0:0:0:1', '/product/edit.do', 4, '[类名]com.itheima.controller.ProductController[方法]edit');
INSERT INTO `syslog` VALUES (613, '2020-08-27 05:43:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (614, '2020-08-27 05:43:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (615, '2020-08-27 05:43:45', 'admin', '0:0:0:0:0:0:0:1', '/product/save.do', 20, '[类名]com.itheima.controller.ProductController[方法]save');
INSERT INTO `syslog` VALUES (616, '2020-08-27 05:43:45', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (617, '2020-08-27 05:46:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (618, '2020-08-27 05:47:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (619, '2020-08-27 05:47:07', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 17, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (620, '2020-08-27 05:57:34', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 20, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (621, '2020-08-27 05:58:14', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (622, '2020-08-27 05:59:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 19, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (623, '2020-08-27 05:59:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (624, '2020-08-27 06:00:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (625, '2020-08-27 06:00:31', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (626, '2020-08-27 06:02:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (627, '2020-08-27 06:03:00', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 20, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (628, '2020-08-27 06:03:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (629, '2020-08-27 06:03:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (630, '2020-08-27 06:03:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (631, '2020-08-27 06:03:19', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (632, '2020-08-27 06:08:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (633, '2020-08-27 06:09:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (634, '2020-08-27 06:14:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (635, '2020-08-27 06:18:26', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 48, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (636, '2020-08-27 06:18:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (637, '2020-08-27 06:20:53', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (638, '2020-08-27 06:20:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (639, '2020-08-27 06:20:57', 'admin', '0:0:0:0:0:0:0:1', '/productdelete.do', 72, '[类名]com.itheima.controller.ProductController[方法]del');
INSERT INTO `syslog` VALUES (640, '2020-08-27 06:31:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 57, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (641, '2020-08-27 06:32:03', 'admin', '0:0:0:0:0:0:0:1', '/productdelete.do', 27, '[类名]com.itheima.controller.ProductController[方法]del');
INSERT INTO `syslog` VALUES (642, '2020-08-27 06:32:03', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (643, '2020-08-27 06:32:24', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (644, '2020-08-27 06:32:29', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (645, '2020-08-27 06:32:49', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 26, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (646, '2020-08-27 06:33:01', 'admin', '0:0:0:0:0:0:0:1', '/role/deleteRole', 17, '[类名]com.itheima.controller.RoleController[方法]deleteRole');
INSERT INTO `syslog` VALUES (647, '2020-08-27 06:33:01', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (648, '2020-08-27 06:33:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 8, '[类名]com.itheima.controller.RoleController[方法]findById');
INSERT INTO `syslog` VALUES (649, '2020-08-27 06:33:12', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (650, '2020-08-27 06:33:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (651, '2020-08-27 06:34:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (652, '2020-08-27 06:34:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (653, '2020-08-27 06:34:17', 'admin', '0:0:0:0:0:0:0:1', '/role/deleteRole', 10, '[类名]com.itheima.controller.RoleController[方法]deleteRole');
INSERT INTO `syslog` VALUES (654, '2020-08-27 06:34:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (655, '2020-08-27 06:34:53', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (656, '2020-08-27 06:34:55', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (657, '2020-08-27 06:35:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (658, '2020-08-27 06:35:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (659, '2020-08-27 06:35:18', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (660, '2020-08-27 06:35:19', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 13, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (661, '2020-08-27 06:35:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (662, '2020-08-27 06:35:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (663, '2020-08-27 06:35:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (664, '2020-08-27 06:35:47', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (665, '2020-08-27 06:35:50', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 18, '[类名]com.itheima.controller.OrdersController[方法]findById');
INSERT INTO `syslog` VALUES (666, '2020-08-27 06:35:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (667, '2020-08-27 06:43:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 58, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (668, '2020-08-27 06:43:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (669, '2020-08-27 06:44:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 69, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (670, '2020-08-27 06:44:33', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 0, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (671, '2020-08-27 06:47:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 61, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (672, '2020-08-27 06:47:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/edit.do', 11, '[类名]com.itheima.controller.OrdersController[方法]edit');
INSERT INTO `syslog` VALUES (673, '2020-08-27 06:47:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (674, '2020-08-27 06:48:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (675, '2020-08-27 06:48:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/edit.do', 9, '[类名]com.itheima.controller.OrdersController[方法]edit');
INSERT INTO `syslog` VALUES (676, '2020-08-27 06:49:47', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (677, '2020-08-27 06:49:51', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (678, '2020-08-27 06:50:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (679, '2020-08-27 06:50:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (680, '2020-08-27 06:50:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (681, '2020-08-27 06:50:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (682, '2020-08-27 06:51:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (683, '2020-08-27 06:51:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (684, '2020-08-27 06:51:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (685, '2020-08-27 06:51:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (686, '2020-08-27 06:51:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 16, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (687, '2020-08-27 06:51:37', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (688, '2020-08-27 06:51:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (689, '2020-08-27 06:51:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (690, '2020-08-27 06:52:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (691, '2020-08-27 06:52:47', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (692, '2020-08-27 06:53:08', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (693, '2020-08-27 06:53:10', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (694, '2020-08-27 06:53:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (695, '2020-08-27 06:53:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (696, '2020-08-27 06:53:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (697, '2020-08-27 06:53:18', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (698, '2020-08-27 06:53:29', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (699, '2020-08-27 06:53:33', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (700, '2020-08-27 06:55:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (701, '2020-08-27 06:57:01', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (702, '2020-08-27 06:57:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 12, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (703, '2020-08-27 06:57:04', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (704, '2020-08-27 06:57:07', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (705, '2020-08-27 06:57:16', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (706, '2020-08-27 06:57:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (707, '2020-08-27 06:57:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (708, '2020-08-27 06:57:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (709, '2020-08-27 06:57:24', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 19, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (710, '2020-08-27 06:57:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (711, '2020-08-27 06:57:37', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (712, '2020-08-27 06:58:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (713, '2020-08-27 06:58:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (714, '2020-08-27 06:58:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (715, '2020-08-27 06:58:52', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (716, '2020-08-27 06:58:54', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (717, '2020-08-27 06:58:56', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (718, '2020-08-27 06:58:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (719, '2020-08-27 06:58:59', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 14, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (720, '2020-08-27 06:59:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (721, '2020-08-27 06:59:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (722, '2020-08-27 06:59:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (723, '2020-08-27 06:59:04', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 16, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (724, '2020-08-27 07:02:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (725, '2020-08-27 07:02:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (726, '2020-08-27 07:02:21', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `syslog` VALUES (727, '2020-08-27 07:08:58', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 61, '[类名]com.itheima.controller.ProductController[方法]findAll');
INSERT INTO `syslog` VALUES (728, '2020-08-27 07:09:01', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.itheima.controller.OrdersController[方法]findAll');
INSERT INTO `syslog` VALUES (729, '2020-08-27 07:09:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名]com.itheima.controller.UserController[方法]findAll');
INSERT INTO `syslog` VALUES (730, '2020-08-27 07:09:04', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 12, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (731, '2020-08-27 07:09:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.itheima.controller.RoleController[方法]findAll');
INSERT INTO `syslog` VALUES (732, '2020-08-27 07:09:07', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 10, '[类名]com.itheima.controller.PermissionController[方法]findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `credentialsType` int(255) NULL DEFAULT NULL,
  `credentialsNum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `travellerType` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES (1, '张龙', '男', '13333333333', 1, '36011119951111303X', 1);
INSERT INTO `traveller` VALUES (2, '张飞', '男', '15555555555', 0, '987654321123456789', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '552176426@qq.com', 'admin', '$2a$10$jXQAs9viNWq5O2pcmWWhSenBI8BH4hmphUgPcRzQqNhuZ3KuLRLT2', '13088888888', 1);
INSERT INTO `users` VALUES (2, '552176426@qq.com', 'admin1', '$2a$10$oyYiyao2XpnEviZDFo8XZeCIyuFWGVAox30.2FdAMjmVdn/5IxmVi', '13065186621', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` int(255) NOT NULL AUTO_INCREMENT,
  `roleId` int(255) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId1`(`roleId`) USING BTREE,
  CONSTRAINT `roleId1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (2, 1);
INSERT INTO `users_role` VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;

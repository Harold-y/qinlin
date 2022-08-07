/*
 Navicat Premium Data Transfer

 Source Server         : Northern Lights
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : qinlin_exchange

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 07/08/2022 18:38:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `bankid` int(0) NOT NULL AUTO_INCREMENT,
  `bank_cn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bank_eng_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bank_abbre_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bankid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bank_account
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `bankid` int(0) NOT NULL,
  `bankaccount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `checkingaccount` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for capital_account
-- ----------------------------
DROP TABLE IF EXISTS `capital_account`;
CREATE TABLE `capital_account`  (
  `accountid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`accountid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin
-- ----------------------------
DROP TABLE IF EXISTS `coin`;
CREATE TABLE `coin`  (
  `coinid` int(0) NOT NULL AUTO_INCREMENT,
  `coin_intro` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eng_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cn_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `abbre_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coin_rating` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`coinid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for founder
-- ----------------------------
DROP TABLE IF EXISTS `founder`;
CREATE TABLE `founder`  (
  `founderid` int(0) NOT NULL AUTO_INCREMENT,
  `coinid` int(0) NOT NULL,
  `founder_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`founderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hang_buy
-- ----------------------------
DROP TABLE IF EXISTS `hang_buy`;
CREATE TABLE `hang_buy`  (
  `orderid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hang_sell
-- ----------------------------
DROP TABLE IF EXISTS `hang_sell`;
CREATE TABLE `hang_sell`  (
  `orderid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for international_currency
-- ----------------------------
DROP TABLE IF EXISTS `international_currency`;
CREATE TABLE `international_currency`  (
  `currencyid` int(0) NOT NULL AUTO_INCREMENT,
  `currency_eng_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currency_cn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currency_abbre_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exchangerate_usd` double NULL DEFAULT NULL,
  `timeupdated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`currencyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for market_manager
-- ----------------------------
DROP TABLE IF EXISTS `market_manager`;
CREATE TABLE `market_manager`  (
  `managerid` int(0) NOT NULL AUTO_INCREMENT,
  `validity` int(0) NOT NULL,
  `enthusiasm_rate` double NULL DEFAULT NULL,
  `optimism_rate` double NULL DEFAULT NULL,
  `extreme_rate` double NULL DEFAULT NULL,
  `userid` int(0) NOT NULL,
  `timeupdated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`managerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permissionid` int(0) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `permission_level` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`permissionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price`  (
  `priceid` int(0) NOT NULL AUTO_INCREMENT,
  `coinid` int(0) NOT NULL,
  `price_usd` double NOT NULL,
  `timeupdated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`priceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for price_manager
-- ----------------------------
DROP TABLE IF EXISTS `price_manager`;
CREATE TABLE `price_manager`  (
  `managerid` int(0) NOT NULL AUTO_INCREMENT,
  `validity` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `optimism_rate` double NULL DEFAULT NULL,
  `enthusiasm_rate` double NULL DEFAULT NULL,
  `assume_level` double NULL DEFAULT NULL,
  `timerange` datetime(0) NULL DEFAULT NULL,
  `pricefloor` double NULL DEFAULT NULL,
  `priceceiling` double NULL DEFAULT NULL,
  `userid` int(0) NOT NULL,
  `timeupdated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`managerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settlement
-- ----------------------------
DROP TABLE IF EXISTS `settlement`;
CREATE TABLE `settlement`  (
  `settlementid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  `price` double NOT NULL,
  `total_charge` double NOT NULL,
  `service_charge_usd` double NOT NULL,
  `settle_time` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`settlementid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics`  (
  `statid` int(0) NOT NULL AUTO_INCREMENT,
  `coinid` int(0) NOT NULL,
  `stat_time` date NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `highestPrice` double(100, 2) NULL DEFAULT NULL,
  `tradeAmount` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`statid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trade_account
-- ----------------------------
DROP TABLE IF EXISTS `trade_account`;
CREATE TABLE `trade_account`  (
  `accountid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`accountid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `transactionid` int(0) NOT NULL AUTO_INCREMENT,
  `buyerid` int(0) NOT NULL,
  `sellerid` int(0) NOT NULL,
  `coinid` int(0) NOT NULL,
  `amount` double NOT NULL,
  `transaction_time` datetime(0) NULL DEFAULT NULL,
  `total_charge` double(255, 0) NULL DEFAULT NULL,
  `price` double(40, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`transactionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14707 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uuid` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `timecreated` date NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `permissionid` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 开发
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 192.168.0.238:3306
 Source Schema         : yichedb

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 09/04/2019 14:15:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sapi_db_tbl
-- ----------------------------
DROP TABLE IF EXISTS `sapi_db_tbl`;
CREATE TABLE `sapi_db_tbl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tbl_name` char(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主表名称',
  `tbl_sub_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分表总数量（字段冗余维护）',
  `tbl_name_latest` char(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最新分表名称',
  `tbl_order_latest` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最新分表序号',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_name` (`tbl_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据库表（分表总管理）';

-- ----------------------------
-- Records of sapi_db_tbl
-- ----------------------------
BEGIN;
INSERT INTO `sapi_db_tbl` VALUES (1, 'e_request', 1, 'e_request_1', 1, '2019-03-20 09:22:55', '2019-03-20 09:23:04', '0000-00-00 00:00:00');
INSERT INTO `sapi_db_tbl` VALUES (2, 'e_callback', 1, 'e_callback_1', 1, '2019-03-20 11:51:39', '2019-03-20 11:51:43', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for sapi_db_tbl_shard
-- ----------------------------
DROP TABLE IF EXISTS `sapi_db_tbl_shard`;
CREATE TABLE `sapi_db_tbl_shard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sapi_db_tbl_id` bigint(20) unsigned NOT NULL,
  `tbl_order` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '分区表序号（数字自增）',
  `db_host` char(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'db host',
  `db_name` char(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库名称',
  `tbl_name` char(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `row_total_num` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '数据总数',
  `min_id` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '最小id',
  `max_id` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '最大id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1、启用，0、停用',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `sapi_db_tbl_id` (`sapi_db_tbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据库分表明细';

-- ----------------------------
-- Records of sapi_db_tbl_shard
-- ----------------------------
BEGIN;
INSERT INTO `sapi_db_tbl_shard` VALUES (1, 1, 1, '127.0.0.1', 'yichedb', 'e_request_1', 1000000, 1, 1000000, 1, '2019-03-20 09:24:22', '2019-04-01 09:03:51', '0000-00-00 00:00:00');
INSERT INTO `sapi_db_tbl_shard` VALUES (3, 2, 1, '127.0.0.1', 'yichedb', 'e_callback_1', 1000000, 1, 1000000, 1, '2019-04-01 09:03:57', '2019-04-01 09:04:20', '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

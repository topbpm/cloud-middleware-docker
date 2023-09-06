/*!40101 SET NAMES utf8 */;

# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS secco_user_center DEFAULT CHARACTER SET = utf8mb4;

Use secco_user_center;

# Dump of table app
# ------------------------------------------------------------

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `uTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `userId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `disabled` tinyint NOT NULL DEFAULT 0 COMMENT '禁用标识',
  `uTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用标识',
  `uTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户额外字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contractor
-- ----------------------------
DROP TABLE IF EXISTS `contractor`;
CREATE TABLE `contractor`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '承包商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `tableName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `fieldName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `connotation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '含义',
  PRIMARY KEY (`tableName`, `fieldName`, `value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for join_menu_tag
-- ----------------------------
DROP TABLE IF EXISTS `join_menu_tag`;
CREATE TABLE `join_menu_tag`  (
  `menuId` int NOT NULL COMMENT '菜单ID',
  `tagId` int NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`menuId`, `tagId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单标签关系表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for join_tag_user_or_organization
-- ----------------------------
DROP TABLE IF EXISTS `join_tag_user_or_organization`;
CREATE TABLE `join_tag_user_or_organization`  (
  `tagId` int NOT NULL COMMENT '标签ID',
  `type` int NOT NULL COMMENT '关联类型',
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联Id',
  PRIMARY KEY (`tagId`, `type`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for join_user_organization
-- ----------------------------
DROP TABLE IF EXISTS `join_user_organization`;
CREATE TABLE `join_user_organization`  (
  `userId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `orgId` int NOT NULL COMMENT '机构ID',
  `main` tinyint(1) NOT NULL DEFAULT 0 COMMENT '主机构标识',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`userId`, `orgId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `enName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '英文名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `type` int NOT NULL DEFAULT 1 COMMENT '类型',
  `uTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `pId` int NOT NULL DEFAULT 0 COMMENT '父ID',
  `appId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `uTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `pId` int NOT NULL DEFAULT 0 COMMENT '父ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用标识',
  `uTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `appId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID胸卡号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `domain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '域账号',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `idCard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证',
  `gender` int NOT NULL DEFAULT 0 COMMENT '性别',
  `type` int NOT NULL DEFAULT 0 COMMENT '用户类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `attributes` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '额外属性',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁用标识',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识',
  `uTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

INSERT INTO `secco_user_center`.`account` (`id`, `password`, `uTime`, `userId`) VALUES ('admin', '20dc4cc7ee8d7ce9456098a40e4cd2da', '2023-03-28 13:46:16', 'administrator');

INSERT INTO `secco_user_center`.`user` (`id`, `name`, `domain`, `mobile`, `email`, `idCard`, `gender`, `type`, `remark`, `attributes`, `status`, `disabled`, `deleted`, `uTime`) VALUES ('administrator', '系统管理员', 'yiPfwlMK7YEHbwW5lWriog==', '', '', '', 1, 3, '', '', 1, 0, 0, '2023-07-17 09:12:01');

INSERT INTO `secco_user_center`.`tag` (`id`, `name`, `disabled`, `uTime`, `appId`) VALUES (1, '系统管理员', 0, '2023-03-16 12:02:23', '0');

INSERT INTO `secco_user_center`.`join_tag_user_or_organization` (`tagId`, `type`, `id`) VALUES (1, 1, 'administrator');

INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (1, 'access', '门禁串号', 0, 0, '2023-03-15 10:51:20');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (2, 'access2', '门禁串号2', 0, 0, '2023-03-15 10:51:40');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (3, 'access2To16', '门禁串号2(16进制)', 0, 0, '2023-03-15 10:52:09');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (4, 'postCode', '岗位代码', 0, 0, '2023-03-15 14:15:22');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (5, 'postName', '岗位名称', 0, 0, '2023-03-15 14:16:59');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (6, 'postFullName', '岗位全称', 0, 0, '2023-03-15 14:17:19');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (7, 'postEnName', '岗位英文', 0, 0, '2023-03-15 14:17:40');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (8, 'fullName', '姓名全称', 1, 0, '2023-03-15 14:25:41');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (9, 'contractorCode', '承包商编码', 0, 0, '2023-03-15 14:36:03');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (10, 'contractorName', '承包商单位名称', 0, 0, '2023-03-15 14:36:12');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (11, 'contractorShortName', '承包商简称', 0, 0, '2023-03-15 14:36:21');
INSERT INTO `secco_user_center`.`attribute` (`id`, `key`, `name`, `sort`, `disabled`, `uTime`) VALUES (12, 'contractorType', '人员类型', 0, 0, '2023-03-15 14:36:31');

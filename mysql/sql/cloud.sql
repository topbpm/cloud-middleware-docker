/*!40101 SET NAMES utf8 */;

# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS cloud DEFAULT CHARACTER SET = utf8mb4;

Use cloud;

# Dump of table app
# ------------------------------------------------------------

-- ----------------------------
-- Table structure for t_app_route
-- ----------------------------
DROP TABLE IF EXISTS `t_app_route`;
CREATE TABLE `t_app_route`  (
  `Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `appid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '应用Id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '代理地址',
  `default` bit(1) NOT NULL DEFAULT b'0' COMMENT '是不是默认地址',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '应用路由表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_app_visiblerange
-- ----------------------------
DROP TABLE IF EXISTS `t_app_visiblerange`;
CREATE TABLE `t_app_visiblerange`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `appid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '应用Id',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '授权id',
  `business_type` tinyint(1) NOT NULL COMMENT '授权数据类型：1.用户 2.部门 3.标签',
  `business_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '应用可见范围表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_app
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_app`;
CREATE TABLE `t_auth_app`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键,AppId',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '应用名称',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `update_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '启用状态',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `bucket_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ceph存储桶名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图标',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_secret
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_secret`;
CREATE TABLE `t_auth_secret`  (
  `appid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'AppId',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密钥',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `update_at` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '启用状态',
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间，为空永不过期',
  `services` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '授权服务列表\r\n0.全部\r\n1.数据库服务\r\n2.缓存服务\r\n3.NoSql/MongoDB服务\r\n4.文件服务\r\n5.日志服务\r\n...\r\n示例：1,2,3',
  PRIMARY KEY (`appid`, `secret`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '应用密钥授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file_list
-- ----------------------------
DROP TABLE IF EXISTS `t_file_list`;
CREATE TABLE `t_file_list`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `create_at` datetime(0) NOT NULL COMMENT '创建时间',
  `appid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'appid',
  `ts` bigint(0) NOT NULL COMMENT '时间戳',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文件名称',
  `size` bigint(0) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `share` tinyint(0) NOT NULL COMMENT '是否分享',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文件存储路径',
  `bucket_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ceph存储桶名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '附件上传表' ROW_FORMAT = Dynamic;

-- 初始化数据
INSERT INTO `t_auth_app`(`id`, `name`, `create_at`, `update_at`, `enable`, `remark`, `bucket_name`, `icon`, `category`) VALUES ('CloudMiddleware', '中间件', '2023-02-09 10:40:03', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_auth_app`(`id`, `name`, `create_at`, `update_at`, `enable`, `remark`, `bucket_name`, `icon`, `category`) VALUES ('dev', '测试应用', '2023-06-19 13:00:25', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_auth_app`(`id`, `name`, `create_at`, `update_at`, `enable`, `remark`, `bucket_name`, `icon`, `category`) VALUES ('secco_user_center', '赛科用户中心', '2023-03-13 12:29:25', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_auth_secret`(`appid`, `secret`, `create_at`, `update_at`, `enable`, `expire_date`, `services`) VALUES ('CloudMiddleware', 'W06zO5DdyUPz17AmYGq8a6FsDFBJTAnRUdehshYsRKI', '2023-02-09 10:51:52', '2023-02-09 10:51:52', 1, NULL, '0');
INSERT INTO `t_auth_secret`(`appid`, `secret`, `create_at`, `update_at`, `enable`, `expire_date`, `services`) VALUES ('dev', 'JxdPy8CGePwSZK7trqCfOOyYOaSYZUgy8uo4BsEgmer', '2023-06-19 13:03:49', '2023-06-19 13:06:38', 1, NULL, '0');
INSERT INTO `t_auth_secret`(`appid`, `secret`, `create_at`, `update_at`, `enable`, `expire_date`, `services`) VALUES ('secco_user_center', 'SYZUgy8uo4BsEgmerJtrqCfOOyYOaxdPy8CGePwSZK7', '2023-03-13 12:30:14', '2023-03-13 12:30:16', 1, NULL, '0');
INSERT INTO `t_app_visiblerange`(`id`, `appid`, `business_id`, `business_type`, `business_name`) VALUES ('eccf57c3-1ad6-4869-aa91-492c007a2d53', 'dev', '1', 3, '系统管理员');
-- 请将 https://www.baidu.com 替换为 测试应用的首页地址
INSERT INTO `t_app_route`(`Id`, `appid`, `url`, `default`) VALUES ('38c48347-4434-4c5a-bdce-85bd0668e452', 'dev', 'https://www.baidu.com', b'1');

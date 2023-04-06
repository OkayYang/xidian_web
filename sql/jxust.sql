/*
 Navicat Premium Data Transfer

 Source Server         : jxust-nc
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 43.139.2.147:3306
 Source Schema         : jxust

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 06/04/2023 11:35:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'nc_article_type', '文章类别', NULL, NULL, 'NcArticleType', 'crud', 'com.jxust.nc', 'nc', 'type', '文章类目', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01', NULL);
INSERT INTO `gen_table` VALUES (2, 'nc_article', '文章', NULL, NULL, 'NcArticle', 'crud', 'com.jxust.nc', 'nc', 'article', '文章管理', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00', NULL);
INSERT INTO `gen_table` VALUES (3, 'nc_user', '用户表', NULL, NULL, 'NcUser', 'crud', 'com.jxust.nc', 'nc', 'user', '用户管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-29 16:32:36', '', '2023-03-29 16:37:56', NULL);
INSERT INTO `gen_table` VALUES (4, 'nc_topic_type', '话题类别', NULL, NULL, 'NcTopicType', 'crud', 'com.jxust.nc', 'nc', 'topicType', '话题类别', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07', NULL);
INSERT INTO `gen_table` VALUES (7, 'nc_topic', '讨论话题表', NULL, NULL, 'NcTopic', 'crud', 'com.jxust.nc', 'nc', 'topic', '讨论话题', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53', '话题表');
INSERT INTO `gen_table` VALUES (10, 'wx_topic', 'VIEW', NULL, NULL, 'WxTopic', 'crud', 'com.jxust.system', 'system', 'topic', 'VIEW', 'ruoyi', '0', '/', '{}', 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24', NULL);
INSERT INTO `gen_table` VALUES (11, 'wx_comment', 'VIEW', NULL, NULL, 'WxComment', 'crud', 'com.jxust.system', 'system', 'comment', 'VIEW', 'ruoyi', '0', '/', '{}', 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09', NULL);
INSERT INTO `gen_table` VALUES (13, 'nc_discuss', '评论专区', '', '', 'NcDiscuss', 'tree', 'com.jxust.nc', 'nc', 'discuss', '评论专区', 'xuxiaoyang', '0', '/', '{\"treeCode\":\"discuss_id\",\"treeName\":\"discuss_content\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2000\"}', 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54', NULL);
INSERT INTO `gen_table` VALUES (14, 'wx_notice', 'VIEW', NULL, NULL, 'WxNotice', 'crud', 'com.jxust.system', 'system', 'notice', 'VIEW', 'ruoyi', '0', '/', NULL, 'admin', '2023-04-02 16:00:38', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'nc_contest', '比赛信息', NULL, NULL, 'NcContest', 'crud', 'com.jxust.nc', 'nc', 'contest', '发布比赛', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11', NULL);
INSERT INTO `gen_table` VALUES (16, 'nc_enroll', '报名记录', 'nc_user', 'uid', 'NcEnroll', 'sub', 'com.jxust.nc', 'nc', 'enroll', '报名记录', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20', NULL);
INSERT INTO `gen_table` VALUES (18, 'view_enroll', 'VIEW', NULL, NULL, 'ViewEnroll', 'crud', 'com.jxust.nc', 'nc', '报名记录', 'VIEW', 'xuxiaoyang', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37', NULL);
INSERT INTO `gen_table` VALUES (19, 'nc_token', '', NULL, NULL, 'NcToken', 'crud', 'com.jxust.system', 'system', 'token', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-04-04 12:56:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'at_id', 'ID', 'int', 'Long', 'atId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (2, '1', 'parent_id', '父ID', 'int', 'Long', 'parentId', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (3, '1', 'at_name', '类目名称', 'varchar(255)', 'String', 'atName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (4, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (5, '1', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 5, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (6, '1', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 6, 'admin', '2023-03-28 18:24:43', '', '2023-03-28 22:01:01');
INSERT INTO `gen_table_column` VALUES (7, '2', 'article_id', '文章ID', 'bigint', 'Long', 'articleId', '1', '1', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (8, '2', 'article_title', '文章标题', 'varchar(255)', 'String', 'articleTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (9, '2', 'article_content', '文章内容', 'blob', 'String', 'articleContent', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'editor', '', 3, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (10, '2', 'article_cover', '封面', 'varchar(255)', 'String', 'articleCover', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (11, '2', 'article_tpye_id', '类型', 'int', 'Long', 'articleTpyeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (12, '2', 'article_stars', '收藏量', 'int', 'Long', 'articleStars', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (13, '2', 'article_likes', '喜欢量', 'int', 'Long', 'articleLikes', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (14, '2', 'article_flows', '浏览量', 'int', 'Long', 'articleFlows', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (15, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (16, '2', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 10, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (17, '2', 'isCarousel', '轮播展示', 'char(1)', 'String', 'isCarousel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 11, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (18, '2', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 12, 'admin', '2023-03-28 22:03:07', '', '2023-04-02 13:43:00');
INSERT INTO `gen_table_column` VALUES (19, '3', 'uid', '用户UID', 'bigint', 'Long', 'uid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (20, '3', 'u_nick', '网名', 'varchar(255)', 'String', 'uNick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (21, '3', 'u_name', '姓名', 'varchar(255)', 'String', 'uName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (22, '3', 'u_sex', '性别', 'char(1)', 'String', 'uSex', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'select', 'sys_user_sex', 4, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (23, '3', 'u_xh', '学号', 'bigint', 'Long', 'uXh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (24, '3', 'u_desc', '介绍', 'varchar(255)', 'String', 'uDesc', '0', '0', NULL, '1', '1', '0', '0', 'EQ', 'input', '', 6, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (25, '3', 'u_password', '密码', 'varchar(255)', 'String', 'uPassword', '0', '0', NULL, '1', '1', '0', '0', 'EQ', 'input', '', 7, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (26, '3', 'u_department', '学院', 'varchar(255)', 'String', 'uDepartment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (27, '3', 'u_major', '专业', 'varchar(255)', 'String', 'uMajor', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (28, '3', 'u_className', '班级', 'varchar(255)', 'String', 'uClassname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (29, '3', 'u_qq', 'QQ', 'varchar(255)', 'String', 'uQq', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (30, '3', 'u_idcard', '身份证', 'varchar(255)', 'String', 'uIdcard', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'input', '', 12, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (31, '3', 'u_email', '邮箱', 'varchar(255)', 'String', 'uEmail', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (32, '3', 'u_image', '头像', 'varchar(255)', 'String', 'uImage', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 14, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (33, '3', 'u_type', '身份', 'varchar(255)', 'String', 'uType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (34, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (35, '3', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 17, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (36, '3', 'openid', 'wx小程序标识用户id', 'varchar(255)', 'String', 'openid', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'input', '', 18, 'admin', '2023-03-29 16:32:37', '', '2023-03-29 16:37:56');
INSERT INTO `gen_table_column` VALUES (37, '4', 'tt_id', 'ID', 'int', 'Long', 'ttId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (38, '4', 'tt_name', '类别名称', 'varchar(255)', 'String', 'ttName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (39, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 3, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (40, '4', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 4, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (41, '4', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 5, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (42, '4', 'tt_cover', '封面', 'varchar(255)', 'String', 'ttCover', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 6, 'admin', '2023-03-29 18:32:04', '', '2023-03-29 21:27:07');
INSERT INTO `gen_table_column` VALUES (67, '7', 'topic_id', '话题id', 'bigint', 'Long', 'topicId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (68, '7', 'topic_title', '标题', 'varchar(255)', 'String', 'topicTitle', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (69, '7', 'topic_content', '内容', 'varchar(255)', 'String', 'topicContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (70, '7', 'topic_images', '图片', 'varchar(255)', 'String', 'topicImages', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (71, '7', 'topic_videos', '视频', 'varchar(255)', 'String', 'topicVideos', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'fileUpload', '', 5, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (72, '7', 'topic_stars', '收藏量', 'int', 'Integer', 'topicStars', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (73, '7', 'topic_likes', '点赞量', 'int', 'Integer', 'topicLikes', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (74, '7', 'topic_flows', '浏览量', 'int', 'Integer', 'topicFlows', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (75, '7', 'topic_type_id', '所属类别', 'int', 'Integer', 'topicTypeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (76, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (77, '7', 'create_uid', '创建者', 'bigint', 'Long', 'createUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (78, '7', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 12, 'admin', '2023-03-30 14:39:59', '', '2023-03-30 15:34:53');
INSERT INTO `gen_table_column` VALUES (99, '10', 'topic_id', '话题id', 'bigint', 'Long', 'topicId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (100, '10', 'topic_title', '话题标题', 'varchar(255)', 'String', 'topicTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (101, '10', 'topic_content', '话题内容', 'varchar(255)', 'String', 'topicContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (102, '10', 'topic_images', '话题图片', 'varchar(5000)', 'String', 'topicImages', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (103, '10', 'topic_videos', '话题视频', 'varchar(255)', 'String', 'topicVideos', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (104, '10', 'topic_stars', '收藏量', 'int', 'Long', 'topicStars', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (105, '10', 'topic_likes', '点赞量', 'int', 'Long', 'topicLikes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (106, '10', 'topic_flows', '浏览量', 'int', 'Long', 'topicFlows', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (107, '10', 'topic_type_id', '所属类别', 'bigint', 'Long', 'topicTypeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (108, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (109, '10', 'uid', '用户UID', 'bigint', 'Long', 'uid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (110, '10', 'u_nick', '用户网名', 'varchar(255)', 'String', 'uNick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (111, '10', 'u_name', '用户姓名', 'varchar(255)', 'String', 'uName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 13, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (112, '10', 'u_image', '头像', 'varchar(255)', 'String', 'uImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 14, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (113, '10', 'comment_count', '评论数量', 'bigint', 'Long', 'commentCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-03-30 20:28:03', '', '2023-03-30 20:28:24');
INSERT INTO `gen_table_column` VALUES (114, '11', 'discuss_id', '评论id', 'bigint', 'Long', 'discussId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (115, '11', 'parent_id', '父id', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (116, '11', 'discuss_content', '评论内容', 'varchar(255)', 'String', 'discussContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (117, '11', 'discuss_images', '评论图片', 'varchar(255)', 'String', 'discussImages', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (118, '11', 'create_time', '评论时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (119, '11', 'relate_id', '关联文章id', 'bigint', 'Long', 'relateArticleId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (120, '11', 'discuss_likes', '评论赞', 'int', 'Integer', 'discussLikes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (121, '11', 'status', '状态（0：正常1：代表删除）', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (122, '11', 'uid', '用户UID', 'bigint', 'Long', 'uid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (123, '11', 'u_nick', '用户网名', 'varchar(255)', 'String', 'uNick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (124, '11', 'u_name', '用户姓名', 'varchar(255)', 'String', 'uName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (125, '11', 'u_sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'uSex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 12, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (126, '11', 'u_image', '头像', 'varchar(255)', 'String', 'uImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 13, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (127, '11', 'u_type', '用户类别', 'varchar(255)', 'String', 'uType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 14, 'admin', '2023-03-31 18:01:57', '', '2023-03-31 18:03:09');
INSERT INTO `gen_table_column` VALUES (138, '13', 'discuss_id', '评论ID', 'bigint', 'Long', 'discussId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (139, '13', 'parent_id', '父id', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (140, '13', 'ancestors', '祖级列表', 'varchar(255)', 'String', 'ancestors', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'input', '', 3, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (141, '13', 'discuss_content', '内容', 'varchar(255)', 'String', 'discussContent', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 4, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (142, '13', 'discuss_images', '图片', 'varchar(255)', 'String', 'discussImages', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 5, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (143, '13', 'create_time', '评论时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (144, '13', 'relate_id', '关联文章id', 'bigint', 'Long', 'relateId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (145, '13', 'create_uid', '评论者id', 'bigint', 'Long', 'createUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (146, '13', 'discuss_likes', '评论赞', 'int', 'Long', 'discussLikes', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (147, '13', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 10, 'admin', '2023-04-02 11:16:20', '', '2023-04-02 11:20:54');
INSERT INTO `gen_table_column` VALUES (148, '14', 'discuss_id', '评论id', 'bigint', 'Long', 'discussId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '14', 'discuss_content', '评论内容', 'varchar(255)', 'String', 'discussContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '14', 'create_time', '评论时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '14', 'uid', '用户UID', 'bigint', 'Long', 'uid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '14', 'comment_nick', '用户网名', 'varchar(255)', 'String', 'commentNick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '14', 'comment_name', '用户姓名', 'varchar(255)', 'String', 'commentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '14', 'u_image', '头像', 'varchar(255)', 'String', 'uImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '14', 'topic_id', '话题id', 'bigint', 'Long', 'topicId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, '14', 'topic_content', '话题内容', 'varchar(255)', 'String', 'topicContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 9, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, '14', 'topic_images', '话题图片', 'varchar(5000)', 'String', 'topicImages', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, '14', 'topic_flows', '浏览量', 'int', 'Long', 'topicFlows', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, '14', 'topic_uid', '创建者', 'bigint', 'Long', 'topicUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, '14', 'parent_comment_id', '评论id', 'bigint', 'Long', 'parentCommentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, '14', 'parent_comment_content', '评论内容', 'varchar(255)', 'String', 'parentCommentContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 14, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, '14', 'parent_comment_uid', '用户UID', 'bigint', 'Long', 'parentCommentUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, '14', 'parent_comment_nick', '用户网名', 'varchar(255)', 'String', 'parentCommentNick', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, '14', 'parent_comment_name', '用户姓名', 'varchar(255)', 'String', 'parentCommentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 17, 'admin', '2023-04-02 16:00:38', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, '15', 'contest_id', '比赛ID', 'bigint', 'Long', 'contestId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (166, '15', 'contest_name', '标题', 'varchar(255)', 'String', 'contestName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (167, '15', 'contest_cover', '封面', 'varchar(255)', 'String', 'contestCover', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (168, '15', 'contest_desc', '描述', 'blob', 'String', 'contestDesc', '0', '0', NULL, '1', '1', '0', '0', 'LIKE', 'editor', '', 4, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (169, '15', 'contest_time', '比赛时间', 'varchar(255)', 'String', 'contestTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (170, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (171, '15', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (172, '15', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 8, 'admin', '2023-04-03 14:22:47', '', '2023-04-03 14:29:11');
INSERT INTO `gen_table_column` VALUES (173, '16', 'enroll_id', '申请表ID', 'bigint', 'Long', 'enrollId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (174, '16', 'enroll_uid', '申请者ID', 'bigint', 'Long', 'enrollUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (175, '16', 'enroll_cid', '申请项目', 'bigint', 'Long', 'enrollCid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (176, '16', 'create_time', '申请时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (177, '16', 'status', '申请状态(0申请中1同意2驳回3取消申请）', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 5, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (178, '16', 'Auditor', '审核员', 'varchar(255)', 'String', 'Auditor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-03 16:45:00', '', '2023-04-03 16:47:20');
INSERT INTO `gen_table_column` VALUES (194, '18', 'enroll_id', 'ID', 'bigint', 'Long', 'enrollId', '0', '0', '1', '1', '0', '1', '0', 'EQ', 'input', '', 1, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (195, '18', 'contest_id', '比赛ID', 'bigint', 'Long', 'contestId', '0', '0', '1', '1', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (196, '18', 'contest_name', '比赛标题', 'varchar(255)', 'String', 'contestName', '0', '0', NULL, '0', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (197, '18', 'uid', '用户UID', 'bigint', 'Long', 'uid', '0', '0', '1', '1', '0', '0', '0', 'EQ', 'input', '', 4, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (198, '18', 'u_nick', '用户网名', 'varchar(255)', 'String', 'uNick', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (199, '18', 'u_name', '用户姓名', 'varchar(255)', 'String', 'uName', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (200, '18', 'u_sex', '用户性别', 'char(1)', 'String', 'uSex', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'select', 'sys_user_sex', 7, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (201, '18', 'u_xh', '学号', 'bigint', 'Long', 'uXh', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (202, '18', 'u_department', '学院', 'varchar(255)', 'String', 'uDepartment', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (203, '18', 'u_major', '专业', 'varchar(255)', 'String', 'uMajor', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (204, '18', 'u_className', '班级', 'varchar(255)', 'String', 'uClassname', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (205, '18', 'u_image', '头像', 'varchar(255)', 'String', 'uImage', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'imageUpload', '', 12, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (206, '18', 'u_type', '用户类别', 'varchar(255)', 'String', 'uType', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'select', '', 13, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (207, '18', 'create_time', '申请时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', '0', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (208, '18', 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', 15, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (209, '18', 'Auditor', '审核员', 'varchar(255)', 'String', 'Auditor', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'input', '', 16, 'admin', '2023-04-03 17:31:27', '', '2023-04-03 18:11:37');
INSERT INTO `gen_table_column` VALUES (210, '19', 'token_id', NULL, 'int', 'Long', 'tokenId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-04 12:56:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (211, '19', 'token_name', NULL, 'varchar(255)', 'String', 'tokenName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-04 12:56:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (212, '19', 'token_value', NULL, 'varchar(255)', 'String', 'tokenValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-04 12:56:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (213, '19', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2023-04-04 12:56:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (214, '19', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-04-04 12:56:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (215, '19', 'status', NULL, 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-04-04 12:56:46', '', NULL);

-- ----------------------------
-- Table structure for nc_article
-- ----------------------------
DROP TABLE IF EXISTS `nc_article`;
CREATE TABLE `nc_article`  (
  `article_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章标题',
  `article_content` blob NULL COMMENT '文章内容',
  `article_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章封面',
  `article_type_id` int NULL DEFAULT NULL COMMENT '文章类型ID',
  `article_stars` int UNSIGNED NULL DEFAULT NULL COMMENT '文章收藏',
  `article_likes` int UNSIGNED NULL DEFAULT NULL COMMENT '文章喜欢',
  `article_flows` int UNSIGNED NULL DEFAULT NULL COMMENT '文章浏览量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `isCarousel` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否轮播图展示（Y展示N不展示）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常1停用）',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `article_type_id`(`article_type_id`) USING BTREE,
  CONSTRAINT `nc_article_ibfk_1` FOREIGN KEY (`article_type_id`) REFERENCES `nc_article_type` (`at_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_article
-- ----------------------------
INSERT INTO `nc_article` VALUES (1, '软件工程学院程序设计大赛', 0x3C703EE6AF94E8B59BE697B6E997B4EFBC9A34E69C8839E58FB73C2F703E3C703EE6AF94E8B59BE59CA8707461E5B9B3E58FB0E4B88AE4BDBFE794A86F6D73E79A84E79B91E88083E7B3BBE7BB9FE4BDBFE794A8E58F8CE69CBAE4BD8DE696B9E5BC8FE8BF9BE8A18CE7BABFE4B88AE88083E8AF95E380823C2F703E3C703EE783ADE8BAABE8B59BE5B086E59CA834E69C8831E58FB7E588B034E69C8832E58FB7E68BA9E69C9FE4B8BEE8A18C3C2F703E3C703EE68AA5E5908DE697B6E997B4E4B8BA33E69C883231E58FB7E688AAE6ADA2E588B033E69C883236E58FB7E6999A3234E782B93C2F703E3C703EE58F82E8B59BE8AFADE8A880E79086E8AEBAE4B88AE59D87E58FAFE4BDBFE794A8EFBC8CE4BD86E68EA8E88D90E4BDBFE794A8632F632B2B2C4A617661206F7220707974686F6E266E6273703B3C2F703E3C703EE58F82E8B59BE68890E58A9FE79A84E69DA1E4BBB6E4B8BAE887B3E5B0916163EFBC88E9809AE8BF87E68980E69C89E6B58BE8AF95E782B9EFBC89E4B880E98193E9A298E79BAEEFBC88E697A0E8AEBAE698AFE593AAE4B880E98193E9A298EFBC893C2F703E3C703EE68AA5E5908DE696B9E5BC8FEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283233302C20302C2030293B223EE59CA8E4B8AAE4BABAE4B8BBE9A1B5E5AE8CE59684E4B8AAE4BABAE69599E58AA1E4BFA1E681AFE5908EE8BF9BE8A18CE68AA5E5908DE58DB3E58FAF3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283233302C20302C2030293B223E3C7370616E20636C6173733D22716C2D637572736F72223EEFBBBF3C2F7370616E3E3C2F7370616E3E3C696D67207372633D222F70726F642D6170692F70726F66696C652F75706C6F61642F323032332F30342F30352F623231626230353166383139383631383136393533336636343965643265373338616434653666365F3230323330333239313035363135413030315F3230323330343035303031373433413030332E706E67223E3C2F703E, '/profile/upload/2023/03/29/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001.png', 2, 5, 50, 1590, '2023-03-28 22:34:36', 'admin', 'Y', '0');
INSERT INTO `nc_article` VALUES (3, 'VR数智谱新篇 志愿筑梦正当时', 0x3C703E09E69CACE7BD91E8AEAFEFBC88E696872FE4BD99E784B620E59BBE2FE89E8DE5AA92E4BD93E4B8ADE5BF8320E5AEA1E6A0B82FE6B19FE58D97EFBC89E5AE9CE4BABAE4B889E69C88EFBC8CE5BEAEE9A38EE98081E788BDE3808233266E6273703BE69C88266E6273703B3138266E6273703BE697A5E4B88AE58D88EFBC8CE6B19FE8A5BFE79086E5B7A5E5A4A7E5ADA6E59CA8E58D97E6988CE6A0A1E58CBAE59BBEE4B9A6E4BFA1E681AFE5A4A7E6A5BCE4B8BEE58A9EE4BA86E6B19FE8A5BFE79C81E8999AE68B9FE78EB0E5AE9EEFBC88562052266E6273703BEFBC89E4BAA7E4B89AE68A80E69CAFE5889BE696B0E68898E795A5E88194E79B9FE7ACACE58D81E69C9FE4B8BBE9A298E6B299E9BE99E69AA8E8999AE68B9FE78EB0E5AE9EE4BABAE6898DE698A5E5ADA3E4B893E59CBAE68B9BE88198E4BC9AE38082E8BDAFE4BBB6E5B7A5E7A88BE5ADA6E999A2E58585E58886E58F91E68CA5E5ADA6E7949FE4BC9AE4BBA5E58F8AE59084E59FBAE5B182E59BA2E694AFE983A8E38081E78FADE7BAA7E5ADA6E7949FE9AAA8E5B9B2E58A9BE9878FE69DA5E7A7AFE69E81E7ADB9E5A487E8BF99E59CBAE79B9BE4BC9AEFBC8CE59BA2E59198E99D92E5B9B4E4BBACE4B99FE58F91E68CA5E79D80E2809CE882AFE59083E88BA6E38081E58B87E68B85E5BD93E2809DE79A84E7B2BEE7A59EEFBC8CE7A7AFE69E81E68A95E585A5E588B0E4BC9AE8AEAEE5B883E7BDAEE79A84E585A8E8BF87E7A88BE4B8ADEFBC8CE4B8BAE68B9BE88198E4BC9AE79A84E59C86E6BBA1E58FACE5BC80E5A589E78CAEE4BA86E887AAE5B7B1E79A84E783ADE68385E4B88EE6B197E6B0B4E380823C2F703E3C703E09E4BC9AE8AEAEE58FACE5BC80E5898DE4B880E5A4A9EFBC8CE5BF97E684BFE88085E4BBACE5B0B1E5BC80E5A78BE7B4A7E994A3E5AF86E9BC93E59CB0E58786E5A487E79D80E38082E4BB96E4BBACE4B8A5E6A0BCE68C89E785A7E8A681E6B182E5819AE5A5BDE59084E9A1B9E5898DE69C9FE58786E5A487EFBC8CE4BB8EE69186E694BEE6A18CE6A485E38081E5AE89E68E92E5BAA7E4BD8DE38081E690ADE5BBBAE5B890E7AFB7E38081E4BC9AE8AEAEE69D90E69699E8A385E8A28BE38081E5B883E7BDAEE4B8BBE4BC9AE59CBAE38081E68C87E5BC95E6A0A1E59BADE8B7AFE7BABFE7AD89E7AD89EFBC8CE5B086E6AF8FE4B8AAE7BB86E88A82E890BDE588B0E5AE9EE5A484EFBC8CE4B8BAE7ACACE4BA8CE697A5E79A84E68B9BE88198E4BC9AE5819AE5A5BDE58585E58886E58786E5A487E380823C2F703E3C703E093C2F703E3C703E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F382F33462F30422F4135423737323738434343344636353646323541344538413139345F32334236444343335F39344442302E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F412F34412F39312F3242464537313330463345413134443435353242394632323533355F38333433464238445F39324538352E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C703E093C2F703E3C703E3C62723E3C2F703E3C703E090909E4BC9AE8AEAEE58FACE5BC80E4B98BE697A5EFBC8CE8B49FE8B4A3E59084E9A1B9E5B7A5E4BD9CE79A84E5BF97E684BFE88085E697A9E697A9E69DA5E588B0E78EB0E59CBAE38082E5AFB9E68EA5E68B9BE88198E4BC81E4B89AE79A84E5BF97E684BFE88085E8BAABE79D80E6ADA3E8A385EFBC8CE6ADA3E8A59FE7AB99E59CA8E6A0A1E997A8E58FA3E8BF8EE68EA5E59889E5AEBEE5928CE4BC81E4B89AEFBC8CE4BB96E4BBACE4B880E5AFB9E4B880E88194E7B3BBE4BC81E4B89AE5B9B6E68C87E5BC95E588B0E68B9BE88198E78EB0E59CBAEFBC9BE59CA8E68B9BE88198E4BC9AE8BF87E7A88BE4B8ADEFBC8CE4BB96E4BBACE585A8E7A88BE58099E59CBAEFBC8CE7A7AFE69E81E68F90E4BE9BE4B893E4B89AE69C8DE58AA1EFBC8CE5B8AEE58AA9E4BC81E4B89AE69BB4E5A5BDE59CB0E5AE8CE68890E68B9BE88198E5B7A5E4BD9CE38082E4BAA4E9809AE5BF97E684BFE88085E4BBACE4B99FE5BA94E68EA5E4B88DE69A87EFBC8CE4BB96E4BBACE6898BE68BBFE696B9E59091E6A087EFBC8CE7AB99E59CA8E59084E4B8AAE4BAA4E9809AE69EA2E7BABDE5A484E5BC95E5AFBCE8BDA6E8BE86E69C89E5BA8FE9A9B6E585A5EFBC8CE68890E4B8BAE5928CE8B090E6A0A1E59BADE4B8ADE4B880E98193E4BAAEE4B8BDE79A84E9A38EE699AFE7BABFE38082E59CA8E68B9BE88198E4BC9AE78EB0E59CBAEFBC8CE5BF97E684BFE88085E4BBACE7AB99E59CA8E59BBEE4B9A6E9A686E5A4A7E6A5BCE585A5E58FA3E58F8AE4B8BBE4BC9AE59CBAE997A8E58FA3E7AD89E59084E4B8AAE59CB0E696B9EFBC8CE4BB96E4BBACE783ADE68385E68EA5E5BE85E68980E69C89E588B0E59CBAE4BABAE59198EFBC8CE58F91E694BEE4BC9AE8AEAEE8A28BEFBC8CE58D8FE58AA9E59889E5AEBEE7869FE68289E59CBAE59CB0E78EAFE5A283EFBC8CE8A7A3E7AD94E59889E5AEBEE79691E997AEE38082E6B299E9BE99E4BC9AE8AEAEE5928CE68B9BE88198E4BC9AE4BA95E784B6E69C89E5BA8FE59CB0E8BF9BE8A18CE79D80E380823C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E09090909090909093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F412F44382F46322F3146314142354137303234333445443341464438464241354533425F34444243384132415F39323334462E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F412F41412F41452F4233413835443644414436394335424530343944353444444335315F39303139433431315F37453235342E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F462F35342F44352F4241433734304445344441434644373533463934314643394442365F31354233443130335F38383834382E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F452F45302F34392F4145393835393536433438313933433139374232413739343944375F36383331333845345F38343645372E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F422F30462F33422F3435433538434245434443373741333646303831313230314343425F33333731304136435F38313344392E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F322F33302F31392F3231303431453144424343303046453745424246334334383837305F44354638323331455F38433430462E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C703E09E8BF99E6ACA1E79A84E5BF97E684BFE6B4BBE58AA8E4B88DE4BB85E8AEA9E5908CE5ADA6E4BBACE69C89E4BA86E4B88DE4B880E6A0B7E79A84E4BD93E9AA8CEFBC8CE69BB4E8AEA9E8AEB8E5A49AE8BDAFE5B7A5E5ADA6E5AD90E4BA86E8A7A3E588B0E4BA86E8999AE68B9FE78EB0E5AE9EE4BAA7E4B89AE79A84E5898DE699AFE58F91E5B195E38082E8999AE68B9FE78EB0E5AE9EE4B893E4B89AE79A84E5BF97E684BFE88085E4BBACE8A1A8E7A4BAEFBC9AE2809CE6ADA4E6ACA1E5BF97E684BFE6B4BBE58AA8E698AFE4B880E6ACA1E99ABEE5BF98E79A84E7BB8FE58E86EFBC8CE68891E4BBACE4B88DE4BB85E6849FE58F97E588B0E4BA86E8999AE68B9FE78EB0E5AE9EE68A80E69CAFE79A84E9AD85E58A9BEFBC8CE6B7B1E588BBE4BD93E4BC9AE588B0E8999AE68B9FE78EB0E5AE9EE68A80E69CAFE79A84E4BBB7E580BCEFBC8CE68891E4BBACE4B99FE69BB4E58AA0E59D9AE5AE9AE4BA86E8999AE68B9FE78EB0E5AE9EE4B893E4B89AE69CAAE69DA5E58FAFE69C9FE38082E2809D3C2F703E3C703E093C2F703E3C703E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F352F38322F32332F4144433543333735344442444631443436304445343038304542465F38393246333334335F37333845302E706E67222077696474683D22353030223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C703E093C2F703E3C703E0909E69CACE6ACA1E68B9BE88198E4BC9AE4B88DE4BB85E4B8BAE68891E999A2E5BA94E5B18AE7949FE68F90E4BE9BE4BA86E4B880E4B8AAE889AFE5A5BDE79A84E5B0B1E4B89AE5B9B3E58FB0EFBC8CE4B99FE8AEA9E68891E999A2E5ADA6E5AD90E5AFB9E8999AE68B9FE78EB0E5AE9EE4B893E4B89AE69C89E4BA86E69BB4E6B7B1E79A84E4BA86E8A7A3EFBC8CE5AFB9E8999AE68B9FE78EB0E5AE9EE68A80E69CAFE69C89E79D80E7BE8EE5A5BDE79A84E686A7E686ACE4B88EE5B195E69C9BE38082E8999AE68B9FE78EB0E5AE9EE68A80E69CAFE4BD9CE4B8BAE69CAAE69DA5E8BDAFE4BBB6E9A286E59F9FE79A84E9878DE8A681E58F91E5B195E8B68BE58ABFE4B98BE4B880E38082E68891E4BBACE79BB8E4BFA1EFBC8CE5AE83E5B086E8AEA9E68891E4BBACE79A84E7949FE6B4BBE58F98E5BE97E69BB4E58AA0E4B8B0E5AF8CE5A49AE5BDA9EFBC8CE4B8BAE68891E4BBACE79A84E697A5E5B8B8E7949FE6B4BBE68F90E4BE9BE69BB4E5A49AE79A84E58FAFE883BDE680A7E38082E8BDAFE4BBB6E5B7A5E7A88BE5ADA6E999A2E69C9FE5BE85E79D80E4B88EE59084E4B8AAE9AB98E6A0A1E5ADA6E999A2E4BBA5E58F8AE59084E4BC81E4B89AE585B1E5908CE68EA8E8BF9BE8999AE68B9FE78EB0E5AE9EE68A80E69CAFE79A84E58F91E5B195EFBC8CE59FB9E585BBE587BAE69BB4E5A49AE4BC98E7A780E79A845652E4BABAE6898DEFBC8CE4B8BAE68EA8E58AA8E6B19FE8A5BFE79C81E8999AE68B9FE78EB0E5AE9EE68A80E69CAFE58F8AE8BDAFE4BBB6E9A286E59F9FE58F91E5B195E8B4A1E78CAEE58A9BE9878FE380823C2F703E, '/profile/upload/2023/03/28/A5B77278CCC4F656F25A4E8A194_23B6DCC3_94DB0_20230328225239A001.png', 1, 0, 0, 7, '2023-03-28 22:52:44', 'admin', 'Y', '0');
INSERT INTO `nc_article` VALUES (4, '我院教工、学生支部组织观看学习《榜样7》专题节目', 0x3C703E09E69CACE7BD91E8AEAF28E696872FE8B596E5BFA0E58B87E38081E69D8EE69687E881AA20E59BBE2FE9BB84E9B8A3E69DB020E5AEA1E6A0B82FE6B19FE58D972920E4B8BAE69BB4E5A5BDE58F91E68CA5E5859AE59198E38081E5B9B2E983A8E6A8A1E88C83E5B8A6E5A4B4E4BD9CE794A8EFBC8CE4B8BAE585A8E99DA2E5BBBAE8AEBEE7A4BEE4BC9AE4B8BBE4B989E78EB0E4BBA3E58C96E59BBDE5AEB6E38081E585A8E99DA2E68EA8E8BF9BE4B8ADE58D8EE6B091E6978FE4BC9FE5A4A7E5A48DE585B4E5879DE8819AE5BCBAE5A4A7E58A9BE9878FEFBC8C33E69C883235E697A5E6999AEFBC8CE8BDAFE4BBB6E5B7A5E7A88BE5ADA6E999A2E38094E59C9FE69CA8E4B88EE6B58BE7BB98E5B7A5E7A88BE5ADA6E999A228E58D97E6988C29E38095E7A094E7A9B6E7949FE5859AE694AFE983A8E38081E69CACE7A791E7949FE7ACACE4B880E5859AE694AFE983A8E38081E69CACE7A791E7949FE7ACACE4BA8CE5859AE694AFE983A8E5928CE69CACE7A791E7949FE7ACACE4B889E5859AE694AFE983A8E7BB84E7BB87E5ADA6E999A2E5ADA6E7949FE5859AE59198E4BBA3E8A1A8E59CA831313033E69599E5AEA4E8A782E79C8BE794B1E4B8ADE5A4AEE7BB84E7BB87E983A8E5928CE4B8ADE5A4AEE5B9BFE692ADE794B5E8A786E680BBE58FB0E88194E59088E588B6E4BD9CE79A84E3808AE6A69CE6A0B737E3808BE4B893E9A298E88A82E79BAEEFBC8CE59084E69599E5B7A5E5859AE694AFE983A8E5859AE59198E887AAE4B8BBE8A782E79C8BE380823C2F703E3C703E09E69CACE69C9FE88A82E79BAEE98280E8AFB7E4BA86E4B8ADE59BBDE5A5B3E680A7E5A4AAE7A9BAE8A18CE8B5B0E7ACACE4B880E4BABAE78E8BE4BA9AE5B9B3EFBC8CE5B8A6E9A286E69D91E6B091E8B5B0E59091E585B1E5908CE5AF8CE8A395E98193E8B7AFE79A84E78E8BE4BCA0E5969CEFBC8CE68BA5E69C89E58CA0E4BABAE7B2BEE7A59EE38081E694BBE5858BE8AEB8E5A49AE59BBDE5AEB6E9878DE5A4A7E5BBBAE8AEBEE7848AE68EA5E68A80E69CAFE79A84E889BEE788B1E59BBDEFBC8CE4B880E8BE88E5AD90E5BD93E88081E5B888E38081E4B880E8BE88E5AD90E5ADA6E5BD93E5A5BDE88081E5B888E79A84E5BCA0E78E89E6BB9AEFBC8CE68898E8839CE4BCA4E79785E38081E4B8BAE59BBDE4BA89E58589E79A84E5A5A5E8BF90E586A0E5869BE6ADA6E5A4A7E99D96EFBC8CE2809CE782B9E88D89E68890E98791E2809DE5B8A6E9A286E884B1E8B4ABE887B4E5AF8CE79A84E69E97E58DA0E786BAEFBC8CE59D9AE5AE88E5B9B3E587A1E5B297E4BD8DE38081E4B88EE7BEA4E4BC97E585B1E591BCE590B8E5BF83E8BF9EE5BF83E79A84E4BABAE6B091E8ADA6E5AF9FE5AD9FE69886E78E89EFBC8CE6898EE6A0B9E69DA1E4BBB6E889B0E88BA6E79A84E4BDB3E58EBFEFBC8CE59D9AE68C81E6B2BBE79785E69591E4BABAE79A84E8B7AFE7949FE6A285E7AD8938E4BD8DE5859AE79A84E4BA8CE58D81E5A4A7E4BBA3E8A1A8E58F82E58AA0E5BD95E588B6EFBC8CE9809AE8BF87E585B8E59E8BE4BA8BE8BFB9E5B195E7A4BAE38081E78EB0E59CBAE8AEBFE8B088E38081E9878DE6B8A9E585A5E5859AE8AA93E8AF8DE7AD89E5BDA2E5BC8FEFBC8CE7949FE58AA8E5B195E78EB0E4B8ADE59BBDE585B1E4BAA7E5859AE4BABAE59D9AE5AE9AE4BFA1E5BFB5E38081E8B7B5E8A18CE5AE97E697A8E38081E68BBCE6908FE5A589E78CAEE38081E5BB89E6B481E5A589E585ACE79A84E9AB98E5B09AE59381E8B4A8E5928CE7B2BEE7A59EE9A38EE8B28CEFBC8CE5BDB0E698BEE4BA86E59FBAE5B182E5859AE7BB84E7BB87E68898E69697E5A0A1E59E92E4BD9CE794A8E5928CE5859AE59198E58588E9948BE6A8A1E88C83E4BD9CE794A8EFBC8CE698AFE6AF8FE4B880E4BD8DE5859AE59198E5ADA6E4B9A0E79A84E58589E8BE89E6A69CE6A0B7E380823C2F703E3C703E09E7AB8BE5BF97E8808CE59CA3E58899E59CA3E79FA3EFBC8CE7AB8BE5BF97E8808CE8B4A4E58899E8B4A4E79FA3E38082E69CACE6ACA1E8A782E5BDB1E5ADA6E4B9A0E6B4BBE58AA8EFBC8CE4BDBFE5BE97E6AF8FE4B880E4BD8DE5859AE59198E69BB4E58AA0E6B7B1E588BBE4BA86E8A7A3E6A69CE6A0B7E79A84E68890E995BFE58FB2EFBC8CE5B8AEE58AA9E5BC95E5AFBCE69599E5B888E38081E5ADA6E7949FE5859AE59198E4BBACE5ADA6E4B9A0E697B6E4BBA3E6A69CE6A0B7EFBC8CE6A091E7AB8BE6ADA3E7A1AEE4BC9FE5A4A7E6A2A6E683B3EFBC8CE8B7B5E8A18CE585A5E5859AE5889DE5BF83EFBC8CE6B1B2E58F96E5898DE8A18CE58AA8E58A9BE380823C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F372F39422F33432F4133354145323735353437344132334642363446433033423043345F33434436383833355F44433531322E706E67223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F352F38352F37382F3541393743414144363739413633304131384539374544333433385F45394236313436385F31334246342E706E67223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F372F45452F34442F3643454232424338394639453041304241374634303739453645365F45354536443744425F46464342312E706E67223E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E3C62723E3C2F703E3C7020636C6173733D22716C2D616C69676E2D63656E746572223E093C696D67207372633D2268747470733A2F2F6E63726A67632E6A787573742E6564752E636E2F5F5F6C6F63616C2F332F46352F31452F3946333432413331303431313736433243373439313936364439415F41464538444238385F31333031312E706E67223E3C2F703E, '/profile/upload/2023/03/28/A35AE2755474A23FB64FC03B0C4_3CD68835_DC512_20230328225727A001.png', 1, 0, 0, 25, '2023-03-28 22:57:31', 'admin', 'Y', '0');

-- ----------------------------
-- Table structure for nc_article_type
-- ----------------------------
DROP TABLE IF EXISTS `nc_article_type`;
CREATE TABLE `nc_article_type`  (
  `at_id` int NOT NULL AUTO_INCREMENT COMMENT '文章类别ID',
  `parent_id` int NULL DEFAULT NULL COMMENT '父ID',
  `at_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章类别名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0：正常1：禁用)',
  PRIMARY KEY (`at_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_article_type
-- ----------------------------
INSERT INTO `nc_article_type` VALUES (1, NULL, '新闻', '2023-03-28 21:36:06', 'admin', '0');
INSERT INTO `nc_article_type` VALUES (2, NULL, '竞赛', '2023-03-28 21:36:13', 'admin', '0');

-- ----------------------------
-- Table structure for nc_contest
-- ----------------------------
DROP TABLE IF EXISTS `nc_contest`;
CREATE TABLE `nc_contest`  (
  `contest_id` bigint NOT NULL AUTO_INCREMENT COMMENT '比赛ID',
  `contest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比赛标题',
  `contest_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比赛内容',
  `contest_desc` blob NULL COMMENT '描述',
  `contest_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比赛时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `contest_flows` int NULL DEFAULT NULL COMMENT '浏览量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0取消1正常',
  PRIMARY KEY (`contest_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_contest
-- ----------------------------
INSERT INTO `nc_contest` VALUES (1, '软件工程学院程序设计大赛开始报名啦', '/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png', 0x3C703EE6AF94E8B59BE697B6E997B4EFBC9A34E69C8839E58FB73C2F703E3C703EE6AF94E8B59BE59CA8707461E5B9B3E58FB0E4B88AE4BDBFE794A86F6D73E79A84E79B91E88083E7B3BBE7BB9FE4BDBFE794A8E58F8CE69CBAE4BD8DE696B9E5BC8FE8BF9BE8A18CE7BABFE4B88AE88083E8AF95E380823C2F703E3C703EE783ADE8BAABE8B59BE5B086E59CA834E69C8831E58FB7E588B034E69C8832E58FB7E68BA9E69C9FE4B8BEE8A18C3C2F703E3C703EE68AA5E5908DE697B6E997B4E4B8BA33E69C883231E58FB7E688AAE6ADA2E588B033E69C883236E58FB7E6999A3234E782B93C2F703E3C703EE58F82E8B59BE8AFADE8A880E79086E8AEBAE4B88AE59D87E58FAFE4BDBFE794A8EFBC8CE4BD86E68EA8E88D90E4BDBFE794A8632F632B2B2C4A617661206F7220707974686F6E266E6273703B3C2F703E3C703EE58F82E8B59BE68890E58A9FE79A84E69DA1E4BBB6E4B8BAE887B3E5B0916163EFBC88E9809AE8BF87E68980E69C89E6B58BE8AF95E782B9EFBC89E4B880E98193E9A298E79BAEEFBC88E697A0E8AEBAE698AFE593AAE4B880E98193E9A298EFBC893C2F703E3C703EE68AA5E5908DE69DA1E4BBB6E4B8BAEFBC9A3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE8AFB7E58588E5AE8CE59684E4B8AAE4BABAE69599E58AA1E4BFA1E681AFE4BF9DE5AD98E5908EE6898DE58FAFE4BBA5E68AA5E5908D28E4B880E5AE9AE8A681E8AEB0E5BE97E5A1ABE58699E5AE8CE68890E5908EE782B9E587BBE4BF9DE5AD98E68C89E992AEEFBC893C2F7370616E3E3C2F703E3C703EEFBBBF3C696D67207372633D222F70726F642D6170692F70726F66696C652F75706C6F61642F323032332F30342F30352F623231626230353166383139383631383136393533336636343965643265373338616434653666365F3230323330333239313035363135413030315F3230323330343035323230323338413030312E706E67223E3C2F703E, '2023-03-28 ,2023-04-10 ', '2023-04-03 14:36:01', NULL, 62, '0');

-- ----------------------------
-- Table structure for nc_discuss
-- ----------------------------
DROP TABLE IF EXISTS `nc_discuss`;
CREATE TABLE `nc_discuss`  (
  `discuss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `ancestors` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '祖级列表',
  `discuss_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '评论内容',
  `discuss_images` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '评论图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `relate_id` bigint NULL DEFAULT NULL COMMENT '关联文章id',
  `create_uid` bigint NULL DEFAULT NULL COMMENT '评论者id',
  `discuss_likes` int NULL DEFAULT NULL COMMENT '评论赞',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0：正常1：代表删除）',
  PRIMARY KEY (`discuss_id`) USING BTREE,
  INDEX `relate_id`(`relate_id`) USING BTREE,
  INDEX `create_uid`(`create_uid`) USING BTREE,
  CONSTRAINT `nc_discuss_ibfk_1` FOREIGN KEY (`relate_id`) REFERENCES `nc_topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nc_discuss_ibfk_2` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_discuss
-- ----------------------------
INSERT INTO `nc_discuss` VALUES (103, 0, NULL, '你好', NULL, '2023-04-04 09:40:38', 23, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (104, 0, NULL, '你也好', NULL, '2023-04-04 11:07:15', 23, 93, 0, '1');
INSERT INTO `nc_discuss` VALUES (107, 0, NULL, '你好', NULL, '2023-04-05 10:55:09', 44, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (108, 0, NULL, '你好', NULL, '2023-04-05 10:55:17', 25, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (109, 0, NULL, '你好', NULL, '2023-04-05 11:02:25', 44, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (110, 0, NULL, '你好', NULL, '2023-04-05 11:02:41', 44, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (111, 0, NULL, '你好', NULL, '2023-04-05 11:03:20', 44, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (112, 0, NULL, '你好', NULL, '2023-04-05 11:03:33', 44, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (113, 0, NULL, '如果大家在使用过程中遇到bug可以在评论区留言，或者点击右上角进行反馈', NULL, '2023-04-05 17:21:53', 45, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (114, 0, NULL, '习近平', NULL, '2023-04-05 19:14:15', 45, 93, 0, '1');
INSERT INTO `nc_discuss` VALUES (115, 0, NULL, '谢谢', NULL, '2023-04-05 20:33:32', 45, 93, 0, '1');
INSERT INTO `nc_discuss` VALUES (116, 0, NULL, '你好', NULL, '2023-04-05 21:08:29', 45, 93, 0, '0');
INSERT INTO `nc_discuss` VALUES (117, 116, '116', '你好', NULL, '2023-04-05 21:08:37', 45, 95, 0, '0');
INSERT INTO `nc_discuss` VALUES (118, 0, NULL, '习近平', NULL, '2023-04-05 21:10:13', 45, 95, 0, '1');

-- ----------------------------
-- Table structure for nc_enroll
-- ----------------------------
DROP TABLE IF EXISTS `nc_enroll`;
CREATE TABLE `nc_enroll`  (
  `enroll_id` bigint NOT NULL AUTO_INCREMENT COMMENT '申请表ID',
  `enroll_uid` bigint NULL DEFAULT NULL COMMENT '申请者ID',
  `enroll_cid` bigint NULL DEFAULT NULL COMMENT '申请项目',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '申请状态(0申请成功1申请失败）',
  `Auditor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核员',
  PRIMARY KEY (`enroll_id`) USING BTREE,
  INDEX `enroll_uid`(`enroll_uid`) USING BTREE,
  INDEX `enroll_cid`(`enroll_cid`) USING BTREE,
  CONSTRAINT `nc_enroll_ibfk_1` FOREIGN KEY (`enroll_uid`) REFERENCES `nc_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nc_enroll_ibfk_2` FOREIGN KEY (`enroll_cid`) REFERENCES `nc_contest` (`contest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_enroll
-- ----------------------------
INSERT INTO `nc_enroll` VALUES (11, 100, 1, '2023-04-04 19:53:53', '0', NULL);
INSERT INTO `nc_enroll` VALUES (12, 96, 1, '2023-04-05 10:21:14', '0', NULL);
INSERT INTO `nc_enroll` VALUES (23, 93, 1, '2023-04-05 12:06:03', '0', NULL);
INSERT INTO `nc_enroll` VALUES (24, 95, 1, '2023-04-05 21:11:58', '0', NULL);
INSERT INTO `nc_enroll` VALUES (25, 102, 1, '2023-04-06 10:38:26', '0', NULL);

-- ----------------------------
-- Table structure for nc_token
-- ----------------------------
DROP TABLE IF EXISTS `nc_token`;
CREATE TABLE `nc_token`  (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `token_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `token_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nc_token
-- ----------------------------
INSERT INTO `nc_token` VALUES (1, '腾讯微信小程序Token', '67_KPqmi1ycoUK3liex9-opZaDcsHvL2ZyhivCTt-yG2pK7F6X3I0MY9X3ot4YpQin-pWmFub0eleIPxuXUBCChdalQdjDN-Ji0ztyqsLyEX2fbzFkBqhQAL7bZWEQIUScABAWIG', '2023-04-04 13:09:18', '2023-04-06 11:00:00', '0');

-- ----------------------------
-- Table structure for nc_topic
-- ----------------------------
DROP TABLE IF EXISTS `nc_topic`;
CREATE TABLE `nc_topic`  (
  `topic_id` bigint NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '话题标题',
  `topic_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '话题内容',
  `topic_images` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '话题图片',
  `topic_videos` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '话题视频',
  `topic_stars` int NULL DEFAULT NULL COMMENT '收藏量',
  `topic_likes` int NULL DEFAULT NULL COMMENT '点赞量',
  `topic_flows` int NULL DEFAULT NULL COMMENT '浏览量',
  `topic_type_id` bigint NULL DEFAULT NULL COMMENT '所属类别',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_uid` bigint NULL DEFAULT NULL COMMENT '创建者',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常：1删除）',
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `1`(`create_uid`) USING BTREE,
  INDEX `topic_type_id`(`topic_type_id`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nc_topic_ibfk_1` FOREIGN KEY (`topic_type_id`) REFERENCES `nc_topic_type` (`tt_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_topic
-- ----------------------------
INSERT INTO `nc_topic` VALUES (23, NULL, '小程序上线啦', '/profile/upload/2023/04/04/tmp_9aa145a50e7a0e6752c39fbcd99ec4e6_20230404093918A004.jpg', NULL, 0, 0, 0, 1, '2023-04-04 09:39:22', 93, '1');
INSERT INTO `nc_topic` VALUES (25, NULL, '测试bug', '/profile/upload/2023/04/04/tmp_00af4c4b2dd784fa2dccfd0edad5e201_20230404110936A005.jpg,/profile/upload/2023/04/05/tmp_9b37d54af99f08f5f790365cd9f0e557_20230405172003A002.jpg', NULL, 0, 0, 0, 5, '2023-04-04 11:09:42', 93, '1');
INSERT INTO `nc_topic` VALUES (26, NULL, 'test', '', NULL, 0, 0, 0, 1, '2023-04-04 11:09:59', 93, '1');
INSERT INTO `nc_topic` VALUES (27, NULL, 'test', '', NULL, 0, 0, 0, 1, '2023-04-04 11:12:19', 93, '1');
INSERT INTO `nc_topic` VALUES (28, NULL, 'test', '', NULL, 0, 0, 0, 1, '2023-04-04 11:14:23', 93, '1');
INSERT INTO `nc_topic` VALUES (29, NULL, '1', '', NULL, 0, 0, 0, 1, '2023-04-04 11:22:45', 93, '1');
INSERT INTO `nc_topic` VALUES (30, NULL, '1111', '', NULL, 0, 0, 0, 2, '2023-04-04 11:27:13', 93, '1');
INSERT INTO `nc_topic` VALUES (31, NULL, '12313', '', NULL, 0, 0, 0, 1, '2023-04-04 11:27:52', 93, '1');
INSERT INTO `nc_topic` VALUES (32, NULL, 'adadwadawd', '', NULL, 0, 0, 0, 2, '2023-04-04 11:28:45', 93, '1');
INSERT INTO `nc_topic` VALUES (33, NULL, 'sdadadsada', '', NULL, 0, 0, 0, 1, '2023-04-04 11:29:24', 93, '1');
INSERT INTO `nc_topic` VALUES (34, NULL, '你好', '', NULL, 0, 0, 0, 2, '2023-04-04 11:30:02', 93, '1');
INSERT INTO `nc_topic` VALUES (35, NULL, '搭建', '', NULL, 0, 0, 0, 1, '2023-04-04 11:30:22', 93, '1');
INSERT INTO `nc_topic` VALUES (36, NULL, '金额金额', '', NULL, 0, 0, 0, 1, '2023-04-04 11:30:48', 93, '1');
INSERT INTO `nc_topic` VALUES (37, NULL, '挖的撒', '', NULL, 0, 0, 0, 1, '2023-04-04 11:31:16', 93, '1');
INSERT INTO `nc_topic` VALUES (38, NULL, 'asdad', '', NULL, 0, 0, 0, 1, '2023-04-04 11:32:57', 93, '1');
INSERT INTO `nc_topic` VALUES (39, NULL, 'asdadsasdasdasdadsasd', '', NULL, 0, 0, 0, 1, '2023-04-04 11:36:29', 93, '1');
INSERT INTO `nc_topic` VALUES (40, NULL, '总结', '', NULL, 0, 0, 0, 1, '2023-04-04 11:37:23', 93, '1');
INSERT INTO `nc_topic` VALUES (41, NULL, '考试', '', NULL, 0, 0, 0, 1, '2023-04-04 11:38:07', 93, '1');
INSERT INTO `nc_topic` VALUES (42, NULL, '习近平', '', NULL, 0, 0, 0, 1, '2023-04-04 19:02:58', 96, '1');
INSERT INTO `nc_topic` VALUES (43, NULL, '毛泽东', '', NULL, 0, 0, 0, 1, '2023-04-05 00:14:57', 93, '1');
INSERT INTO `nc_topic` VALUES (44, NULL, 'test', '', NULL, 0, 0, 0, 1, '2023-04-05 10:22:53', 93, '1');
INSERT INTO `nc_topic` VALUES (45, NULL, '欢迎大家测试，如有问题可以在评论区留言～', '/profile/upload/2023/04/05/tmp_0eea804c8257e3eca7ee4f0342a0e05c_20230405172003A001.jpg', NULL, 0, 0, 132, 5, '2023-04-05 17:20:18', 93, '0');

-- ----------------------------
-- Table structure for nc_topic_type
-- ----------------------------
DROP TABLE IF EXISTS `nc_topic_type`;
CREATE TABLE `nc_topic_type`  (
  `tt_id` bigint NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `tt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类别名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0：正常1：禁用)',
  `tt_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`tt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_topic_type
-- ----------------------------
INSERT INTO `nc_topic_type` VALUES (0, '全部', '2023-03-28 18:29:54', NULL, '0', NULL);
INSERT INTO `nc_topic_type` VALUES (1, '竞赛', '2023-03-29 21:30:02', NULL, '0', NULL);
INSERT INTO `nc_topic_type` VALUES (2, '学习', '2023-03-29 21:30:11', NULL, '0', NULL);
INSERT INTO `nc_topic_type` VALUES (3, '吐槽', '2023-03-29 21:30:17', NULL, '0', NULL);
INSERT INTO `nc_topic_type` VALUES (4, '表白', '2023-03-29 21:30:24', NULL, '0', NULL);
INSERT INTO `nc_topic_type` VALUES (5, '其他', '2023-03-29 21:30:49', NULL, '0', NULL);

-- ----------------------------
-- Table structure for nc_user
-- ----------------------------
DROP TABLE IF EXISTS `nc_user`;
CREATE TABLE `nc_user`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT '用户UID',
  `u_nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户网名',
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户姓名',
  `u_sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '2' COMMENT '用户性别（0男 1女 2未知）',
  `u_xh` bigint NULL DEFAULT NULL COMMENT '学号',
  `u_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户介绍',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `u_department` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院',
  `u_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业',
  `u_className` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '班级',
  `u_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'qq',
  `u_idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'email',
  `u_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `u_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户类别',
  `create_time` datetime NULL DEFAULT NULL COMMENT '用户创建时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0：正常1：禁用)',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'wx小程序标识用户id',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_user
-- ----------------------------
INSERT INTO `nc_user` VALUES (93, '白桦', '许肖阳', '0', 5720191930, 'while（true）i=i++', NULL, '江西理工大学', '软件工程学院(土测学院南昌)', '软件开发193班', NULL, NULL, '1347456958@qq.com', '/profile/upload/2023/04/05/tmp_6138bb298d8730ee4c99b8d739f828ce_20230405185742A003.jpg', '管理员', '2023-03-29 17:37:58', '0', 'o-arR5GC3ioJIJalQMLjG3m06yxY', NULL);
INSERT INTO `nc_user` VALUES (95, 'L', '刘江', '1', 5720191930, NULL, NULL, '江西理工大学', '软件工程学院(土测学院南昌)', '软件土木191', NULL, NULL, NULL, '/profile/upload/2023/04/01/tmp_ec4bc0a2ed525ef490c27eb7ed6be3a4_20230401203937A001.jpg', NULL, '2023-04-01 20:39:40', '0', 'o-arR5NrG40-ZlXjiRkzrOWT8OFI', NULL);
INSERT INTO `nc_user` VALUES (96, '许世平', '许世平', '0', 5720191929, '死亡如风', NULL, '江西理工大学', '法学院', '软件开发193班', NULL, NULL, '10201@qq.com', '/profile/upload/2023/04/01/tmp_6d5fdcb96e207ed3ea3920fd7bf0b61f05307c1a225949e8_20230401222010A003.jpg', NULL, '2023-04-01 22:20:16', '0', 'o-arR5NVDK77xZnYSLypuaPtVPGY', NULL);
INSERT INTO `nc_user` VALUES (97, '柳汛', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/profile/upload/2023/04/03/tmp_e23f7440fc5df5452070b7bc2fda60d6b6b749c2f1b62f86_20230403103139A001.jpg', NULL, '2023-04-03 10:31:43', '0', 'o-arR5ORiiZxJVWCt3zxdkn8Q3Hk', NULL);
INSERT INTO `nc_user` VALUES (98, '刘述民', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/profile/upload/2023/04/03/tmp_0985cdbfb042b0febdfdc5e71597591488982b8354a78033_20230403112920A005.jpg', '老师', '2023-04-03 11:29:25', '0', 'o-arR5OQ500NadAqB4-QcVi0uCBU', NULL);
INSERT INTO `nc_user` VALUES (99, '吴俊华', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/profile/upload/2023/04/03/tmp_f46c62382049edd637be413beb979799_20230403113000A006.jpg', '老师', '2023-04-03 11:30:05', '0', 'o-arR5GQk_HXuuFlWFzXf87a5sxk', NULL);
INSERT INTO `nc_user` VALUES (100, 'yyyyyyy', '杨', '2', 5720191328, NULL, NULL, '江西理工大学', '软件工程学院(土测学院南昌)', '大数据191', NULL, NULL, NULL, '/profile/upload/2023/04/04/tmp_75639aec49e1c115e3166de2e5ff251f00d10b13cadd0d32_20230404194821A011.jpg', NULL, '2023-04-04 19:48:27', '0', 'o-arR5F2Jbkh42l6uTsl7JOVOZek', NULL);
INSERT INTO `nc_user` VALUES (101, '一路随风飘', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/profile/upload/2023/04/05/tmp_319031685658fc46edc3efac9c82fdfd_20230405090108A004.jpg', NULL, '2023-04-05 09:01:12', '0', 'o-arR5M0eDRwch5Q4WcH8rn0C2-M', NULL);
INSERT INTO `nc_user` VALUES (102, '王家康', '王家康', '0', 5720191923, NULL, NULL, '江西理工大学', '软件工程学院(土测学院南昌)', '软件开发193班', NULL, NULL, NULL, '/profile/upload/2023/04/05/tmp_c765e813f2e51cc44fa302f97d573e4a12b9906373936fb2_20230405211149A001.jpg', NULL, '2023-04-05 21:12:12', '0', 'o-arR5OVf0Tg132xFoY5tyF5h7gA', NULL);

-- ----------------------------
-- Table structure for nc_user_type
-- ----------------------------
DROP TABLE IF EXISTS `nc_user_type`;
CREATE TABLE `nc_user_type`  (
  `ut_id` int NOT NULL AUTO_INCREMENT COMMENT '用户类别ID',
  `ut_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户类别名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0：正常1：停用）',
  PRIMARY KEY (`ut_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_user_type
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-28 14:31:39', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '江西理工大学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '软件工程学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '商学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件开发191', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '软件开发192', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '软件开发193', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '软件开发194', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '大数据191', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '财务管理191', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务管理192', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '0 0/59 * * * ?', '1', '1', '0', 'admin', '2023-04-04 15:03:35', 'admin', '2023-04-05 10:25:50', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：854毫秒', '0', '', '2023-04-04 15:04:25');
INSERT INTO `sys_job_log` VALUES (2, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：370毫秒', '0', '', '2023-04-05 10:24:19');
INSERT INTO `sys_job_log` VALUES (3, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：327毫秒', '0', '', '2023-04-05 10:59:00');
INSERT INTO `sys_job_log` VALUES (4, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：2296毫秒', '0', '', '2023-04-05 10:59:03');
INSERT INTO `sys_job_log` VALUES (5, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：310毫秒', '0', '', '2023-04-05 11:00:00');
INSERT INTO `sys_job_log` VALUES (6, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：386毫秒', '0', '', '2023-04-05 11:00:01');
INSERT INTO `sys_job_log` VALUES (7, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：806毫秒', '0', '', '2023-04-05 11:59:01');
INSERT INTO `sys_job_log` VALUES (8, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：359毫秒', '0', '', '2023-04-05 12:00:00');
INSERT INTO `sys_job_log` VALUES (9, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：329毫秒', '0', '', '2023-04-05 12:59:00');
INSERT INTO `sys_job_log` VALUES (10, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：326毫秒', '0', '', '2023-04-05 13:00:00');
INSERT INTO `sys_job_log` VALUES (11, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：340毫秒', '0', '', '2023-04-05 13:59:00');
INSERT INTO `sys_job_log` VALUES (12, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：384毫秒', '0', '', '2023-04-05 14:00:00');
INSERT INTO `sys_job_log` VALUES (13, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：345毫秒', '0', '', '2023-04-05 14:59:00');
INSERT INTO `sys_job_log` VALUES (14, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：327毫秒', '0', '', '2023-04-05 15:00:00');
INSERT INTO `sys_job_log` VALUES (15, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：1044毫秒', '0', '', '2023-04-05 15:59:01');
INSERT INTO `sys_job_log` VALUES (16, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：405毫秒', '0', '', '2023-04-05 16:00:00');
INSERT INTO `sys_job_log` VALUES (17, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：344毫秒', '0', '', '2023-04-05 16:59:00');
INSERT INTO `sys_job_log` VALUES (18, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：359毫秒', '0', '', '2023-04-05 17:00:00');
INSERT INTO `sys_job_log` VALUES (19, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：434毫秒', '0', '', '2023-04-05 17:59:00');
INSERT INTO `sys_job_log` VALUES (20, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：414毫秒', '0', '', '2023-04-05 18:00:00');
INSERT INTO `sys_job_log` VALUES (21, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：387毫秒', '0', '', '2023-04-05 18:59:00');
INSERT INTO `sys_job_log` VALUES (22, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：368毫秒', '0', '', '2023-04-05 19:00:00');
INSERT INTO `sys_job_log` VALUES (23, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：366毫秒', '0', '', '2023-04-05 19:59:00');
INSERT INTO `sys_job_log` VALUES (24, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：757毫秒', '0', '', '2023-04-05 20:00:01');
INSERT INTO `sys_job_log` VALUES (25, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：868毫秒', '0', '', '2023-04-05 20:59:01');
INSERT INTO `sys_job_log` VALUES (26, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：392毫秒', '0', '', '2023-04-05 21:00:00');
INSERT INTO `sys_job_log` VALUES (27, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：347毫秒', '0', '', '2023-04-05 21:59:00');
INSERT INTO `sys_job_log` VALUES (28, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：379毫秒', '0', '', '2023-04-05 22:00:00');
INSERT INTO `sys_job_log` VALUES (29, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：387毫秒', '0', '', '2023-04-05 22:59:00');
INSERT INTO `sys_job_log` VALUES (30, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：369毫秒', '0', '', '2023-04-05 23:00:00');
INSERT INTO `sys_job_log` VALUES (31, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：307毫秒', '0', '', '2023-04-05 23:59:00');
INSERT INTO `sys_job_log` VALUES (32, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：376毫秒', '0', '', '2023-04-06 00:00:00');
INSERT INTO `sys_job_log` VALUES (33, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：310毫秒', '0', '', '2023-04-06 00:59:00');
INSERT INTO `sys_job_log` VALUES (34, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：362毫秒', '0', '', '2023-04-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (35, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：352毫秒', '0', '', '2023-04-06 01:59:00');
INSERT INTO `sys_job_log` VALUES (36, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：380毫秒', '0', '', '2023-04-06 02:00:00');
INSERT INTO `sys_job_log` VALUES (37, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：365毫秒', '0', '', '2023-04-06 02:59:00');
INSERT INTO `sys_job_log` VALUES (38, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：416毫秒', '0', '', '2023-04-06 03:00:00');
INSERT INTO `sys_job_log` VALUES (39, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：359毫秒', '0', '', '2023-04-06 03:59:00');
INSERT INTO `sys_job_log` VALUES (40, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：377毫秒', '0', '', '2023-04-06 04:00:00');
INSERT INTO `sys_job_log` VALUES (41, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：334毫秒', '0', '', '2023-04-06 04:59:00');
INSERT INTO `sys_job_log` VALUES (42, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：410毫秒', '0', '', '2023-04-06 05:00:00');
INSERT INTO `sys_job_log` VALUES (43, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：393毫秒', '0', '', '2023-04-06 05:59:00');
INSERT INTO `sys_job_log` VALUES (44, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：379毫秒', '0', '', '2023-04-06 06:00:00');
INSERT INTO `sys_job_log` VALUES (45, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：355毫秒', '0', '', '2023-04-06 06:59:00');
INSERT INTO `sys_job_log` VALUES (46, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：330毫秒', '0', '', '2023-04-06 07:00:00');
INSERT INTO `sys_job_log` VALUES (47, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：293毫秒', '0', '', '2023-04-06 07:59:00');
INSERT INTO `sys_job_log` VALUES (48, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：459毫秒', '0', '', '2023-04-06 08:00:00');
INSERT INTO `sys_job_log` VALUES (49, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：360毫秒', '0', '', '2023-04-06 08:59:00');
INSERT INTO `sys_job_log` VALUES (50, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：457毫秒', '0', '', '2023-04-06 09:00:00');
INSERT INTO `sys_job_log` VALUES (51, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：330毫秒', '0', '', '2023-04-06 09:59:00');
INSERT INTO `sys_job_log` VALUES (52, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：309毫秒', '0', '', '2023-04-06 10:00:00');
INSERT INTO `sys_job_log` VALUES (53, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：353毫秒', '0', '', '2023-04-06 10:59:00');
INSERT INTO `sys_job_log` VALUES (54, '获取微信Token', 'DEFAULT', 'tokenTask.getAccessToken()', '获取微信Token 总共耗时：268毫秒', '0', '', '2023-04-06 11:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 14:37:35');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-28 14:39:06');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 14:39:09');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 18:21:13');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 21:20:49');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 10:55:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-29 16:32:04');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 16:32:08');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:37:05');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-29 21:24:49');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:24:53');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 14:31:24');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 14:31:27');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 15:31:06');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:22:46');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:27:47');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 23:28:03');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-31 11:41:27');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 11:41:30');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 14:24:59');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 16:32:24');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 18:01:39');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 19:27:16');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 20:36:56');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 15:11:19');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 15:11:23');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 15:11:25');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 18:00:44');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 20:32:52');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 22:55:50');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 10:42:55');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 11:14:47');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-02 13:38:50');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 13:38:53');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 16:00:23');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:01:08');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 18:27:42');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-02 20:31:22');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 20:31:26');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 22:41:21');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 10:06:19');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-03 10:06:19');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 10:06:29');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 14:22:02');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-03 14:22:02');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 14:22:08');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-04-03 14:22:08');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 14:22:13');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 15:28:54');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-03 15:28:54');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 15:29:00');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-03 16:22:11');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 16:22:11');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 16:22:17');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-03 21:05:15');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-03 21:05:15');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:05:23');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 22:04:13');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 08:25:24');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 12:56:37');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 15:01:31');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 19:38:02');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-04 21:09:20');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 21:09:23');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 00:15:31');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 09:38:51');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 09:46:57');
INSERT INTO `sys_logininfor` VALUES (167, 'jxust', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 09:47:08');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-05 09:53:26');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-05 09:53:26');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 09:53:34');
INSERT INTO `sys_logininfor` VALUES (171, 'jxust', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 10:23:45');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '117.40.53.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 10:23:52');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 11:30:00');
INSERT INTO `sys_logininfor` VALUES (174, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:49:53');
INSERT INTO `sys_logininfor` VALUES (175, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:50:29');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:50:34');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:51:41');
INSERT INTO `sys_logininfor` VALUES (178, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:51:47');
INSERT INTO `sys_logininfor` VALUES (179, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:52:56');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-05 14:53:00');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:53:03');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:53:56');
INSERT INTO `sys_logininfor` VALUES (183, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:54:07');
INSERT INTO `sys_logininfor` VALUES (184, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:54:19');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:54:23');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:56:03');
INSERT INTO `sys_logininfor` VALUES (187, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:56:13');
INSERT INTO `sys_logininfor` VALUES (188, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:57:15');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:57:25');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:58:29');
INSERT INTO `sys_logininfor` VALUES (191, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:58:40');
INSERT INTO `sys_logininfor` VALUES (192, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 14:58:52');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:58:57');
INSERT INTO `sys_logininfor` VALUES (194, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 15:04:06');
INSERT INTO `sys_logininfor` VALUES (195, 'jxust', '221.178.124.139', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2023-04-05 15:12:31');
INSERT INTO `sys_logininfor` VALUES (196, 'jxust', '221.178.124.139', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-04-05 15:12:35');
INSERT INTO `sys_logininfor` VALUES (197, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:09:58');
INSERT INTO `sys_logininfor` VALUES (198, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 21:18:11');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:18:25');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 21:27:33');
INSERT INTO `sys_logininfor` VALUES (201, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-05 21:27:38');
INSERT INTO `sys_logininfor` VALUES (202, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:27:42');
INSERT INTO `sys_logininfor` VALUES (203, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 21:34:04');
INSERT INTO `sys_logininfor` VALUES (204, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-05 21:34:16');
INSERT INTO `sys_logininfor` VALUES (205, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-05 21:34:16');
INSERT INTO `sys_logininfor` VALUES (206, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-05 21:34:24');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:34:30');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 21:35:59');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:36:06');
INSERT INTO `sys_logininfor` VALUES (210, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-05 21:51:23');
INSERT INTO `sys_logininfor` VALUES (211, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-05 21:51:23');
INSERT INTO `sys_logininfor` VALUES (212, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 21:51:31');
INSERT INTO `sys_logininfor` VALUES (213, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 22:10:08');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 22:10:12');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-05 22:10:55');
INSERT INTO `sys_logininfor` VALUES (216, 'jxust', '117.40.52.211', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 22:11:05');
INSERT INTO `sys_logininfor` VALUES (217, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '密码输入错误1次', '2023-04-06 09:56:06');
INSERT INTO `sys_logininfor` VALUES (218, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2023-04-06 09:56:06');
INSERT INTO `sys_logininfor` VALUES (219, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '密码输入错误2次', '2023-04-06 09:56:16');
INSERT INTO `sys_logininfor` VALUES (220, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2023-04-06 09:56:16');
INSERT INTO `sys_logininfor` VALUES (221, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-04-06 09:56:27');
INSERT INTO `sys_logininfor` VALUES (222, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2023-04-06 10:54:03');
INSERT INTO `sys_logininfor` VALUES (223, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '密码输入错误1次', '2023-04-06 10:54:03');
INSERT INTO `sys_logininfor` VALUES (224, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2023-04-06 10:54:05');
INSERT INTO `sys_logininfor` VALUES (225, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2023-04-06 10:54:05');
INSERT INTO `sys_logininfor` VALUES (226, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '密码输入错误2次', '2023-04-06 10:54:08');
INSERT INTO `sys_logininfor` VALUES (227, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2023-04-06 10:54:08');
INSERT INTO `sys_logininfor` VALUES (228, 'jxust', '117.40.52.211', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-04-06 10:54:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2073 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-28 14:31:39', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-03-28 14:31:39', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-28 14:31:39', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-03-28 14:31:39', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-28 14:31:39', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-28 14:31:39', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-28 14:31:39', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-28 14:31:39', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-28 14:31:39', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-28 14:31:39', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-28 14:31:39', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-28 14:31:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-28 14:31:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-28 14:31:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-28 14:31:39', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-28 14:31:39', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-28 14:31:39', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-28 14:31:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-28 14:31:39', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-28 14:31:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-28 14:31:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-28 14:31:39', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-28 14:31:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-28 14:31:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '双创系统', 0, 5, 'nc', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'wechat', 'admin', '2023-03-28 18:28:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '文章类目', 2000, 1, 'type', 'nc/type/index', NULL, 1, 0, 'C', '0', '0', 'nc:type:list', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '文章类目菜单');
INSERT INTO `sys_menu` VALUES (2002, '文章类目查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:type:query', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '文章类目新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:type:add', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '文章类目修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:type:edit', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '文章类目删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:type:remove', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '文章类目导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:type:export', '#', 'admin', '2023-03-28 21:21:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '文章管理', 2000, 1, 'article', 'nc/article/index', NULL, 1, 0, 'C', '0', '0', 'nc:article:list', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '文章管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '文章管理查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:article:query', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '文章管理新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:article:add', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '文章管理修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:article:edit', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '文章管理删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:article:remove', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '文章管理导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:article:export', '#', 'admin', '2023-03-28 22:07:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '用户管理', 2000, 1, 'user', 'nc/user/index', NULL, 1, 0, 'C', '0', '0', 'nc:user:list', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (2014, '用户管理查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:user:query', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '用户管理新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:user:add', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '用户管理修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:user:edit', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '用户管理删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:user:remove', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '用户管理导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:user:export', '#', 'admin', '2023-03-29 16:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '话题类别', 2000, 1, 'topicType', 'nc/topicType/index', NULL, 1, 0, 'C', '0', '0', 'nc:topicType:list', '#', 'admin', '2023-03-29 21:29:33', 'admin', '2023-04-05 14:59:44', '话题类别菜单');
INSERT INTO `sys_menu` VALUES (2032, '话题类别查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topicType:query', '#', 'admin', '2023-03-29 21:29:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '话题类别新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topicType:add', '#', 'admin', '2023-03-29 21:29:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '话题类别修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topicType:edit', '#', 'admin', '2023-03-29 21:29:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '话题类别删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topicType:remove', '#', 'admin', '2023-03-29 21:29:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '话题类别导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topicType:export', '#', 'admin', '2023-03-29 21:29:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '讨论话题', 2000, 1, 'topic', 'nc/topic/index', NULL, 1, 0, 'C', '0', '0', 'nc:topic:list', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '讨论话题菜单');
INSERT INTO `sys_menu` VALUES (2050, '讨论话题查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topic:query', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '讨论话题新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topic:add', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '讨论话题修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topic:edit', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '讨论话题删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topic:remove', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '讨论话题导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:topic:export', '#', 'admin', '2023-03-30 14:53:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '评论专区', 2000, 1, 'discuss', 'nc/discuss/index', NULL, 1, 0, 'C', '0', '0', 'nc:discuss:list', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '评论专区菜单');
INSERT INTO `sys_menu` VALUES (2056, '评论专区查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:discuss:query', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '评论专区新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:discuss:add', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '评论专区修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:discuss:edit', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '评论专区删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:discuss:remove', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '评论专区导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:discuss:export', '#', 'admin', '2023-03-30 17:37:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '发布比赛', 2000, 1, 'contest', 'nc/contest/index', NULL, 1, 0, 'C', '0', '0', 'nc:contest:list', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '发布比赛菜单');
INSERT INTO `sys_menu` VALUES (2062, '发布比赛查询', 2061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:contest:query', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '发布比赛新增', 2061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:contest:add', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '发布比赛修改', 2061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:contest:edit', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '发布比赛删除', 2061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:contest:remove', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '发布比赛导出', 2061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:contest:export', '#', 'admin', '2023-04-03 14:29:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '报名记录', 2000, 1, 'enroll', 'nc/enroll/index', NULL, 1, 0, 'C', '0', '0', 'nc:enroll:list', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '报名记录菜单');
INSERT INTO `sys_menu` VALUES (2068, '报名记录查询', 2067, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:enroll:query', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '报名记录新增', 2067, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:enroll:add', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '报名记录修改', 2067, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:enroll:edit', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '报名记录删除', 2067, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:enroll:remove', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '报名记录导出', 2067, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'nc:enroll:export', '#', 'admin', '2023-04-03 16:49:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '江理双创小程序上线啦，欢迎大家前来体验！', '1', 0x3C703E313C2F703E, '0', 'admin', '2023-03-28 21:42:54', 'jxust', '2023-04-05 22:09:04', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 366 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:24:43', 238);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.jxust.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"双创系统\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"nc\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:28:38', 32);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"NcArticleType\",\"columns\":[{\"capJavaField\":\"AtId\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"at_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"atId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":2,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"AtName\",\"columnComment\":\"类目名称\",\"columnId\":3,\"columnName\":\"at_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"atName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:31:04', 41);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article_type\"}', NULL, 0, NULL, '2023-03-28 21:21:14', 363);
INSERT INTO `sys_oper_log` VALUES (104, '文章类目', 1, 'com.jxust.web.controller.nc.NcArticleTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":1,\"atName\":\"新闻\",\"createTime\":\"2023-03-28 21:30:39\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:30:39', 117);
INSERT INTO `sys_oper_log` VALUES (105, '文章类目', 1, 'com.jxust.web.controller.nc.NcArticleTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":2,\"atName\":\"竞赛\",\"createTime\":\"2023-03-28 21:30:53\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:30:53', 12);
INSERT INTO `sys_oper_log` VALUES (106, '文章类目', 2, 'com.jxust.web.controller.nc.NcArticleTypeController.edit()', 'PUT', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":1,\"atName\":\"新闻\",\"createTime\":\"2023-03-28 21:30:40\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:31:19', 10);
INSERT INTO `sys_oper_log` VALUES (107, '文章类目', 2, 'com.jxust.web.controller.nc.NcArticleTypeController.edit()', 'PUT', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":1,\"atName\":\"新闻\",\"createTime\":\"2023-03-28 21:30:40\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:31:23', 11);
INSERT INTO `sys_oper_log` VALUES (108, '文章类目', 3, 'com.jxust.web.controller.nc.NcArticleTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/type/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:35:56', 24);
INSERT INTO `sys_oper_log` VALUES (109, '文章类目', 3, 'com.jxust.web.controller.nc.NcArticleTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/type/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:35:58', 9);
INSERT INTO `sys_oper_log` VALUES (110, '文章类目', 1, 'com.jxust.web.controller.nc.NcArticleTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":3,\"atName\":\"新闻\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 21:36:06\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:36:06', 19);
INSERT INTO `sys_oper_log` VALUES (111, '文章类目', 1, 'com.jxust.web.controller.nc.NcArticleTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/type', '127.0.0.1', '内网IP', '{\"atId\":4,\"atName\":\"竞赛\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 21:36:13\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:36:13', 12);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"NcArticleType\",\"columns\":[{\"capJavaField\":\"AtId\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"at_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"atId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 18:31:04\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":2,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 18:31:04\",\"usableColumn\":true},{\"capJavaField\":\"AtName\",\"columnComment\":\"类目名称\",\"columnId\":3,\"columnName\":\"at_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"atName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 18:31:04\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:38:42', 40);
INSERT INTO `sys_oper_log` VALUES (113, '通知公告', 1, 'com.jxust.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>1</p>\",\"noticeTitle\":\"江理双创小程序上线啦\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:42:54', 112);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"NcArticleType\",\"columns\":[{\"capJavaField\":\"AtId\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"at_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"atId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 21:38:42\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":2,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 21:38:42\",\"usableColumn\":true},{\"capJavaField\":\"AtName\",\"columnComment\":\"类目名称\",\"columnId\":3,\"columnName\":\"at_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"atName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 21:38:42\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:00:55', 49);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"NcArticleType\",\"columns\":[{\"capJavaField\":\"AtId\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"at_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"atId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:00:54\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":2,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:00:54\",\"usableColumn\":true},{\"capJavaField\":\"AtName\",\"columnComment\":\"类目名称\",\"columnId\":3,\"columnName\":\"at_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"atName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:00:54\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":4,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 18:24:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:01:01', 24);
INSERT INTO `sys_oper_log` VALUES (116, '通知公告', 2, 'com.jxust.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 21:42:54\",\"noticeContent\":\"<p>1</p>\",\"noticeId\":10,\"noticeTitle\":\"江理双创小程序上线啦\",\"noticeType\":\"1\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:01:43', 15);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:03:07', 65);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"article\",\"className\":\"NcArticle\",\"columns\":[{\"capJavaField\":\"ArticleId\",\"columnComment\":\"文章ID\",\"columnId\":7,\"columnName\":\"article_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"articleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleTitle\",\"columnComment\":\"文章标题\",\"columnId\":8,\"columnName\":\"article_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleContent\",\"columnComment\":\"文章内容\",\"columnId\":9,\"columnName\":\"article_content\",\"columnType\":\"blob\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"articleContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleCover\",\"columnComment\":\"封面\",\"columnId\":10,\"columnName\":\"article_cover\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:06:49', 37);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article\"}', NULL, 0, NULL, '2023-03-28 22:06:54', 44);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"article\",\"className\":\"NcArticle\",\"columns\":[{\"capJavaField\":\"ArticleId\",\"columnComment\":\"文章ID\",\"columnId\":7,\"columnName\":\"article_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"articleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:06:49\",\"usableColumn\":false},{\"capJavaField\":\"ArticleTitle\",\"columnComment\":\"文章标题\",\"columnId\":8,\"columnName\":\"article_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:06:49\",\"usableColumn\":false},{\"capJavaField\":\"ArticleContent\",\"columnComment\":\"文章内容\",\"columnId\":9,\"columnName\":\"article_content\",\"columnType\":\"blob\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"articleContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:06:49\",\"usableColumn\":false},{\"capJavaField\":\"ArticleCover\",\"columnComment\":\"封面\",\"columnId\":10,\"columnName\":\"article_cover\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:31:03', 70);
INSERT INTO `sys_oper_log` VALUES (121, '文章管理', 1, 'com.jxust.web.controller.nc.NcArticleController.add()', 'POST', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p><p><br></p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"N\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:34:36', 23);
INSERT INTO `sys_oper_log` VALUES (122, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p><p><br></p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:47:16', 23);
INSERT INTO `sys_oper_log` VALUES (123, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"N\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:47:25', 13);
INSERT INTO `sys_oper_log` VALUES (124, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":3,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"N\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:47:30', 12);
INSERT INTO `sys_oper_log` VALUES (125, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":4,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"N\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:47:44', 11);
INSERT INTO `sys_oper_log` VALUES (126, '文章管理', 1, 'com.jxust.web.controller.nc.NcArticleController.add()', 'POST', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>1</p>\",\"articleFlows\":1,\"articleId\":2,\"articleLikes\":1,\"articleStars\":1,\"articleTitle\":\"1\",\"articleTypeId\":3,\"createTime\":\"2023-03-28 22:48:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:48:00', 16);
INSERT INTO `sys_oper_log` VALUES (127, '文章管理', 3, 'com.jxust.web.controller.nc.NcArticleController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/article/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:48:12', 13);
INSERT INTO `sys_oper_log` VALUES (128, '文章管理', 1, 'com.jxust.web.controller.nc.NcArticleController.add()', 'POST', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯（文/余然 图/融媒体中心 审核/江南）宜人三月，微风送爽。3&nbsp;月&nbsp;18&nbsp;日上午，江西理工大学在南昌校区图书信息大楼举办了江西省虚拟现实（V R&nbsp;）产业技术创新战略联盟第十期主题沙龙暨虚拟现实人才春季专场招聘会。软件工程学院充分发挥学生会以及各基层团支部、班级学生骨干力量来积极筹备这场盛会，团员青年们也发挥着“肯吃苦、勇担当”的精神，积极投入到会议布置的全过程中，为招聘会的圆满召开奉献了自己的热情与汗水。</p><p>\\t会议召开前一天，志愿者们就开始紧锣密鼓地准备着。他们严格按照要求做好各项前期准备，从摆放桌椅、安排座位、搭建帐篷、会议材料装袋、布置主会场、指引校园路线等等，将每个细节落到实处，为第二日的招聘会做好充分准备。</p><p>\\t</p><p><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/8/3F/0B/A5B77278CCC4F656F25A4E8A194_23B6DCC3_94DB0.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/4A/91/2BFE7130F3EA14D4552B9F22535_8343FB8D_92E85.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p>\\t</p><p><br></p><p>\\t\\t\\t会议召开之日，负责各项工作的志愿者早早来到现场。对接招聘企业的志愿者身着正装，正襟站在校门口迎接嘉宾和企业，他们一对一联系企业并指引到招聘现场；在招聘会过程中，他们全程候场，积极提供专业服务，帮助企业更好地完成招聘工作。交通志愿者们也应接不暇，他们手拿方向标，站在各个交通枢纽处引导车辆有序驶入，成为和谐校园中一道亮丽的风景线。在招聘会现场，志愿者们站在图书馆大楼入口及主会场门口等各个地方，他们热情接待所有到场人员，发放会议袋，协助嘉宾熟悉场地环境，解答嘉宾疑问。沙龙会议和招聘会井然有序地进行着。</p><p class=\\\"ql-align-center\\\">\\t\\t\\t\\t\\t\\t\\t\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/D8/F2/1F1AB5A702434ED3AFD8FBA5E3B_4DBC8A2A_9234F.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/AA/AE/B3A85D6DAD69C5BE049D54DDC51_9019C411_7E254.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/F/54/D5/BAC740DE4DACFD753F941FC9DB6_15B3D103_88848.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/E/E0/49/AE985956C48193C197B2A7949D7_683138E4_846E7.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/B/0F/3B/45C58CBECDC77A36F0811201CCB_33710A6C_813D9.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-ce', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:52:44', 14);
INSERT INTO `sys_oper_log` VALUES (129, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯（文/余然 图/融媒体中心 审核/江南）宜人三月，微风送爽。3&nbsp;月&nbsp;18&nbsp;日上午，江西理工大学在南昌校区图书信息大楼举办了江西省虚拟现实（V R&nbsp;）产业技术创新战略联盟第十期主题沙龙暨虚拟现实人才春季专场招聘会。软件工程学院充分发挥学生会以及各基层团支部、班级学生骨干力量来积极筹备这场盛会，团员青年们也发挥着“肯吃苦、勇担当”的精神，积极投入到会议布置的全过程中，为招聘会的圆满召开奉献了自己的热情与汗水。</p><p>\\t会议召开前一天，志愿者们就开始紧锣密鼓地准备着。他们严格按照要求做好各项前期准备，从摆放桌椅、安排座位、搭建帐篷、会议材料装袋、布置主会场、指引校园路线等等，将每个细节落到实处，为第二日的招聘会做好充分准备。</p><p>\\t</p><p><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/8/3F/0B/A5B77278CCC4F656F25A4E8A194_23B6DCC3_94DB0.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/4A/91/2BFE7130F3EA14D4552B9F22535_8343FB8D_92E85.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p>\\t</p><p><br></p><p>\\t\\t\\t会议召开之日，负责各项工作的志愿者早早来到现场。对接招聘企业的志愿者身着正装，正襟站在校门口迎接嘉宾和企业，他们一对一联系企业并指引到招聘现场；在招聘会过程中，他们全程候场，积极提供专业服务，帮助企业更好地完成招聘工作。交通志愿者们也应接不暇，他们手拿方向标，站在各个交通枢纽处引导车辆有序驶入，成为和谐校园中一道亮丽的风景线。在招聘会现场，志愿者们站在图书馆大楼入口及主会场门口等各个地方，他们热情接待所有到场人员，发放会议袋，协助嘉宾熟悉场地环境，解答嘉宾疑问。沙龙会议和招聘会井然有序地进行着。</p><p class=\\\"ql-align-center\\\">\\t\\t\\t\\t\\t\\t\\t\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/D8/F2/1F1AB5A702434ED3AFD8FBA5E3B_4DBC8A2A_9234F.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/AA/AE/B3A85D6DAD69C5BE049D54DDC51_9019C411_7E254.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/F/54/D5/BAC740DE4DACFD753F941FC9DB6_15B3D103_88848.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/E/E0/49/AE985956C48193C197B2A7949D7_683138E4_846E7.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/B/0F/3B/45C58CBECDC77A36F0811201CCB_33710A6C_813D9.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-ce', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:52:54', 14);
INSERT INTO `sys_oper_log` VALUES (130, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯（文/余然 图/融媒体中心 审核/江南）宜人三月，微风送爽。3&nbsp;月&nbsp;18&nbsp;日上午，江西理工大学在南昌校区图书信息大楼举办了江西省虚拟现实（V R&nbsp;）产业技术创新战略联盟第十期主题沙龙暨虚拟现实人才春季专场招聘会。软件工程学院充分发挥学生会以及各基层团支部、班级学生骨干力量来积极筹备这场盛会，团员青年们也发挥着“肯吃苦、勇担当”的精神，积极投入到会议布置的全过程中，为招聘会的圆满召开奉献了自己的热情与汗水。</p><p>\\t会议召开前一天，志愿者们就开始紧锣密鼓地准备着。他们严格按照要求做好各项前期准备，从摆放桌椅、安排座位、搭建帐篷、会议材料装袋、布置主会场、指引校园路线等等，将每个细节落到实处，为第二日的招聘会做好充分准备。</p><p>\\t</p><p><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/8/3F/0B/A5B77278CCC4F656F25A4E8A194_23B6DCC3_94DB0.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/4A/91/2BFE7130F3EA14D4552B9F22535_8343FB8D_92E85.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p>\\t</p><p><br></p><p>\\t\\t\\t会议召开之日，负责各项工作的志愿者早早来到现场。对接招聘企业的志愿者身着正装，正襟站在校门口迎接嘉宾和企业，他们一对一联系企业并指引到招聘现场；在招聘会过程中，他们全程候场，积极提供专业服务，帮助企业更好地完成招聘工作。交通志愿者们也应接不暇，他们手拿方向标，站在各个交通枢纽处引导车辆有序驶入，成为和谐校园中一道亮丽的风景线。在招聘会现场，志愿者们站在图书馆大楼入口及主会场门口等各个地方，他们热情接待所有到场人员，发放会议袋，协助嘉宾熟悉场地环境，解答嘉宾疑问。沙龙会议和招聘会井然有序地进行着。</p><p class=\\\"ql-align-center\\\">\\t\\t\\t\\t\\t\\t\\t\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/D8/F2/1F1AB5A702434ED3AFD8FBA5E3B_4DBC8A2A_9234F.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/AA/AE/B3A85D6DAD69C5BE049D54DDC51_9019C411_7E254.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/F/54/D5/BAC740DE4DACFD753F941FC9DB6_15B3D103_88848.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/E/E0/49/AE985956C48193C197B2A7949D7_683138E4_846E7.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/B/0F/3B/45C58CBECDC77A36F0811201CCB_33710A6C_813D9.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-ce', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:54:07', 13);
INSERT INTO `sys_oper_log` VALUES (131, '文章管理', 1, 'com.jxust.web.controller.nc.NcArticleController.add()', 'POST', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯(文/赖忠勇、李文聪 图/黄鸣杰 审核/江南) 为更好发挥党员、干部模范带头作用，为全面建设社会主义现代化国家、全面推进中华民族伟大复兴凝聚强大力量，3月25日晚，软件工程学院〔土木与测绘工程学院(南昌)〕研究生党支部、本科生第一党支部、本科生第二党支部和本科生第三党支部组织学院学生党员代表在1103教室观看由中央组织部和中央广播电视总台联合制作的《榜样7》专题节目，各教工党支部党员自主观看。</p><p>\\t本期节目邀请了中国女性太空行走第一人王亚平，带领村民走向共同富裕道路的王传喜，拥有匠人精神、攻克许多国家重大建设焊接技术的艾爱国，一辈子当老师、一辈子学当好老师的张玉滚，战胜伤病、为国争光的奥运冠军武大靖，“点草成金”带领脱贫致富的林占熺，坚守平凡岗位、与群众共呼吸心连心的人民警察孟昆玉，扎根条件艰苦的佳县，坚持治病救人的路生梅等8位党的二十大代表参加录制，通过典型事迹展示、现场访谈、重温入党誓词等形式，生动展现中国共产党人坚定信念、践行宗旨、拼搏奉献、廉洁奉公的高尚品质和精神风貌，彰显了基层党组织战斗堡垒作用和党员先锋模范作用，是每一位党员学习的光辉榜样。</p><p>\\t立志而圣则圣矣，立志而贤则贤矣。本次观影学习活动，使得每一位党员更加深刻了解榜样的成长史，帮助引导教师、学生党员们学习时代榜样，树立正确伟大梦想，践行入党初心，汲取前行动力。</p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/7/9B/3C/A35AE2755474A23FB64FC03B0C4_3CD68835_DC512.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/5/85/78/5A97CAAD679A630A18E97ED3438_E9B61468_13BF4.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/7/EE/4D/6CEB2BC89F9E0A0BA7F4079E6E6_E5E6D7DB_FFCB1.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/3/F5/1E/9F342A31041176C2C7491966D9A_AFE8DB88_13011.png\\\"></p><p><br></p>\",\"articleCover\":\"/profile/upload/2023/03/28/A35AE2755474A23FB64FC03B0C4_3CD68835_DC512_20230328225727A001.png\",\"articleId\":4,\"articleTitle\":\"我院教工、学生支部组织观看学习《榜样7》专题节目\",\"articleTypeId\":3,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:57:31\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:57:31', 118);
INSERT INTO `sys_oper_log` VALUES (132, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"articleCover\":\"/profile/upload/2023/03/28/detail_20230328223422A001.jpg\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":4,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:59:42', 14);
INSERT INTO `sys_oper_log` VALUES (133, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯（文/余然 图/融媒体中心 审核/江南）宜人三月，微风送爽。3&nbsp;月&nbsp;18&nbsp;日上午，江西理工大学在南昌校区图书信息大楼举办了江西省虚拟现实（V R&nbsp;）产业技术创新战略联盟第十期主题沙龙暨虚拟现实人才春季专场招聘会。软件工程学院充分发挥学生会以及各基层团支部、班级学生骨干力量来积极筹备这场盛会，团员青年们也发挥着“肯吃苦、勇担当”的精神，积极投入到会议布置的全过程中，为招聘会的圆满召开奉献了自己的热情与汗水。</p><p>\\t会议召开前一天，志愿者们就开始紧锣密鼓地准备着。他们严格按照要求做好各项前期准备，从摆放桌椅、安排座位、搭建帐篷、会议材料装袋、布置主会场、指引校园路线等等，将每个细节落到实处，为第二日的招聘会做好充分准备。</p><p>\\t</p><p><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/8/3F/0B/A5B77278CCC4F656F25A4E8A194_23B6DCC3_94DB0.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/4A/91/2BFE7130F3EA14D4552B9F22535_8343FB8D_92E85.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p>\\t</p><p><br></p><p>\\t\\t\\t会议召开之日，负责各项工作的志愿者早早来到现场。对接招聘企业的志愿者身着正装，正襟站在校门口迎接嘉宾和企业，他们一对一联系企业并指引到招聘现场；在招聘会过程中，他们全程候场，积极提供专业服务，帮助企业更好地完成招聘工作。交通志愿者们也应接不暇，他们手拿方向标，站在各个交通枢纽处引导车辆有序驶入，成为和谐校园中一道亮丽的风景线。在招聘会现场，志愿者们站在图书馆大楼入口及主会场门口等各个地方，他们热情接待所有到场人员，发放会议袋，协助嘉宾熟悉场地环境，解答嘉宾疑问。沙龙会议和招聘会井然有序地进行着。</p><p class=\\\"ql-align-center\\\">\\t\\t\\t\\t\\t\\t\\t\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/D8/F2/1F1AB5A702434ED3AFD8FBA5E3B_4DBC8A2A_9234F.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/A/AA/AE/B3A85D6DAD69C5BE049D54DDC51_9019C411_7E254.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/F/54/D5/BAC740DE4DACFD753F941FC9DB6_15B3D103_88848.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/E/E0/49/AE985956C48193C197B2A7949D7_683138E4_846E7.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/B/0F/3B/45C58CBECDC77A36F0811201CCB_33710A6C_813D9.png\\\" width=\\\"500\\\"></p><p class=\\\"ql-align-ce', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:59:48', 12);
INSERT INTO `sys_oper_log` VALUES (134, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>\\t本网讯(文/赖忠勇、李文聪 图/黄鸣杰 审核/江南) 为更好发挥党员、干部模范带头作用，为全面建设社会主义现代化国家、全面推进中华民族伟大复兴凝聚强大力量，3月25日晚，软件工程学院〔土木与测绘工程学院(南昌)〕研究生党支部、本科生第一党支部、本科生第二党支部和本科生第三党支部组织学院学生党员代表在1103教室观看由中央组织部和中央广播电视总台联合制作的《榜样7》专题节目，各教工党支部党员自主观看。</p><p>\\t本期节目邀请了中国女性太空行走第一人王亚平，带领村民走向共同富裕道路的王传喜，拥有匠人精神、攻克许多国家重大建设焊接技术的艾爱国，一辈子当老师、一辈子学当好老师的张玉滚，战胜伤病、为国争光的奥运冠军武大靖，“点草成金”带领脱贫致富的林占熺，坚守平凡岗位、与群众共呼吸心连心的人民警察孟昆玉，扎根条件艰苦的佳县，坚持治病救人的路生梅等8位党的二十大代表参加录制，通过典型事迹展示、现场访谈、重温入党誓词等形式，生动展现中国共产党人坚定信念、践行宗旨、拼搏奉献、廉洁奉公的高尚品质和精神风貌，彰显了基层党组织战斗堡垒作用和党员先锋模范作用，是每一位党员学习的光辉榜样。</p><p>\\t立志而圣则圣矣，立志而贤则贤矣。本次观影学习活动，使得每一位党员更加深刻了解榜样的成长史，帮助引导教师、学生党员们学习时代榜样，树立正确伟大梦想，践行入党初心，汲取前行动力。</p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/7/9B/3C/A35AE2755474A23FB64FC03B0C4_3CD68835_DC512.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/5/85/78/5A97CAAD679A630A18E97ED3438_E9B61468_13BF4.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/7/EE/4D/6CEB2BC89F9E0A0BA7F4079E6E6_E5E6D7DB_FFCB1.png\\\"></p><p class=\\\"ql-align-center\\\"><br></p><p class=\\\"ql-align-center\\\">\\t<img src=\\\"https://ncrjgc.jxust.edu.cn/__local/3/F5/1E/9F342A31041176C2C7491966D9A_AFE8DB88_13011.png\\\"></p>\",\"articleCover\":\"/profile/upload/2023/03/28/A35AE2755474A23FB64FC03B0C4_3CD68835_DC512_20230328225727A001.png\",\"articleFlows\":0,\"articleId\":4,\"articleLikes\":0,\"articleStars\":0,\"articleTitle\":\"我院教工、学生支部组织观看学习《榜样7》专题节目\",\"articleTypeId\":3,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:57:31\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 22:59:53', 11);
INSERT INTO `sys_oper_log` VALUES (135, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '127.0.0.1', '内网IP', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"articleCover\":\"/profile/upload/2023/03/29/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001.png\",\"articleFlows\":50,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:56:17', 17);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:32:37', 92);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"NcUser\",\"columns\":[{\"capJavaField\":\"Uid\",\"columnComment\":\"用户UID\",\"columnId\":19,\"columnName\":\"uid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UNick\",\"columnComment\":\"网名\",\"columnId\":20,\"columnName\":\"u_nick\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uNick\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UName\",\"columnComment\":\"姓名\",\"columnId\":21,\"columnName\":\"u_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"USex\",\"columnComment\":\"性别\",\"columnId\":22,\"columnName\":\"u_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"uSex\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:37:29', 52);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"NcUser\",\"columns\":[{\"capJavaField\":\"Uid\",\"columnComment\":\"用户UID\",\"columnId\":19,\"columnName\":\"uid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 16:37:29\",\"usableColumn\":false},{\"capJavaField\":\"UNick\",\"columnComment\":\"网名\",\"columnId\":20,\"columnName\":\"u_nick\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uNick\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 16:37:29\",\"usableColumn\":false},{\"capJavaField\":\"UName\",\"columnComment\":\"姓名\",\"columnId\":21,\"columnName\":\"u_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 16:37:29\",\"usableColumn\":false},{\"capJavaField\":\"USex\",\"columnComment\":\"性别\",\"columnId\":22,\"columnName\":\"u_sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 16:32:37\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 16:37:56', 36);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_user\"}', NULL, 0, NULL, '2023-03-29 16:38:00', 174);
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 3, 'com.jxust.web.controller.nc.NcUserController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/user/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 17:37:28', 19);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic_type\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 18:32:04', 53);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topicType\",\"className\":\"NcTopicType\",\"columns\":[{\"capJavaField\":\"TtId\",\"columnComment\":\"ID\",\"columnId\":37,\"columnName\":\"tt_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"ttId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TtName\",\"columnComment\":\"类别名称\",\"columnId\":38,\"columnName\":\"tt_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ttName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":39,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":40,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 18:35:39', 28);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic_type\"}', NULL, 0, NULL, '2023-03-29 18:35:43', 174);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic_type\"}', NULL, 0, NULL, '2023-03-29 18:35:45', 50);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic_type\"}', NULL, 0, NULL, '2023-03-29 18:35:46', 32);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topicType\",\"className\":\"NcTopicType\",\"columns\":[{\"capJavaField\":\"TtId\",\"columnComment\":\"ID\",\"columnId\":37,\"columnName\":\"tt_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"ttId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 18:35:39\",\"usableColumn\":false},{\"capJavaField\":\"TtName\",\"columnComment\":\"类别名称\",\"columnId\":38,\"columnName\":\"tt_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"ttName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 18:35:39\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":39,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 18:35:39\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":40,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-29 18:32:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:27:07', 38);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:28:47', 3);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:28:54', 24);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:28:56', 11);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:28:59', 14);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:02', 17);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:04', 12);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:07', 12);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:12', 43);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:14', 14);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:16', 13);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:20', 12);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2026', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:22', 14);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:29:24', 17);
INSERT INTO `sys_oper_log` VALUES (160, '话题类别', 1, 'com.jxust.web.controller.nc.NcTopicTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/topicType', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-29 21:30:02\",\"params\":{},\"status\":\"0\",\"ttId\":1,\"ttName\":\"竞赛\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:30:02', 16);
INSERT INTO `sys_oper_log` VALUES (161, '话题类别', 1, 'com.jxust.web.controller.nc.NcTopicTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/topicType', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-29 21:30:10\",\"params\":{},\"ttId\":2,\"ttName\":\"Java\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:30:10', 11);
INSERT INTO `sys_oper_log` VALUES (162, '话题类别', 1, 'com.jxust.web.controller.nc.NcTopicTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/topicType', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-29 21:30:17\",\"params\":{},\"ttId\":3,\"ttName\":\"C语言\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:30:17', 11);
INSERT INTO `sys_oper_log` VALUES (163, '话题类别', 1, 'com.jxust.web.controller.nc.NcTopicTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/topicType', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-29 21:30:24\",\"params\":{},\"ttId\":4,\"ttName\":\"Python\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:30:24', 9);
INSERT INTO `sys_oper_log` VALUES (164, '话题类别', 1, 'com.jxust.web.controller.nc.NcTopicTypeController.add()', 'POST', 1, 'admin', NULL, '/nc/topicType', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-29 21:30:49\",\"params\":{},\"ttId\":5,\"ttName\":\"其他\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:30:49', 26);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:32:47', 116);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 2, 'com.jxust.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/nc_topic', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:36:51', 45);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:37:00', 3);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:37:09', 45);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:39:56', 17);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:39:59', 39);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"NcTopic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"话题id\",\"columnId\":67,\"columnName\":\"topic_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicTitle\",\"columnComment\":\"标题\",\"columnId\":68,\"columnName\":\"topic_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"topicTitle\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"内容\",\"columnId\":69,\"columnName\":\"topic_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicImages\",\"columnComment\":\"图片\",\"columnId\":70,\"columnName\":\"topic_images\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"topicImages\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:42:41', 34);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article\"}', NULL, 0, NULL, '2023-03-30 14:42:46', 152);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_article\"}', NULL, 0, NULL, '2023-03-30 14:42:50', 32);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic\"}', NULL, 0, NULL, '2023-03-30 14:44:36', 33);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2043', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-03-30 14:51:52', 0);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2044', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:51:56', 29);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2045', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:51:58', 5);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2046', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:01', 10);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2047', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:04', 15);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2048', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:06', 4);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2043', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:08', 5);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2042', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:13', 15);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2041', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:16', 11);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2040', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:18', 13);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:19', 24);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:20', 15);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.jxust.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2037', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:22', 25);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"NcTopic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"话题id\",\"columnId\":67,\"columnName\":\"topic_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:42:41\",\"usableColumn\":false},{\"capJavaField\":\"TopicTitle\",\"columnComment\":\"标题\",\"columnId\":68,\"columnName\":\"topic_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"topicTitle\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:42:41\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"内容\",\"columnId\":69,\"columnName\":\"topic_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:42:41\",\"usableColumn\":false},{\"capJavaField\":\"TopicImages\",\"columnComment\":\"图片\",\"columnId\":70,\"columnName\":\"topic_images\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:52:42', 49);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_topic\"}', NULL, 0, NULL, '2023-03-30 14:52:44', 134);
INSERT INTO `sys_oper_log` VALUES (190, '讨论话题', 1, 'com.jxust.web.controller.nc.NcTopicController.add()', 'POST', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":1,\"params\":{},\"topicContent\":\"你好\",\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 14:55:51', 108);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"NcTopic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"话题id\",\"columnId\":67,\"columnName\":\"topic_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:52:42\",\"usableColumn\":false},{\"capJavaField\":\"TopicTitle\",\"columnComment\":\"标题\",\"columnId\":68,\"columnName\":\"topic_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"topicTitle\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:52:42\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"内容\",\"columnId\":69,\"columnName\":\"topic_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 14:52:42\",\"usableColumn\":false},{\"capJavaField\":\"TopicImages\",\"columnComment\":\"图片\",\"columnId\":70,\"columnName\":\"topic_images\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 14:39:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:34:53', 58);
INSERT INTO `sys_oper_log` VALUES (192, '讨论话题', 1, 'com.jxust.web.controller.nc.NcTopicController.add()', 'POST', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:36:26\",\"params\":{},\"topicContent\":\"111\",\"topicFlows\":0,\"topicId\":5,\"topicLikes\":0,\"topicStars\":1,\"topicTypeId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:36:26', 102);
INSERT INTO `sys_oper_log` VALUES (193, '讨论话题', 3, 'com.jxust.web.controller.nc.NcTopicController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/topic/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:47:02', 16);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_discuss\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:26:11', 65);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:31:27', 20);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_discuss\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:31:33', 36);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"discuss\",\"className\":\"NcDiscuss\",\"columns\":[{\"capJavaField\":\"DiscussId\",\"columnComment\":\"ID\",\"columnId\":89,\"columnName\":\"discuss_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"discussId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":90,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Ancestor\",\"columnComment\":\"祖级列表\",\"columnId\":91,\"columnName\":\"ancestor\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"ancestor\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiscussContent\",\"columnComment\":\"评论内容\",\"columnId\":92,\"columnName\":\"discuss_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"discussContent\",\"javaType\":\"Stri', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:35:58', 32);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_discuss\"}', NULL, 0, NULL, '2023-03-30 17:36:01', 142);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"discuss\",\"className\":\"NcDiscuss\",\"columns\":[{\"capJavaField\":\"DiscussId\",\"columnComment\":\"ID\",\"columnId\":89,\"columnName\":\"discuss_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"discussId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 17:35:58\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父ID\",\"columnId\":90,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 17:35:58\",\"usableColumn\":true},{\"capJavaField\":\"Ancestor\",\"columnComment\":\"祖级列表\",\"columnId\":91,\"columnName\":\"ancestor\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"ancestor\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-03-30 17:35:58\",\"usableColumn\":false},{\"capJavaField\":\"DiscussContent\",\"columnComment\":\"评论内容\",\"columnId\":92,\"columnName\":\"discuss_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:31:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:43:13', 56);
INSERT INTO `sys_oper_log` VALUES (200, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:38\",\"createUid\":93,\"discussContent\":\"你好\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg\",\"params\":{},\"parentId\":0,\"relateId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:44:38', 17);
INSERT INTO `sys_oper_log` VALUES (201, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:45:45\",\"createUid\":93,\"discussContent\":\"你也好\",\"discussId\":2,\"params\":{},\"parentId\":1,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:45:45', 16);
INSERT INTO `sys_oper_log` VALUES (202, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:46:01\",\"createUid\":93,\"discussContent\":\"你好\",\"discussId\":3,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:46:01', 17);
INSERT INTO `sys_oper_log` VALUES (203, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:46:01\",\"createUid\":93,\"discussContent\":\"你好\",\"discussId\":3,\"params\":{},\"parentId\":0,\"relateId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:46:12', 15);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 20:28:03', 65);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"WxTopic\",\"columns\":[{\"capJavaField\":\"TopicId\",\"columnComment\":\"话题id\",\"columnId\":99,\"columnName\":\"topic_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 20:28:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"topicId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicTitle\",\"columnComment\":\"话题标题\",\"columnId\":100,\"columnName\":\"topic_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 20:28:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"topicTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicContent\",\"columnComment\":\"话题内容\",\"columnId\":101,\"columnName\":\"topic_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 20:28:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"topicContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TopicImages\",\"columnComment\":\"话题图片\",\"columnId\":102,\"columnName\":\"topic_images\",\"columnType\":\"varchar(5000)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-30 20:28:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 20:28:24', 47);
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 1, 'com.jxust.web.controller.nc.NcUserController.add()', 'POST', 1, 'admin', NULL, '/nc/user', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-31 11:41:44\",\"params\":{},\"uNick\":\"11\",\"uid\":94}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:41:45', 16);
INSERT INTO `sys_oper_log` VALUES (207, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":95,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`jxust-nc`.`nc_topic`, CONSTRAINT `1` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE)\r\n### The error may exist in file [C:\\Users\\13474\\Desktop\\jxust-nc\\JxustAdminSys\\jxust-nc\\target\\classes\\mapper\\nc\\NcTopicMapper.xml]\r\n### The error may involve com.jxust.nc.mapper.NcTopicMapper.updateNcTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update nc_topic          SET topic_content = ?,             topic_images = ?,                          topic_stars = ?,             topic_likes = ?,             topic_flows = ?,             topic_type_id = ?,             create_time = ?,             create_uid = ?,             status = ?          where topic_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`jxust-nc`.`nc_topic`, CONSTRAINT `1` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`jxust-nc`.`nc_topic`, CONSTRAINT `1` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`jxust-nc`.`nc_topic`, CONSTRAINT `1` FOREIGN KEY (`create_uid`) REFERENCES `nc_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE)', '2023-03-31 11:41:59', 68);
INSERT INTO `sys_oper_log` VALUES (208, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":94,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:42:03', 15);
INSERT INTO `sys_oper_log` VALUES (209, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:42:12', 10);
INSERT INTO `sys_oper_log` VALUES (210, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"1\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:42:17', 15);
INSERT INTO `sys_oper_log` VALUES (211, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:42:21', 16);
INSERT INTO `sys_oper_log` VALUES (212, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:46:34\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"haha\",\"topicFlows\":0,\"topicId\":6,\"topicImages\":\"/profile/upload/2023/03/30/9ZaBs8CfcQeb9b5b1c8a8c18ee2995adc790972c7ad2_20230330154630A004.png,/profile/upload/2023/03/30/gEuHmT8pmK0w369bafafc4d0abb77edfba640db47038_20230330154630A001.png,/profile/upload/2023/03/30/snWNyYUjOoNs0d783e2795b4aef0cd60bed69ea54d0b_20230330154630A002.png,/profile/upload/2023/03/30/gv16INPkJQSo4cda1e838bcdc61aed924f7f2ebfea0e_20230330154630A003.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:52:53', 20);
INSERT INTO `sys_oper_log` VALUES (213, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:55:14', 11);
INSERT INTO `sys_oper_log` VALUES (214, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:11\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"nihao\",\"topicFlows\":0,\"topicId\":3,\"topicImages\":\"/profile/upload/2023/03/30/7purjhf5IV5p4b038c8febd34d7dd2bf9fd34b09561f_20230330152958A001.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:55:18', 11);
INSERT INTO `sys_oper_log` VALUES (215, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:53\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"asd\",\"topicFlows\":0,\"topicId\":4,\"topicImages\":\"/profile/upload/2023/03/30/gq2ToWVgTYXW4cda1e838bcdc61aed924f7f2ebfea0e_20230330153042A003.png,/profile/upload/2023/03/30/zhSXVdBus5RD369bafafc4d0abb77edfba640db47038_20230330153045A004.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:55:21', 11);
INSERT INTO `sys_oper_log` VALUES (216, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:46:34\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"haha\",\"topicFlows\":0,\"topicId\":6,\"topicImages\":\"/profile/upload/2023/03/30/9ZaBs8CfcQeb9b5b1c8a8c18ee2995adc790972c7ad2_20230330154630A004.png,/profile/upload/2023/03/30/gEuHmT8pmK0w369bafafc4d0abb77edfba640db47038_20230330154630A001.png,/profile/upload/2023/03/30/snWNyYUjOoNs0d783e2795b4aef0cd60bed69ea54d0b_20230330154630A002.png,/profile/upload/2023/03/30/gv16INPkJQSo4cda1e838bcdc61aed924f7f2ebfea0e_20230330154630A003.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:55:25', 12);
INSERT INTO `sys_oper_log` VALUES (217, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:27:04\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":2,\"topicImages\":\"/profile/upload/2023/03/30/4WzVLhwUODW341b46ea86b4a62c07315e162ed1caf23_20230330151915A003.jpg,/profile/upload/2023/03/30/aByieiyTodlY4b038c8febd34d7dd2bf9fd34b09561f_20230330151915A005.jpg,/profile/upload/2023/03/30/TRAH2OGeKfkMcbde6f5e83388a096d28fab7339d56fd_20230330151915A004.gif\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:25:14', 11);
INSERT INTO `sys_oper_log` VALUES (218, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:27:04\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":2,\"topicImages\":\"/profile/upload/2023/03/30/4WzVLhwUODW341b46ea86b4a62c07315e162ed1caf23_20230330151915A003.jpg,/profile/upload/2023/03/30/aByieiyTodlY4b038c8febd34d7dd2bf9fd34b09561f_20230330151915A005.jpg,/profile/upload/2023/03/30/TRAH2OGeKfkMcbde6f5e83388a096d28fab7339d56fd_20230330151915A004.gif\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:48:36', 12);
INSERT INTO `sys_oper_log` VALUES (219, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:53\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"asd\",\"topicFlows\":0,\"topicId\":4,\"topicImages\":\"/profile/upload/2023/03/30/gq2ToWVgTYXW4cda1e838bcdc61aed924f7f2ebfea0e_20230330153042A003.png,/profile/upload/2023/03/30/zhSXVdBus5RD369bafafc4d0abb77edfba640db47038_20230330153045A004.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:16:36', 13);
INSERT INTO `sys_oper_log` VALUES (220, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:27:04\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":2,\"topicImages\":\"/profile/upload/2023/03/30/4WzVLhwUODW341b46ea86b4a62c07315e162ed1caf23_20230330151915A003.jpg,/profile/upload/2023/03/30/aByieiyTodlY4b038c8febd34d7dd2bf9fd34b09561f_20230330151915A005.jpg,/profile/upload/2023/03/30/TRAH2OGeKfkMcbde6f5e83388a096d28fab7339d56fd_20230330151915A004.gif,/profile/upload/2023/03/31/10_20230331163422A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:34:24', 12);
INSERT INTO `sys_oper_log` VALUES (221, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:53\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"asd\",\"topicFlows\":0,\"topicId\":4,\"topicImages\":\"/profile/upload/2023/03/30/gq2ToWVgTYXW4cda1e838bcdc61aed924f7f2ebfea0e_20230330153042A003.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:34:42', 9);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_comment\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 18:01:57', 141);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"WxComment\",\"columns\":[{\"capJavaField\":\"DiscussId\",\"columnComment\":\"评论id\",\"columnId\":114,\"columnName\":\"discuss_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 18:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"discussId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父id\",\"columnId\":115,\"columnName\":\"parent_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 18:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"DiscussContent\",\"columnComment\":\"评论内容\",\"columnId\":116,\"columnName\":\"discuss_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 18:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"discussContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiscussImages\",\"columnComment\":\"评论图片\",\"columnId\":117,\"columnName\":\"discuss_images\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 18:01:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 18:03:09', 44);
INSERT INTO `sys_oper_log` VALUES (224, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 19:27:32\",\"discussContent\":\"你更好\",\"discussId\":4,\"discussLikes\":0,\"params\":{},\"parentId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 19:27:32', 18);
INSERT INTO `sys_oper_log` VALUES (225, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 19:27:32\",\"createUid\":93,\"discussContent\":\"你更好\",\"discussId\":4,\"discussLikes\":0,\"params\":{},\"parentId\":2,\"relateId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 19:28:25', 0);
INSERT INTO `sys_oper_log` VALUES (226, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 20:37:14\",\"createUid\":93,\"discussContent\":\"谢谢\",\"discussId\":5,\"discussLikes\":0,\"params\":{},\"parentId\":1,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 20:37:14', 21);
INSERT INTO `sys_oper_log` VALUES (227, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 20:37:33\",\"createUid\":93,\"discussContent\":\"谢谢\",\"discussId\":6,\"discussLikes\":0,\"params\":{},\"parentId\":1,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 20:37:33', 13);
INSERT INTO `sys_oper_log` VALUES (228, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 20:48:47\",\"createUid\":93,\"discussContent\":\"你谁啊\",\"discussId\":7,\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 20:48:47', 32);
INSERT INTO `sys_oper_log` VALUES (229, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:39\",\"createUid\":93,\"discussContent\":\"你是谁\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg\",\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:11:46', 22);
INSERT INTO `sys_oper_log` VALUES (230, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:45:46\",\"createUid\":93,\"discussContent\":\"我是许肖阳\",\"discussId\":2,\"discussLikes\":0,\"params\":{},\"parentId\":1,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:12:00', 11);
INSERT INTO `sys_oper_log` VALUES (231, '评论专区', 3, 'com.jxust.web.controller.nc.NcDiscussController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/discuss/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:12:08', 13);
INSERT INTO `sys_oper_log` VALUES (232, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 20:37:33\",\"createUid\":93,\"discussContent\":\"我是杨佳仪\",\"discussId\":6,\"discussLikes\":0,\"params\":{},\"parentId\":1,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:12:25', 11);
INSERT INTO `sys_oper_log` VALUES (233, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 20:48:47\",\"createUid\":93,\"discussContent\":\"你吃早饭了吗\",\"discussId\":7,\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:12:41', 15);
INSERT INTO `sys_oper_log` VALUES (234, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:46:01\",\"createUid\":93,\"discussContent\":\"你有病吗\",\"discussId\":3,\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:12:55', 19);
INSERT INTO `sys_oper_log` VALUES (235, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 19:27:32\",\"createUid\":93,\"discussContent\":\"谢谢\",\"discussId\":4,\"discussLikes\":0,\"params\":{},\"parentId\":2,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:13:06', 2);
INSERT INTO `sys_oper_log` VALUES (236, '评论专区', 1, 'com.jxust.web.controller.nc.NcDiscussController.add()', 'POST', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-31 21:24:20\",\"createUid\":93,\"discussContent\":\"不用谢\",\"discussId\":8,\"discussLikes\":0,\"params\":{},\"parentId\":4,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 21:24:20', 97);
INSERT INTO `sys_oper_log` VALUES (237, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:39\",\"createUid\":93,\"discussContent\":\"你是谁\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg\",\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 22:56:07', 17);
INSERT INTO `sys_oper_log` VALUES (238, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:45:46\",\"createUid\":93,\"discussContent\":\"我是许肖阳\",\"discussId\":2,\"discussLikes\":0,\"params\":{},\"parentId\":1,\"relateId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:43:07', 0);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:15:12', 27);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_discuss\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:15:16', 58);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:16:17', 13);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_discuss\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:16:20', 36);
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"discuss\",\"className\":\"NcDiscuss\",\"columns\":[{\"capJavaField\":\"DiscussId\",\"columnComment\":\"评论ID\",\"columnId\":138,\"columnName\":\"discuss_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"discussId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父id\",\"columnId\":139,\"columnName\":\"parent_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Ancestors\",\"columnComment\":\"祖级列表\",\"columnId\":140,\"columnName\":\"ancestors\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"ancestors\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiscussContent\",\"columnComment\":\"内容\",\"columnId\":141,\"columnName\":\"discuss_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"discussContent\",\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:18:26', 31);
INSERT INTO `sys_oper_log` VALUES (244, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:39\",\"createUid\":93,\"discussContent\":\"<p>你是谁</p>\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg\",\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:20:00', 16);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"discuss\",\"className\":\"NcDiscuss\",\"columns\":[{\"capJavaField\":\"DiscussId\",\"columnComment\":\"评论ID\",\"columnId\":138,\"columnName\":\"discuss_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"discussId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 11:18:26\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父id\",\"columnId\":139,\"columnName\":\"parent_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 11:18:26\",\"usableColumn\":true},{\"capJavaField\":\"Ancestors\",\"columnComment\":\"祖级列表\",\"columnId\":140,\"columnName\":\"ancestors\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"ancestors\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 11:18:26\",\"usableColumn\":false},{\"capJavaField\":\"DiscussContent\",\"columnComment\":\"内容\",\"columnId\":141,\"columnName\":\"discuss_content\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 11:16:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:20:54', 65);
INSERT INTO `sys_oper_log` VALUES (246, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:39\",\"createUid\":93,\"discussContent\":\"你是谁\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg\",\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:43:59', 27);
INSERT INTO `sys_oper_log` VALUES (247, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 17:44:39\",\"createUid\":93,\"discussContent\":\"你是谁\",\"discussId\":1,\"discussImages\":\"/profile/upload/2023/03/30/2_20230330174436A001.jpg,/profile/upload/2023/04/02/3_20230402114415A001.jpeg\",\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:44:17', 12);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"article\",\"className\":\"NcArticle\",\"columns\":[{\"capJavaField\":\"ArticleId\",\"columnComment\":\"文章ID\",\"columnId\":7,\"columnName\":\"article_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"articleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:31:03\",\"usableColumn\":false},{\"capJavaField\":\"ArticleTitle\",\"columnComment\":\"文章标题\",\"columnId\":8,\"columnName\":\"article_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:31:03\",\"usableColumn\":false},{\"capJavaField\":\"ArticleContent\",\"columnComment\":\"文章内容\",\"columnId\":9,\"columnName\":\"article_content\",\"columnType\":\"blob\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"articleContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 22:31:03\",\"usableColumn\":false},{\"capJavaField\":\"ArticleCover\",\"columnComment\":\"封面\",\"columnId\":10,\"columnName\":\"article_cover\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:03:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 13:43:00', 49);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_notice\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 16:00:38', 66);
INSERT INTO `sys_oper_log` VALUES (250, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":3,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:01:20', 17);
INSERT INTO `sys_oper_log` VALUES (251, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":1,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:25:10', 8);
INSERT INTO `sys_oper_log` VALUES (252, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 14:55:51\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":1,\"topicImages\":\"/profile/upload/2023/03/30/8_20230330145538A003.jpg,/profile/upload/2023/03/30/9_20230330145538A001.jpg,/profile/upload/2023/03/30/10_20230330145538A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:34:34', 8);
INSERT INTO `sys_oper_log` VALUES (253, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:27:04\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"你好\",\"topicFlows\":0,\"topicId\":2,\"topicImages\":\"/profile/upload/2023/03/30/4WzVLhwUODW341b46ea86b4a62c07315e162ed1caf23_20230330151915A003.jpg,/profile/upload/2023/03/30/aByieiyTodlY4b038c8febd34d7dd2bf9fd34b09561f_20230330151915A005.jpg,/profile/upload/2023/03/30/TRAH2OGeKfkMcbde6f5e83388a096d28fab7339d56fd_20230330151915A004.gif,/profile/upload/2023/03/31/10_20230331163422A002.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:34:38', 9);
INSERT INTO `sys_oper_log` VALUES (254, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:11\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"nihao\",\"topicFlows\":0,\"topicId\":3,\"topicImages\":\"/profile/upload/2023/03/30/7purjhf5IV5p4b038c8febd34d7dd2bf9fd34b09561f_20230330152958A001.jpg\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:34:41', 15);
INSERT INTO `sys_oper_log` VALUES (255, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:30:53\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"asd\",\"topicFlows\":0,\"topicId\":4,\"topicImages\":\"/profile/upload/2023/03/30/gq2ToWVgTYXW4cda1e838bcdc61aed924f7f2ebfea0e_20230330153042A003.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:34:46', 12);
INSERT INTO `sys_oper_log` VALUES (256, '讨论话题', 2, 'com.jxust.web.controller.nc.NcTopicController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topic', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-03-30 15:46:34\",\"createUid\":93,\"params\":{},\"status\":\"0\",\"topicContent\":\"haha\",\"topicFlows\":0,\"topicId\":6,\"topicImages\":\"/profile/upload/2023/03/30/9ZaBs8CfcQeb9b5b1c8a8c18ee2995adc790972c7ad2_20230330154630A004.png,/profile/upload/2023/03/30/gEuHmT8pmK0w369bafafc4d0abb77edfba640db47038_20230330154630A001.png,/profile/upload/2023/03/30/snWNyYUjOoNs0d783e2795b4aef0cd60bed69ea54d0b_20230330154630A002.png,/profile/upload/2023/03/30/gv16INPkJQSo4cda1e838bcdc61aed924f7f2ebfea0e_20230330154630A003.png\",\"topicLikes\":0,\"topicStars\":0,\"topicTypeId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:34:50', 9);
INSERT INTO `sys_oper_log` VALUES (257, '个人信息', 2, 'com.jxust.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-04-02 22:41:47', 81);
INSERT INTO `sys_oper_log` VALUES (258, '个人信息', 2, 'com.jxust.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:41:59', 302);
INSERT INTO `sys_oper_log` VALUES (259, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-02 16:38:33\",\"createUid\":93,\"discussContent\":\"谢谢\",\"discussId\":94,\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":13,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:42:54', 14);
INSERT INTO `sys_oper_log` VALUES (260, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"ancestors\":\"94\",\"children\":[],\"createTime\":\"2023-04-02 16:39:06\",\"createUid\":96,\"discussContent\":\"不用谢\",\"discussId\":95,\"discussLikes\":0,\"params\":{},\"parentId\":94,\"relateId\":13,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:43:27', 11);
INSERT INTO `sys_oper_log` VALUES (261, '评论专区', 2, 'com.jxust.web.controller.nc.NcDiscussController.edit()', 'PUT', 1, 'admin', NULL, '/nc/discuss', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-02 16:38:33\",\"createUid\":93,\"discussContent\":\"谢谢\",\"discussId\":94,\"discussLikes\":0,\"params\":{},\"parentId\":0,\"relateId\":13,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:44:47', 13);
INSERT INTO `sys_oper_log` VALUES (262, '评论专区', 3, 'com.jxust.web.controller.nc.NcDiscussController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/discuss/94', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:45:15', 9);
INSERT INTO `sys_oper_log` VALUES (263, '评论专区', 3, 'com.jxust.web.controller.nc.NcDiscussController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/discuss/95', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:46:20', 14);
INSERT INTO `sys_oper_log` VALUES (264, '评论专区', 3, 'com.jxust.web.controller.nc.NcDiscussController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/discuss/96', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 22:46:28', 11);
INSERT INTO `sys_oper_log` VALUES (265, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_contest\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 14:22:47', 63);
INSERT INTO `sys_oper_log` VALUES (266, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contest\",\"className\":\"NcContest\",\"columns\":[{\"capJavaField\":\"ContestId\",\"columnComment\":\"比赛ID\",\"columnId\":165,\"columnName\":\"contest_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 14:22:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"contestId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContestName\",\"columnComment\":\"标题\",\"columnId\":166,\"columnName\":\"contest_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 14:22:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contestName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContestCover\",\"columnComment\":\"封面\",\"columnId\":167,\"columnName\":\"contest_cover\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 14:22:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"contestCover\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContestDesc\",\"columnComment\":\"描述\",\"columnId\":168,\"columnName\":\"contest_desc\",\"columnType\":\"blob\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 14:22:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"contes', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 14:29:11', 37);
INSERT INTO `sys_oper_log` VALUES (267, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_contest\"}', NULL, 0, NULL, '2023-04-03 14:29:14', 122);
INSERT INTO `sys_oper_log` VALUES (268, '发布比赛', 1, 'com.jxust.web.controller.nc.NcContestController.add()', 'POST', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"createTime\":\"2023-04-03 14:36:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 14:36:00', 100);
INSERT INTO `sys_oper_log` VALUES (269, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 14:51:19', 22);
INSERT INTO `sys_oper_log` VALUES (270, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-03 00:00:00\",\"2023-04-05 00:00:00\"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 15:29:22', 17);
INSERT INTO `sys_oper_log` VALUES (271, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-03 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 15:40:47', 16);
INSERT INTO `sys_oper_log` VALUES (272, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-03 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:22:44', 15);
INSERT INTO `sys_oper_log` VALUES (273, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-06 \",\"2023-04-11 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:39:07', 10);
INSERT INTO `sys_oper_log` VALUES (274, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-08 \",\"2023-03-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:39:53', 16);
INSERT INTO `sys_oper_log` VALUES (275, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '127.0.0.1', '内网IP', '{\"contestCover\":\"/profile/upload/2023/04/03/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230403145117A001.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-05 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:41:18', 8);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"nc_enroll\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:45:00', 63);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"enroll\",\"className\":\"NcEnroll\",\"columns\":[{\"capJavaField\":\"EnrollId\",\"columnComment\":\"申请表ID\",\"columnId\":173,\"columnName\":\"enroll_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 16:45:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"enrollId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnrollUid\",\"columnComment\":\"申请者ID\",\"columnId\":174,\"columnName\":\"enroll_uid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 16:45:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"enrollUid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnrollCid\",\"columnComment\":\"申请项目\",\"columnId\":175,\"columnName\":\"enroll_cid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 16:45:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"enrollCid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"申请时间\",\"columnId\":176,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 16:45:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 16:47:20', 15);
INSERT INTO `sys_oper_log` VALUES (278, '代码生成', 8, 'com.jxust.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"nc_enroll\"}', NULL, 0, NULL, '2023-04-03 16:47:23', 187);
INSERT INTO `sys_oper_log` VALUES (279, '报名记录', 5, 'com.jxust.web.controller.nc.NcEnrollController.export()', 'POST', 1, 'admin', NULL, '/nc/enroll/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-03 16:57:45', 724);
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"view_enroll\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:28:06', 170);
INSERT INTO `sys_oper_log` VALUES (281, '代码生成', 3, 'com.jxust.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:31:22', 24);
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"view_enroll\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:31:27', 50);
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"报名记录\",\"className\":\"ViewEnroll\",\"columns\":[{\"capJavaField\":\"EnrollId\",\"columnComment\":\"申请表ID\",\"columnId\":194,\"columnName\":\"enroll_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"enrollId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContestId\",\"columnComment\":\"比赛ID\",\"columnId\":195,\"columnName\":\"contest_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"contestId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContestName\",\"columnComment\":\"比赛标题\",\"columnId\":196,\"columnName\":\"contest_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contestName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户UID\",\"columnId\":197,\"columnName\":\"uid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:36:09', 53);
INSERT INTO `sys_oper_log` VALUES (284, '报名记录', 1, 'com.jxust.web.controller.nc.NcEnrollController.add()', 'POST', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 17:52:26\",\"enrollCid\":1,\"enrollId\":1,\"enrollUid\":1,\"ncUserList\":[{\"params\":{},\"status\":\"\",\"uClassname\":\"\",\"uDepartment\":\"\",\"uEmail\":\"\",\"uImage\":\"\",\"uMajor\":\"\",\"uName\":\"111\",\"uNick\":\"111\",\"uQq\":\"\",\"uSex\":\"0\",\"uType\":\"\",\"uid\":1}],\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:52:27', 23);
INSERT INTO `sys_oper_log` VALUES (285, '报名记录', 2, 'com.jxust.web.controller.nc.NcEnrollController.edit()', 'PUT', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 17:52:27\",\"enrollCid\":1,\"enrollId\":1,\"enrollUid\":1,\"ncUserList\":[{\"params\":{},\"status\":\"\",\"uClassname\":\"\",\"uDepartment\":\"\",\"uEmail\":\"\",\"uImage\":\"\",\"uMajor\":\"\",\"uName\":\"111\",\"uNick\":\"111\",\"uQq\":\"\",\"uSex\":\"0\",\"uType\":\"\",\"uid\":1}],\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 17:52:38', 17);
INSERT INTO `sys_oper_log` VALUES (286, '报名记录', 2, 'com.jxust.web.controller.nc.NcEnrollController.edit()', 'PUT', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 17:52:27\",\"enrollCid\":1,\"enrollId\":1,\"enrollUid\":1,\"ncUserList\":[{\"params\":{},\"status\":\"\",\"uClassname\":\"\",\"uDepartment\":\"\",\"uEmail\":\"\",\"uImage\":\"\",\"uMajor\":\"\",\"uName\":\"111\",\"uNick\":\"111\",\"uQq\":\"\",\"uSex\":\"0\",\"uType\":\"\",\"uid\":1},{\"params\":{},\"status\":\"\",\"uClassname\":\"\",\"uDepartment\":\"\",\"uEmail\":\"\",\"uImage\":\"\",\"uMajor\":\"\",\"uName\":\"12313\",\"uNick\":\"132213\",\"uQq\":\"\",\"uSex\":\"\",\"uType\":\"\",\"uid\":1}],\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'nc_user.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\13474\\Desktop\\jxust-nc\\JxustAdminSys\\jxust-nc\\target\\classes\\mapper\\nc\\NcEnrollMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into nc_user( uid, u_nick, u_name, u_sex, u_xh, u_desc, u_password, u_department, u_major, u_className, u_qq, u_idcard, u_email, u_image, u_type, create_time, status, openid) values                  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'nc_user.PRIMARY\'\n; Duplicate entry \'1\' for key \'nc_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'nc_user.PRIMARY\'', '2023-04-03 17:53:58', 66);
INSERT INTO `sys_oper_log` VALUES (287, '代码生成', 2, 'com.jxust.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"报名记录\",\"className\":\"ViewEnroll\",\"columns\":[{\"capJavaField\":\"EnrollId\",\"columnComment\":\"ID\",\"columnId\":194,\"columnName\":\"enroll_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"enrollId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 17:36:09\",\"usableColumn\":false},{\"capJavaField\":\"ContestId\",\"columnComment\":\"比赛ID\",\"columnId\":195,\"columnName\":\"contest_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"contestId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 17:36:09\",\"usableColumn\":false},{\"capJavaField\":\"ContestName\",\"columnComment\":\"比赛标题\",\"columnId\":196,\"columnName\":\"contest_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contestName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 17:36:09\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户UID\",\"columnId\":197,\"columnName\":\"uid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 17:31:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 18:11:37', 74);
INSERT INTO `sys_oper_log` VALUES (288, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 18:15:35', 42);
INSERT INTO `sys_oper_log` VALUES (289, '报名记录', 1, 'com.jxust.web.controller.nc.NcEnrollController.add()', 'POST', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 18:16:29\",\"enrollId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 18:16:29', 18);
INSERT INTO `sys_oper_log` VALUES (290, '报名记录', 1, 'com.jxust.web.controller.nc.NcEnrollController.add()', 'POST', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 18:28:11\",\"enrollId\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 18:28:11', 119);
INSERT INTO `sys_oper_log` VALUES (291, '报名记录', 1, 'com.jxust.web.controller.nc.NcEnrollController.add()', 'POST', 1, 'admin', NULL, '/nc/enroll', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 18:31:13\",\"enrollCid\":1,\"enrollId\":4,\"enrollUid\":93,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 18:31:13', 13);
INSERT INTO `sys_oper_log` VALUES (292, '报名记录', 5, 'com.jxust.web.controller.nc.NcEnrollController.export()', 'POST', 1, 'admin', NULL, '/nc/enroll/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-03 18:37:44', 716);
INSERT INTO `sys_oper_log` VALUES (293, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 21:10:49', 30);
INSERT INTO `sys_oper_log` VALUES (294, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 21:11:03', 16);
INSERT INTO `sys_oper_log` VALUES (295, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 21:14:10', 12);
INSERT INTO `sys_oper_log` VALUES (296, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 21:14:52', 14);
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 6, 'com.jxust.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '117.40.53.60', 'XX XX', '{\"tables\":\"nc_token\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 12:56:46', 189);
INSERT INTO `sys_oper_log` VALUES (298, '定时任务', 1, 'com.jxust.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '117.40.53.60', 'XX XX', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0/59 0 1/28 1/1 ?\",\"invokeTarget\":\"tokenTask.getAccessToken()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"获取微信Token\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-04-29 00:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 15:03:35', 92);
INSERT INTO `sys_oper_log` VALUES (299, '定时任务', 2, 'com.jxust.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '117.40.53.60', 'XX XX', '{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 15:03:40', 61);
INSERT INTO `sys_oper_log` VALUES (300, '定时任务', 2, 'com.jxust.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '117.40.53.60', 'XX XX', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 15:03:35\",\"cronExpression\":\"0 0/59 0 1/28 1/1 ?\",\"invokeTarget\":\"tokenTask.getAccessToken()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"获取微信Token\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-04-29 00:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 15:03:44', 47);
INSERT INTO `sys_oper_log` VALUES (301, '定时任务', 2, 'com.jxust.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '117.40.53.60', 'XX XX', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 15:04:24', 17);
INSERT INTO `sys_oper_log` VALUES (302, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '117.40.53.60', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-05 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 19:38:27', 50);
INSERT INTO `sys_oper_log` VALUES (303, '发布比赛', 1, 'com.jxust.web.controller.nc.NcContestController.add()', 'POST', 1, 'admin', NULL, '/nc/contest', '117.40.53.60', 'XX XX', '{\"contestId\":2,\"contestName\":\"test\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 21:09:36\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:09:36', 39);
INSERT INTO `sys_oper_log` VALUES (304, '发布比赛', 3, 'com.jxust.web.controller.nc.NcContestController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/contest/2', '117.40.53.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:10:22', 18);
INSERT INTO `sys_oper_log` VALUES (305, '发布比赛', 1, 'com.jxust.web.controller.nc.NcContestController.add()', 'POST', 1, 'admin', NULL, '/nc/contest', '117.40.53.60', 'XX XX', '{\"contestId\":3,\"contestName\":\"11\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 21:10:32\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:10:32', 19);
INSERT INTO `sys_oper_log` VALUES (306, '发布比赛', 3, 'com.jxust.web.controller.nc.NcContestController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/contest/3', '117.40.53.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:10:54', 16);
INSERT INTO `sys_oper_log` VALUES (307, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '117.40.53.60', 'XX XX', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名方式：<span style=\\\"background-color: rgb(230, 0, 0);\\\">在个人主页完善个人教务信息后进行报名即可</span></p>\",\"articleCover\":\"/profile/upload/2023/03/29/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001.png\",\"articleFlows\":56,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:16:33', 29);
INSERT INTO `sys_oper_log` VALUES (308, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '117.40.53.60', 'XX XX', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名方式：<span style=\\\"background-color: rgb(230, 0, 0);\\\">在个人主页完善个人教务信息后进行报名即可</span></p>\",\"articleCover\":\"/profile/upload/2023/03/29/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001.png\",\"articleFlows\":56,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:16:56', 17);
INSERT INTO `sys_oper_log` VALUES (309, '文章管理', 2, 'com.jxust.web.controller.nc.NcArticleController.edit()', 'PUT', 1, 'admin', NULL, '/nc/article', '117.40.53.60', 'XX XX', '{\"articleContent\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名方式：<span style=\\\"background-color: rgb(230, 0, 0);\\\">在个人主页完善个人教务信息后进行报名即可</span></p><p><span style=\\\"background-color: rgb(230, 0, 0);\\\"><span class=\\\"ql-cursor\\\">﻿</span></span><img src=\\\"/prod-api/profile/upload/2023/04/05/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230405001743A003.png\\\"></p>\",\"articleCover\":\"/profile/upload/2023/03/29/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001.png\",\"articleFlows\":1582,\"articleId\":1,\"articleLikes\":50,\"articleStars\":5,\"articleTitle\":\"软件工程学院程序设计大赛\",\"articleTypeId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 22:34:36\",\"isCarousel\":\"Y\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:17:51', 15);
INSERT INTO `sys_oper_log` VALUES (310, '话题类别', 2, 'com.jxust.web.controller.nc.NcTopicTypeController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topicType', '117.40.53.60', 'XX XX', '{\"createTime\":\"2023-03-29 21:30:11\",\"currentPage\":1,\"endText\":\"到底了\",\"ending\":false,\"pageCount\":0,\"params\":{},\"status\":\"0\",\"ttId\":2,\"ttName\":\"学习\",\"wxTopics\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:18:22', 18);
INSERT INTO `sys_oper_log` VALUES (311, '话题类别', 2, 'com.jxust.web.controller.nc.NcTopicTypeController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topicType', '117.40.53.60', 'XX XX', '{\"createTime\":\"2023-03-29 21:30:17\",\"currentPage\":1,\"endText\":\"到底了\",\"ending\":false,\"pageCount\":0,\"params\":{},\"status\":\"0\",\"ttId\":3,\"ttName\":\"吐槽\",\"wxTopics\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:18:32', 14);
INSERT INTO `sys_oper_log` VALUES (312, '话题类别', 2, 'com.jxust.web.controller.nc.NcTopicTypeController.edit()', 'PUT', 1, 'admin', NULL, '/nc/topicType', '117.40.53.60', 'XX XX', '{\"createTime\":\"2023-03-29 21:30:24\",\"currentPage\":1,\"endText\":\"到底了\",\"ending\":false,\"pageCount\":0,\"params\":{},\"status\":\"0\",\"ttId\":4,\"ttName\":\"表白\",\"wxTopics\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 00:18:50', 14);
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.jxust.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '117.40.53.60', 'XX XX', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"1347456958@qq.com\",\"nickName\":\"jxust\",\"params\":{},\"phonenumber\":\"18436002417\",\"postIds\":[1,2,3],\"roleIds\":[2],\"sex\":\"2\",\"status\":\"0\",\"userId\":100,\"userName\":\"jxust\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 09:45:58', 168);
INSERT INTO `sys_oper_log` VALUES (314, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.53.60', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 09:46:16', 83);
INSERT INTO `sys_oper_log` VALUES (315, '用户头像', 2, 'com.jxust.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '117.40.53.60', 'XX XX', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/05/blob_20230405094651A005.png\",\"code\":200}', 0, NULL, '2023-04-05 09:46:51', 17);
INSERT INTO `sys_oper_log` VALUES (316, '个人信息', 2, 'com.jxust.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '117.40.53.60', 'XX XX', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:31:39\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ywenrou123@163.com\",\"loginDate\":\"2023-04-05 00:15:32\",\"loginIp\":\"117.40.53.60\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 09:46:52', 20);
INSERT INTO `sys_oper_log` VALUES (317, '用户头像', 2, 'com.jxust.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'jxust', NULL, '/system/user/profile/avatar', '117.40.53.60', 'XX XX', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/05/blob_20230405094731A006.png\",\"code\":200}', 0, NULL, '2023-04-05 09:47:31', 15);
INSERT INTO `sys_oper_log` VALUES (318, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/contest', '117.40.53.60', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-09 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 10:20:09', 17);
INSERT INTO `sys_oper_log` VALUES (319, '定时任务', 2, 'com.jxust.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '117.40.53.60', 'XX XX', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 10:24:19', 24);
INSERT INTO `sys_oper_log` VALUES (320, '定时任务', 2, 'com.jxust.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '117.40.53.60', 'XX XX', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 15:03:35\",\"cronExpression\":\"0 0/59 * * * ?\",\"invokeTarget\":\"tokenTask.getAccessToken()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"获取微信Token\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-04-05 10:59:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 10:25:50', 26);
INSERT INTO `sys_oper_log` VALUES (321, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/10', '117.40.53.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 10:45:37', 15);
INSERT INTO `sys_oper_log` VALUES (322, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/13', '117.40.53.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 10:50:20', 52);
INSERT INTO `sys_oper_log` VALUES (323, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/15', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:30:11', 19);
INSERT INTO `sys_oper_log` VALUES (324, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/14', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:33:28', 26);
INSERT INTO `sys_oper_log` VALUES (325, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/16', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:36:34', 17);
INSERT INTO `sys_oper_log` VALUES (326, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/17', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:37:32', 17);
INSERT INTO `sys_oper_log` VALUES (327, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestFlows\":24,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-04 \",\"2023-04-06 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:37:50', 20);
INSERT INTO `sys_oper_log` VALUES (328, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestFlows\":24,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-04-27 \",\"2023-05-17 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:38:06', 20);
INSERT INTO `sys_oper_log` VALUES (329, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestFlows\":24,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2022-04-04 \",\"2022-04-15 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:38:24', 16);
INSERT INTO `sys_oper_log` VALUES (330, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'admin', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为填写下列二维码所指向的腾讯问卷（在报名结束后会发出报名表以供核对）</p>\",\"contestFlows\":24,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:38:42', 13);
INSERT INTO `sys_oper_log` VALUES (331, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/18', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:40:55', 21);
INSERT INTO `sys_oper_log` VALUES (332, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/19', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:46:48', 19);
INSERT INTO `sys_oper_log` VALUES (333, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/20', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 11:51:38', 17);
INSERT INTO `sys_oper_log` VALUES (334, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/21', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:03:54', 33);
INSERT INTO `sys_oper_log` VALUES (335, '报名记录', 3, 'com.jxust.web.controller.nc.NcEnrollController.remove()', 'DELETE', 1, 'admin', NULL, '/nc/enroll/22', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:05:48', 24);
INSERT INTO `sys_oper_log` VALUES (336, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:50:56', 70);
INSERT INTO `sys_oper_log` VALUES (337, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:53:51', 49);
INSERT INTO `sys_oper_log` VALUES (338, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:55:13', 43);
INSERT INTO `sys_oper_log` VALUES (339, '角色管理', 1, 'com.jxust.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"后台管理员\",\"roleId\":100,\"roleKey\":\"jxust\",\"roleName\":\"jxust\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:55:41', 41);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 4, 'com.jxust.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '117.40.52.211', 'XX XX', '{\"roleIds\":\"100\",\"userId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:55:59', 39);
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 2, 'com.jxust.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '117.40.52.211', 'XX XX', '{\"children\":[],\"component\":\"nc/topicType/index\",\"createTime\":\"2023-03-29 21:29:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"话题类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"topicType\",\"perms\":\"nc:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:58:17', 38);
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 2, 'com.jxust.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '117.40.52.211', 'XX XX', '{\"children\":[],\"component\":\"nc/topicType/index\",\"createTime\":\"2023-03-29 21:29:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"话题类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"topicType\",\"perms\":\"nc:topicType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 14:59:44', 20);
INSERT INTO `sys_oper_log` VALUES (343, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 15:02:54', 33);
INSERT INTO `sys_oper_log` VALUES (344, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/contest', '221.178.124.139', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为：请先完善个人教务信息保存后才可以报名</p>\",\"contestFlows\":31,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 15:13:40', 29);
INSERT INTO `sys_oper_log` VALUES (345, '用户管理', 2, 'com.jxust.web.controller.nc.NcUserController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/user', '117.40.52.211', 'XX XX', '{\"createTime\":\"2023-04-01 20:39:40\",\"openid\":\"o-arR5NrG40-ZlXjiRkzrOWT8OFI\",\"params\":{},\"status\":\"0\",\"uClassname\":\"\",\"uImage\":\"/profile/upload/2023/04/01/tmp_ec4bc0a2ed525ef490c27eb7ed6be3a4_20230401203937A001.jpg\",\"uName\":\"刘江\",\"uNick\":\"L\",\"uSex\":\"1\",\"uXh\":5720191930,\"uid\":95}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:11:17', 36);
INSERT INTO `sys_oper_log` VALUES (346, '用户管理', 2, 'com.jxust.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '117.40.52.211', 'XX XX', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:31:39\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"软件开发193\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"1347456958@qq.com\",\"loginDate\":\"2023-03-28 14:31:39\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"许肖阳\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"修改用户\'ry\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2023-04-05 21:20:22', 15);
INSERT INTO `sys_oper_log` VALUES (347, '用户管理', 2, 'com.jxust.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '117.40.52.211', 'XX XX', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:31:39\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"软件开发193\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"xuxiaoang168@gmail.com\",\"loginDate\":\"2023-03-28 14:31:39\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"许肖阳\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:20:39', 58);
INSERT INTO `sys_oper_log` VALUES (348, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2013,2031,2049,2055,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2014,2032,2050,2053,2056,2059,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:24:12', 63);
INSERT INTO `sys_oper_log` VALUES (349, '通知公告', 3, 'com.jxust.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/1', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:24:45', 20);
INSERT INTO `sys_oper_log` VALUES (350, '通知公告', 3, 'com.jxust.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/2', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:24:49', 19);
INSERT INTO `sys_oper_log` VALUES (351, '通知公告', 2, 'com.jxust.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '117.40.52.211', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 21:42:54\",\"noticeContent\":\"<p>1</p>\",\"noticeId\":10,\"noticeTitle\":\"江理双创小程序上线啦\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-28 22:01:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:24:55', 20);
INSERT INTO `sys_oper_log` VALUES (352, '通知公告', 1, 'com.jxust.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '117.40.52.211', 'XX XX', '{\"createBy\":\"admin\",\"noticeContent\":\"<p><br></p>\",\"noticeTitle\":\"大家好\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:25:14', 27);
INSERT INTO `sys_oper_log` VALUES (353, '通知公告', 3, 'com.jxust.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/11', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:25:19', 16);
INSERT INTO `sys_oper_log` VALUES (354, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,109,2000,2013,2031,2049,2055,107,1035,1036,1037,1038,1046,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2014,2032,2050,2053,2056,2059,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:25:58', 34);
INSERT INTO `sys_oper_log` VALUES (355, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-04-05 14:55:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,109,107,1035,1036,1037,1038,1046,111,112,113,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"后台管理员\",\"roleId\":100,\"roleKey\":\"jxust\",\"roleName\":\"jxust\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:26:50', 62);
INSERT INTO `sys_oper_log` VALUES (356, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为：请先完善个人教务信息保存后才可以报名</p><p><a href=\\\"www.baidu.com\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\">www.baidu.com</a></p>\",\"contestFlows\":47,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:00:56', 31);
INSERT INTO `sys_oper_log` VALUES (357, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为：<span style=\\\"color: rgb(230, 0, 0);\\\">请先完善个人教务信息保存后才可以报名(一定要记得填写完成后点击保存按钮）</span></p><p><span class=\\\"ql-cursor\\\">﻿</span><img src=\\\"/prod-api/profile/upload/2023/04/05/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230405220238A001.png\\\"></p><p><br></p>\",\"contestFlows\":48,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:02:40', 17);
INSERT INTO `sys_oper_log` VALUES (358, '发布比赛', 2, 'com.jxust.web.controller.nc.NcContestController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/contest', '117.40.52.211', 'XX XX', '{\"contestCover\":\"/profile/upload/2023/04/04/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230404193826A009.png\",\"contestDesc\":\"<p>比赛时间：4月9号</p><p>比赛在pta平台上使用oms的监考系统使用双机位方式进行线上考试。</p><p>热身赛将在4月1号到4月2号择期举行</p><p>报名时间为3月21号截止到3月26号晚24点</p><p>参赛语言理论上均可使用，但推荐使用c/c++,Java or python&nbsp;</p><p>参赛成功的条件为至少ac（通过所有测试点）一道题目（无论是哪一道题）</p><p>报名条件为：<span style=\\\"color: rgb(230, 0, 0);\\\">请先完善个人教务信息保存后才可以报名(一定要记得填写完成后点击保存按钮）</span></p><p>﻿<img src=\\\"/prod-api/profile/upload/2023/04/05/b21bb051f8198618169533f649ed2e738ad4e6f6_20230329105615A001_20230405220238A001.png\\\"></p>\",\"contestFlows\":52,\"contestId\":1,\"contestName\":\"软件工程学院程序设计大赛开始报名啦\",\"contestTime\":[\"2023-03-28 \",\"2023-04-10 \"],\"createTime\":\"2023-04-03 14:36:01\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:03:37', 20);
INSERT INTO `sys_oper_log` VALUES (359, '用户管理', 2, 'com.jxust.web.controller.nc.NcUserController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/user', '117.40.52.211', 'XX XX', '{\"createTime\":\"2023-03-29 17:37:58\",\"openid\":\"o-arR5GC3ioJIJalQMLjG3m06yxY\",\"params\":{},\"status\":\"0\",\"uClassname\":\"软件开发193班\",\"uDepartment\":\"江西理工大学\",\"uDesc\":\"while（true）i=i++\",\"uEmail\":\"1347456958@qq.com\",\"uImage\":\"/profile/upload/2023/04/05/tmp_6138bb298d8730ee4c99b8d739f828ce_20230405185742A003.jpg\",\"uMajor\":\"软件工程学院(土测学院南昌)\",\"uName\":\"许肖阳\",\"uNick\":\"白桦\",\"uSex\":\"0\",\"uType\":\"老师\",\"uXh\":5720191930,\"uid\":93}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:05:02', 36);
INSERT INTO `sys_oper_log` VALUES (360, '用户管理', 2, 'com.jxust.web.controller.nc.NcUserController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/user', '117.40.52.211', 'XX XX', '{\"createTime\":\"2023-03-29 17:37:58\",\"openid\":\"o-arR5GC3ioJIJalQMLjG3m06yxY\",\"params\":{},\"status\":\"0\",\"uClassname\":\"软件开发193班\",\"uDepartment\":\"江西理工大学\",\"uDesc\":\"while（true）i=i++\",\"uEmail\":\"1347456958@qq.com\",\"uImage\":\"/profile/upload/2023/04/05/tmp_6138bb298d8730ee4c99b8d739f828ce_20230405185742A003.jpg\",\"uMajor\":\"软件工程学院(土测学院南昌)\",\"uName\":\"许肖阳\",\"uNick\":\"白桦\",\"uSex\":\"0\",\"uType\":\"开发者\",\"uXh\":5720191930,\"uid\":93}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:05:12', 19);
INSERT INTO `sys_oper_log` VALUES (361, '用户管理', 2, 'com.jxust.web.controller.nc.NcUserController.edit()', 'PUT', 1, 'jxust', NULL, '/nc/user', '117.40.52.211', 'XX XX', '{\"createTime\":\"2023-03-29 17:37:58\",\"openid\":\"o-arR5GC3ioJIJalQMLjG3m06yxY\",\"params\":{},\"status\":\"0\",\"uClassname\":\"软件开发193班\",\"uDepartment\":\"江西理工大学\",\"uDesc\":\"while（true）i=i++\",\"uEmail\":\"1347456958@qq.com\",\"uImage\":\"/profile/upload/2023/04/05/tmp_6138bb298d8730ee4c99b8d739f828ce_20230405185742A003.jpg\",\"uMajor\":\"软件工程学院(土测学院南昌)\",\"uName\":\"许肖阳\",\"uNick\":\"白桦\",\"uSex\":\"0\",\"uType\":\"管理员\",\"uXh\":5720191930,\"uid\":93}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:05:23', 15);
INSERT INTO `sys_oper_log` VALUES (362, '通知公告', 2, 'com.jxust.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'jxust', NULL, '/system/notice', '117.40.52.211', 'XX XX', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 21:42:54\",\"noticeContent\":\"<p>1</p>\",\"noticeId\":10,\"noticeTitle\":\"江理双创小程序上线啦，欢迎大家前来体验！\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"jxust\",\"updateTime\":\"2023-04-05 21:24:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:09:04', 24);
INSERT INTO `sys_oper_log` VALUES (363, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-03-28 14:31:39\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2013,2031,2049,2055,107,1035,1036,1037,1038,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2014,2032,2050,2053,2056,2059,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:10:42', 77);
INSERT INTO `sys_oper_log` VALUES (364, '角色管理', 2, 'com.jxust.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '117.40.52.211', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-04-05 14:55:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,107,1035,1036,1037,1038,111,112,113,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2031,2032,2033,2034,2035,2036,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072],\"params\":{},\"remark\":\"后台管理员\",\"roleId\":100,\"roleKey\":\"jxust\",\"roleName\":\"jxust\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:10:50', 54);
INSERT INTO `sys_oper_log` VALUES (365, '讨论话题', 3, 'com.jxust.web.controller.nc.NcTopicController.remove()', 'DELETE', 1, 'jxust', NULL, '/nc/topic/24', '117.40.52.211', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 09:57:12', 17);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '校长', 1, '0', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '院长', 2, '0', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '教师', 3, '0', 'admin', '2023-03-28 14:31:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '学生', 4, '0', 'admin', '2023-03-28 14:31:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-28 14:31:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-28 14:31:39', 'admin', '2023-04-05 22:10:42', '普通角色');
INSERT INTO `sys_role` VALUES (100, 'jxust', 'jxust', 0, '1', 1, 1, '0', '0', 'admin', '2023-04-05 14:55:41', 'admin', '2023-04-05 22:10:50', '后台管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2059);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2064);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2066);
INSERT INTO `sys_role_menu` VALUES (2, 2067);
INSERT INTO `sys_role_menu` VALUES (2, 2068);
INSERT INTO `sys_role_menu` VALUES (2, 2069);
INSERT INTO `sys_role_menu` VALUES (2, 2070);
INSERT INTO `sys_role_menu` VALUES (2, 2071);
INSERT INTO `sys_role_menu` VALUES (2, 2072);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (100, 2061);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2065);
INSERT INTO `sys_role_menu` VALUES (100, 2066);
INSERT INTO `sys_role_menu` VALUES (100, 2067);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2069);
INSERT INTO `sys_role_menu` VALUES (100, 2070);
INSERT INTO `sys_role_menu` VALUES (100, 2071);
INSERT INTO `sys_role_menu` VALUES (100, 2072);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '许肖阳', '00', 'ywenrou123@163.com', '15888888888', '0', '/profile/avatar/2023/04/05/blob_20230405094651A005.png', '$2a$10$jSoff1Yl/jE8A6USw8QgBuOgzhQMYNYqoXOgvUsRd/YxHLbGVRAZy', '0', '0', '117.40.52.211', '2023-04-05 22:10:13', 'admin', '2023-03-28 14:31:39', '', '2023-04-05 22:10:12', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'xuxiaoyang', '许肖阳', '00', 'xuxiaoang168@gmail.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-28 14:31:39', 'admin', '2023-03-28 14:31:39', 'admin', '2023-04-05 21:20:39', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'jxust', 'jxust', '00', '1347456958@qq.com', '18436002417', '2', '/profile/avatar/2023/04/05/blob_20230405094731A006.png', '$2a$10$khQQMAQSewteSO.UyHJvtuSpocIioyVFpYLLxoz9Vl7BaCVxTWTWC', '0', '0', '117.40.52.211', '2023-04-06 10:54:20', 'admin', '2023-04-05 09:45:58', '', '2023-04-06 10:54:20', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 1);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (100, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);

-- ----------------------------
-- View structure for view_enroll
-- ----------------------------
DROP VIEW IF EXISTS `view_enroll`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_enroll` AS select `nc_enroll`.`enroll_id` AS `enroll_id`,`nc_contest`.`contest_id` AS `contest_id`,`nc_contest`.`contest_name` AS `contest_name`,`nc_user`.`uid` AS `uid`,`nc_user`.`u_nick` AS `u_nick`,`nc_user`.`u_name` AS `u_name`,`nc_user`.`u_sex` AS `u_sex`,`nc_user`.`u_xh` AS `u_xh`,`nc_user`.`u_department` AS `u_department`,`nc_user`.`u_major` AS `u_major`,`nc_user`.`u_className` AS `u_className`,`nc_user`.`u_image` AS `u_image`,`nc_user`.`u_type` AS `u_type`,`nc_enroll`.`create_time` AS `create_time`,`nc_enroll`.`status` AS `status`,`nc_enroll`.`Auditor` AS `Auditor` from ((`nc_contest` join `nc_enroll` on((`nc_contest`.`contest_id` = `nc_enroll`.`enroll_cid`))) join `nc_user` on((`nc_enroll`.`enroll_uid` = `nc_user`.`uid`)));

-- ----------------------------
-- View structure for wx_comment
-- ----------------------------
DROP VIEW IF EXISTS `wx_comment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wx_comment` AS select `nc_discuss`.`discuss_id` AS `discuss_id`,`nc_discuss`.`parent_id` AS `parent_id`,`nc_discuss`.`discuss_content` AS `discuss_content`,`nc_discuss`.`discuss_images` AS `discuss_images`,`nc_discuss`.`create_time` AS `create_time`,`nc_discuss`.`relate_id` AS `relate_id`,`nc_discuss`.`discuss_likes` AS `discuss_likes`,`nc_user`.`uid` AS `uid`,`nc_user`.`u_nick` AS `u_nick`,`nc_user`.`u_name` AS `u_name`,`nc_user`.`u_sex` AS `u_sex`,`nc_user`.`u_image` AS `u_image`,`nc_user`.`u_type` AS `u_type` from (`nc_discuss` join `nc_user` on((`nc_discuss`.`create_uid` = `nc_user`.`uid`))) where (`nc_discuss`.`status` = 0);

-- ----------------------------
-- View structure for wx_notice
-- ----------------------------
DROP VIEW IF EXISTS `wx_notice`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wx_notice` AS select `wx_comment`.`discuss_id` AS `discuss_id`,`wx_comment`.`discuss_content` AS `discuss_content`,`wx_comment`.`create_time` AS `create_time`,`wx_comment`.`uid` AS `uid`,`wx_comment`.`u_nick` AS `comment_nick`,`wx_comment`.`u_name` AS `comment_name`,`wx_comment`.`u_image` AS `u_image`,`nc_topic`.`topic_id` AS `topic_id`,`nc_topic`.`topic_content` AS `topic_content`,`nc_topic`.`topic_images` AS `topic_images`,`nc_topic`.`topic_flows` AS `topic_flows`,`nc_topic`.`create_uid` AS `topic_uid`,`parent_comment`.`discuss_id` AS `parent_comment_id`,`parent_comment`.`discuss_content` AS `parent_comment_content`,`parent_comment`.`uid` AS `parent_comment_uid`,`parent_comment`.`u_nick` AS `parent_comment_nick`,`parent_comment`.`u_name` AS `parent_comment_name` from ((`wx_comment` left join `wx_comment` `parent_comment` on((`wx_comment`.`parent_id` = `parent_comment`.`discuss_id`))) join `nc_topic` on((`wx_comment`.`relate_id` = `nc_topic`.`topic_id`))) where (`nc_topic`.`status` = 0);

-- ----------------------------
-- View structure for wx_topic
-- ----------------------------
DROP VIEW IF EXISTS `wx_topic`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `wx_topic` AS select `nc_topic`.`topic_id` AS `topic_id`,`nc_topic`.`topic_title` AS `topic_title`,`nc_topic`.`topic_content` AS `topic_content`,`nc_topic`.`topic_images` AS `topic_images`,`nc_topic`.`topic_videos` AS `topic_videos`,`nc_topic`.`topic_stars` AS `topic_stars`,`nc_topic`.`topic_likes` AS `topic_likes`,`nc_topic`.`topic_flows` AS `topic_flows`,`nc_topic`.`topic_type_id` AS `topic_type_id`,`nc_topic`.`create_time` AS `create_time`,`nc_user`.`uid` AS `uid`,`nc_user`.`u_nick` AS `u_nick`,`nc_user`.`u_name` AS `u_name`,`nc_user`.`u_image` AS `u_image`,`nc_user`.`u_type` AS `u_type`,count(`nc_discuss`.`discuss_id`) AS `comment_count`,`nc_topic_type`.`tt_name` AS `tt_name`,`nc_topic_type`.`tt_cover` AS `tt_cover` from (((`nc_user` join `nc_topic` on((`nc_user`.`uid` = `nc_topic`.`create_uid`))) left join `nc_discuss` on(((`nc_discuss`.`relate_id` = `nc_topic`.`topic_id`) and (`nc_discuss`.`status` = 0)))) join `nc_topic_type` on((`nc_topic`.`topic_type_id` = `nc_topic_type`.`tt_id`))) where (`nc_topic`.`status` = 0) group by `nc_topic`.`topic_id`;

SET FOREIGN_KEY_CHECKS = 1;

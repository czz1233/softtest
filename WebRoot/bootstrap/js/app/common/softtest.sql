/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : softtest

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-04-24 00:56:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for SFT_SOFTWARE
-- ----------------------------
DROP TABLE IF EXISTS `SFT_SOFTWARE`;
CREATE TABLE `SFT_SOFTWARE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `ENVIRONMENT` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VISION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SFT_SOFTWARE
-- ----------------------------
INSERT INTO `SFT_SOFTWARE` VALUES ('2b9081e65443e17e015444045e200018', '2016-04-24 00:46:58', '超级管理员【admin】', 'linux centos6.5 jdk 1.7', '禅道管理系统', '这是一款神奇的软件', '1', 'B/S小型企业级应用软件', 'v 1.0');

-- ----------------------------
-- Table structure for SFT_SOFTWARETYPE
-- ----------------------------
DROP TABLE IF EXISTS `SFT_SOFTWARETYPE`;
CREATE TABLE `SFT_SOFTWARETYPE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SFT_SOFTWARETYPE
-- ----------------------------
INSERT INTO `SFT_SOFTWARETYPE` VALUES ('2b9081e65443e17e0154440383620016', '2016-04-24 00:46:02', '超级管理员【admin】', 'B/S小型企业级应用软件', 'B/S小型企业级应用软件....', '1');
INSERT INTO `SFT_SOFTWARETYPE` VALUES ('2b9081e65443e17e01544403c04a0017', '2016-04-24 00:46:17', '超级管理员【admin】', 'B/S中型企业级应用软件', '', '1');

-- ----------------------------
-- Table structure for SFT_TESTEXAMPLE
-- ----------------------------
DROP TABLE IF EXISTS `SFT_TESTEXAMPLE`;
CREATE TABLE `SFT_TESTEXAMPLE` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` longtext,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TEST_ENVIRONMENT` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TEST_PLAN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_9ib26e8biwxs8oe9uilmh2lhn` (`TEST_PLAN`),
  CONSTRAINT `FK_9ib26e8biwxs8oe9uilmh2lhn` FOREIGN KEY (`TEST_PLAN`) REFERENCES `sft_testplan` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SFT_TESTEXAMPLE
-- ----------------------------
INSERT INTO `SFT_TESTEXAMPLE` VALUES ('2b9081e65443e17e0154440997cd001e', '<h1>\r\n	<strong><em><span style=\"color:#009900;\">1、查看登陆页面有无滚动条，正常：没有</span></em></strong>\r\n</h1>\r\n<h1>\r\n	<strong><em><span style=\"color:#009900;\"><img src=\"/softtest/upload/image/20160424/20160424005146_975.jpg\" alt=\"\" /></span></em></strong>\r\n</h1>\r\n<h1>\r\n	<strong><em><span style=\"color:#000000;\">2:登陆失败后，提示用户名或者密码错误</span></em></strong>\r\n</h1>\r\n<p>\r\n	<strong><em><span style=\"color:#000000;\"><img src=\"/softtest/upload/image/20160424/20160424005237_32.jpg\" alt=\"\" /><br />\r\n</span></em></strong>\r\n</p>', '2016-04-24 00:52:40', '超级管理员【admin】', '....', '1', 'windows7  chrome浏览器...', '登陆测试', '2b9081e65443e17e01544405dbce001c');

-- ----------------------------
-- Table structure for SFT_TESTPLAN
-- ----------------------------
DROP TABLE IF EXISTS `SFT_TESTPLAN`;
CREATE TABLE `SFT_TESTPLAN` (
  `ID` varchar(50) NOT NULL,
  `BEGIN_TIME` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SFT_TESTPLAN
-- ----------------------------
INSERT INTO `SFT_TESTPLAN` VALUES ('2b9081e65443e17e01544405dbce001c', '2016-04-24 00:48:00', '2016-04-24 00:48:35', '超级管理员【admin】', '2016-06-01 01:00:00', '请大家抓紧测试', '1', '1', '禅道首轮测试计划', '首轮测试');
INSERT INTO `SFT_TESTPLAN` VALUES ('2b9081e65443e17e01544406bf9a001d', '2016-04-20 00:05:00', '2016-04-24 00:49:34', '超级管理员【admin】', '2016-05-07 15:45:00', '1', '-1', '1', '二次测试', '二轮测试');

-- ----------------------------
-- Table structure for SFT_TESTPLANTYPE
-- ----------------------------
DROP TABLE IF EXISTS `SFT_TESTPLANTYPE`;
CREATE TABLE `SFT_TESTPLANTYPE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SFT_TESTPLANTYPE
-- ----------------------------
INSERT INTO `SFT_TESTPLANTYPE` VALUES ('2b9081e65443e17e01544404dc4a0019', '2016-04-24 00:47:30', '超级管理员【admin】', '首轮测试', '1', '1');
INSERT INTO `SFT_TESTPLANTYPE` VALUES ('2b9081e65443e17e01544404fd38001a', '2016-04-24 00:47:38', '超级管理员【admin】', '二轮测试', '', '1');
INSERT INTO `SFT_TESTPLANTYPE` VALUES ('2b9081e65443e17e01544405152a001b', '2016-04-24 00:47:44', '超级管理员【admin】', '回归测试', '', '1');

-- ----------------------------
-- Table structure for SYS_ACCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ACCOUNT`;
CREATE TABLE `SYS_ACCOUNT` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT` varchar(120) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(120) DEFAULT NULL,
  `DESCRIBLE` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CHECK_CODE` varchar(255) DEFAULT NULL,
  `EMAIL_CHECK_TAG` varchar(255) DEFAULT NULL,
  `ENABLE` bit(1) DEFAULT NULL,
  `LEVEL` varchar(255) DEFAULT NULL,
  `NICK_NAME` varchar(120) DEFAULT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `PHTOTO` longtext,
  `QQ` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `SEX` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TEL` varchar(255) DEFAULT NULL,
  `TYEPE_ID` varchar(50) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_2ohbqfoudqodbchyuvvs6i6hx` (`ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ACCOUNT
-- ----------------------------
INSERT INTO `SYS_ACCOUNT` VALUES ('18863774-60df-11e5-8a98-742f68372bed', 'admin', null, '2016-04-20 17:01:55', '超级管理员[admin]', '超级管理员，管理系统', null, null, null, '', null, '超级管理员', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, '1', null, null, null);
INSERT INTO `SYS_ACCOUNT` VALUES ('2b9081e65443e17e015443f2d7a80004', 'user01', null, '2016-04-24 00:27:49', '超级管理员【admin】', null, null, null, null, '', null, '项目主管---张三', 'e10adc3949ba59abbe56e057f20f883e', 'upload\\images\\20160424\\74ec70e1-750e-401d-9fec-3e1f54fd50ea.jpg', null, '', '1', '1', null, null, null);
INSERT INTO `SYS_ACCOUNT` VALUES ('2b9081e65443e17e015444010e3f0011', 'user02', null, '2016-04-24 00:43:20', '超级管理员【admin】', null, null, null, null, '', null, '项目经理--李四', 'e10adc3949ba59abbe56e057f20f883e', 'upload\\images\\20160424\\4ee25ca7-6f6e-4585-a384-09709f4694a9.jpg', null, '', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for SYS_ACCOUNT_RIGHT
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ACCOUNT_RIGHT`;
CREATE TABLE `SYS_ACCOUNT_RIGHT` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `RIGHT_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_mvpvjse8md72g2bng92w8s5nb` (`ACCOUNT_ID`),
  KEY `FK_708erv4b9byda9l9cnxdyw7j4` (`RIGHT_ID`),
  CONSTRAINT `FK_708erv4b9byda9l9cnxdyw7j4` FOREIGN KEY (`RIGHT_ID`) REFERENCES `sys_right` (`ID`),
  CONSTRAINT `FK_mvpvjse8md72g2bng92w8s5nb` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ACCOUNT_RIGHT
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_ACCOUNT_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ACCOUNT_ROLE`;
CREATE TABLE `SYS_ACCOUNT_ROLE` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fnmfk81ktlhqvg1p8b6nx2d4k` (`ACCOUNT_ID`),
  KEY `FK_9gs6k5fv01iwr0nyp06w4lcou` (`ROLE_ID`),
  CONSTRAINT `FK_9gs6k5fv01iwr0nyp06w4lcou` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`),
  CONSTRAINT `FK_fnmfk81ktlhqvg1p8b6nx2d4k` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ACCOUNT_ROLE
-- ----------------------------
INSERT INTO `SYS_ACCOUNT_ROLE` VALUES ('2b9081e65443e17e015443f2d7b80005', '2b9081e65443e17e015443f2d7a80004', '2b9081e65443e17e015443f235500001');
INSERT INTO `SYS_ACCOUNT_ROLE` VALUES ('2b9081e65443e17e015444010e510012', '2b9081e65443e17e015444010e3f0011', '2b9081e65443e17e015444004bd7000e');
INSERT INTO `SYS_ACCOUNT_ROLE` VALUES ('86bc8fbe-e86b-11e5-b9fb-00e0667c4153', '18863774-60df-11e5-8a98-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');

-- ----------------------------
-- Table structure for SYS_DICTIONARY
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICTIONARY`;
CREATE TABLE `SYS_DICTIONARY` (
  `ID` varchar(50) NOT NULL,
  `DICT_NAME` varchar(120) NOT NULL,
  `DICT_TYPE` varchar(120) NOT NULL,
  `DICT_VALUE` varchar(120) NOT NULL,
  `EXT01` varchar(255) DEFAULT NULL,
  `EXT02` varchar(255) DEFAULT NULL,
  `EXT03` varchar(255) DEFAULT NULL,
  `EXT04` varchar(255) DEFAULT NULL,
  `EXT05` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_DICTIONARY
-- ----------------------------
INSERT INTO `SYS_DICTIONARY` VALUES ('9847d4d5-d3e1-11e5-9a09-00e0667c4153', '男', 'PERSION_SEX', '1', null, null, null, null, null, null);
INSERT INTO `SYS_DICTIONARY` VALUES ('98550335-d3e1-11e5-9a09-00e0667c4153', '女', 'PERSION_SEX', '2', null, null, null, null, null, null);
INSERT INTO `SYS_DICTIONARY` VALUES ('986cea06-d3e1-11e5-9a09-00e0667c4153', '保密', 'PERSION_SEX', '3', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for SYS_DICTIONARY_ITEM
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DICTIONARY_ITEM`;
CREATE TABLE `SYS_DICTIONARY_ITEM` (
  `ID` varchar(50) NOT NULL,
  `DICT_NAME` varchar(120) NOT NULL,
  `DICT_TYPE` varchar(120) NOT NULL,
  `ISEDIT` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_1dfswy8xlvr0ub4oemm4mqg6n` (`DICT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_DICTIONARY_ITEM
-- ----------------------------
INSERT INTO `SYS_DICTIONARY_ITEM` VALUES ('97e4e9d3-d3e1-11e5-9a09-00e0667c4153', '性别', 'PERSION_SEX', '');

-- ----------------------------
-- Table structure for SYS_RIGHT
-- ----------------------------
DROP TABLE IF EXISTS `SYS_RIGHT`;
CREATE TABLE `SYS_RIGHT` (
  `ID` varchar(50) NOT NULL,
  `CODE` varchar(120) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(120) DEFAULT NULL,
  `DESCRIBLE` varchar(255) DEFAULT NULL,
  `ICON` varchar(120) DEFAULT NULL,
  `ICONCLS` varchar(120) DEFAULT NULL,
  `IMG_URL` varchar(120) DEFAULT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `PARENT_ID` varchar(50) DEFAULT NULL,
  `SORT_BY` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `URL` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_3fly3uan6grx7g9xvy6st29fl` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_RIGHT
-- ----------------------------
INSERT INTO `SYS_RIGHT` VALUES ('038a8839-0964-11e6-9f14-00e0667c4153', '#SOFTTEST_TESTPLAN_INDEX', '2016-04-23 22:59:44', '管理员', '软件管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '发布计划', '52d8d80f-095c-11e6-9f14-00e0667c4153', '24', '1', '2', 'softtest/testplan/index');
INSERT INTO `SYS_RIGHT` VALUES ('039dcfb5-0964-11e6-9f14-00e0667c4153', '#SOFTTEST_TESTPLAN_AUDIT', '2016-04-23 22:59:44', '管理员', '软件管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '审核计划', '52d8d80f-095c-11e6-9f14-00e0667c4153', '25', '1', '2', 'softtest/testplan/audit');
INSERT INTO `SYS_RIGHT` VALUES ('0c2339fe-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_INDEX', '2016-03-11 21:27:49', '管理员', '角色管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '角色管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '21', '1', '2', 'system/role/index');
INSERT INTO `SYS_RIGHT` VALUES ('0c371896-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_ADD', '2016-03-11 21:27:49', '管理员', '新增角色--3级按钮权限', null, 'icon-add', null, '新增角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '211', '-1', '3', 'system/role/add');
INSERT INTO `SYS_RIGHT` VALUES ('0c4d9236-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_EDIT', '2016-03-11 21:27:49', '管理员', '编辑角色--3级按钮权限', null, 'icon-edit', null, '编辑角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '212', '-1', '3', 'system/role/edit');
INSERT INTO `SYS_RIGHT` VALUES ('0c6032e5-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_DELETE', '2016-03-11 21:27:49', '管理员', '删除角色--3级按钮权限', null, 'icon-remove', null, '删除角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '213', '-1', '3', 'system/role/deleteRole');
INSERT INTO `SYS_RIGHT` VALUES ('35eb57b8-0963-11e6-9f14-00e0667c4153', '#SOFTTEST_TESTPLANTYPE_INDEX', '2016-04-23 22:53:59', '管理员', '软件管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '计划类型', '52d8d80f-095c-11e6-9f14-00e0667c4153', '23', '1', '2', 'softtest/testplantype/index');
INSERT INTO `SYS_RIGHT` VALUES ('400f6152-0969-11e6-9f14-00e0667c4153', '#SOFTTEST_TESTEXAMPLE_INDEX', '2016-04-23 23:37:13', '管理员', '软件管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '测试用例', '52d8d80f-095c-11e6-9f14-00e0667c4153', '26', '1', '2', 'softtest/testexample/index');
INSERT INTO `SYS_RIGHT` VALUES ('52d8d80f-095c-11e6-9f14-00e0667c4153', '#SOFTTEST', '2016-04-23 22:04:41', '管理员', '测试管理--1级分类权限', 'fa-sign-in', 'icon-system', null, '用例管理', null, '2', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('52e0f826-095c-11e6-9f14-00e0667c4153', '#SOFTTEST_SOFTWARETYPE_INDEX', '2016-04-23 22:04:41', '管理员', '软件类型管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '软件类型', '52d8d80f-095c-11e6-9f14-00e0667c4153', '21', '1', '2', 'softtest/softwaretype/index');
INSERT INTO `SYS_RIGHT` VALUES ('743876e9-095d-11e6-9f14-00e0667c4153', '#SOFTTEST_SOFTWARE_INDEX', '2016-04-23 22:12:47', '管理员', '软件管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '软件管理', '52d8d80f-095c-11e6-9f14-00e0667c4153', '22', '1', '2', 'softtest/software/index');
INSERT INTO `SYS_RIGHT` VALUES ('88c16fc2-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM', '2016-02-15 20:42:12', '管理员', '系统管理--1级分类权限', 'fa fa-cogs', 'icon-system', null, '系统管理', null, '1', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('8913013f-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_INDEX', '2016-02-15 20:42:12', '管理员', '账号管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '账号管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '11', '1', '2', 'system/account/index.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('89329c24-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_ADD', '2016-02-15 20:42:12', '管理员', '新增账号--3级按钮权限', null, 'icon-add', null, '新增账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '111', '-1', '3', 'system/account/add.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('894187b7-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_EDIT', '2016-02-15 20:42:13', '管理员', '编辑账号--3级按钮权限', null, 'icon-edit', null, '编辑账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '112', '-1', '3', 'system/account/edit.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('8950cd83-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_DELETE', '2016-02-15 20:42:13', '管理员', '删除账号--3级按钮权限', null, 'icon-remove', null, '删除账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '113', '-1', '3', 'system/account/deleteAccount.mvc');

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE` (
  `ID` varchar(50) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(120) DEFAULT NULL,
  `DESCRIBLE` varchar(255) DEFAULT NULL,
  `ENABLE` bit(1) DEFAULT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO `SYS_ROLE` VALUES ('0760c4a9-60df-11e5-8a98-742f68372bed', '2016-03-13 00:00:22', '管理员', '系统超级管理员，请勿删除', '', '系统超级管理员', '1');
INSERT INTO `SYS_ROLE` VALUES ('2b9081e65443e17e015443f158140000', '2016-04-24 00:26:11', '超级管理员【admin】', '13', '', '123', '-1');
INSERT INTO `SYS_ROLE` VALUES ('2b9081e65443e17e015443f235500001', '2016-04-24 00:27:07', '超级管理员【admin】', '负责发布选件信息，对软件进行管理', '', '项目主管', '1');
INSERT INTO `SYS_ROLE` VALUES ('2b9081e65443e17e015443fff748000d', '2016-04-24 00:42:09', '超级管理员【admin】', '12', '', '12312', '-1');
INSERT INTO `SYS_ROLE` VALUES ('2b9081e65443e17e015444004bd7000e', '2016-04-24 00:42:31', '超级管理员【admin】', '项目经理', '', '项目经理', '1');

-- ----------------------------
-- Table structure for SYS_ROLE_RIGHT
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE_RIGHT`;
CREATE TABLE `SYS_ROLE_RIGHT` (
  `ID` varchar(50) NOT NULL,
  `RIGHT_ID` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_s1f73s3b49p1mr3f12winuw8v` (`RIGHT_ID`),
  KEY `FK_h5tfegtn5va1dosmdufd1486d` (`ROLE_ID`),
  CONSTRAINT `FK_h5tfegtn5va1dosmdufd1486d` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`),
  CONSTRAINT `FK_s1f73s3b49p1mr3f12winuw8v` FOREIGN KEY (`RIGHT_ID`) REFERENCES `sys_right` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ROLE_RIGHT
-- ----------------------------
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015443f3d9180006', '400f6152-0969-11e6-9f14-00e0667c4153', '2b9081e65443e17e015443f235500001');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015443f3d9180007', '52d8d80f-095c-11e6-9f14-00e0667c4153', '2b9081e65443e17e015443f235500001');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015443f3d9180008', '52e0f826-095c-11e6-9f14-00e0667c4153', '2b9081e65443e17e015443f235500001');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015443f3d9180009', '743876e9-095d-11e6-9f14-00e0667c4153', '2b9081e65443e17e015443f235500001');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015444020daa0013', '038a8839-0964-11e6-9f14-00e0667c4153', '2b9081e65443e17e015444004bd7000e');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015444020daa0014', '039dcfb5-0964-11e6-9f14-00e0667c4153', '2b9081e65443e17e015444004bd7000e');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('2b9081e65443e17e015444020daa0015', '52d8d80f-095c-11e6-9f14-00e0667c4153', '2b9081e65443e17e015444004bd7000e');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4284635e-0969-11e6-9f14-00e0667c4153', '52d8d80f-095c-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4314608f-0969-11e6-9f14-00e0667c4153', '52e0f826-095c-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('431461c6-0969-11e6-9f14-00e0667c4153', '743876e9-095d-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146290-0969-11e6-9f14-00e0667c4153', '400f6152-0969-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4314635a-0969-11e6-9f14-00e0667c4153', '35eb57b8-0963-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146417-0969-11e6-9f14-00e0667c4153', '039dcfb5-0964-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('431464d8-0969-11e6-9f14-00e0667c4153', '038a8839-0964-11e6-9f14-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146595-0969-11e6-9f14-00e0667c4153', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4314665c-0969-11e6-9f14-00e0667c4153', '89329c24-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4314671f-0969-11e6-9f14-00e0667c4153', '8950cd83-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('431467e3-0969-11e6-9f14-00e0667c4153', '894187b7-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('431468a4-0969-11e6-9f14-00e0667c4153', '8913013f-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('4314696a-0969-11e6-9f14-00e0667c4153', '0c371896-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146a24-0969-11e6-9f14-00e0667c4153', '0c6032e5-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146ade-0969-11e6-9f14-00e0667c4153', '0c4d9236-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('43146b7f-0969-11e6-9f14-00e0667c4153', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');

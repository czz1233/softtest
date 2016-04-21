/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : roadline

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-04-16 18:05:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for RL_LINE
-- ----------------------------
DROP TABLE IF EXISTS `RL_LINE`;
CREATE TABLE `RL_LINE` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_LINE
-- ----------------------------
INSERT INTO `RL_LINE` VALUES ('402881f05413bba5015413f2788f0001', '31', '2016-04-14 16:45:38', '管理员【admin】', 'asd1', '-1', '11', '21');
INSERT INTO `RL_LINE` VALUES ('402881f05413bba5015413f3bb2e0002', '杭州--重庆--上海', '2016-04-14 16:47:01', '管理员【admin】', '', '1', '杭州线路', '1');

-- ----------------------------
-- Table structure for RL_LOGISTICS
-- ----------------------------
DROP TABLE IF EXISTS `RL_LOGISTICS`;
CREATE TABLE `RL_LOGISTICS` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `LINK_ORDER` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ep7ec2g0mj93h10dip61ehcih` (`LINK_ORDER`),
  CONSTRAINT `FK_ep7ec2g0mj93h10dip61ehcih` FOREIGN KEY (`LINK_ORDER`) REFERENCES `rl_order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_LOGISTICS
-- ----------------------------

-- ----------------------------
-- Table structure for RL_NEWS
-- ----------------------------
DROP TABLE IF EXISTS `RL_NEWS`;
CREATE TABLE `RL_NEWS` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` longtext,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `SUB_TITLE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_NEWS
-- ----------------------------
INSERT INTO `RL_NEWS` VALUES ('402881f05413bba5015413cf0ec40000', '<span style=\"background-color:#E53333;\">sad222</span>', '2016-04-14 16:06:57', '管理员【admin】', '1', '22', '123');

-- ----------------------------
-- Table structure for RL_ORDER
-- ----------------------------
DROP TABLE IF EXISTS `RL_ORDER`;
CREATE TABLE `RL_ORDER` (
  `ID` varchar(50) NOT NULL,
  `APPLY_TIME` datetime DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `CANCEL_TIME` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `FINISH_TIME` datetime DEFAULT NULL,
  `GOODS` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `APPLY_USER` varchar(50) DEFAULT NULL,
  `AUDIT_USER` varchar(50) DEFAULT NULL,
  `LINE` varchar(50) DEFAULT NULL,
  `TRUCK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_76bckp1mug4wljpgo9omrq8w8` (`APPLY_USER`),
  KEY `FK_pqq47yuopg8rx1opyc8f309qt` (`AUDIT_USER`),
  KEY `FK_fpwcnayevfc2xfo65q4l4oguq` (`LINE`),
  KEY `FK_ak2idmqxhy16k15s7gay16qyg` (`TRUCK`),
  CONSTRAINT `FK_ak2idmqxhy16k15s7gay16qyg` FOREIGN KEY (`TRUCK`) REFERENCES `rl_truck` (`ID`),
  CONSTRAINT `FK_76bckp1mug4wljpgo9omrq8w8` FOREIGN KEY (`APPLY_USER`) REFERENCES `sys_account` (`ID`),
  CONSTRAINT `FK_fpwcnayevfc2xfo65q4l4oguq` FOREIGN KEY (`LINE`) REFERENCES `rl_line` (`ID`),
  CONSTRAINT `FK_pqq47yuopg8rx1opyc8f309qt` FOREIGN KEY (`AUDIT_USER`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_ORDER
-- ----------------------------
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541db7536c0001', null, null, null, null, '2016-04-16 14:17:14', '管理员【admin】', null, '玛钢件', '2', null, '1', '112', null, null, null, null);
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541e1f27d90002', '2016-04-16 16:10:39', null, '2016-04-16 16:55:06', '20160416', '2016-04-16 16:10:39', '管理员【admin】', null, '1', '2', '3', '1', '4', null, null, null, null);
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541e4e38cd0003', '2016-04-16 17:02:03', null, '2016-04-16 17:02:12', '20160416', '2016-04-16 17:02:03', '管理员【admin】', null, '啊', '啊我', '3', '1', '1', null, null, null, null);
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541e4e8d560004', '2016-04-16 17:02:25', '2016-04-16 17:36:56', null, '20160416', '2016-04-16 17:02:25', '管理员【admin】', '2016-04-16 17:41:38', '1', '2', '2', '1', '4', null, null, '402881f05413bba5015413f3bb2e0002', '2b9081e5541ce9c901541cea69230000');
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541e5f78320005', '2016-04-16 17:20:54', '2016-04-16 17:38:33', null, '20160416', '2016-04-16 17:20:54', '管理员【admin】', '2016-04-16 17:40:39', '1', '2', '2', '1', '4', null, null, '402881f05413bba5015413f3bb2e0002', '2b9081e5541ce9c901541cea69230000');
INSERT INTO `RL_ORDER` VALUES ('2b9081e5541ce9c901541e6908e20006', '2016-04-16 17:31:21', '2016-04-16 17:36:01', null, '20160416', '2016-04-16 17:31:21', '管理员【admin】', '2016-04-16 17:40:42', '1', '2', '2', '1', '4', '18863774-60df-11e5-8a98-742f68372bed', null, '402881f05413bba5015413f3bb2e0002', '2b9081e5541ce9c901541cea69230000');

-- ----------------------------
-- Table structure for RL_TALK
-- ----------------------------
DROP TABLE IF EXISTS `RL_TALK`;
CREATE TABLE `RL_TALK` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `REBACK` varchar(255) DEFAULT NULL,
  `REBACK_TIME` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `REBACK_USER` varchar(50) DEFAULT NULL,
  `SEND_USER` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_a6p7wq386vwn9oiywxxq3nu7r` (`REBACK_USER`),
  KEY `FK_pwmb4stbs0ohfynctcn9lx1yu` (`SEND_USER`),
  CONSTRAINT `FK_pwmb4stbs0ohfynctcn9lx1yu` FOREIGN KEY (`SEND_USER`) REFERENCES `sys_account` (`ID`),
  CONSTRAINT `FK_a6p7wq386vwn9oiywxxq3nu7r` FOREIGN KEY (`REBACK_USER`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_TALK
-- ----------------------------
INSERT INTO `RL_TALK` VALUES ('2b9081e5541e6f6501541e7a39dd0000', '2', '2016-04-16 17:50:07', '管理员【admin】', null, null, '-1', '1', null, null);
INSERT INTO `RL_TALK` VALUES ('2b9081e5541e7cc901541e8019ba0000', '2', '2016-04-16 17:56:32', '管理员【admin】', '按时试试水', '2016-04-16 18:05:39', '1', '12', '18863774-60df-11e5-8a98-742f68372bed', '18863774-60df-11e5-8a98-742f68372bed');

-- ----------------------------
-- Table structure for RL_TRUCK
-- ----------------------------
DROP TABLE IF EXISTS `RL_TRUCK`;
CREATE TABLE `RL_TRUCK` (
  `ID` varchar(50) NOT NULL,
  `ALLOW_WEIGHT` double DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `NUM` varchar(255) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `USER_TEL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of RL_TRUCK
-- ----------------------------
INSERT INTO `RL_TRUCK` VALUES ('2b9081e5541ce9c901541cea69230000', '2.01', 'NO0021', '2016-04-16 10:33:25', '管理员【admin】', '云A92541', '0', '1', '11', '31', '41');
INSERT INTO `RL_TRUCK` VALUES ('402881f05413bba501541400fb980003', '4', '1', '2016-04-14 17:01:29', '管理员【admin】', '2', '0', '-1', '3', '5', '6');

-- ----------------------------
-- Table structure for SYS_ACCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ACCOUNT`;
CREATE TABLE `SYS_ACCOUNT` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT` varchar(120) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATOR` varchar(120) DEFAULT NULL,
  `ENABLE` bit(1) DEFAULT NULL,
  `NICK_NAME` varchar(120) DEFAULT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `PHTOTO` longtext,
  `REMARK` varchar(255) DEFAULT NULL,
  `SEX` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TYEPE_ID` varchar(50) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_2ohbqfoudqodbchyuvvs6i6hx` (`ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SYS_ACCOUNT
-- ----------------------------
INSERT INTO `SYS_ACCOUNT` VALUES ('18863774-60df-11e5-8a98-742f68372bed', 'admin', '2016-03-13 00:00:22', '管理员', '', '管理员', '21232f297a57a5a743894a0e4a801fc3', null, '系统管理员,勿删', null, '1', null, null);

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
INSERT INTO `SYS_DICTIONARY_ITEM` VALUES ('97e4e9d3-d3e1-11e5-9a09-00e0667c4153', '性别', 'PERSION_SEX', '\0');

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
INSERT INTO `SYS_RIGHT` VALUES ('0c2339fe-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_INDEX', '2016-03-11 21:27:49', '管理员', '角色管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '角色管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '21', '1', '2', 'system/role/index');
INSERT INTO `SYS_RIGHT` VALUES ('0c371896-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_ADD', '2016-03-11 21:27:49', '管理员', '新增角色--3级按钮权限', null, 'icon-add', null, '新增角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '211', '-1', '3', 'system/role/add');
INSERT INTO `SYS_RIGHT` VALUES ('0c4d9236-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_EDIT', '2016-03-11 21:27:49', '管理员', '编辑角色--3级按钮权限', null, 'icon-edit', null, '编辑角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '212', '-1', '3', 'system/role/edit');
INSERT INTO `SYS_RIGHT` VALUES ('0c6032e5-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_DELETE', '2016-03-11 21:27:49', '管理员', '删除角色--3级按钮权限', null, 'icon-remove', null, '删除角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '213', '-1', '3', 'system/role/deleteRole');
INSERT INTO `SYS_RIGHT` VALUES ('1f5af680-037e-11e6-91b8-00e0667c4153', '#RL_ORDER_MGT_INDEX', '2016-04-16 10:51:31', '管理员', '申请订单管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '处理订单', 'd6d1b940-037d-11e6-91b8-00e0667c4153', '22', '1', '2', 'rl/order/mgt/index');
INSERT INTO `SYS_RIGHT` VALUES ('6ce97686-0219-11e6-bcfd-742f68372bed', '#RL_NEWS_INDEX_SEARCH', '2016-04-14 15:53:22', '管理员', '发布新闻管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '查看新闻', 'f5c9fdd3-0215-11e6-bcfd-742f68372bed', '22', '1', '2', 'rl/news/search/index');
INSERT INTO `SYS_RIGHT` VALUES ('88c16fc2-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM', '2016-02-15 20:42:12', '管理员', '系统管理--1级分类权限', 'fa fa-cogs', 'icon-system', null, '系统管理', null, '1', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('8913013f-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_INDEX', '2016-02-15 20:42:12', '管理员', '账号管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '账号管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '11', '1', '2', 'system/account/index.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('89329c24-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_ADD', '2016-02-15 20:42:12', '管理员', '新增账号--3级按钮权限', null, 'icon-add', null, '新增账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '111', '-1', '3', 'system/account/add.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('894187b7-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_EDIT', '2016-02-15 20:42:13', '管理员', '编辑账号--3级按钮权限', null, 'icon-edit', null, '编辑账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '112', '-1', '3', 'system/account/edit.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('8950cd83-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_DELETE', '2016-02-15 20:42:13', '管理员', '删除账号--3级按钮权限', null, 'icon-remove', null, '删除账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '113', '-1', '3', 'system/account/deleteAccount.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('b59a1835-03b7-11e6-91b8-00e0667c4153', '#RL_6', '2016-04-16 17:43:45', '管理员', '留言管理--1级分类权限', 'fa-cogs', 'icon-system', null, '留言管理', null, '6', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('b5bc4728-03b7-11e6-91b8-00e0667c4153', '#RL_TALK_RL_6_INDEX', '2016-04-16 17:43:45', '管理员', '发布留言管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '发布留言', 'b59a1835-03b7-11e6-91b8-00e0667c4153', '21', '1', '2', 'rl/talk/index');
INSERT INTO `SYS_RIGHT` VALUES ('bd61ae5d-021d-11e6-bcfd-742f68372bed', '#RL_2', '2016-04-14 16:49:03', '管理员', '车辆管理--1级分类权限', 'fa-cogs', 'icon-system', null, '车辆管理', null, '4', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('bd732b37-021d-11e6-bcfd-742f68372bed', '#RL_TRUCK_INDEX', '2016-04-14 16:49:03', '管理员', '车辆管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '车辆管理', 'bd61ae5d-021d-11e6-bcfd-742f68372bed', '21', '1', '2', 'rl/truck/index');
INSERT INTO `SYS_RIGHT` VALUES ('c75a7173-021c-11e6-bcfd-742f68372bed', '#RL_1', '2016-04-14 16:42:11', '管理员', '路线管理--1级分类权限', 'fa-cogs', 'icon-system', null, '路线管理', null, '3', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('c76e3777-021c-11e6-bcfd-742f68372bed', '#RL_LINE_INDEX', '2016-04-14 16:42:11', '管理员', '路线管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '路线管理', 'c75a7173-021c-11e6-bcfd-742f68372bed', '21', '1', '2', 'rl/line/index');
INSERT INTO `SYS_RIGHT` VALUES ('cf7ff738-03b7-11e6-91b8-00e0667c4153', '#RL_TALK_RL_6_INDEX_1', '2016-04-16 17:44:28', '管理员', '发布留言管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '回复留言', 'b59a1835-03b7-11e6-91b8-00e0667c4153', '22', '1', '2', 'rl/talk/recall/index');
INSERT INTO `SYS_RIGHT` VALUES ('d6d1b940-037d-11e6-91b8-00e0667c4153', '#RL_3', '2016-04-16 10:49:29', '管理员', '订单管理--1级分类权限', 'fa-cogs', 'icon-system', null, '订单管理', null, '5', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('d6db7635-037d-11e6-91b8-00e0667c4155', '#RL_ORDER_INDEX', '2016-04-16 10:49:29', '管理员', '申请订单管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '申请订单', 'd6d1b940-037d-11e6-91b8-00e0667c4153', '21', '1', '2', 'rl/order/index');
INSERT INTO `SYS_RIGHT` VALUES ('f5c9fdd3-0215-11e6-bcfd-742f68372bed', '#RL', '2016-04-14 15:53:22', '管理员', '新闻管理--1级分类权限', 'fa-cogs', 'icon-system', null, '新闻管理', null, '2', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('f5d708cd-0215-11e6-bcfd-742f68372bed', '#RL_NEWS_INDEX', '2016-04-14 15:53:22', '管理员', '发布新闻管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '发布新闻', 'f5c9fdd3-0215-11e6-bcfd-742f68372bed', '21', '1', '2', 'rl/news/index');

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
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d133a8f8-03b7-11e6-91b8-00e0667c4153', 'f5c9fdd3-0215-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2495-03b7-11e6-91b8-00e0667c4153', 'c75a7173-021c-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d261c-03b7-11e6-91b8-00e0667c4153', 'bd61ae5d-021d-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d26f3-03b7-11e6-91b8-00e0667c4153', 'd6d1b940-037d-11e6-91b8-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d27bd-03b7-11e6-91b8-00e0667c4153', 'b59a1835-03b7-11e6-91b8-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d289a-03b7-11e6-91b8-00e0667c4153', 'c76e3777-021c-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2958-03b7-11e6-91b8-00e0667c4153', 'f5d708cd-0215-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2a1b-03b7-11e6-91b8-00e0667c4153', '6ce97686-0219-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2b25-03b7-11e6-91b8-00e0667c4153', 'd6db7635-037d-11e6-91b8-00e0667c4155', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2bdf-03b7-11e6-91b8-00e0667c4153', '1f5af680-037e-11e6-91b8-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2cad-03b7-11e6-91b8-00e0667c4153', 'b5bc4728-03b7-11e6-91b8-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2d6a-03b7-11e6-91b8-00e0667c4153', 'cf7ff738-03b7-11e6-91b8-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2e2e-03b7-11e6-91b8-00e0667c4153', 'bd732b37-021d-11e6-bcfd-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2ee8-03b7-11e6-91b8-00e0667c4153', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d2fb5-03b7-11e6-91b8-00e0667c4153', '89329c24-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d306c-03b7-11e6-91b8-00e0667c4153', '8950cd83-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d311c-03b7-11e6-91b8-00e0667c4153', '894187b7-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d31d0-03b7-11e6-91b8-00e0667c4153', '8913013f-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d328a-03b7-11e6-91b8-00e0667c4153', '0c371896-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d3327-03b7-11e6-91b8-00e0667c4153', '0c6032e5-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d33c1-03b7-11e6-91b8-00e0667c4153', '0c4d9236-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('d18d3461-03b7-11e6-91b8-00e0667c4153', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');

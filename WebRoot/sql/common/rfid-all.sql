/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : rfid

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-04-12 16:57:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ARCHIVE
-- ----------------------------
DROP TABLE IF EXISTS `ARCHIVE`;
CREATE TABLE `ARCHIVE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(255) DEFAULT NULL,
  `EL_TAG` varchar(255) DEFAULT NULL,
  `GIVE_TO` varchar(255) DEFAULT NULL,
  `GIVE_TO_OPERATOR` varchar(255) DEFAULT NULL,
  `GIVE_TO_REMARK` varchar(255) DEFAULT NULL,
  `GIVE_TO_TIME` datetime DEFAULT NULL,
  `KEY_WORD` varchar(255) DEFAULT NULL,
  `LOACATION` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `ARCHIVETYPE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_mfgngs3kvm9brhkq6en3vuc9i` (`ARCHIVETYPE_ID`),
  CONSTRAINT `FK_mfgngs3kvm9brhkq6en3vuc9i` FOREIGN KEY (`ARCHIVETYPE_ID`) REFERENCES `archivetype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ARCHIVE
-- ----------------------------
INSERT INTO `ARCHIVE` VALUES ('4028811354081c7b01540820090b0002', '2016-04-12 09:39:58', '管理员', 'EL001', null, null, null, null, '1', '2', '3', '-4', '王老师档案', '4028811354081c7b0154081f94b80000');
INSERT INTO `ARCHIVE` VALUES ('4028811354081c7b0154082069dc0003', '2016-04-12 09:40:23', '管理员', 'El001', null, null, null, null, '1', '2', '3', '-3', '长虹企业档案', '4028811354081c7b0154081f94b80000');

-- ----------------------------
-- Table structure for ARCHIVEFILE
-- ----------------------------
DROP TABLE IF EXISTS `ARCHIVEFILE`;
CREATE TABLE `ARCHIVEFILE` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `FILE_URL` varchar(255) DEFAULT NULL,
  `KEY_WORK` varchar(255) DEFAULT NULL,
  `PUT_IN_TIME` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ARCHIVE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_37f08x7645iaeqvpttjv1rnrl` (`ARCHIVE_ID`),
  CONSTRAINT `FK_37f08x7645iaeqvpttjv1rnrl` FOREIGN KEY (`ARCHIVE_ID`) REFERENCES `archive` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ARCHIVEFILE
-- ----------------------------
INSERT INTO `ARCHIVEFILE` VALUES ('402881f0540917c4015409188b3c0000', '阿<span style=\"background-color:#E53333;\">萨德</span>', '2016-04-12 14:11:24', '管理员【admin】', null, '3', '2016-03-29 01:05:00', '-1', '1', '2', null);
INSERT INTO `ARCHIVEFILE` VALUES ('402881f0540917c40154091a940e0001', '1', '2016-04-12 14:13:37', '管理员【admin】', null, '1', '2016-04-20 14:45:00', '-1', '1', '1', null);
INSERT INTO `ARCHIVEFILE` VALUES ('402881f0540917c40154091cf7450002', '1', '2016-04-12 14:16:14', '管理员【admin】', null, '1', '2016-04-12 07:20:00', '-1', '1', '1', null);
INSERT INTO `ARCHIVEFILE` VALUES ('402881f0540917c4015409220d800003', '洗发水贝<span style=\"background-color:#009900;\">多芬234</span>', '2016-04-12 14:21:47', '管理员【admin】', null, '3234', '2016-04-28 09:30:00', '1', '1234', '2234', '4028811354081c7b0154082069dc0003');
INSERT INTO `ARCHIVEFILE` VALUES ('402881f0540991d2015409ad278f0002', '1', '2016-04-12 16:53:43', '管理员【admin】', null, '1', '2016-04-21 08:05:00', '-1', '1', '1', '4028811354081c7b01540820090b0002');

-- ----------------------------
-- Table structure for ARCHIVETYPE
-- ----------------------------
DROP TABLE IF EXISTS `ARCHIVETYPE`;
CREATE TABLE `ARCHIVETYPE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ARCHIVETYPE
-- ----------------------------
INSERT INTO `ARCHIVETYPE` VALUES ('4028811354081c7b0154081f94b80000', '2016-04-12 09:39:28', '管理员【admin】', '人事档案', '', '1');
INSERT INTO `ARCHIVETYPE` VALUES ('4028811354081c7b0154081fb3900001', '2016-04-12 09:39:36', '管理员【admin】', '政企档案', '', '1');
INSERT INTO `ARCHIVETYPE` VALUES ('402881fa53e567bd0153e5934a400000', '2016-04-05 16:39:09', '管理员【admin】', '人事档案1', '人事类别档案信息1', '-1');

-- ----------------------------
-- Table structure for BORROW
-- ----------------------------
DROP TABLE IF EXISTS `BORROW`;
CREATE TABLE `BORROW` (
  `ID` varchar(50) NOT NULL,
  `APPLY_BEGIN_TIME` datetime DEFAULT NULL,
  `APPLY_END_TIME` datetime DEFAULT NULL,
  `APPLY_ID_CARD` varchar(255) DEFAULT NULL,
  `APPLY_ID_CARD_IMAGE` varchar(255) DEFAULT NULL,
  `APPLY_REASON` varchar(255) DEFAULT NULL,
  `APPLY_TIME` datetime DEFAULT NULL,
  `APPLY_USER` varchar(255) DEFAULT NULL,
  `AUDIT_REASON` varchar(255) DEFAULT NULL,
  `AUDIT_TIME` varchar(255) DEFAULT NULL,
  `AUDIT_USER` varchar(255) DEFAULT NULL,
  `BACK_REMARK` varchar(255) DEFAULT NULL,
  `BACK_TIME` datetime DEFAULT NULL,
  `BACK_USER` varchar(255) DEFAULT NULL,
  `GIVE_TO_REMARK` varchar(255) DEFAULT NULL,
  `GIVE_TOTIME` datetime DEFAULT NULL,
  `GIVE_TO_USER` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `RIGHT_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ojxpqcsvy0ieouk1q17trjism` (`RIGHT_ID`),
  CONSTRAINT `FK_ojxpqcsvy0ieouk1q17trjism` FOREIGN KEY (`RIGHT_ID`) REFERENCES `archive` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of BORROW
-- ----------------------------
INSERT INTO `BORROW` VALUES ('402881f0540954cf01540968373a0001', '2016-03-29 01:00:00', '2016-04-21 15:50:00', '3', null, '34', '2016-04-12 15:38:25', '3', 'sfs', '2016-04-12 15:59:15', '管理员', null, null, null, null, null, null, '-2', '4028811354081c7b01540820090b0002');
INSERT INTO `BORROW` VALUES ('402881f0540954cf0154097c73e80002', '2016-03-29 01:05:00', '2016-04-15 09:30:00', '2', null, 'asd asd', '2016-04-12 16:00:32', '1', 'd', '2016-04-12 16:01:08', '管理员', null, '2016-04-12 16:16:55', '管理员', null, '2016-04-12 16:12:06', '管理员', '3', '4028811354081c7b01540820090b0002');

-- ----------------------------
-- Table structure for LIVE_RECORD
-- ----------------------------
DROP TABLE IF EXISTS `LIVE_RECORD`;
CREATE TABLE `LIVE_RECORD` (
  `ID` varchar(50) NOT NULL,
  `LIVE_REASON` varchar(255) DEFAULT NULL,
  `LIVE_TIME` datetime DEFAULT NULL,
  `LIVE_TO` varchar(255) DEFAULT NULL,
  `LIVE_USER` varchar(255) DEFAULT NULL,
  `OPERATE_TIMME` datetime DEFAULT NULL,
  `OPERATE_USER` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `ARCHIVE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_gmg74fvkw5tywtp5dimwdietg` (`ARCHIVE_ID`),
  CONSTRAINT `FK_gmg74fvkw5tywtp5dimwdietg` FOREIGN KEY (`ARCHIVE_ID`) REFERENCES `archive` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of LIVE_RECORD
-- ----------------------------
INSERT INTO `LIVE_RECORD` VALUES ('402881f0540991d2015409aa38130001', '1', '2016-04-06 08:10:00', '2', '1', '2016-04-12 16:50:31', '管理员', null, '4028811354081c7b0154082069dc0003');

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
INSERT INTO `SYS_RIGHT` VALUES ('7a90a998-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_INDEX', '2016-04-05 16:43:33', '管理员', '档案管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '档案管理', 'cb731425-fb08-11e5-ab76-742f68372bed', '22', '1', '2', 'rfid/archive/index');
INSERT INTO `SYS_RIGHT` VALUES ('7a9e92db-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_ADD', '2016-04-05 16:43:33', '管理员', '新增档案--3级按钮权限', null, 'icon-add', null, '新增档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '211', '-1', '3', 'rfid/archive/add');
INSERT INTO `SYS_RIGHT` VALUES ('7aa7b5da-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_EDIT', '2016-04-05 16:43:33', '管理员', '编辑档案--3级按钮权限', null, 'icon-edit', null, '编辑档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '212', '-1', '3', 'rfid/archive/edit');
INSERT INTO `SYS_RIGHT` VALUES ('7ab1a210-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_DELETE', '2016-04-05 16:43:33', '管理员', '删除档案--3级按钮权限', null, 'icon-remove', null, '删除档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '213', '-1', '3', 'rfid/archive/deleteArchive');
INSERT INTO `SYS_RIGHT` VALUES ('7e01808c-0087-11e6-aced-742f68372bed', '#RFID_3', '2016-04-12 16:21:02', '管理员', '调档管理--1级分类权限', 'fa-industry', 'icon-system', null, '调档管理', null, '4', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('7e15eec2-0087-11e6-aced-742f68372bed', '#RFID_LIVERECORD_INDEX', '2016-04-12 16:21:02', '管理员', '调档记录管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '调档记录', '7e01808c-0087-11e6-aced-742f68372bed', '24', '1', '2', 'rfid/liverecord/index');
INSERT INTO `SYS_RIGHT` VALUES ('7e1ff63c-0087-11e6-aced-742f68372bed', '#RFID_LIVERECORD_ADD', '2016-04-12 16:21:02', '管理员', '新增调档记录--3级按钮权限', null, 'icon-add', null, '新增调档记录', '7e15eec2-0087-11e6-aced-742f68372bed', '211', '-1', '3', 'rfid/liverecord/add');
INSERT INTO `SYS_RIGHT` VALUES ('7e27366b-0087-11e6-aced-742f68372bed', '#RFID_LIVERECORD_EDIT', '2016-04-12 16:21:02', '管理员', '编辑调档记录--3级按钮权限', null, 'icon-edit', null, '编辑调档记录', '7e15eec2-0087-11e6-aced-742f68372bed', '212', '-1', '3', 'rfid/liverecord/edit');
INSERT INTO `SYS_RIGHT` VALUES ('7e2dc63a-0087-11e6-aced-742f68372bed', '#RFID_LIVERECORD_DELETE', '2016-04-12 16:21:02', '管理员', '删除调档记录--3级按钮权限', null, 'icon-remove', null, '删除调档记录', '7e15eec2-0087-11e6-aced-742f68372bed', '213', '-1', '3', 'rfid/liverecord/deleteLiveRecord');
INSERT INTO `SYS_RIGHT` VALUES ('88c16fc2-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM', '2016-02-15 20:42:12', '管理员', '系统管理--1级分类权限', 'fa fa-cogs', 'icon-system', null, '系统管理', null, '1', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('8913013f-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_INDEX', '2016-02-15 20:42:12', '管理员', '账号管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '账号管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '11', '1', '2', 'system/account/index.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('89329c24-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_ADD', '2016-02-15 20:42:12', '管理员', '新增账号--3级按钮权限', null, 'icon-add', null, '新增账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '111', '-1', '3', 'system/account/add.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('894187b7-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_EDIT', '2016-02-15 20:42:13', '管理员', '编辑账号--3级按钮权限', null, 'icon-edit', null, '编辑账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '112', '-1', '3', 'system/account/edit.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('8950cd83-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_DELETE', '2016-02-15 20:42:13', '管理员', '删除账号--3级按钮权限', null, 'icon-remove', null, '删除账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '113', '-1', '3', 'system/account/deleteAccount.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('91470f08-007b-11e6-aced-742f68372bed', '#RFID_2', '2016-04-12 14:55:40', '管理员', '档案外借--1级分类权限', 'fa-book', 'icon-system', null, '档案外借', null, '3', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('914e8bc0-007b-11e6-aced-742f68372bed', '#RFID_BORROW_INDEX', '2016-04-12 14:55:40', '管理员', '申请外借管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '申请外借', '91470f08-007b-11e6-aced-742f68372bed', '21', '1', '2', 'rfid/borrow/apply/index');
INSERT INTO `SYS_RIGHT` VALUES ('915586f6-007b-11e6-aced-742f68372bed', '#RFID_BORROW_INDEX_2', '2016-04-12 14:55:40', '管理员', '申请外借管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '档案外借', '91470f08-007b-11e6-aced-742f68372bed', '23', '1', '2', 'rfid/borrow/give/index');
INSERT INTO `SYS_RIGHT` VALUES ('a6b69fa8-007b-11e6-aced-742f68372bed', '#RFID_BORROW_INDEX_3', '2016-04-12 14:56:16', '管理员', '申请外借管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '档案归还', '91470f08-007b-11e6-aced-742f68372bed', '24', '1', '2', 'rfid/borrow/back/index');
INSERT INTO `SYS_RIGHT` VALUES ('ad1b54ec-007d-11e6-aced-742f68372bed', '#RFID_BORROW_INDEX_4', '2016-04-12 14:55:40', '管理员', '申请外借管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '外借审核', '91470f08-007b-11e6-aced-742f68372bed', '22', '1', '2', 'rfid/borrow/audit/index');
INSERT INTO `SYS_RIGHT` VALUES ('c3b4d6a4-004f-11e6-aced-742f68372bed', '#RFID_ARCHIVEFILE_INDEX', '2016-04-12 09:42:06', '管理员', '文档管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '文档管理', 'cb731425-fb08-11e5-ab76-742f68372bed', '23', '1', '2', 'rfid/archivefile/index');
INSERT INTO `SYS_RIGHT` VALUES ('c3c5ff6f-004f-11e6-aced-742f68372bed', '#RFID_ARCHIVEFILE_ADD', '2016-04-12 09:42:06', '管理员', '新增文档--3级按钮权限', null, 'icon-add', null, '新增文档', 'c3b4d6a4-004f-11e6-aced-742f68372bed', '211', '-1', '3', 'rfid/archivefile/add');
INSERT INTO `SYS_RIGHT` VALUES ('c3ccb040-004f-11e6-aced-742f68372bed', '#RFID_ARCHIVEFILE_EDIT', '2016-04-12 09:42:06', '管理员', '编辑文档--3级按钮权限', null, 'icon-edit', null, '编辑文档', 'c3b4d6a4-004f-11e6-aced-742f68372bed', '212', '-1', '3', 'rfid/archivefile/edit');
INSERT INTO `SYS_RIGHT` VALUES ('c3d8cf65-004f-11e6-aced-742f68372bed', '#RFID_ARCHIVEFILE_DELETE', '2016-04-12 09:42:07', '管理员', '删除文档--3级按钮权限', null, 'icon-remove', null, '删除文档', 'c3b4d6a4-004f-11e6-aced-742f68372bed', '213', '-1', '3', 'rfid/archivefile/deleteArchiveFile');
INSERT INTO `SYS_RIGHT` VALUES ('cb731425-fb08-11e5-ab76-742f68372bed', '#RFID', '2016-04-05 16:31:30', '管理员', '档案管理--1级分类权限', 'fa-file-text', 'icon-system', null, '档案管理', null, '2', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('cb84b638-fb08-11e5-ab76-742f68372bed', '#RFID_ARCHIVETYPE_INDEX', '2016-04-05 16:31:30', '管理员', '类型管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '类型管理', 'cb731425-fb08-11e5-ab76-742f68372bed', '21', '1', '2', 'rfid/archivetype/index');
INSERT INTO `SYS_RIGHT` VALUES ('cb8dab56-fb08-11e5-ab76-742f68372bed', '#RFID_ARCHIVETYPE_ADD', '2016-04-05 16:31:30', '管理员', '新增类型--3级按钮权限', null, 'icon-add', null, '新增类型', 'cb84b638-fb08-11e5-ab76-742f68372bed', '211', '-1', '3', 'rfid/archivetype/add');
INSERT INTO `SYS_RIGHT` VALUES ('cb94cca0-fb08-11e5-ab76-742f68372bed', '#RFID_ARCHIVETYPE_EDIT', '2016-04-05 16:31:30', '管理员', '编辑类型--3级按钮权限', null, 'icon-edit', null, '编辑类型', 'cb84b638-fb08-11e5-ab76-742f68372bed', '212', '-1', '3', 'rfid/archivetype/edit');
INSERT INTO `SYS_RIGHT` VALUES ('cb9f16d6-fb08-11e5-ab76-742f68372bed', '#RFID_ARCHIVETYPE_DELETE', '2016-04-05 16:31:30', '管理员', '删除类型--3级按钮权限', null, 'icon-remove', null, '删除类型', 'cb84b638-fb08-11e5-ab76-742f68372bed', '213', '-1', '3', 'rfid/archivetype/deleteArchiveType');

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
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('80f67f82-0087-11e6-aced-742f68372bed', 'cb731425-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811cea7f-0087-11e6-aced-742f68372bed', '91470f08-007b-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d06e4-0087-11e6-aced-742f68372bed', '7e01808c-0087-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d09ed-0087-11e6-aced-742f68372bed', 'c3c5ff6f-004f-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d0cbb-0087-11e6-aced-742f68372bed', 'c3d8cf65-004f-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d0fa0-0087-11e6-aced-742f68372bed', 'c3ccb040-004f-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d1241-0087-11e6-aced-742f68372bed', 'c3b4d6a4-004f-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d1526-0087-11e6-aced-742f68372bed', 'cb8dab56-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d17d5-0087-11e6-aced-742f68372bed', 'cb9f16d6-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d1a92-0087-11e6-aced-742f68372bed', 'cb94cca0-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d1d22-0087-11e6-aced-742f68372bed', 'cb84b638-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d1fc8-0087-11e6-aced-742f68372bed', '7a9e92db-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d23b0-0087-11e6-aced-742f68372bed', '7ab1a210-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d2735-0087-11e6-aced-742f68372bed', '7aa7b5da-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d29c9-0087-11e6-aced-742f68372bed', '7a90a998-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d2c86-0087-11e6-aced-742f68372bed', '914e8bc0-007b-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d2f78-0087-11e6-aced-742f68372bed', '915586f6-007b-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d3211-0087-11e6-aced-742f68372bed', 'a6b69fa8-007b-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d34df-0087-11e6-aced-742f68372bed', 'ad1b54ec-007d-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d3759-0087-11e6-aced-742f68372bed', '7e1ff63c-0087-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d3a4b-0087-11e6-aced-742f68372bed', '7e2dc63a-0087-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d3cff-0087-11e6-aced-742f68372bed', '7e27366b-0087-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d3ff1-0087-11e6-aced-742f68372bed', '7e15eec2-0087-11e6-aced-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d428a-0087-11e6-aced-742f68372bed', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d4527-0087-11e6-aced-742f68372bed', '89329c24-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d4ba7-0087-11e6-aced-742f68372bed', '8950cd83-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d4e6d-0087-11e6-aced-742f68372bed', '894187b7-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d50fd-0087-11e6-aced-742f68372bed', '8913013f-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d537b-0087-11e6-aced-742f68372bed', '0c371896-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d5618-0087-11e6-aced-742f68372bed', '0c6032e5-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d58d0-0087-11e6-aced-742f68372bed', '0c4d9236-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('811d5ae8-0087-11e6-aced-742f68372bed', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');

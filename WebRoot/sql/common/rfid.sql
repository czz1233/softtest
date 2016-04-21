/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : rfid

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-04-05 17:13:17
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
INSERT INTO `SYS_RIGHT` VALUES ('7a90a998-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_INDEX', '2016-04-05 16:43:33', '管理员', '档案管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '档案管理', 'cb731425-fb08-11e5-ab76-742f68372bed', '21', '1', '2', 'rfid/archive/index');
INSERT INTO `SYS_RIGHT` VALUES ('7a9e92db-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_ADD', '2016-04-05 16:43:33', '管理员', '新增档案--3级按钮权限', null, 'icon-add', null, '新增档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '211', '-1', '3', 'rfid/archive/add');
INSERT INTO `SYS_RIGHT` VALUES ('7aa7b5da-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_EDIT', '2016-04-05 16:43:33', '管理员', '编辑档案--3级按钮权限', null, 'icon-edit', null, '编辑档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '212', '-1', '3', 'rfid/archive/edit');
INSERT INTO `SYS_RIGHT` VALUES ('7ab1a210-fb0a-11e5-ab76-742f68372bed', '#RFID_ARCHIVE_DELETE', '2016-04-05 16:43:33', '管理员', '删除档案--3级按钮权限', null, 'icon-remove', null, '删除档案', '7a90a998-fb0a-11e5-ab76-742f68372bed', '213', '-1', '3', 'rfid/archive/deleteArchive');
INSERT INTO `SYS_RIGHT` VALUES ('88c16fc2-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM', '2016-02-15 20:42:12', '管理员', '系统管理--1级分类权限', 'fa fa-cogs', 'icon-system', null, '系统管理', null, '1', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('8913013f-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_INDEX', '2016-02-15 20:42:12', '管理员', '账号管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '账号管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '11', '1', '2', 'system/account/index.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('89329c24-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_ADD', '2016-02-15 20:42:12', '管理员', '新增账号--3级按钮权限', null, 'icon-add', null, '新增账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '111', '-1', '3', 'system/account/add.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('894187b7-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_EDIT', '2016-02-15 20:42:13', '管理员', '编辑账号--3级按钮权限', null, 'icon-edit', null, '编辑账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '112', '-1', '3', 'system/account/edit.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('8950cd83-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_DELETE', '2016-02-15 20:42:13', '管理员', '删除账号--3级按钮权限', null, 'icon-remove', null, '删除账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '113', '-1', '3', 'system/account/deleteAccount.mvc');
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
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7aff8f-fb0a-11e5-ab76-742f68372bed', 'cb731425-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0307-fb0a-11e5-ab76-742f68372bed', 'cb8dab56-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0406-fb0a-11e5-ab76-742f68372bed', 'cb9f16d6-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b04f2-fb0a-11e5-ab76-742f68372bed', 'cb94cca0-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0732-fb0a-11e5-ab76-742f68372bed', 'cb84b638-fb08-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0861-fb0a-11e5-ab76-742f68372bed', '7a9e92db-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b094e-fb0a-11e5-ab76-742f68372bed', '7ab1a210-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0a36-fb0a-11e5-ab76-742f68372bed', '7aa7b5da-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0b30-fb0a-11e5-ab76-742f68372bed', '7a90a998-fb0a-11e5-ab76-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0c8c-fb0a-11e5-ab76-742f68372bed', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0dda-fb0a-11e5-ab76-742f68372bed', '89329c24-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0eb5-fb0a-11e5-ab76-742f68372bed', '8950cd83-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b0f90-fb0a-11e5-ab76-742f68372bed', '894187b7-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b1073-fb0a-11e5-ab76-742f68372bed', '8913013f-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b1149-fb0a-11e5-ab76-742f68372bed', '0c371896-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b1217-fb0a-11e5-ab76-742f68372bed', '0c6032e5-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b12e8-fb0a-11e5-ab76-742f68372bed', '0c4d9236-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('7e7b13ba-fb0a-11e5-ab76-742f68372bed', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');

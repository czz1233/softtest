/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : story

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-04-21 15:57:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for STY_BOOKRACK
-- ----------------------------
DROP TABLE IF EXISTS `STY_BOOKRACK`;
CREATE TABLE `STY_BOOKRACK` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT` varchar(50) DEFAULT NULL,
  `STORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_gu175w3uddnss5oosca1v2018` (`ACCOUNT`),
  KEY `FK_9ff2bt6ql2j5rm0ekdqj1gao1` (`STORY`),
  CONSTRAINT `FK_9ff2bt6ql2j5rm0ekdqj1gao1` FOREIGN KEY (`STORY`) REFERENCES `sty_story` (`ID`),
  CONSTRAINT `FK_gu175w3uddnss5oosca1v2018` FOREIGN KEY (`ACCOUNT`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_BOOKRACK
-- ----------------------------
INSERT INTO `STY_BOOKRACK` VALUES ('402881f05437c638015437c854810001', '18863774-60df-11e5-8a98-742f68372bed', '402881f05436da4c015436dc08bd0003');

-- ----------------------------
-- Table structure for STY_BOOKTAG
-- ----------------------------
DROP TABLE IF EXISTS `STY_BOOKTAG`;
CREATE TABLE `STY_BOOKTAG` (
  `ID` varchar(50) NOT NULL,
  `ACCOUNT` varchar(50) DEFAULT NULL,
  `SECTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_qs4qshrhqwhx8rtkkk5qcp9ju` (`ACCOUNT`),
  KEY `FK_hak3cf1925jlyejwdyg15sigw` (`SECTION`),
  CONSTRAINT `FK_hak3cf1925jlyejwdyg15sigw` FOREIGN KEY (`SECTION`) REFERENCES `sty_section` (`ID`),
  CONSTRAINT `FK_qs4qshrhqwhx8rtkkk5qcp9ju` FOREIGN KEY (`ACCOUNT`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_BOOKTAG
-- ----------------------------
INSERT INTO `STY_BOOKTAG` VALUES ('402881f05437ca59015437cf59d60000', '18863774-60df-11e5-8a98-742f68372bed', '402881f05436da4c015436dc55610004');
INSERT INTO `STY_BOOKTAG` VALUES ('402881f05437ca59015437d199d90001', '18863774-60df-11e5-8a98-742f68372bed', '402881f05436da4c015436dc8df70005');

-- ----------------------------
-- Table structure for STY_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `STY_COMMENT`;
CREATE TABLE `STY_COMMENT` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `REPLAY_TIME` datetime DEFAULT NULL,
  `REPLAY_USER` varchar(255) DEFAULT NULL,
  `REPLY_CONTENT` varchar(255) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `STORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_iw5boifnfijb6k2m5sifet003` (`STORY`),
  CONSTRAINT `FK_iw5boifnfijb6k2m5sifet003` FOREIGN KEY (`STORY`) REFERENCES `sty_story` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_COMMENT
-- ----------------------------

-- ----------------------------
-- Table structure for STY_SECTION
-- ----------------------------
DROP TABLE IF EXISTS `STY_SECTION`;
CREATE TABLE `STY_SECTION` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `SECTION` varchar(255) DEFAULT NULL,
  `SNAME` varchar(255) DEFAULT NULL,
  `SREAD_NUM` bigint(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `SUPDATE` datetime DEFAULT NULL,
  `SWORD_NUM` bigint(20) DEFAULT NULL,
  `STORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nxxm26ivfl2tuuh5t42rufj8u` (`STORY`),
  CONSTRAINT `FK_nxxm26ivfl2tuuh5t42rufj8u` FOREIGN KEY (`STORY`) REFERENCES `sty_story` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_SECTION
-- ----------------------------
INSERT INTO `STY_SECTION` VALUES ('402881f05436da4c015436dc55610004', '2016-04-21 11:28:10', '超级管理员【admin】', '从前有座山', '第一章第一节', '2', '1', '2016-04-21 11:28:10', '5', '402881f05436da4c015436dbd06f0002');
INSERT INTO `STY_SECTION` VALUES ('402881f05436da4c015436dc8df70005', '2016-04-21 11:28:24', '超级管理员【admin】', '山里有座庙', '第一章第二节', '1', '1', '2016-04-21 11:28:25', '5', '402881f05436da4c015436dbd06f0002');

-- ----------------------------
-- Table structure for STY_STORY
-- ----------------------------
DROP TABLE IF EXISTS `STY_STORY`;
CREATE TABLE `STY_STORY` (
  `ID` varchar(50) NOT NULL,
  `COLLECT_NUM` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `DESCRIBLE` varchar(255) DEFAULT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `WORD_COUNT` bigint(20) DEFAULT NULL,
  `AUTHOR` varchar(50) DEFAULT NULL,
  `STORY_TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fxhc6ogqt44o6bbs4h83jb9vk` (`AUTHOR`),
  KEY `FK_7k8mcfljrp16sj7m4f0c4t2hw` (`STORY_TYPE`),
  CONSTRAINT `FK_7k8mcfljrp16sj7m4f0c4t2hw` FOREIGN KEY (`STORY_TYPE`) REFERENCES `sty_storytype` (`ID`),
  CONSTRAINT `FK_fxhc6ogqt44o6bbs4h83jb9vk` FOREIGN KEY (`AUTHOR`) REFERENCES `sys_account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_STORY
-- ----------------------------
INSERT INTO `STY_STORY` VALUES ('402881f05436da4c015436dbd06f0002', '3', '2016-04-21 11:27:36', '超级管理员【admin】', '', '/bootstrap/image/uploaddefault.png', '回到三国', '3', null, '-1', '2016-04-21 11:28:24', '10', '18863774-60df-11e5-8a98-742f68372bed', '402881f05436da4c015436db9a140000');
INSERT INTO `STY_STORY` VALUES ('402881f05436da4c015436dc08bd0003', '1', '2016-04-21 11:27:50', '超级管理员【admin】', '', '/bootstrap/image/uploaddefault.png', '大宋官', '0', null, '1', '2016-04-21 11:27:50', '0', '18863774-60df-11e5-8a98-742f68372bed', '402881f05436da4c015436db9a140000');

-- ----------------------------
-- Table structure for STY_STORYTYPE
-- ----------------------------
DROP TABLE IF EXISTS `STY_STORYTYPE`;
CREATE TABLE `STY_STORYTYPE` (
  `ID` varchar(50) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR` varchar(255) DEFAULT NULL,
  `DESCRIBLE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of STY_STORYTYPE
-- ----------------------------
INSERT INTO `STY_STORYTYPE` VALUES ('402881f05436da4c015436db9a140000', '2016-04-21 11:27:22', '超级管理员【admin】', '', '穿越', '1');
INSERT INTO `STY_STORYTYPE` VALUES ('402881f05436da4c015436dbaa410001', '2016-04-21 11:27:26', '超级管理员【admin】', '', '悬疑', '1');

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
INSERT INTO `SYS_RIGHT` VALUES ('0c2339fe-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_INDEX', '2016-03-11 21:27:49', '管理员', '角色管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '角色管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '21', '1', '2', 'system/role/index');
INSERT INTO `SYS_RIGHT` VALUES ('0c371896-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_ADD', '2016-03-11 21:27:49', '管理员', '新增角色--3级按钮权限', null, 'icon-add', null, '新增角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '211', '-1', '3', 'system/role/add');
INSERT INTO `SYS_RIGHT` VALUES ('0c4d9236-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_EDIT', '2016-03-11 21:27:49', '管理员', '编辑角色--3级按钮权限', null, 'icon-edit', null, '编辑角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '212', '-1', '3', 'system/role/edit');
INSERT INTO `SYS_RIGHT` VALUES ('0c6032e5-e78d-11e5-b46c-00e0667c4153', '#SYSTEM_ROLE_DELETE', '2016-03-11 21:27:49', '管理员', '删除角色--3级按钮权限', null, 'icon-remove', null, '删除角色', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '213', '-1', '3', 'system/role/deleteRole');
INSERT INTO `SYS_RIGHT` VALUES ('304661e5-0768-11e6-bfc0-742f68372bed', '#STORY', '2016-04-21 10:24:34', '管理员', '小说管理--1级分类权限', 'fa-book', 'icon-system', null, '小说管理', null, '2', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('3058884f-0768-11e6-bfc0-742f68372bed', '#STORY_STORYTYPE_INDEX', '2016-04-21 10:24:35', '管理员', '小说管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '类型管理', '304661e5-0768-11e6-bfc0-742f68372bed', '21', '1', '2', 'story/storytype/index');
INSERT INTO `SYS_RIGHT` VALUES ('55f3e48e-0768-11e6-bfc0-742f68372bed', '#STORY_STORY_INDEX', '2016-04-21 10:25:38', '管理员', '小说管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '小说管理', '304661e5-0768-11e6-bfc0-742f68372bed', '22', '1', '2', 'story/story/index');
INSERT INTO `SYS_RIGHT` VALUES ('5b66fb57-076d-11e6-bfc0-742f68372bed', '#STORY_READ', '2016-04-21 10:24:34', '管理员', '阅读管理--1级分类权限', 'fa-folder', 'icon-system', null, '阅读管理', null, '3', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('70459ca9-0792-11e6-bfc0-742f68372bed', '#STORY_BOOKTAG_INDEX_2', '2016-04-21 15:27:01', '管理员', '我的书架管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '我的书签', '5b66fb57-076d-11e6-bfc0-742f68372bed', '34', '1', '2', 'story/booktag/index');
INSERT INTO `SYS_RIGHT` VALUES ('73fd8064-0768-11e6-bfc0-742f68372bed', '#STORY_SECTION_INDEX', '2016-04-21 10:26:28', '管理员', '更新章节管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '更新章节', '304661e5-0768-11e6-bfc0-742f68372bed', '23', '1', '2', 'story/section/index');
INSERT INTO `SYS_RIGHT` VALUES ('816a150b-078b-11e6-bfc0-742f68372bed', '#SECTION_READ', '2016-04-21 13:55:09', '管理员', '我的书架管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '阅读章节', '5b66fb57-076d-11e6-bfc0-742f68372bed', '33', '1', '2', 'story/section/search');
INSERT INTO `SYS_RIGHT` VALUES ('88c16fc2-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM', '2016-02-15 20:42:12', '管理员', '系统管理--1级分类权限', 'fa fa-cogs', 'icon-system', null, '系统管理', null, '1', '1', '1', '#');
INSERT INTO `SYS_RIGHT` VALUES ('8913013f-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_INDEX', '2016-02-15 20:42:12', '管理员', '账号管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '账号管理', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '11', '1', '2', 'system/account/index.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('89329c24-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_ADD', '2016-02-15 20:42:12', '管理员', '新增账号--3级按钮权限', null, 'icon-add', null, '新增账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '111', '-1', '3', 'system/account/add.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('894187b7-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_EDIT', '2016-02-15 20:42:13', '管理员', '编辑账号--3级按钮权限', null, 'icon-edit', null, '编辑账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '112', '-1', '3', 'system/account/edit.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('8950cd83-d3e1-11e5-9a09-00e0667c4153', '#SYSTEM_ACCOUNT_DELETE', '2016-02-15 20:42:13', '管理员', '删除账号--3级按钮权限', null, 'icon-remove', null, '删除账号', '8913013f-d3e1-11e5-9a09-00e0667c4153', '113', '-1', '3', 'system/account/deleteAccount.mvc');
INSERT INTO `SYS_RIGHT` VALUES ('9b2b0d5d-0785-11e6-bfc0-742f68372bed', '#STORY_BOOKRACK_INDEX', '2016-04-21 13:55:09', '管理员', '我的书架管理--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '我的书架', '5b66fb57-076d-11e6-bfc0-742f68372bed', '32', '1', '2', 'story/bookrack/index');
INSERT INTO `SYS_RIGHT` VALUES ('c4867e3f-076d-11e6-bfc0-742f68372bed', '#STORY_S_1', '2016-04-21 10:24:35', '管理员', '小说查看--2级菜单权限', null, 'icon-menu', '/page/js/jquery-easyui-1.4.3/themes/icons/menu.png', '小说查看', '5b66fb57-076d-11e6-bfc0-742f68372bed', '31', '1', '2', 'story/story/search');

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
INSERT INTO `SYS_ROLE` VALUES ('0', '2016-04-21 15:56:33', '超级管理员【admin】', '', '', '读者', '1');
INSERT INTO `SYS_ROLE` VALUES ('0760c4a9-60df-11e5-8a98-742f68372bed', '2016-03-13 00:00:22', '管理员', '系统超级管理员，请勿删除', '', '系统超级管理员', '1');
INSERT INTO `SYS_ROLE` VALUES ('1', '2016-04-21 15:56:37', '超级管理员【admin】', '', '', '作者', '1');

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
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('724c7c3b-0792-11e6-bfc0-742f68372bed', '816a150b-078b-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f2f6d-0792-11e6-bfc0-742f68372bed', '304661e5-0768-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f3549-0792-11e6-bfc0-742f68372bed', '9b2b0d5d-0785-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f3832-0792-11e6-bfc0-742f68372bed', '70459ca9-0792-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f3b31-0792-11e6-bfc0-742f68372bed', '5b66fb57-076d-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f3e00-0792-11e6-bfc0-742f68372bed', '73fd8064-0768-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f405e-0792-11e6-bfc0-742f68372bed', '3058884f-0768-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f42b0-0792-11e6-bfc0-742f68372bed', '55f3e48e-0768-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f4513-0792-11e6-bfc0-742f68372bed', 'c4867e3f-076d-11e6-bfc0-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f4777-0792-11e6-bfc0-742f68372bed', '88c16fc2-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f49b6-0792-11e6-bfc0-742f68372bed', '89329c24-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f4bf1-0792-11e6-bfc0-742f68372bed', '8950cd83-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f4e3a-0792-11e6-bfc0-742f68372bed', '894187b7-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f50d7-0792-11e6-bfc0-742f68372bed', '8913013f-d3e1-11e5-9a09-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f5324-0792-11e6-bfc0-742f68372bed', '0c371896-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f5571-0792-11e6-bfc0-742f68372bed', '0c6032e5-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f57a4-0792-11e6-bfc0-742f68372bed', '0c4d9236-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');
INSERT INTO `SYS_ROLE_RIGHT` VALUES ('727f59fe-0792-11e6-bfc0-742f68372bed', '0c2339fe-e78d-11e5-b46c-00e0667c4153', '0760c4a9-60df-11e5-8a98-742f68372bed');

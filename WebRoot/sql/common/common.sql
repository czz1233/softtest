-- ----------------------------
-- SYS_ROLE 添加超级管理员角色
-- ----------------------------
INSERT INTO `SYS_ROLE` (`ID`, `CREATETIME`, `CREATOR`, `DESCRIBLE`, `ENABLE`, `NAME`, `STATUS`) VALUES ('0760c4a9-60df-11e5-8a98-742f68372bed', NOW(), '管理员', '系统超级管理员，请勿删除', '1', '系统超级管理员', '1');
-- ----------------------------
-- SYS_ACCOUNT 添加超级管理员用户
-- ----------------------------
INSERT INTO `SYS_ACCOUNT` (`ID`, `ACCOUNT`, `CREATETIME`, `CREATOR`, `ENABLE`, `NICK_NAME`, `PASSWORD`, `PHTOTO`, `REMARK`, `SEX`, `STATUS`, `TYEPE_ID`, `TYPE`) VALUES ('18863774-60df-11e5-8a98-742f68372bed', 'admin', NOW(), '管理员', '1', '管理员', '21232f297a57a5a743894a0e4a801fc3', NULL, '系统管理员,勿删', NULL, '1', NULL, NULL);

-- ----------------------------
-- SYS_ROLE_RIGHT给超级管理员角色授予权限
-- ----------------------------
DELETE FROM SYS_ROLE_RIGHT WHERE ROLE_ID = '0760c4a9-60df-11e5-8a98-742f68372bed';
INSERT INTO SYS_ROLE_RIGHT (ID,RIGHT_ID,ROLE_ID) SELECT UUID(),ID,'0760c4a9-60df-11e5-8a98-742f68372bed' FROM SYS_RIGHT;

-- ----------------------------
-- SYS_ACCOUNT_RIGHT 为admin授予角色
-- ----------------------------
INSERT INTO `SYS_ACCOUNT_ROLE` (`ID`, `ACCOUNT_ID`, `ROLE_ID`) VALUES (UUID(), '18863774-60df-11e5-8a98-742f68372bed', '0760c4a9-60df-11e5-8a98-742f68372bed');

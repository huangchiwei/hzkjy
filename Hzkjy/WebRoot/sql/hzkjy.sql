
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `member_basic`
-- ----------------------------
DROP TABLE IF EXISTS `member_basic`;
CREATE TABLE `member_basic` (
  `ID` int(11) NOT NULL auto_increment,
  `Hybh` varchar(50) default NULL,
  `Qymc` varchar(100) default NULL,
  `Qymcpy` varchar(50) default NULL,
  `Address` varchar(100) default NULL,
  `Zydy` varchar(50) default NULL,
  `Mj` varchar(50) default NULL,
  `Fzr` varchar(50) default NULL,
  `Zczj` varchar(50) default NULL,
  `Lxr` varchar(50) default NULL,
  `Zt` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_basic
-- ----------------------------
INSERT INTO `member_basic` VALUES ('24', '440100001', '广州军软', 'gzjr', '广园东路2193号时代新世界北塔3001', '3001', '100', '邱晓帆', '1100', '邱晓帆', '1');



SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `ModuleNo` varchar(50) NOT NULL COMMENT '模块代码',
  `ModName` varchar(50) DEFAULT NULL COMMENT '模块名称',
  `Url` varchar(100) DEFAULT NULL COMMENT '操作连接',
  `OrderNo` int(6) DEFAULT NULL COMMENT '排序',
  `ParentNo` varchar(50) DEFAULT NULL COMMENT '上级模块',
  `Level` int(2) DEFAULT NULL COMMENT '菜单级别',
  PRIMARY KEY (`ModuleNo`),
  KEY `fk_module_ParentNo` (`ParentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块资源表';

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('Lev1_01', '系统管理', null, '1', null, '1');
INSERT INTO `sys_module` VALUES ('Lev1_02', '会员管理', null, '2', null, '1');
INSERT INTO `sys_module` VALUES ('Lev2_01', '用户管理', 'sys/sysUser/list', '1', 'Lev1_01', '2');
INSERT INTO `sys_module` VALUES ('Lev2_02', '角色管理', 'sys/sysRole/list', '2', 'Lev1_01', '2');
INSERT INTO `sys_module` VALUES ('Lev2_03', '在园企业管理', 'member/memberBasic/list', '1', 'Lev1_02', '2');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleNo` varchar(50) DEFAULT NULL COMMENT '角色模块id',
  `PermName` varchar(50) DEFAULT NULL,
  `PermValue` varchar(200) DEFAULT NULL COMMENT '权限值',
  `PermType` int(1) DEFAULT '1' COMMENT '0 菜单权限 1 操作权限',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `un_sys_perm_permvalue` (`PermValue`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='角色模块权限';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('16', 'Lev2_01', '用户管理', 'us_list', '0');
INSERT INTO `sys_permission` VALUES ('17', 'Lev2_02', '角色管理', 'ro_list', '0');
INSERT INTO `sys_permission` VALUES ('18', 'Lev2_01', '删除用户', 'us_del', '1');
INSERT INTO `sys_permission` VALUES ('19', 'Lev2_01', '修改用户', 'us_updt', '1');
INSERT INTO `sys_permission` VALUES ('20', 'Lev2_01', '添加用户', 'us_save', '1');
INSERT INTO `sys_permission` VALUES ('21', 'Lev2_02', '添加角色', 'ro_save', '1');
INSERT INTO `sys_permission` VALUES ('22', 'Lev2_02', '修改角色', 'ro_updt', '1');
INSERT INTO `sys_permission` VALUES ('23', 'Lev2_02', '删除角色', 'ro_del', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleNo` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `RoleName` varchar(50) DEFAULT NULL COMMENT '角色名字',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `Creater` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `Modifier` varchar(50) DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uni_role_RoleNo` (`RoleNo`),
  KEY `fk_role_creater` (`Creater`),
  KEY `fk_role_modifier` (`Modifier`),
  CONSTRAINT `fk_role_creater` FOREIGN KEY (`Creater`) REFERENCES `sys_user` (`UserNo`),
  CONSTRAINT `fk_role_modifier` FOREIGN KEY (`Modifier`) REFERENCES `sys_user` (`UserNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('16', 'superadmin', 'admin', '', 'admin', '2015-01-22 20:15:42', 'admin', '2015-01-22 20:15:42');
-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleNo` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `PermId` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1247 DEFAULT CHARSET=utf8 COMMENT='角色模块（中间表）';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------


-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserNo` varchar(50) NOT NULL COMMENT '登录账号',
  `Pwd` varchar(50) NOT NULL COMMENT '密码',
  `UserName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `Sex` int(1) DEFAULT NULL COMMENT '性别: 0 女 1 男',
  `Email` varchar(50) NOT NULL COMMENT '邮箱',
  `Tel` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `Phone` varchar(20) NOT NULL COMMENT '手机号码',
  `QQNum` varchar(20) DEFAULT NULL COMMENT 'qq号码',
  `Status` int(1) DEFAULT NULL COMMENT '状态： 1 激活 2 冻结 3  删除',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `Creater` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uni_user_UserNo` (`UserNo`),
  KEY `fk_user_creater` (`Creater`),
  CONSTRAINT `fk_user_creater` FOREIGN KEY (`Creater`) REFERENCES `sys_user` (`UserNo`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '4297f44b13955235245b2497399d7a93', 'administrator', '1', '123@qq.com', null, '1591000000', null, '1', '2014-05-28 00:00:00', 'admin');
-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `UserNo` varchar(50) NOT NULL,
  `RoleNo` varchar(50) NOT NULL,
  PRIMARY KEY (`UserNo`,`RoleNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色（中间表）';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '文档内容',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `realTime` datetime DEFAULT NULL COMMENT '文档原始时间',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `clicks` int(11) DEFAULT '0' COMMENT '阅读次数',
  `cateCode` varchar(255) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯';

#
# Source for table news_category
#

CREATE TABLE `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `cateCode` varchar(255) DEFAULT NULL COMMENT '代号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯类型';

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `member_basic`
-- ----------------------------
DROP TABLE IF EXISTS `member_basic`;
CREATE TABLE `member_basic` (
  `ID` int(11) NOT NULL auto_increment,
  `Hybh` varchar(50) default NULL COMMENT '会员编号',
  `Qymc` varchar(100) default NULL COMMENT '会员名称',
  `Qymcpy` varchar(50) default NULL COMMENT '会员名称拼音',
  `Address` varchar(100) default NULL COMMENT '地址',
  `Zydy` varchar(50) default NULL COMMENT '租用地址',
  `Mj` varchar(50) default NULL COMMENT '面积',
  `Fzr` varchar(50) default NULL COMMENT '负责人',
  `Zczj` varchar(50) default NULL COMMENT '注册资金',
  `Lxr` varchar(50) default NULL COMMENT '联系人',
  `Zt` varchar(50) default NULL COMMENT '状态',
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

INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (1,'组织架构','park_frame','园区风貌');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (2,'园区介绍','park_intro','园区风貌');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (3,'园区荣誉','park_honor','园区风貌');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (4,'园区大事','park_event','园区风貌');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (5,'国家政策','policy_regu','政策法规');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (6,'省市政策','policy_province','政策法规');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (7,'园区政策','policy_park','政策法规');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (8,'科技动态','dynamic_science','新闻动态');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (9,'行业动态','dynamic_industry','新闻动态');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (10,'企业动态','dynamic_enterprise','新闻动态');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (11,'物业招租','info_lease','园区信息');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (12,'工程招标','info_tender','园区信息');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (13,'人员招聘','info_recruit','园区信息');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (14,'展览服务','style_exhibition','企业风采');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (15,'新技术新材料','style_tech','企业风采');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (16,'生物医药与技术','style_medicine','企业风采');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (17,'电子与信息','style_electronic ','企业风采');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (18,'其他','style_other','企业风采');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (19,'入园指南','service_inpark','园区服务');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (20,'出园指南','service_outpark','园区服务');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (21,'证照办理','service_license','园区服务');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (22,'综合服务','service_multiple','园区服务');
INSERT INTO `news_category` (`id`,`cateName`,`cateCode`,`remark`) VALUES (23,'成果转化','service_result','园区服务');



INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_03','园区风貌',NULL,3,NULL,1);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_04','政策法规',NULL,4,NULL,1);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_05','新闻动态',NULL,5,NULL,1);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_06','园区信息',NULL,6,NULL,1);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_07','企业风采',NULL,7,NULL,1);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev1_08','园区服务',NULL,8,NULL,1);

INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_08','园区介绍','manager/news/list/1.html?cateCode=park_intro',1,'Lev1_03',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_09','组织架构','manager/news/list/1.html?cateCode=park_frame',2,'Lev1_03',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_10','园区荣誉','manager/news/list/1.html?cateCode=park_honor',3,'Lev1_03',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_11','园区大事','manager/news/list/1.html?cateCode=park_event',4,'Lev1_03',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_12','国家政策','manager/news/list/1.html?cateCode=policy_regu',1,'Lev1_04',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_13','省市政策','manager/news/list/1.html?cateCode=policy_province',2,'Lev1_04',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_14','园区政策','manager/news/list/1.html?cateCode=policy_regu',3,'Lev1_04',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_15','科技动态','manager/news/list/1.html?cateCode=dynamic_science',1,'Lev1_05',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_16','行业动态','manager/news/list/1.html?cateCode=dynamic_industry',2,'Lev1_05',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_17','企业动态','manager/news/list/1.html?cateCode=dynamic_enterprise',3,'Lev1_05',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_18','物业招租','manager/news/list/1.html?cateCode=info_lease',1,'Lev1_06',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_19','工程招标','manager/news/list/1.html?cateCode=info_tender',2,'Lev1_06',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_20','人员招聘','manager/news/list/1.html?cateCode=info_recruit',3,'Lev1_06',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_21','展览服务','manager/news/list/1.html?cateCode=style_exhibition',1,'Lev1_07',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_22','新技术新材料','manager/news/list/1.html?cateCode=style_tech',2,'Lev1_07',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_23','生物医药与技术','manager/news/list/1.html?cateCode=style_medicine',3,'Lev1_07',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_24','电子与信息','manager/news/list/1.html?cateCode=style_electronic',4,'Lev1_07',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_25','其他','manager/news/list/1.html?cateCode=style_other',5,'Lev1_07',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_26','入园指南','manager/news/list/1.html?cateCode=service_inpark',1,'Lev1_08',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_27','出园指南','manager/news/list/1.html?cateCode=service_outpark',2,'Lev1_08',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_28','证照办理','manager/news/list/1.html?cateCode=service_license',3,'Lev1_08',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_29','综合服务','manager/news/list/1.html?cateCode=service_multiple',4,'Lev1_08',2);
INSERT INTO `sys_module` (`ModuleNo`,`ModName`,`Url`,`OrderNo`,`ParentNo`,`Level`) VALUES ('Lev2_30','成果转化','manager/news/list/1.html?cateCode=service_result',5,'Lev1_08',2);



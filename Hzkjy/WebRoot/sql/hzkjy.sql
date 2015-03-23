
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
  `Rysj` datetime default NULL COMMENT '入园时间',
  `Htqxf` datetime default NULL COMMENT '合同期限始',
  `Htqxe` datetime default NULL COMMENT '合同期限终',
  `Hyfl` varchar(200) default NULL COMMENT '行业分类',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bs_news`;
CREATE TABLE `bs_news` (
  `ID` int(11) NOT NULL auto_increment,
  `Title` varchar(50) default NULL COMMENT '标题',
  `Receiver` varchar(100) default NULL COMMENT '接收者',
  `Iseveryone` varchar(50) default NULL COMMENT '是否全部发送',
  `ActiveTime` datetime default NULL COMMENT '有限时间',
  `Content` longtext default NULL COMMENT '内容',
  `Creater` varchar(50) default NULL COMMENT '创建人',
  `IsReport` varchar(50) default NULL COMMENT '是否发布',
  `CreateTime` datetime default NULL COMMENT '创建时间',
  `ReceiverBh` varchar(50) default NULL COMMENT '接受者编号',
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

INSERT INTO `sys_permission` VALUES (16,'Lev2_01','用户管理','us_list',0);
INSERT INTO `sys_permission` VALUES (17,'Lev2_02','角色管理','ro_list',0);
INSERT INTO `sys_permission` VALUES (18,'Lev2_01','删除用户','us_del',1);
INSERT INTO `sys_permission` VALUES (19,'Lev2_01','修改用户','us_updt',1);
INSERT INTO `sys_permission` VALUES (20,'Lev2_01','添加用户','us_save',1);
INSERT INTO `sys_permission` VALUES (21,'Lev2_02','添加角色','ro_save',1);
INSERT INTO `sys_permission` VALUES (22,'Lev2_02','修改角色','ro_updt',1);
INSERT INTO `sys_permission` VALUES (23,'Lev2_02','删除角色','ro_del',1);
INSERT INTO `sys_permission` VALUES (24,'Lev2_31','会员管理','mb_list',0);
INSERT INTO `sys_permission` VALUES (25,'Lev2_02','分配权限','ro_saveperm',1);
INSERT INTO `sys_permission` VALUES (26,'Lev2_31','修改会员','mb_updt',1);
INSERT INTO `sys_permission` VALUES (27,'Lev2_31','添加会员','mb_save',1);
INSERT INTO `sys_permission` VALUES (28,'Lev2_03','删除会员','mb_del',1);
INSERT INTO `sys_permission` VALUES (30,'Lev2_08','园区介绍','news_list',0);
INSERT INTO `sys_permission` VALUES (31,'Lev2_32','孵化企业填报','fhqytb_list',0);
INSERT INTO `sys_permission` VALUES (32,'Lev2_32','修改资料','fhqytb_updt',1);
INSERT INTO `sys_permission` VALUES (33,'Lev2_32','添加资料','fhqytb_save',1);
INSERT INTO `sys_permission` VALUES (34,'Lev2_32','删除资料','fhqytb_del',1);
INSERT INTO `sys_permission` VALUES (35,'Lev2_41','知识产权统计','inteProCount_list',0);
INSERT INTO `sys_permission` VALUES (36,'Lev2_42','科技项目','intel_list',0);
INSERT INTO `sys_permission` VALUES (37,'Lev2_43','专利','patent_list',0);

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
INSERT INTO `sys_user` VALUES (2,'440100001','e10adc3949ba59abbe56e057f20f883e','广州军软',1,'1246251343@qq.com','','13418056821','',1,'2015-03-01 19:41:53','admin');

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
  `filePath` varchar(255) default NULL COMMENT '附件路径',
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



INSERT INTO `news_category` VALUES (1,'组织架构','park_frame','园区风貌');
INSERT INTO `news_category` VALUES (2,'园区介绍','park_intro','园区风貌');
INSERT INTO `news_category` VALUES (3,'园区位置','park_site','园区风貌');
INSERT INTO `news_category` VALUES (4,'创业环境','park_envir','园区风貌');
INSERT INTO `news_category` VALUES (5,'国家政策','policy_regu','政策法规');
INSERT INTO `news_category` VALUES (6,'省市政策','policy_province','政策法规');
INSERT INTO `news_category` VALUES (7,'园区政策','policy_park','政策法规');
INSERT INTO `news_category` VALUES (8,'最新公告','notice_lastest','最新公告');
INSERT INTO `news_category` VALUES (11,'招商信息','service_business','企业服务');
INSERT INTO `news_category` VALUES (19,'入园导向>入园指南','service_inpark_guide','企业服务');
INSERT INTO `news_category` VALUES (20,'出园导向>出园指南','service_outpark_guide','企业服务');
INSERT INTO `news_category` VALUES (21,'基础服务','service_base','企业服务');
INSERT INTO `news_category` VALUES (22,'人力资源','service_human','企业服务');
INSERT INTO `news_category` VALUES (23,'项目申报','service_apply','企业服务');
INSERT INTO `news_category` VALUES (24,'入园导向>入园流程','service_inpark_process','企业服务');
INSERT INTO `news_category` VALUES (25,'出园导向>出园流程','service_outpark_process','企业服务');
INSERT INTO `news_category` VALUES (26,'培训通知','train_notice','交流培训');
INSERT INTO `news_category` VALUES (27,'培训课件','train_file','交流培训');


INSERT INTO `sys_module` VALUES ('Lev1_10','通知管理',NULL,1,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_02','会员管理',NULL,2,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_09','租金管理',NULL,3,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_11','统计报表',NULL,4,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_12','知识产权',NULL,5,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_03','园区风貌',NULL,6,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_05','最新公告','admin/news/list/1.html?cateCode=notice_lastest',7,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_06','企业服务',NULL,8,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_07','交流培训',NULL,9,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_08','政策法规',NULL,10,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_01','系统管理',NULL,11,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev2_01','用户管理','admin/sysUser/list/1.html',1,'Lev1_01',2);
INSERT INTO `sys_module` VALUES ('Lev2_02','角色管理','admin/sysRole/list/1.html',2,'Lev1_01',2);
INSERT INTO `sys_module` VALUES ('Lev2_08','园区介绍','admin/news/list/1.html?cateCode=park_intro',1,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_09','组织架构','admin/news/list/1.html?cateCode=park_frame',2,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_10','园区位置','admin/news/list/1.html?cateCode=park_site',3,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_11','创业环境','admin/news/list/1.html?cateCode=park_envir',4,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_14','入园导向','',1,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_14_1','入园指南','admin/news/list/1.html?cateCode=service_inpark_guide',1,'Lev2_14',2);
INSERT INTO `sys_module` VALUES ('Lev2_14_2','入园流程','admin/news/list/1.html?cateCode=service_inpark_process',2,'Lev2_14',2);
INSERT INTO `sys_module` VALUES ('Lev2_15','出园导向','',2,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_15_1','出园指南','admin/news/list/1.html?cateCode=service_outpark_guide',1,'Lev2_15',2);
INSERT INTO `sys_module` VALUES ('Lev2_15_2','出园流程','admin/news/list/1.html?cateCode=service_outpark_process',2,'Lev2_15',2);
INSERT INTO `sys_module` VALUES ('Lev2_16','基础服务','admin/news/list/1.html?cateCode=service_base',3,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_17','人力资源','admin/news/list/1.html?cateCode=service_human',4,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_18','项目申报','admin/news/list/1.html?cateCode=service_apply',5,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_20','招商信息','admin/news/list/1.html?cateCode=service_business',6,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_22','培训通知','admin/news/list/1.html?cateCode=train_notice',1,'Lev1_07',2);
INSERT INTO `sys_module` VALUES ('Lev2_23','培训课件','admin/news/list/1.html?cateCode=train_file',2,'Lev1_07',2);
INSERT INTO `sys_module` VALUES ('Lev2_24','国家政策','admin/news/list/1.html?cateCode=policy_regu',1,'Lev1_08',2);
INSERT INTO `sys_module` VALUES ('Lev2_25','省市政策','admin/news/list/1.html?cateCode=policy_province',2,'Lev1_08',2);
INSERT INTO `sys_module` VALUES ('Lev2_26','园区政策','admin/news/list/1.html?cateCode=policy_park',3,'Lev1_08',2);
INSERT INTO `sys_module` VALUES ('Lev2_31','企业管理','admin/memberBasic/list/1.html',1,'Lev1_02',2);
INSERT INTO `sys_module` VALUES ('Lev2_32','孵化企业填报','admin/incubatedEnterprises/list/1.html',2,'Lev1_02',2);
INSERT INTO `sys_module` VALUES ('Lev2_33','租金录入','admin/memberRental/list/1.html',1,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_34','审核租金','admin/rentalExamine/list/1.html',2,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_35','企业租金录入','admin/enterpriseRental/list/1.html',3,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_36','企业缴费审核','admin/rentReview/list/1.html',4,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_37','通知管理','admin/bsNews/list/1.html',1,'Lev1_10',2);
INSERT INTO `sys_module` VALUES ('Lev2_38','经济月报统计','admin/eccIndicator/list/1.html',1,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_39','经济月报设置','admin/chooseSelect/list/1.html',2,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_40','经济月报填报','admin/economicReporting/list/1.html',3,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_41','知识产权统计','admin/memberIntellectualPro/inteProCount.html',1,'Lev1_12',2);
INSERT INTO `sys_module` VALUES ('Lev2_42','科技项目','admin/memberIntellectualPro/list/1.html',2,'Lev1_12',2);
INSERT INTO `sys_module` VALUES ('Lev2_43','专利','admin/memberPatent/list/1.html',3,'Lev1_12',2);


CREATE TABLE `member_intellectual_pro` (
 `Id` int(11) NOT NULL auto_increment,
  `MemberNo` varchar(50) NOT NULL default '' COMMENT '企业编号',
  `ProjectLevel` int(4) default '0' COMMENT '项目级别 0国家级 1省级 2市级 3区级',
  `ProjectType` varchar(255) default NULL COMMENT '项目类别',
  `ProjectName` varchar(255) default NULL COMMENT '项目名称',
  `ApplyAmount` float(7,3) default '0.000' COMMENT '申报额度(万)',
  `IsSetUp` int(1) default '0' COMMENT '是否立项 0未知 1否 2是',
  `SetUpAmount` float(7,3) default '0.000' COMMENT '立项资助金额(万)',
  `Status` int(1) default '0' COMMENT '审核状态 1通过 0不通过',
  `Year` int(11) default '0' COMMENT '年份',
  `Month` int(1) default '0' COMMENT '1为7-12月 0为1-6月',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='科技项目';

#
# Dumping data for table member_intellectual_pro
#

INSERT INTO `member_intellectual_pro` VALUES (2,'440100001',1,'关于申报2013年广东省企业500强广东省制造业百强企业、广东省服务业百强企业的通知','广东省企业500强',0,0,0,0,2012,1);
INSERT INTO `member_intellectual_pro` VALUES (3,'440100001',0,'33','33',3,2,3,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (8,'440100001',0,'f','3',1,2,1,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (9,'admin',2,'test1','tes1_content',3,2,3,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (10,'admin',3,'test2','test2_name',333.3,1,333,0,2015,1);

#
# Source for table member_patent
#

CREATE TABLE `member_patent` (
  `Id` int(11) NOT NULL auto_increment,
  `MemberNo` varchar(50) default NULL COMMENT '企业编号',
  `Type` varchar(20) default NULL COMMENT '专利类别 0发明专利 1实用新型 2外观设计  3软件著作权',
  `Name` varchar(255) default NULL COMMENT '专利名称',
  `PatentNo` varchar(255) default NULL COMMENT '专利编号',
  `Status` int(1) default '0' COMMENT '审核状态 1通过 0不通过',
  `Year` int(11) default NULL COMMENT '年份',
  `Month` int(1) default NULL COMMENT '1为7-12月 0为1-6月',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='专利';

#
# Dumping data for table member_patent
#

INSERT INTO `member_patent` VALUES (1,'440100001','发明专利','军团菌种快速检测试剂盒及其检测方法','200910040956.3',0,2011,1);
INSERT INTO `member_patent` VALUES (2,'440100001','发明专利','军团菌选择性分离培养基','200910040282.7',0,2013,0);
INSERT INTO `member_patent` VALUES (3,'440100001','发明专利','ff','fff',0,2010,0);
INSERT INTO `member_patent` VALUES (4,'admin','2','test1_name','test000001',0,2015,0);
INSERT INTO `member_patent` VALUES (5,'admin','0','test2_name','test2000001',0,2015,1);


DROP TABLE IF EXISTS `ecc_indicator`;
CREATE TABLE `ecc_indicator` (
  `ID` int(11) NOT NULL auto_increment,
  `Hybh` varchar(50) default NULL  COMMENT '会员编号',
  `Rzqy` varchar(100) default NULL COMMENT '入驻企业',
  `Hyfl` varchar(50) default NULL COMMENT '行业分类',
  `Zczj` varchar(100) default NULL COMMENT '注册资金',
  `JgmzsrBys` varchar(50) default NULL COMMENT '技工贸总收入本月数',
  `JgmzsrLjs` varchar(50) default NULL COMMENT '技工贸总收入累计数',
  `LrzeBys` varchar(50) default NULL COMMENT '利润总额本月数',
  `LrzeLjs` varchar(50) default NULL COMMENT '利润总额累计数',
 `NsBys` varchar(50) default NULL COMMENT '纳税本月数',
 `NsLjs` varchar(50) default NULL COMMENT '纳税累计数',
 `LszeBys` varchar(50) default NULL COMMENT '利税总额本月数',
 `LszeLjs` varchar(50) default NULL COMMENT '利税总额累计数',
 `Ch` varchar(50) default NULL COMMENT '创汇',
 `Zgs` varchar(50) default NULL COMMENT '职工数',
 `Yfjf` varchar(50) default NULL COMMENT '研发经费',
  `Gxjscpsr` varchar(50) default NULL COMMENT '高新技术产品收入',
  `Gyzcz` varchar(50) default NULL COMMENT '工业总产值',
  `Gyzjz` varchar(50) default NULL COMMENT '工业增加值',
 `JjzbNy` varchar(50) default NULL COMMENT '经济指标年月',
 `Shzt` varchar(50) default NULL COMMENT '审核状态',

  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : hzkjy

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-03-08 21:00:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `member_rental`
-- ----------------------------
DROP TABLE IF EXISTS `member_rental`;
CREATE TABLE `member_rental` (
  `ID` int(11) NOT NULL auto_increment,
  `Hybh` varchar(50) default NULL COMMENT '会员编号',
  `Qymc` varchar(100) default NULL COMMENT '企业名称',
  `Qyzj` decimal(10,0) default NULL COMMENT '企业租金',
  `Glfwf` decimal(10,0) default NULL COMMENT '管理服务费',
  `Qysf` decimal(10,0) default NULL COMMENT '企业水费',
   `Qydf` decimal(10,0) default NULL COMMENT '企业电费',
  `Zlbzj` decimal(10,0) default NULL COMMENT '租赁保证金', 
  `Zxyj` decimal(10,0) default NULL COMMENT '装修押金', 
  `Glfwfdj` decimal(10,0) default NULL COMMENT '管理服务费平方/元', 
  `Qyzjdj` decimal(10,0) default NULL COMMENT '企业租金平方/元', 
  `Zlbzjdj` decimal(10,0) default NULL COMMENT '租赁保证金平方/元', 
  `Zxyjdj` decimal(10,0) default NULL COMMENT '装修押金平方/元', 
  `Qydfdj` decimal(10,0) default NULL COMMENT '企业电费平方/元', 
   `Qysfdj` decimal(10,0) default NULL COMMENT '企业水费平方/元', 
   
  `Qyzjznj` decimal(10,0) default NULL COMMENT '企业租金滞纳金 ',
  `Glfwfznj` decimal(10,0) default NULL COMMENT '管理服务费滞纳金 ',
  `Qysfznj` decimal(10,0) default NULL COMMENT '企业水费滞纳金 ',
  `Zlbzjznj` decimal(10,0) default NULL COMMENT '租赁保证金滞纳金 ', 
  `Zxyjznj` decimal(10,0) default NULL COMMENT '装修押金滞纳金 ', 
  `Qydfznj` decimal(10,0) default NULL COMMENT '企业电费滞纳金 ', 
   `Hjjeznj` decimal(10,0) default NULL COMMENT '合计金额滞纳金 ', 
  `Ssyhd` decimal(10,0) default NULL COMMENT '水上月行度',
  `Sbyhd` decimal(10,0) default NULL COMMENT '水本月行度',
  `Shjyl` decimal(10,0) default NULL COMMENT '水合计用量',
  `Dhjyl` decimal(10,0) default NULL COMMENT '电合计用量',
  `Qymj` decimal(10,0) default NULL COMMENT '企业面积',
  `Hjje` decimal(10,0) default NULL COMMENT '合计金额',
  `Hjjedx` varchar(255) default NULL COMMENT '合计金额大写',
  `Shzt` varchar(50) default NULL COMMENT '审核状态',
  `Fbzt` varchar(50) default NULL COMMENT '发布状态',
  `Jfyd` varchar(50) default NULL COMMENT '缴费月度',
  `Dsyhd` decimal(10,0) default NULL COMMENT '电上月行度',
  `Dbyhd` decimal(10,0) default NULL COMMENT '电本月行度',
  `Zydy` varchar(50) default NULL COMMENT '租用地址',
  `Bz` varchar(255) default NULL COMMENT '注备',
  `Zjsq` varchar(255) default NULL COMMENT '租金属期',
  `Glfsq` varchar(255) default NULL COMMENT '管理费属期',
  `Sfsq` varchar(255) default NULL COMMENT '水费属期',
  `Dfsq` varchar(255) default NULL COMMENT '电费属期',
  `Zlbzjsq`  varchar(255) default NULL COMMENT '租赁保证金属期', 
  `Zxyjsq` varchar(255) default NULL COMMENT '装修押金属期', 
  `Zjbz` varchar(255) default NULL COMMENT '租金备注',
  `Glfbz` varchar(255) default NULL COMMENT '管理费备注',
  `Sfbz` varchar(255) default NULL COMMENT '水费备注',
  `Dfbz` varchar(255) default NULL COMMENT '电费备注',
  `Zlbzjbz` varchar(255) default NULL COMMENT '租赁保证金备注', 
  `Zxyjbz` varchar(255)  default NULL COMMENT '装修押金备注', 
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_rental
-- ----------------------------
INSERT INTO `member_rental` VALUES ('2', '440100001', '广州军软', '5530', '3160', '85', '27', '0', '15', '15', '21', '100', '0', '8802', '已审核', '未提交', '2014-12', '21301', '21322', '3001', null, '14/12/1~14/12/31', '14/12/1~14/12/31', '14/10/23~14/11/22', '14/10/23~14/11/22', '', '', '分摊洗手间水费', '已含公摊费用');
INSERT INTO `member_rental` VALUES ('3', '440100001', '广州军软', '333', '33', '33', '33', '33', '33', '0', '0', '100', '33', '432', '已审核', '未提交', '2015-02', '33', '33', '3001', null, '33', '33', '33', '33', '33', '33', '33', '33');


/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : hzkjy

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-03-08 21:01:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `enterprise_rental`
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_rental`;
CREATE TABLE `enterprise_rental` (
   `ID` int(11) NOT NULL auto_increment,
  `Hybh` varchar(50) default NULL COMMENT '会员编号',
  `Qymc` varchar(100) default NULL COMMENT '企业名称',
  `Qyzj` decimal(10,0) default NULL COMMENT '企业租金',
  `Glfwf` decimal(10,0) default NULL COMMENT '管理服务费',
  `Qysf` decimal(10,0) default NULL COMMENT '企业水费',
   `Qydf` decimal(10,0) default NULL COMMENT '企业电费',
  `Zlbzj` decimal(10,0) default NULL COMMENT '租赁保证金',
  `Zxyj` decimal(10,0) default NULL COMMENT '装修押金',
  `Glfwfdj` decimal(10,0) default NULL COMMENT '管理服务费平方/元',
  `Qyzjdj` decimal(10,0) default NULL COMMENT '企业租金平方/元',
  `Zlbzjdj` decimal(10,0) default NULL COMMENT '租赁保证金平方/元',
  `Zxyjdj` decimal(10,0) default NULL COMMENT '装修押金平方/元',
  `Qydfdj` decimal(10,0) default NULL COMMENT '企业电费平方/元',
   `Qysfdj` decimal(10,0) default NULL COMMENT '企业水费平方/元',
   
  `Qyzjznj` decimal(10,0) default NULL COMMENT '企业租金滞纳金 ',
  `Glfwfznj` decimal(10,0) default NULL COMMENT '管理服务费滞纳金 ',
  `Qysfznj` decimal(10,0) default NULL COMMENT '企业水费滞纳金 ',
  `Zlbzjznj` decimal(10,0) default NULL COMMENT '租赁保证金滞纳金 ',
  `Zxyjznj` decimal(10,0) default NULL COMMENT '装修押金滞纳金 ',
  `Qydfznj` decimal(10,0) default NULL COMMENT '企业电费滞纳金 ',
   `Hjjeznj` decimal(10,0) default NULL COMMENT '合计金额滞纳金 ',
  `Ssyhd` decimal(10,0) default NULL COMMENT '水上月行度',
  `Sbyhd` decimal(10,0) default NULL COMMENT '水本月行度',
  `Shjyl` decimal(10,0) default NULL COMMENT '水合计用量',
  `Dhjyl` decimal(10,0) default NULL COMMENT '电合计用量',
  `Qymj` decimal(10,0) default NULL COMMENT '企业面积',
  `Hjje` decimal(10,0) default NULL COMMENT '合计金额',
  `Hjjedx` varchar(255) default NULL COMMENT '合计金额大写',
  `Shzt` varchar(50) default NULL COMMENT '审核状态',
  `Fbzt` varchar(50) default NULL COMMENT '发布状态',
  `Jfyd` varchar(50) default NULL COMMENT '缴费月度',
  `Dsyhd` decimal(10,0) default NULL COMMENT '电上月行度',
  `Dbyhd` decimal(10,0) default NULL COMMENT '电本月行度',
  `Zydy` varchar(50) default NULL COMMENT '租用地址',
  `Bz` varchar(255) default NULL COMMENT '注备',
  `Zjsq` varchar(255) default NULL COMMENT '租金属期',
  `Glfsq` varchar(255) default NULL COMMENT '管理费属期',
  `Sfsq` varchar(255) default NULL COMMENT '水费属期',
  `Dfsq` varchar(255) default NULL COMMENT '电费属期',
  `Zlbzjsq`  varchar(255) default NULL COMMENT '租赁保证金属期',
  `Zxyjsq` varchar(255) default NULL COMMENT '装修押金属期',
  `Zjbz` varchar(255) default NULL COMMENT '租金备注',
  `Glfbz` varchar(255) default NULL COMMENT '管理费备注',
  `Sfbz` varchar(255) default NULL COMMENT '水费备注',
  `Dfbz` varchar(255) default NULL COMMENT '电费备注',
  `Zlbzjbz` varchar(255) default NULL COMMENT '租赁保证金备注',
  `Zxyjbz` varchar(255)  default NULL COMMENT '装修押金备注', 
  `Jnje` decimal(10,0) default NULL COMMENT '缴纳金额',
  `Accessory` varchar(50) default NULL COMMENT '缴费依据',
  `Sfqf` varchar(50) default NULL COMMENT '是否欠费',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprise_rental
-- ----------------------------
INSERT INTO `enterprise_rental` VALUES ('36', '440100001', '广州军软', '5530', '3160', '85', '27', '0', '0', '15', '21', '100', '0', null, '未提交', '2014-12', '21301', '21322', '3001', '8802', '0', '0', '0', null);
INSERT INTO `enterprise_rental` VALUES ('37', '440100001', '广州军软', '333', '33', '33', '33', '33', '33', '0', '0', '100', '33', null, '未提交', '2015-02', '33', '33', '3001', '432', '0', '0', '0', null);

DROP TABLE IF EXISTS `incubated_enterprises`;
CREATE TABLE `incubated_enterprises` (
  `ID` int(11) NOT NULL auto_increment,
  `Qymc` varchar(100) default NULL COMMENT '会员名称',
  `Zzjgdm` varchar(50) default NULL COMMENT '组织机构代码',
  `Frdb` varchar(100) default NULL COMMENT '法人代表',
  `Zczb` varchar(50) default NULL COMMENT '注册资本',
  `Frlxdh` varchar(50) default NULL COMMENT '法人联系电话',
  `Qyclsj` datetime default NULL COMMENT '企业成立时间',
  `Lxr` varchar(50) default NULL COMMENT '联系人',
  `Qyrzsj` datetime default NULL COMMENT '企业入驻时间',
  `Lxrlxdh` varchar(50) default NULL COMMENT '联系人联系电话',
  `Qydjzclx` varchar(50) default NULL COMMENT '企业登记注册类型',
  `Htstze` varchar(50) default NULL COMMENT '获天使或风险投资额（千元）',
  `Dzys` varchar(50) default NULL COMMENT '大专以上（人）',
  `Xnyjdxs` varchar(200) default NULL COMMENT '吸纳应届大学毕业生（人）',
`Qyssjsly` varchar(200) default NULL COMMENT '企业所属技术领域',
`Gxjsqy` varchar(200) default NULL COMMENT '高新技术企业',
`Lxryqy` varchar(200) default NULL COMMENT '留学人员企业',
`Hylb` varchar(200) default NULL COMMENT '行业类别',
`Synyxzscq` varchar(200) default NULL COMMENT '到上一年为止拥有有效知识产权（件）',
`Fmzl` varchar(200) default NULL COMMENT '发明专利（件）',
`Wgsj` varchar(200) default NULL COMMENT '外观设计（个）',
`Syxx` varchar(200) default NULL COMMENT '实用新型（件）',
`Rjzzq` varchar(200) default NULL COMMENT '软件著作权（个）',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

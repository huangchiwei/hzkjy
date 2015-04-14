# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: hzkjy
# ------------------------------------------------------
# Server version 5.6.21-log

USE `hzkjy`;

#
# Source for table bs_news
#

CREATE TABLE `bs_news` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Receiver` varchar(100) DEFAULT NULL,
  `Iseveryone` varchar(50) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `Content` longtext,
  `Creater` varchar(50) DEFAULT NULL,
  `IsReport` varchar(50) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ReceiverBh` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Dumping data for table bs_news
#

INSERT INTO `bs_news` VALUES (2,'33','广州军软','0','2015-02-11','<p>\r\n\t<img alt=\"\" src=\"/Hzkjy/userfiles/images/20150223000840939f7007-12a3-4ed5-ae39-a5afb3e331e6.jpg\" style=\"width: 135px; height: 174px;\" />33</p>\r\n',NULL,'0','2015-02-23 00:08:50','440100001');
INSERT INTO `bs_news` VALUES (4,'2014-12缴费通知','广州军软','0','2015-04-06 14:40:25','你好:广州军软海珠科技园通知您缴交2014-12租金费用：8802','admin','1','2015-03-06 14:40:25','440100001');
INSERT INTO `bs_news` VALUES (5,'2014-12缴费通知','广州军软','0','2015-04-09 09:15:13','你好:广州军软,海珠科技园通知您缴交2014-12租金费用：8802','admin','1','2015-03-09 09:15:13','440100001');
INSERT INTO `bs_news` VALUES (6,'2015-02缴费通知','广州军软','0','2015-04-09 09:15:13','你好:广州军软,海珠科技园通知您缴交2015-02租金费用：432','admin','1','2015-03-09 09:15:13','440100001');
INSERT INTO `bs_news` VALUES (7,'2015-02缴费通知','广州军软','0','2015-04-13 15:08:38','你好:广州军软,海珠科技园通知您缴交2015-02租金费用：432','admin','1','2015-03-13 15:08:38','440100001');
INSERT INTO `bs_news` VALUES (8,'2015-01缴费通知','广州军软','0','2015-04-24 09:31:16','缴费通知格式：温馨提示：您好！请贵司按照缴费通知单的要求在每月5日前缴交当月的租金、管理费、水电费等费用，逾期我司将收取滞纳金！联系电话：89232382。','admin','1','2015-03-24 09:31:16','440100001');
INSERT INTO `bs_news` VALUES (10,'经济月报通知','广州军软','0','2015-04-25 11:48:03','经济月报的通知格式：您好！请贵公司在每月15日前（节假日顺延）登录www.hzkjcyy.com（广州市海珠科技产业基地网）报送上月的“经济指标月报表”，打印报表盖公章，在报送当月30日前送到海珠科技产业园的园区部，联系电话：89232382。','admin','1','2015-03-25 11:48:03','440100001');
INSERT INTO `bs_news` VALUES (11,'经济月报审核通过通知','广州军软6','0','2015-04-30 21:10:31','test','admin','1','2015-03-30 21:10:31','440100007');
INSERT INTO `bs_news` VALUES (12,'经济月报审核不通过通知','广州军软6','0','2015-04-30 21:10:42','test','admin','1','2015-03-30 21:10:42','440100007');

#
# Source for table db_message
#

CREATE TABLE `db_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Messagename` varchar(50) DEFAULT NULL COMMENT '信息名',
  `Message` longtext COMMENT '信息内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table db_message
#

INSERT INTO `db_message` VALUES (1,'经济月报通知','您好！请贵公司在每月15日前（节假日顺延）登录www.hzkjcyy.com（广州市海珠科技产业基地网）报送上月的“经济指标月报表”，打印报表盖公章，在报送当月30日前送到海珠科技产业园的园区部，联系电话：89232382。');
INSERT INTO `db_message` VALUES (2,'租金通知','温馨提示：您好！请贵司按照缴费通知单的要求在每月5日前缴交当月的租金、管理费、水电费等费用，逾期我司将收取滞纳金！联系电话：89232382。');
INSERT INTO `db_message` VALUES (3,'经济月报审核通过通知','test');
INSERT INTO `db_message` VALUES (4,'经济月报审核不通过通知','test');

#
# Source for table ecc_indicator
#

CREATE TABLE `ecc_indicator` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hybh` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `Rzqy` varchar(100) DEFAULT NULL COMMENT '入驻企业',
  `Hyfl` varchar(50) DEFAULT NULL COMMENT '行业分类',
  `Zczj` varchar(100) DEFAULT NULL COMMENT '注册资金',
  `JgmzsrBys` varchar(50) DEFAULT NULL COMMENT '技工贸总收入本月数',
  `JgmzsrLjs` varchar(50) DEFAULT NULL COMMENT '技工贸总收入累计数',
  `LrzeBys` varchar(50) DEFAULT NULL COMMENT '利润总额本月数',
  `LrzeLjs` varchar(50) DEFAULT NULL COMMENT '利润总额累计数',
  `NsBys` varchar(50) DEFAULT NULL COMMENT '纳税本月数',
  `NsLjs` varchar(50) DEFAULT NULL COMMENT '纳税累计数',
  `LszeBys` varchar(50) DEFAULT NULL COMMENT '利税总额本月数',
  `LszeLjs` varchar(50) DEFAULT NULL COMMENT '利税总额累计数',
  `Ch` varchar(50) DEFAULT NULL COMMENT '创汇',
  `ChLjs` varchar(50) DEFAULT NULL COMMENT '创汇累计数',
  `Zgs` varchar(50) DEFAULT NULL COMMENT '职工数',
  `Yfjf` varchar(50) DEFAULT NULL COMMENT '研发经费',
  `YfjfLjs` varchar(50) DEFAULT NULL COMMENT '研发经费累计数',
  `Gxjscpsr` varchar(50) DEFAULT NULL COMMENT '高新技术产品收入',
  `GxjscpsrLjs` varchar(50) DEFAULT NULL COMMENT '高新技术产品收入累计数',
  `Gyzcz` varchar(50) DEFAULT NULL COMMENT '工业总产值',
  `GyzczLjs` varchar(50) DEFAULT NULL COMMENT '工业总产值累计数',
  `Gyzjz` varchar(50) DEFAULT NULL COMMENT '工业增加值',
  `GyzjzLjs` varchar(50) DEFAULT NULL COMMENT '工业增加值累计数',
  `JjzbNy` varchar(50) DEFAULT NULL COMMENT '经济指标年月',
  `Shzt` varchar(50) DEFAULT NULL COMMENT '审核状态',
  `Tbr` varchar(50) DEFAULT NULL COMMENT '填表人',
  `Dwfzr` varchar(50) DEFAULT NULL COMMENT '单位负责人',
  `Tjfzr` varchar(50) DEFAULT NULL COMMENT '统计负责人',
  `Tbrlxdh` varchar(50) DEFAULT NULL COMMENT '填表联系电话',
  `Tbrq` varchar(50) DEFAULT NULL COMMENT '填表日期',
  `Zt` varchar(50) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table ecc_indicator
#

INSERT INTO `ecc_indicator` VALUES (1,'440100001','广州军软','1','1000','0','0','0','0','0','0','0','0','0',NULL,'0','0',NULL,'0',NULL,'0',NULL,'0',NULL,'2015-01','未提交',NULL,NULL,NULL,NULL,NULL,'1');

#
# Source for table enterprise_rental
#

CREATE TABLE `enterprise_rental` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hybh` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `Qymc` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `Qyzj` decimal(10,0) DEFAULT NULL COMMENT '企业租金',
  `Glfwf` decimal(10,0) DEFAULT NULL COMMENT '管理服务费',
  `Qysf` decimal(10,0) DEFAULT NULL COMMENT '企业水费',
  `Qydf` decimal(10,0) DEFAULT NULL COMMENT '企业电费',
  `Zlbzj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金',
  `Zxyj` decimal(10,0) DEFAULT NULL COMMENT '装修押金',
  `Glfwfdj` decimal(10,0) DEFAULT NULL COMMENT '管理服务费平方/元',
  `Qyzjdj` decimal(10,0) DEFAULT NULL COMMENT '企业租金平方/元',
  `Zlbzjdj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金平方/元',
  `Zxyjdj` decimal(10,0) DEFAULT NULL COMMENT '装修押金平方/元',
  `Qydfdj` decimal(10,0) DEFAULT NULL COMMENT '企业电费平方/元',
  `Qysfdj` decimal(10,0) DEFAULT NULL COMMENT '企业水费平方/元',
  `Qyzjznj` decimal(10,0) DEFAULT NULL COMMENT '企业租金滞纳金 ',
  `Glfwfznj` decimal(10,0) DEFAULT NULL COMMENT '管理服务费滞纳金 ',
  `Qysfznj` decimal(10,0) DEFAULT NULL COMMENT '企业水费滞纳金 ',
  `Zlbzjznj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金滞纳金 ',
  `Zxyjznj` decimal(10,0) DEFAULT NULL COMMENT '装修押金滞纳金 ',
  `Qydfznj` decimal(10,0) DEFAULT NULL COMMENT '企业电费滞纳金 ',
  `Hjjeznj` decimal(10,0) DEFAULT NULL COMMENT '合计金额滞纳金 ',
  `Ssyhd` decimal(10,0) DEFAULT NULL COMMENT '水上月行度',
  `Sbyhd` decimal(10,0) DEFAULT NULL COMMENT '水本月行度',
  `Shjyl` decimal(10,0) DEFAULT NULL COMMENT '水合计用量',
  `Dhjyl` decimal(10,0) DEFAULT NULL COMMENT '电合计用量',
  `Qymj` decimal(10,0) DEFAULT NULL COMMENT '企业面积',
  `Hjje` decimal(10,0) DEFAULT NULL COMMENT '合计金额',
  `Hjjedx` varchar(255) DEFAULT NULL COMMENT '合计金额大写',
  `Shzt` varchar(50) DEFAULT NULL COMMENT '审核状态',
  `Fbzt` varchar(50) DEFAULT NULL COMMENT '发布状态',
  `Jfyd` varchar(50) DEFAULT NULL COMMENT '缴费月度',
  `Dsyhd` decimal(10,0) DEFAULT NULL COMMENT '电上月行度',
  `Dbyhd` decimal(10,0) DEFAULT NULL COMMENT '电本月行度',
  `Zydy` varchar(50) DEFAULT NULL COMMENT '租用地址',
  `Bz` varchar(255) DEFAULT NULL COMMENT '注备',
  `Zjsq` varchar(255) DEFAULT NULL COMMENT '租金属期',
  `Glfsq` varchar(255) DEFAULT NULL COMMENT '管理费属期',
  `Sfsq` varchar(255) DEFAULT NULL COMMENT '水费属期',
  `Dfsq` varchar(255) DEFAULT NULL COMMENT '电费属期',
  `Zlbzjsq` varchar(255) DEFAULT NULL COMMENT '租赁保证金属期',
  `Zxyjsq` varchar(255) DEFAULT NULL COMMENT '装修押金属期',
  `Zjbz` varchar(255) DEFAULT NULL COMMENT '租金备注',
  `Glfbz` varchar(255) DEFAULT NULL COMMENT '管理费备注',
  `Sfbz` varchar(255) DEFAULT NULL COMMENT '水费备注',
  `Dfbz` varchar(255) DEFAULT NULL COMMENT '电费备注',
  `Zlbzjbz` varchar(255) DEFAULT NULL COMMENT '租赁保证金备注',
  `Zxyjbz` varchar(255) DEFAULT NULL COMMENT '装修押金备注',
  `Jnje` decimal(10,0) DEFAULT NULL COMMENT '缴纳金额',
  `Accessory` varchar(50) DEFAULT NULL COMMENT '缴费依据',
  `Sfqf` varchar(50) DEFAULT NULL COMMENT '是否欠费',
  `Xxbz` longtext COMMENT '详细备注',
  `Sslq` varchar(255) DEFAULT NULL COMMENT '所属楼区',
  `Ssyhd2` varchar(255) DEFAULT NULL COMMENT '水上月行度2',
  `Sbyhd2` varchar(255) DEFAULT NULL COMMENT '水本月行度2',
  `Shjyl2` varchar(255) DEFAULT NULL,
  `Qysfdj2` varchar(255) DEFAULT NULL COMMENT '企业电费平方/元2',
  `Lqysf2` varchar(255) DEFAULT NULL COMMENT '企业水费2',
  `Sfbz2` varchar(255) DEFAULT NULL COMMENT '水费备注2',
  `Dsyhd2` varchar(255) DEFAULT NULL COMMENT '电上月行度2',
  `Dbyhd2` varchar(255) DEFAULT NULL COMMENT '电本月行度2',
  `Dhjyl2` varchar(255) DEFAULT NULL COMMENT '电合计用量2',
  `Qydfdj2` varchar(255) DEFAULT NULL COMMENT '企业电费平方/元2',
  `Lqydf2` varchar(255) DEFAULT NULL COMMENT '企业电费2',
  `Dfbz2` varchar(255) DEFAULT NULL COMMENT '电费备注',
  `Zjmc` varchar(255) DEFAULT NULL COMMENT '租金名称',
  `Glfwfmc` varchar(255) DEFAULT NULL COMMENT '管理服务费名称',
  `Zlbzjmc` varchar(255) DEFAULT NULL COMMENT '租赁保证金名称',
  `Zxyjmc` varchar(255) DEFAULT NULL COMMENT '装修押金名称',
  `Sfmc` varchar(255) DEFAULT NULL COMMENT '水费名称',
  `Dfmc` varchar(255) DEFAULT NULL COMMENT '电费名称',
  `Lqysf` varchar(255) DEFAULT NULL COMMENT '水费1',
  `Lqydf` varchar(255) DEFAULT NULL COMMENT '电费1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Dumping data for table enterprise_rental
#

INSERT INTO `enterprise_rental` VALUES (42,'440100001','广州军软',6900,6900,45770,66600,13800,6900,23,23,23,23,333,23,NULL,0,0,0,0,0,0,232,2222,1990,200,300,146870,'壹拾肆万陆仟捌佰柒拾元整',NULL,'未提交','2015-01',22,222,'广园东路2193号3001','','2323','23','','','23','23','','',NULL,'','','',0,'0','0','','1','23','33','3','3','3.0','3','33','33','3','3','3.0','3','租金','管理服务费','租赁保证金','装修押金','水费','电费',NULL,NULL);

#
# Source for table incubated_enterprises
#

CREATE TABLE `incubated_enterprises` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Qymc` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `Zzjgdm` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `Frdb` varchar(100) DEFAULT NULL COMMENT '法人代表',
  `Zczb` varchar(50) DEFAULT NULL COMMENT '注册资本',
  `Frlxdh` varchar(50) DEFAULT NULL COMMENT '法人联系电话',
  `Qyclsj` datetime DEFAULT NULL COMMENT '企业成立时间',
  `Lxr` varchar(50) DEFAULT NULL COMMENT '联系人',
  `Qyrzsj` datetime DEFAULT NULL COMMENT '企业入驻时间',
  `Lxrlxdh` varchar(50) DEFAULT NULL COMMENT '联系人联系电话',
  `Qydjzclx` varchar(50) DEFAULT NULL COMMENT '企业登记注册类型',
  `Htstze` varchar(50) DEFAULT NULL COMMENT '获天使或风险投资额（千元）',
  `Dzys` varchar(50) DEFAULT NULL COMMENT '大专以上（人）',
  `Xnyjdxs` varchar(200) DEFAULT NULL COMMENT '吸纳应届大学毕业生（人）',
  `Qyssjsly` varchar(200) DEFAULT NULL COMMENT '企业所属技术领域',
  `Gxjsqy` varchar(200) DEFAULT NULL COMMENT '高新技术企业',
  `Lxryqy` varchar(200) DEFAULT NULL COMMENT '留学人员企业',
  `Hylb` varchar(200) DEFAULT NULL COMMENT '行业类别',
  `Synyxzscq` varchar(200) DEFAULT NULL COMMENT '到上一年为止拥有有效知识产权（件）',
  `Fmzl` varchar(200) DEFAULT NULL COMMENT '发明专利（件）',
  `Wgsj` varchar(200) DEFAULT NULL COMMENT '外观设计（个）',
  `Syxx` varchar(200) DEFAULT NULL COMMENT '实用新型（件）',
  `Rjzzq` varchar(200) DEFAULT NULL COMMENT '软件著作权（个）',
  `Ssn` varchar(50) DEFAULT NULL COMMENT '所属年',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table incubated_enterprises
#


#
# Source for table member_basic
#

CREATE TABLE `member_basic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hybh` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `Qymc` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `Qymcpy` varchar(50) DEFAULT NULL COMMENT '会员名称拼音',
  `Address` varchar(100) DEFAULT NULL COMMENT '地址',
  `Zydy` varchar(50) DEFAULT NULL COMMENT '租用地址',
  `Mj` varchar(50) DEFAULT NULL COMMENT '面积',
  `Frdb` varchar(100) DEFAULT NULL COMMENT '法人代表',
  `Zczb` varchar(50) DEFAULT NULL COMMENT '注册资本',
  `Lxr` varchar(50) DEFAULT NULL COMMENT '联系人',
  `Zt` varchar(50) DEFAULT NULL COMMENT '状态',
  `Qyrzsj` datetime DEFAULT NULL COMMENT '企业入驻时间',
  `Htqxf` datetime DEFAULT NULL COMMENT '合同期限始',
  `Htqxe` datetime DEFAULT NULL COMMENT '合同期限终',
  `Qydjzclx` varchar(50) DEFAULT NULL COMMENT '企业登记注册类型',
  `Lxrdh` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `Sfjjyb` varchar(50) DEFAULT NULL COMMENT '是否经济月报',
  `Zzjgdm` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `Frlxdh` varchar(50) DEFAULT NULL COMMENT '法人联系电话',
  `Qyclsj` datetime DEFAULT NULL COMMENT '企业成立时间',
  `Htstze` varchar(50) DEFAULT NULL COMMENT '获天使或风险投资额（千元）',
  `Dzys` varchar(50) DEFAULT NULL COMMENT '大专以上（人）',
  `Xnyjdxs` varchar(200) DEFAULT NULL COMMENT '吸纳应届大学毕业生（人）',
  `Qyssjsly` varchar(200) DEFAULT NULL COMMENT '企业所属技术领域',
  `Gxjsqy` varchar(200) DEFAULT NULL COMMENT '高新技术企业',
  `Lxryqy` varchar(200) DEFAULT NULL COMMENT '留学人员企业',
  `Hylb` varchar(200) DEFAULT NULL COMMENT '行业类别',
  `Synyxzscq` varchar(200) DEFAULT NULL COMMENT '到上一年为止拥有有效知识产（件）',
  `Fmzl` varchar(200) DEFAULT NULL COMMENT '发明专利（件）',
  `Wgsj` varchar(200) DEFAULT NULL COMMENT '外观设计（个）',
  `Syxx` varchar(200) DEFAULT NULL COMMENT '实用新型（件）',
  `Rjzzq` varchar(200) DEFAULT NULL COMMENT '软件著作权（个）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Dumping data for table member_basic
#

INSERT INTO `member_basic` VALUES (1,'440100001','广州军软','gzjr','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-12','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','1','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (2,'440100003','广州军软2','gzjr2','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','6','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (3,'440100004','广州军软3','gzjr3','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','0','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','1','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (4,'440100005','广州军软4','gzjr','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','1','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (6,'440100007','广州军软6','gzjr6','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','2','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (7,'440100008','广州军软7','gzjr7','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','4','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (8,'440100002','广州军软1','gzjr','广园东路2193号3001','广园东路2193号3001','300','邱晓帆','1000','陈泽','1','2015-03-04','2015-03-19','2015-03-27','1','15813366410','1','440508198901310732','15813366410','2015-03-19','1000','10','10','1','0','0','000000',NULL,'10','10','10','10');
INSERT INTO `member_basic` VALUES (10,'440100003','广州银汉科技','gzyhkj','天河区',NULL,NULL,'邱晓帆','100',NULL,NULL,NULL,NULL,NULL,NULL,'020-87733788',NULL,'111111111','15813366410','2015-04-08',NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `member_basic` VALUES (11,'440100004','广州测试3','gzcs3','33',NULL,NULL,'333','333',NULL,NULL,NULL,NULL,NULL,NULL,'020-8888888',NULL,'111111111','15813366410','2015-04-09',NULL,NULL,NULL,NULL,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL);

#
# Source for table member_intellectual_pro
#

CREATE TABLE `member_intellectual_pro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MemberNo` varchar(50) NOT NULL DEFAULT '' COMMENT '企业编号',
  `ProjectLevel` int(4) DEFAULT '0' COMMENT '项目级别 0国家级 1省级 2市级 3区级',
  `ProjectType` varchar(255) DEFAULT NULL COMMENT '项目类别',
  `ProjectName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `ApplyAmount` float(7,3) DEFAULT '0.000' COMMENT '申报额度(万)',
  `IsSetUp` int(1) DEFAULT '0' COMMENT '是否立项 0未知 1否 2是',
  `SetUpAmount` float(7,3) DEFAULT '0.000' COMMENT '立项资助金额(万)',
  `Status` int(1) DEFAULT '0' COMMENT '审核状态 1通过 0不通过',
  `Year` int(11) DEFAULT '0' COMMENT '年份',
  `Month` int(1) DEFAULT '0' COMMENT '1为7-12月 0为1-6月',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='科技项目';

#
# Dumping data for table member_intellectual_pro
#

INSERT INTO `member_intellectual_pro` VALUES (2,'440100001',1,'关于申报2013年广东省企业500强广东省制造业百强企业、广东省服务业百强企业的通知','广东省企业500强',0,0,0,0,2012,1);
INSERT INTO `member_intellectual_pro` VALUES (3,'440100001',0,'33','33',3,2,3,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (8,'440100001',0,'f','3',1,2,1,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (9,'admin',2,'test1','tes1_content',3,2,3,0,2015,0);
INSERT INTO `member_intellectual_pro` VALUES (10,'admin',3,'test2','test2_name',333.3,1,333,0,2015,1);
INSERT INTO `member_intellectual_pro` VALUES (11,'admin',0,'33','33',33,2,33,0,2013,0);

#
# Source for table member_patent
#

CREATE TABLE `member_patent` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MemberNo` varchar(50) DEFAULT NULL COMMENT '企业编号',
  `Type` varchar(20) DEFAULT NULL COMMENT '专利类别 0发明专利 1实用新型 2外观设计  3软件著作权',
  `Name` varchar(255) DEFAULT NULL COMMENT '专利名称',
  `PatentNo` varchar(255) DEFAULT NULL COMMENT '专利编号',
  `Status` int(1) DEFAULT '0' COMMENT '审核状态 1通过 0不通过',
  `Year` int(11) DEFAULT NULL COMMENT '年份',
  `Month` int(1) DEFAULT NULL COMMENT '1为7-12月 0为1-6月',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='专利';

#
# Dumping data for table member_patent
#

INSERT INTO `member_patent` VALUES (1,'440100001','发明专利','军团菌种快速检测试剂盒及其检测方法','200910040956.3',0,2011,1);
INSERT INTO `member_patent` VALUES (3,'440100001','发明专利','ff','fff',0,2010,0);
INSERT INTO `member_patent` VALUES (4,'admin','2','test1_name','test000001',0,2015,0);
INSERT INTO `member_patent` VALUES (5,'admin','0','test2_name','test2000001',0,2015,1);
INSERT INTO `member_patent` VALUES (6,'admin','0','23','23',0,2013,0);
INSERT INTO `member_patent` VALUES (7,'440100001','0','333','33',0,2013,0);
INSERT INTO `member_patent` VALUES (8,'440100003','0','33','33',0,2013,0);

#
# Source for table member_rental
#

CREATE TABLE `member_rental` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hybh` varchar(50) DEFAULT NULL COMMENT '会员编号',
  `Qymc` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `Qyzj` decimal(10,0) DEFAULT NULL COMMENT '企业租金',
  `Glfwf` decimal(10,0) DEFAULT NULL COMMENT '管理服务费',
  `Qysf` decimal(10,0) DEFAULT NULL COMMENT '企业水费',
  `Qydf` decimal(10,0) DEFAULT NULL COMMENT '企业电费',
  `Zlbzj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金',
  `Zxyj` decimal(10,0) DEFAULT NULL COMMENT '装修押金',
  `Glfwfdj` decimal(10,0) DEFAULT NULL COMMENT '管理服务费平方/元',
  `Qyzjdj` decimal(10,0) DEFAULT NULL COMMENT '企业租金平方/元',
  `Zlbzjdj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金平方/元',
  `Zxyjdj` decimal(10,0) DEFAULT NULL COMMENT '装修押金平方/元',
  `Qydfdj` decimal(10,0) DEFAULT NULL COMMENT '企业电费平方/元',
  `Qysfdj` decimal(10,0) DEFAULT NULL COMMENT '企业水费平方/元',
  `Qyzjznj` decimal(10,0) DEFAULT NULL COMMENT '企业租金滞纳金 ',
  `Glfwfznj` decimal(10,0) DEFAULT NULL COMMENT '管理服务费滞纳金 ',
  `Qysfznj` decimal(10,0) DEFAULT NULL COMMENT '企业水费滞纳金 ',
  `Zlbzjznj` decimal(10,0) DEFAULT NULL COMMENT '租赁保证金滞纳金 ',
  `Zxyjznj` decimal(10,0) DEFAULT NULL COMMENT '装修押金滞纳金 ',
  `Qydfznj` decimal(10,0) DEFAULT NULL COMMENT '企业电费滞纳金 ',
  `Hjjeznj` decimal(10,0) DEFAULT NULL COMMENT '合计金额滞纳金 ',
  `Ssyhd` decimal(10,0) DEFAULT NULL COMMENT '水上月行度',
  `Sbyhd` decimal(10,0) DEFAULT NULL COMMENT '水本月行度',
  `Shjyl` decimal(10,0) DEFAULT NULL COMMENT '水合计用量',
  `Dhjyl` decimal(10,0) DEFAULT NULL COMMENT '电合计用量',
  `Qymj` decimal(10,0) DEFAULT NULL COMMENT '企业面积',
  `Hjje` decimal(10,0) DEFAULT NULL COMMENT '合计金额',
  `Hjjedx` varchar(255) DEFAULT NULL COMMENT '合计金额大写',
  `Shzt` varchar(50) DEFAULT NULL COMMENT '审核状态',
  `Fbzt` varchar(50) DEFAULT NULL COMMENT '发布状态',
  `Jfyd` varchar(50) DEFAULT NULL COMMENT '缴费月度',
  `Dsyhd` decimal(10,0) DEFAULT NULL COMMENT '电上月行度',
  `Dbyhd` decimal(10,0) DEFAULT NULL COMMENT '电本月行度',
  `Zydy` varchar(50) DEFAULT NULL COMMENT '租用地址',
  `Bz` varchar(255) DEFAULT NULL COMMENT '注备',
  `Zjsq` varchar(255) DEFAULT NULL COMMENT '租金属期',
  `Glfsq` varchar(255) DEFAULT NULL COMMENT '管理费属期',
  `Sfsq` varchar(255) DEFAULT NULL COMMENT '水费属期',
  `Dfsq` varchar(255) DEFAULT NULL COMMENT '电费属期',
  `Zlbzjsq` varchar(255) DEFAULT NULL COMMENT '租赁保证金属期',
  `Zxyjsq` varchar(255) DEFAULT NULL COMMENT '装修押金属期',
  `Zjbz` varchar(255) DEFAULT NULL COMMENT '租金备注',
  `Glfbz` varchar(255) DEFAULT NULL COMMENT '管理费备注',
  `Sfbz` varchar(255) DEFAULT NULL COMMENT '水费备注',
  `Dfbz` varchar(255) DEFAULT NULL COMMENT '电费备注',
  `Zlbzjbz` varchar(255) DEFAULT NULL COMMENT '租赁保证金备注',
  `Zxyjbz` varchar(255) DEFAULT NULL COMMENT '装修押金备注',
  `Xxbz` longtext COMMENT '详细备注',
  `Sslq` varchar(255) DEFAULT NULL COMMENT '所属楼区',
  `Ssyhd2` varchar(255) DEFAULT NULL COMMENT '水上月行度2',
  `Sbyhd2` varchar(255) DEFAULT NULL COMMENT '水本月行度2',
  `Shjyl2` varchar(255) DEFAULT NULL,
  `Qysfdj2` varchar(255) DEFAULT NULL COMMENT '企业电费平方/元2',
  `Lqysf2` varchar(255) DEFAULT NULL COMMENT '企业水费2',
  `Sfbz2` varchar(255) DEFAULT NULL COMMENT '水费备注2',
  `Dsyhd2` varchar(255) DEFAULT NULL COMMENT '电上月行度2',
  `Dbyhd2` varchar(255) DEFAULT NULL COMMENT '电本月行度2',
  `Dhjyl2` varchar(255) DEFAULT NULL COMMENT '电合计用量2',
  `Qydfdj2` varchar(255) DEFAULT NULL COMMENT '企业电费平方/元2',
  `Lqydf2` varchar(255) DEFAULT NULL COMMENT '企业电费2',
  `Dfbz2` varchar(255) DEFAULT NULL COMMENT '电费备注',
  `Zjmc` varchar(255) DEFAULT NULL COMMENT '租金名称',
  `Glfwfmc` varchar(255) DEFAULT NULL COMMENT '管理服务费名称',
  `Zlbzjmc` varchar(255) DEFAULT NULL COMMENT '租赁保证金名称',
  `Zxyjmc` varchar(255) DEFAULT NULL COMMENT '装修押金名称',
  `Sfmc` varchar(255) DEFAULT NULL COMMENT '水费名称',
  `Dfmc` varchar(255) DEFAULT NULL COMMENT '电费名称',
  `Lqysf` varchar(255) DEFAULT NULL COMMENT '水费1',
  `Lqydf` varchar(255) DEFAULT NULL COMMENT '电费1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table member_rental
#

INSERT INTO `member_rental` VALUES (1,'440100001','广州军软',6900,6900,538,3999,13800,6900,23,23,23,23,333,23,0,0,0,0,0,0,0,232,255,23,12,300,39037,'叁万玖仟零叁拾柒元整','已审核','未发布','2015-01',22,34,'广园东路2193号3001','','2323','23','','','23','23','','','','','','','','1','23','33','3','3','3.0','3','33','33','3','3','3.0','3','租金','管理服务费','租赁保证金','装修押金','水费','电费','529.0','3996.0');

#
# Source for table news
#

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '文档内容',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `realTime` datetime DEFAULT NULL COMMENT '文档原始时间',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `clicks` int(11) DEFAULT '0' COMMENT '阅读次数',
  `cateCode` varchar(255) DEFAULT NULL COMMENT '分类',
  `filePath` varchar(255) DEFAULT NULL COMMENT '附件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='资讯';

#
# Dumping data for table news
#

INSERT INTO `news` VALUES (1,'dd','<p>\r\n\tff</p>\r\n',NULL,'2015-03-22','admin',0,'service_base',NULL);
INSERT INTO `news` VALUES (2,'test1国家政策国家政策国家政策国家政策国家政策','<p>\r\n\ttest国家政策国家政策国家政策国家政策国家政策国家政策</p>\r\n',NULL,'2015-03-22','admin',0,'policy_regu',NULL);
INSERT INTO `news` VALUES (3,'test1培训课件培训课件培训课件培训课件','<p>\r\n\ttest培训课件培训课件培训课件培训课件培训课件培训课件培训课件培训课件</p>\r\n',NULL,'2015-03-22','admin',0,'train_file','/userfiles/trainFile/1427030251515_c.jpg');
INSERT INTO `news` VALUES (4,'创业环境','<p>\r\n\t<img alt=\"\" src=\"/Hzkjy/userfiles/images/201503311544503d684bb9-f696-4ca3-b532-8499dc3749cc.png\" style=\"width: 445px; height: 346px;\" /><img alt=\"\" src=\"/Hzkjy/userfiles/images/20150331154328f0e96c05-7855-4da1-8b99-e226e098651d.jpg\" style=\"width: 900px; height: 535px;\" /><img alt=\"\" src=\"/Hzkjy/userfiles/images/201503311544040155db70-5cd3-4c13-86ed-b31cc0cec8b1.jpg\" style=\"width: 960px; height: 718px;\" /></p>\r\n',NULL,'2015-03-31','admin',0,'park_envir',NULL);
INSERT INTO `news` VALUES (5,'最新公告最新公告最新公告最新公告最新公告最新公告','<p>\r\n\t最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告</p>\r\n',NULL,'2015-04-08','admin',0,'notice_lastest',NULL);
INSERT INTO `news` VALUES (6,'2最新公告最新公告最新公告最新公告最新公告','<p>\r\n\t最新公告最新公告最新公告最新公告最新公告最新公告最新公告最新公告</p>\r\n',NULL,'2015-04-08','admin',0,'notice_lastest',NULL);
INSERT INTO `news` VALUES (7,'3最新公告最新公告最新公告','<p>\r\n\t3最新公告最新公告最新公告最新公告最新公告最新公告最新公告</p>\r\n',NULL,'2015-04-07','admin',0,'notice_lastest',NULL);
INSERT INTO `news` VALUES (8,'培训通知培训通知培训通知培训通知培训通知培训通知','<p>\r\n\t培训通知培训通知培训通知培训通知培训通知培训通知培训通知</p>\r\n',NULL,'2015-04-08','admin',0,'train_notice',NULL);
INSERT INTO `news` VALUES (9,'2培训通知培训通培训通知知培训通知','<p>\r\n\t2培训通知培训通知培训通知</p>\r\n',NULL,'2015-04-08','admin',0,'train_notice',NULL);
INSERT INTO `news` VALUES (10,'2培训课件培训课件培训课件培训课件','<p>\r\n\t222培训课件培训课件培训课件培训课件培训课件培训课件</p>\r\n',NULL,'2015-04-08','admin',0,'train_file',NULL);
INSERT INTO `news` VALUES (11,'2国家政策国家政策国家政策国家政策国家政策','<p>\r\n\t2国家政策国家政策国家政策国家政策国家政策国家政策国家政策</p>\r\n',NULL,'2015-04-08','admin',0,'policy_regu',NULL);
INSERT INTO `news` VALUES (12,'1省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策省市政策','<p>\r\n\t寺省市政策省市政策省市政策省市政策省市政策</p>\r\n',NULL,'2015-04-08','admin',0,'policy_province',NULL);
INSERT INTO `news` VALUES (13,'33通知通知通通知通知通知通知通知通知通知通知通知通知知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知通知','<p>\r\n\t通知通知通知通知通知通知通知通知通知通知通知通知通知通知</p>\r\n',NULL,'2015-04-08','admin',0,'train_notice',NULL);

#
# Source for table news_advert
#

CREATE TABLE `news_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '广告标题',
  `path` varchar(255) DEFAULT NULL COMMENT '图片存储相对路径',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `linkUrl` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `adType` int(11) NOT NULL DEFAULT '0' COMMENT '广告类型 0首页轮播图 1首页中间位置图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告';

#
# Dumping data for table news_advert
#

INSERT INTO `news_advert` VALUES (1,'广告1','/userfiles/advertFile/1427376871703_banner_index_1.jpg','广告1','2015-03-26 21:34:16',NULL,0);
INSERT INTO `news_advert` VALUES (2,'广告2','/userfiles/advertFile/1427376890656_banner_index_2.jpg','广告2','2015-03-26 21:34:35',NULL,0);
INSERT INTO `news_advert` VALUES (3,'广告3','/userfiles/advertFile/1427376901875_banner_index_3.jpg','广告3','2015-03-26 21:34:46',NULL,0);
INSERT INTO `news_advert` VALUES (4,'广告4','/userfiles/advertFile/1427376912921_banner_index_4.jpg','广告4','2015-03-26 21:34:57',NULL,0);

#
# Source for table news_category
#

CREATE TABLE `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `cateCode` varchar(255) DEFAULT NULL COMMENT '代号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='资讯类型';

#
# Dumping data for table news_category
#

INSERT INTO `news_category` VALUES (1,'组织架构','park_frame','园区风貌');
INSERT INTO `news_category` VALUES (2,'园区介绍','park_intro','园区风貌');
INSERT INTO `news_category` VALUES (3,'园区位置','park_site','园区风貌');
INSERT INTO `news_category` VALUES (4,'创业环境','park_envir','园区风貌');
INSERT INTO `news_category` VALUES (5,'国家政策','policy_regu','政策法规');
INSERT INTO `news_category` VALUES (6,'省市政策','policy_province','政策法规');
INSERT INTO `news_category` VALUES (7,'园区政策','policy_park','政策法规');
INSERT INTO `news_category` VALUES (8,'最新公告','notice_lastest','最新公告');
INSERT INTO `news_category` VALUES (11,'招商信息','service_business','企业服务');
INSERT INTO `news_category` VALUES (19,'入园指南','service_inpark_guide','企业服务');
INSERT INTO `news_category` VALUES (20,'出园指南','service_outpark_guide','企业服务');
INSERT INTO `news_category` VALUES (21,'基础服务','service_base','企业服务');
INSERT INTO `news_category` VALUES (22,'人力资源','service_human','企业服务');
INSERT INTO `news_category` VALUES (23,'项目申报','service_apply','企业服务');
INSERT INTO `news_category` VALUES (24,'入园流程','service_inpark_process','企业服务');
INSERT INTO `news_category` VALUES (25,'出园流程','service_outpark_process','企业服务');
INSERT INTO `news_category` VALUES (26,'培训通知','train_notice','交流培训');
INSERT INTO `news_category` VALUES (27,'培训课件','train_file','交流培训');

#
# Source for table sys_module
#

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

#
# Dumping data for table sys_module
#


INSERT INTO `sys_module` VALUES ('Lev1_01','系统管理',NULL,11,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_02','会员管理',NULL,2,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_03','园区风貌',NULL,6,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_05','公告','',7,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_06','企业服务',NULL,8,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_07','交流培训',NULL,9,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_08','政策法规',NULL,10,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_09','租金管理',NULL,3,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_10','信息管理',NULL,1,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_11','统计报表',NULL,4,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_12','知识产权',NULL,5,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev1_13','页面管理',NULL,12,NULL,1);
INSERT INTO `sys_module` VALUES ('Lev2_01','用户管理','admin/sysUser/list/1.html',1,'Lev1_01',2);
INSERT INTO `sys_module` VALUES ('Lev2_02','角色管理','admin/sysRole/list/1.html',2,'Lev1_01',2);
INSERT INTO `sys_module` VALUES ('Lev2_09','组织架构','admin/news/list/1.html?cateCode=park_frame',2,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_11','创业环境','admin/news/list/1.html?cateCode=park_envir',4,'Lev1_03',2);
INSERT INTO `sys_module` VALUES ('Lev2_14','入园指南','admin/news/list/1.html?cateCode=service_inpark_guide',1,'Lev1_06',2);
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
INSERT INTO `sys_module` VALUES ('Lev2_35','企业租金查询','admin/enterpriseRental/list/1.html',3,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_36','企业缴费审核','admin/rentReview/list/1.html',4,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_37','通知管理','admin/bsNews/list/1.html',1,'Lev1_10',2);
INSERT INTO `sys_module` VALUES ('Lev2_38','经济月报统计','admin/eccIndicator/list/1.html',1,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_39','经济月报设置','admin/chooseSelect/list/1.html',2,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_40','经济月报填报','admin/economicReporting/list/1.html',3,'Lev1_11',2);
INSERT INTO `sys_module` VALUES ('Lev2_41','知识产权统计','admin/memberIntellectualPro/inteProCount.html',1,'Lev1_12',2);
INSERT INTO `sys_module` VALUES ('Lev2_42','科技项目','admin/memberIntellectualPro/list/1.html',2,'Lev1_12',2);
INSERT INTO `sys_module` VALUES ('Lev2_43','专利','admin/memberPatent/list/1.html',3,'Lev1_12',2);
INSERT INTO `sys_module` VALUES ('Lev2_44','信息设置','admin/dbMessage/list/1.html',2,'Lev1_10',2);
INSERT INTO `sys_module` VALUES ('Lev2_45','最新公告','admin/news/list/1.html?cateCode=notice_lastest',1,'Lev1_05',2);
INSERT INTO `sys_module` VALUES ('Lev2_46','入园流程','admin/news/list/1.html?cateCode=service_inpark_process',2,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_47','出园指南','admin/news/list/1.html?cateCode=service_outpark_guide',1,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_48','出园流程','admin/news/list/1.html?cateCode=service_outpark_process',2,'Lev1_06',2);
INSERT INTO `sys_module` VALUES ('Lev2_49','租金统计','admin/rentStatistics/list/1.html',5,'Lev1_09',2);
INSERT INTO `sys_module` VALUES ('Lev2_50','首页广告','admin/newsAdvert/list/1.html',1,'Lev1_13',2);
INSERT INTO `sys_module` VALUES ('Lev2_51','友情链接','admin/newsLink/list/1.html',2,'Lev1_13',2);

#
# Source for table sys_permission
#

CREATE TABLE `sys_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleNo` varchar(50) DEFAULT NULL COMMENT '角色模块id',
  `PermName` varchar(50) DEFAULT NULL,
  `PermValue` varchar(200) DEFAULT NULL COMMENT '权限值',
  `PermType` int(1) DEFAULT '1' COMMENT '0 菜单权限 1 操作权限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='角色模块权限';

#
# Dumping data for table sys_permission
#

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
INSERT INTO `sys_permission` VALUES (31,'Lev2_32','孵化企业填报','fhqytb_list',0);
INSERT INTO `sys_permission` VALUES (32,'Lev2_32','修改资料','fhqytb_updt',1);
INSERT INTO `sys_permission` VALUES (33,'Lev2_32','添加资料','fhqytb_save',1);
INSERT INTO `sys_permission` VALUES (34,'Lev2_32','删除资料','fhqytb_del',1);
INSERT INTO `sys_permission` VALUES (35,'Lev2_33','租金录入','zjlr_list',0);
INSERT INTO `sys_permission` VALUES (36,'Lev2_33','修改租金','zjlr_updt',1);
INSERT INTO `sys_permission` VALUES (37,'Lev2_33','添加租金','zjlr_save',1);
INSERT INTO `sys_permission` VALUES (38,'Lev2_33','删除租金','zjlr_del',1);
INSERT INTO `sys_permission` VALUES (39,'Lev2_34','审核租金','shzj_list',0);
INSERT INTO `sys_permission` VALUES (40,'Lev2_34','审核租金修改','shzj_updt',1);
INSERT INTO `sys_permission` VALUES (41,'Lev2_34','审核租金添加','shzj_save',1);
INSERT INTO `sys_permission` VALUES (42,'Lev2_34','审核租金删除','shzj_del',1);
INSERT INTO `sys_permission` VALUES (43,'Lev2_37','通知管理','tzgl_list',0);
INSERT INTO `sys_permission` VALUES (44,'Lev2_37','通知管理修改','tzgl_updt',1);
INSERT INTO `sys_permission` VALUES (45,'Lev2_37','通知管理添加','tzgl_save',1);
INSERT INTO `sys_permission` VALUES (46,'Lev2_37','通知管理删除','tzgl_del',1);
INSERT INTO `sys_permission` VALUES (47,'Lev2_35','企业租金录入','qyzjlr_list',0);
INSERT INTO `sys_permission` VALUES (48,'Lev2_35','企业租金录入修改','qyzjlr_updt',1);
INSERT INTO `sys_permission` VALUES (49,'Lev2_35','企业租金录入添加','qyzjlr_save',1);
INSERT INTO `sys_permission` VALUES (50,'Lev2_35','企业租金录入删除','qyzjlr_del',1);
INSERT INTO `sys_permission` VALUES (51,'Lev2_36','企业缴费审核','qyjfsh_list',0);
INSERT INTO `sys_permission` VALUES (52,'Lev2_36','企业缴费审核修改','qyjfsh_updt',1);
INSERT INTO `sys_permission` VALUES (53,'Lev2_36','企业缴费审核添加','qyjfsh_save',1);
INSERT INTO `sys_permission` VALUES (54,'Lev2_36','企业缴费审核删除','qyjfsh_del',1);
INSERT INTO `sys_permission` VALUES (55,'Lev2_39','经济月报设置','jjybsz_list',0);
INSERT INTO `sys_permission` VALUES (56,'Lev2_39','经济月报设置修改','jjybsz_updt',1);
INSERT INTO `sys_permission` VALUES (57,'Lev2_39','经济月报设置添加','jjybsz_save',1);
INSERT INTO `sys_permission` VALUES (58,'Lev2_39','经济月报设置删除','jjybsz_del',1);
INSERT INTO `sys_permission` VALUES (59,'Lev2_40','经济月报填报','jjybtb_list',0);
INSERT INTO `sys_permission` VALUES (60,'Lev2_40','经济月报填报修改','jjybtb_updt',1);
INSERT INTO `sys_permission` VALUES (61,'Lev2_40','经济月报填报添加','jjybtb_save',1);
INSERT INTO `sys_permission` VALUES (62,'Lev2_40','经济月报填报删除','jjybtb_del',1);
INSERT INTO `sys_permission` VALUES (63,'Lev2_38','经济月报统计','jjybtj_list',0);
INSERT INTO `sys_permission` VALUES (64,'Lev2_42','科技项目','intel_list',0);
INSERT INTO `sys_permission` VALUES (65,'Lev2_43','专利','patent_list',0);
INSERT INTO `sys_permission` VALUES (66,'Lev2_08','园区介绍','news_list',0);
INSERT INTO `sys_permission` VALUES (67,'Lev2_09','组织架构','news_list',0);
INSERT INTO `sys_permission` VALUES (68,'Lev2_10','园区位置','news_list',0);
INSERT INTO `sys_permission` VALUES (69,'Lev2_11','创业环境','news_list',0);
INSERT INTO `sys_permission` VALUES (70,'Lev2_45','最新公告','news_list',0);
INSERT INTO `sys_permission` VALUES (71,'Lev2_14','入园导向(入园指南)','news_list',0);
INSERT INTO `sys_permission` VALUES (72,'Lev2_46','入园导向(入园流程)','news_list',0);
INSERT INTO `sys_permission` VALUES (73,'Lev2_47','出园导向(出园指南)','news_list',0);
INSERT INTO `sys_permission` VALUES (74,'Lev2_48','出园导向(出园流程)','news_list',0);
INSERT INTO `sys_permission` VALUES (75,'Lev2_16','基础服务','news_list',0);
INSERT INTO `sys_permission` VALUES (76,'Lev2_17','人力资源','news_list',0);
INSERT INTO `sys_permission` VALUES (77,'Lev2_18','项目申报','news_list',0);
INSERT INTO `sys_permission` VALUES (78,'Lev2_20','招商信息','news_list',0);
INSERT INTO `sys_permission` VALUES (81,'Lev2_22','培训通知','news_list',0);
INSERT INTO `sys_permission` VALUES (82,'Lev2_23','培训课件','news_list',0);
INSERT INTO `sys_permission` VALUES (83,'Lev2_24','国家政策','news_list',0);
INSERT INTO `sys_permission` VALUES (84,'Lev2_25','省市政策','news_list',0);
INSERT INTO `sys_permission` VALUES (85,'Lev2_26','园区政策','news_list',0);
INSERT INTO `sys_permission` VALUES (86,'Lev2_40','经济月报填报审核','jjybtj_sh',1);
INSERT INTO `sys_permission` VALUES (87,'Lev2_40','经济月报填报退回','jjybtb_th',1);
INSERT INTO `sys_permission` VALUES (88,'Lev2_40','经济月报填报通过','jjybtb_tg',1);
INSERT INTO `sys_permission` VALUES (89,'Lev2_40','经济月报填报不通过','jjybtb_btg',1);

#
# Source for table sys_role
#

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
  KEY `fk_role_modifier` (`Modifier`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='角色表';

#
# Dumping data for table sys_role
#

INSERT INTO `sys_role` VALUES (16,'admin','admin','','admin','2015-01-22 20:15:42','admin','2015-01-22 20:15:42');
INSERT INTO `sys_role` VALUES (17,'admin1','admin1','','admin','2015-03-04 14:29:30','admin','2015-03-04 14:29:40');

#
# Source for table sys_role_permission
#

CREATE TABLE `sys_role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleNo` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `PermId` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色模块（中间表）';

#
# Dumping data for table sys_role_permission
#


#
# Source for table sys_user
#

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
  `MailSeq` varchar(255) DEFAULT NULL COMMENT '邮箱序列',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uni_user_UserNo` (`UserNo`),
  KEY `fk_user_creater` (`Creater`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Dumping data for table sys_user
#

INSERT INTO `sys_user` VALUES (1,'admin','4297f44b13955235245b2497399d7a93','administrator',1,'123@qq.com',NULL,'1591000000',NULL,1,'2014-05-28','admin','');
INSERT INTO `sys_user` VALUES (2,'440100001','21218cca77804d2ba1922c33e0151105','440100001',1,'303386015@qq.com','8321024','15813366410','123456',1,'2015-03-04 14:30:47','admin','');

#
# Source for table sys_user_role
#

CREATE TABLE `sys_user_role` (
  `UserNo` varchar(50) NOT NULL,
  `RoleNo` varchar(50) NOT NULL,
  PRIMARY KEY (`UserNo`,`RoleNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色（中间表）';

#
# Dumping data for table sys_user_role
#


CREATE TABLE `news_link` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL COMMENT '名称',
  `UrlLink` varchar(255) DEFAULT NULL COMMENT '链接地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

#
# Dumping data for table news_link
#

INSERT INTO `news_link` VALUES (1,'海珠区科信局','http://www.baidu.com');
INSERT INTO `news_link` VALUES (2,'广州市科信局','http://www.baidu.com');
INSERT INTO `news_link` VALUES (3,'广州市发改局','http://www.baidu.com');
INSERT INTO `news_link` VALUES (4,'广州经贸网','http://www.baidu.com');
INSERT INTO `news_link` VALUES (5,'广东省科技厅','http://www.baidu.com');
INSERT INTO `news_link` VALUES (7,'广州市中小企业信息网','http://www.baidu.com');
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

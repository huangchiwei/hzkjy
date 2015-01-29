/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : hzkjy

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-01-29 09:06:00
*/

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

-- ----------------------------
-- Table structure for `sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
;

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
;

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
;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('16', 'superadmin', 'admin', '', 'admin', '2015-01-22 20:15:42', 'admin', '2015-01-22 20:15:42');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '4297f44b13955235245b2497399d7a93', 'administrator', '1', '123@qq.com', null, '1591000000', null, '1', '2014-05-28 00:00:00', 'admin');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

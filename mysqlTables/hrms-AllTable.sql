/*
Navicat MySQL Data Transfer

Source Server         : hello
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : hrms

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2018-12-24 16:07:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `approveinfo`
-- ----------------------------
DROP TABLE IF EXISTS `approveinfo`;
CREATE TABLE `approveinfo` (
  `approveno` int(10) NOT NULL AUTO_INCREMENT,
  `infono` int(10) NOT NULL,
  `userno` int(10) NOT NULL,
  `approtime` varchar(100) NOT NULL,
  `checkstatus` varchar(100) NOT NULL,
  `infostatus` varchar(100) NOT NULL,
  `approdesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`approveno`),
  UNIQUE KEY `approveno` (`approveno`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approveinfo
-- ----------------------------
INSERT INTO `approveinfo` VALUES ('100', '5', '5', '2018-12-18 15:46:19', '起草', '试用期', '起草完了哟');
INSERT INTO `approveinfo` VALUES ('200', '6', '3', '2018-12-21 08:39:56', '审核通过', '试用期', '完事');
INSERT INTO `approveinfo` VALUES ('300', '6', '3', '2018-12-21 13:17:38', '变更', '正式员工', '待审');
INSERT INTO `approveinfo` VALUES ('301', '6', '3', '2018-12-21 17:22:38', '审核通过', '正式员工', '完事啦啦啦');
INSERT INTO `approveinfo` VALUES ('302', '6', '3', '2018-12-22 12:31:57', '审核通过', '正式员工', '完事啦');
INSERT INTO `approveinfo` VALUES ('303', '6', '3', '2018-12-22 12:37:14', '审核通过', '正式员工', '完事');
INSERT INTO `approveinfo` VALUES ('308', '6', '3', '2018-12-22 13:42:40', '审核通过', '正式员工', '完毕');
INSERT INTO `approveinfo` VALUES ('310', '102', '5', '2018-12-22 16:42:32', '修改', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('311', '102', '5', '2018-12-22 16:49:14', '修改', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('312', '102', '5', '2018-12-22 16:51:50', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('313', '102', '3', '2018-12-22 16:54:33', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('314', '102', '3', '2018-12-22 16:57:15', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('315', '102', '3', '2018-12-22 17:00:50', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('316', '102', '3', '2018-12-22 17:01:49', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('317', '102', '3', '2018-12-22 17:05:34', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('318', '102', '3', '2018-12-22 17:19:05', '变更', '试用期', '轻狂少年');
INSERT INTO `approveinfo` VALUES ('319', '6', '3', '2018-12-22 17:22:15', '删除', '试用期', '谋杀关羽');
INSERT INTO `approveinfo` VALUES ('320', '5', '3', '2018-12-23 13:39:29', '驳回', '正式员工', '不合格，改一下');
INSERT INTO `approveinfo` VALUES ('321', '107', '2', '2018-12-23 14:31:01', '起草', '正式员工', '过了');
INSERT INTO `approveinfo` VALUES ('322', '106', '2', '2018-12-23 14:35:093509', '起草', '正式员工', '过了，入档');
INSERT INTO `approveinfo` VALUES ('323', '105', '2', '2018-12-23 14:41:354135', '起草', '正式员工', '过了，入档');
INSERT INTO `approveinfo` VALUES ('324', '103', '2', '2018-12-23 14:51:135113', '审核通过', '正式员工', '过了');
INSERT INTO `approveinfo` VALUES ('325', '104', '2', '2018-12-23 14:51:515151', '审核通过', '正式员工', '过了，入档');
INSERT INTO `approveinfo` VALUES ('326', '102', '2', '2018-12-23 14:52:155215', '审核通过', '试用期', '过了');
INSERT INTO `approveinfo` VALUES ('327', '6', '2', '2018-12-23 14:52:305230', '删除审核中', '试用期', '谋杀关羽');
INSERT INTO `approveinfo` VALUES ('328', '107', '5', '2018-12-23 14:55:425542', '修改', '正式员工', '薪酬办的专员档案起草');
INSERT INTO `approveinfo` VALUES ('329', '102', '5', '2018-12-23 14:57:165716', '变更', '正式员工', '转正变更');
INSERT INTO `approveinfo` VALUES ('330', '102', '3', '2018-12-23 15:00:080008', '审核中', '正式员工', '可以');
INSERT INTO `approveinfo` VALUES ('331', '107', '3', '2018-12-23 15:00:350035', '审核通过', '正式员工', '过了，入档');
INSERT INTO `approveinfo` VALUES ('332', '6', '3', '2018-12-23 15:01:110111', '删除', '试用期', '谋杀关羽');
INSERT INTO `approveinfo` VALUES ('333', '102', '2', '2018-12-23 15:02:330233', '审核通过', '正式员工', '过了，入档');
INSERT INTO `approveinfo` VALUES ('334', '6', '2', '2018-12-23 15:03:070307', '删除审核中', '试用期', '过了');
INSERT INTO `approveinfo` VALUES ('335', '6', '1', '2018-12-23 15:04:450445', '驳回', '试用期', '再修改一下');
INSERT INTO `approveinfo` VALUES ('336', '102', '3', '2018-12-23 15:15:511551', '变更', '正式员工', '工资调档');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptno` int(10) NOT NULL AUTO_INCREMENT,
  `dsname` varchar(100) DEFAULT NULL,
  `daname` varchar(100) DEFAULT NULL,
  `supdept` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `dremark` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`deptno`),
  KEY `dsname` (`dsname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '总裁办', '总裁办', '-1', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('2', '人力资源部', '人资部', '1', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('3', '人事办公室', '人事办', '2', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('4', '薪酬办公室', '薪酬办', '2', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('5', '财务管理部', '财务部', '1', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('6', '市场营销部', '市场部', '1', '总部大楼A1', '暂无', '启用');
INSERT INTO `dept` VALUES ('7', '技术研发部', '研发部', '1', '总部大楼A1', '暂无', '启用');

-- ----------------------------
-- Table structure for `element`
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `eleid` int(11) NOT NULL AUTO_INCREMENT,
  `elename` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('1', '薪资审核', '/salstand/toAuditStand');

-- ----------------------------
-- Table structure for `information`
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `infono` int(10) NOT NULL AUTO_INCREMENT,
  `infoname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `idcard` varchar(100) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  `infostatus` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `homeaddress` varchar(100) DEFAULT NULL,
  `professional` varchar(100) DEFAULT NULL,
  `politics` varchar(100) DEFAULT NULL,
  `bank` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `bankno` varchar(100) DEFAULT NULL,
  `infotime` varchar(100) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  `inforemark` varchar(255) DEFAULT NULL,
  `infofile` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `posno` int(10) DEFAULT NULL,
  `deptno` int(10) DEFAULT NULL,
  `ptname` varchar(100) DEFAULT NULL,
  `ptno` int(10) DEFAULT NULL,
  `invalidtime` int(10) DEFAULT NULL,
  `dsname` varchar(100) DEFAULT NULL,
  `checkstatus` varchar(100) DEFAULT NULL,
  `userno` int(10) DEFAULT NULL,
  PRIMARY KEY (`infono`),
  KEY `fk_info_posno` (`posno`),
  KEY `fk_info_deptno` (`deptno`),
  KEY `fk_info_ptno` (`ptno`),
  KEY `fk_info_uname` (`uname`),
  CONSTRAINT `fk_info_deptno` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`),
  CONSTRAINT `fk_info_posno` FOREIGN KEY (`posno`) REFERENCES `position` (`posno`),
  CONSTRAINT `fk_info_ptno` FOREIGN KEY (`ptno`) REFERENCES `ptitle` (`ptno`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='人事表';

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('4', '关羽', '12313@121', '山西运城', '12313123123', '山西大学', '山西医院', '正式员工', '男', '123123123123', '农村', '军事', '群众', '工商银行', 'guanping', '硕士', '12312312312312', '2016-10-10', '履历', '备注', 'c://', 'D:/upload/photo/gui-mikai.jpg', '人事主任', '2', '3', '高级人力专家', '1', '10', '人事办', '审核通过', '5');
INSERT INTO `information` VALUES ('6', '吕蒙', '11321@12', '江苏省', '213123123132', '江苏大学', '1231312313', '试用期', '男', '18101284496', '连云港', '市场营销', '党员', '123131231', 'gaoqi', '博士后', '213213123', '2018-12-20 ', '白衣渡江', '谋杀关羽', 'D:/upload/resume/新建文本文档.txt', 'D:/upload/photo/jietu-3.jpg', '市场专员', '9', '6', '初级市场专员', '6', '10', '市场营销部', '驳回', '1');
INSERT INTO `information` VALUES ('102', '关兴', '12313@123', '湖北省', '12313123', '上海大学', '123132131312', '正式员工', '男', '18101284496', 'h湖北省黄冈市', '心理学', '群众', '12313213', 'guanyu', '硕士', '1231321313', '2018-12-23', '履历很深，', '工资调档', 'D:/upload/resume/简历.txt', 'D:/upload/photo/gui-3.jpg', '薪酬专员', '5', '4', '高级注册会计师', '2', '3', '薪酬办公室', '变更', '3');
INSERT INTO `information` VALUES ('103', '高淇', '1231231313@qq.com', '北京市', '123131231313', '诺丁汉大学', '12313123123123', '正式员工', '男', '18101284496', '北京市西三旗', '计算机', '党员', '中国银行', 'liubei', '博士后', '123131231313123', '2018-12-23', '成功企业家', '专员不在，我来起草高总的档案', 'D:/upload/resume/gaoqi.txt', 'D:/upload/photo/gui-leo.jpg', '执行总裁', '200', '1', '高级人力专家', '1', '10', '总裁办', '审核通过', '2');
INSERT INTO `information` VALUES ('104', '刘备', '1231231313@qq.com', '中山国', '1233333333333', '南加大', '1231313123', '正式员工', '男', '18101284496', '中山国', '织席贩履', '群众', '中国银行', 'liubei', '博士', '1231321321231', '2018-12-23', '中山靖王之后，汉室宗亲，街头卖鞋', '专员不在，刘总档案由我起草', 'D:/upload/resume/liubei.txt', 'D:/upload/photo/gui-raph.jpg', '人力资源经理', '1', '2', '高级人力专家', '1', '10', '人力资源部', '审核通过', '2');
INSERT INTO `information` VALUES ('105', '张飞', '12313131@qq.com', '河北涿郡', '123123123', '斯坦福大学', '1231231231', '正式员工', '男', '18101284496', '河北保定市', '杀猪', '群众', '建设银行', 'liubei', '硕士', '123123123', '2018-12-23', '杀猪屠狗', '专员不在，我来起草', 'D:/upload/resume/zhangfei.txt', 'D:/upload/photo/gui-dona.jpg', '薪酬主任', '3', '4', '高级人力专家', '1', '10', '薪酬办公室', '审核通过', '2');
INSERT INTO `information` VALUES ('106', '关平', '1231313213@qq.com', '荆州', '123123123123123', '皇家理工', '123123132131', '正式员工', '男', '18101284496', '湖北省黄冈市', '人事管理', '团员', '建设银行', 'liubei', '硕士', '12312313123', '2018-12-23', '年少顽劣，随父从军', '人事专员起草', 'D:/upload/resume/guanping.txt', 'D:/upload/photo/wa-first.jpg', '人事专员', '4', '3', '初级人力专员', '5', '10', '人事办公室', '审核通过', '2');
INSERT INTO `information` VALUES ('107', '张苞', '12313131@qq.com', '四川', '213131231231231', '安普顿社会', '131231231313213', '正式员工', '男', '18101284496', '四川成都', '财会', '团员', '农业银行', 'guanyu', '博士', '123132131231', '2018-12-23', '英雄出少年', '薪酬办的专员档案起草', 'C:\\fakepath\\zhangbao.txt', 'D:/upload/photo/wa-2.jpg', '薪酬专员', '5', '4', '初级注册会计师', '6', '5', '薪酬办公室', '审核通过', '3');
INSERT INTO `information` VALUES ('1000', '张苞', '12313131@qq.com', '四川', '213131231231231', '安普顿社会', '131231231313213', '正式员工', '男', '18101284496', '四川成都', '财会', '团员', '农业银行', 'guanyu', '博士', '123132131231', '2018-12-23', '英雄出少年', '薪酬办的专员档案起草', 'C:\\fakepath\\zhangbao.txt', 'D:/upload/photo/wa-2.jpg', '薪酬专员', '5', '4', '初级注册会计师', '6', '5', '薪酬办公室', '审核通过', '3');
INSERT INTO `information` VALUES ('1001', '张苞', '12313131@qq.com', '四川', '213131231231231', '安普顿社会', '131231231313213', '正式员工', '男', '18101284496', '四川成都', '财会', '团员', '农业银行', 'guanyu', '博士', '123132131231', '2018-12-23', '英雄出少年', '薪酬办的专员档案起草', 'C:\\fakepath\\zhangbao.txt', 'D:/upload/photo/wa-2.jpg', '薪酬专员', '5', '4', '初级注册会计师', '6', '5', '薪酬办公室', '审核通过', '3');
INSERT INTO `information` VALUES ('1002', '张苞', '12313131@qq.com', '四川', '213131231231231', '安普顿社会', '131231231313213', '正式员工', '男', '18101284496', '四川成都', '财会', '团员', '农业银行', 'guanyu', '博士', '123132131231', '2018-12-23', '英雄出少年', '薪酬办的专员档案起草', 'C:\\fakepath\\zhangbao.txt', 'D:/upload/photo/wa-2.jpg', '薪酬专员', '5', '4', '初级注册会计师', '6', '5', '薪酬办公室', '审核通过', '3');
INSERT INTO `information` VALUES ('1003', '张苞', '12313131@qq.com', '四川', '213131231231231', '安普顿社会', '131231231313213', '正式员工', '男', '18101284496', '四川成都', '财会', '团员', '农业银行', 'guanyu', '博士', '123132131231', '2018-12-23', '英雄出少年', '薪酬办的专员档案起草', 'C:\\fakepath\\zhangbao.txt', 'D:/upload/photo/wa-2.jpg', '薪酬专员', '5', '4', '初级注册会计师', '6', '5', '薪酬办公室', '审核通过', '3');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `lasttime` varchar(255) DEFAULT NULL,
  `logip` varchar(255) DEFAULT NULL,
  `logname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `fk_login_logname` (`logname`),
  CONSTRAINT `fk_login_logname` FOREIGN KEY (`logname`) REFERENCES `users` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', '2018-11-10 16:48:44', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('2', '2018-09-10 20:58:54', '0:0:0:0:0:0:0:1', 'guanping');
INSERT INTO `login` VALUES ('3', '2016-11-29 20:58:54', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('4', '2018-12-20 20:58:54', '0:0:0:0:0:0:0:1', 'zhangfei');
INSERT INTO `login` VALUES ('5', '2018-12-20 20:58:54', '0:0:0:0:0:0:0:1', 'liubei');
INSERT INTO `login` VALUES ('6', '2018-12-20 21:09:12', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('7', '2018-12-20 21:23:48', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('8', '2018-12-20 21:50:07', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('9', '2018-12-20 21:52:22', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('10', '2018-12-21 09:31:45', '0:0:0:0:0:0:0:1', 'guanping');
INSERT INTO `login` VALUES ('11', '2018-12-21 09:43:48', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('12', '2018-12-21 10:51:13', '0:0:0:0:0:0:0:1', 'gaoqi');
INSERT INTO `login` VALUES ('13', '2018-12-21 10:52:53', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('14', '2018-12-21 10:58:45', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('15', '2018-12-21 11:02:25', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('16', '2018-12-21 12:38:23', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('17', '2018-12-21 13:20:28', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('18', '2018-12-21 13:24:57', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('19', '2018-12-21 13:27:03', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('20', '2018-12-21 13:35:48', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('21', '2018-12-21 13:41:26', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('22', '2018-12-21 13:46:16', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('23', '2018-12-21 14:08:55', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('24', '2018-12-21 14:10:46', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('25', '2018-12-21 14:21:58', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('26', '2018-12-21 15:26:15', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('27', '2018-12-21 20:16:35', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('28', '2018-12-21 20:19:13', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('29', '2018-12-21 21:02:05', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('30', '2018-12-21 21:24:34', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('31', '2018-12-22 08:56:21', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('32', '2018-12-22 09:51:05', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('33', '2018-12-22 09:52:50', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('34', '2018-12-22 10:20:05', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('35', '2018-12-22 10:23:41', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('36', '2018-12-22 10:28:26', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('37', '2018-12-22 10:29:41', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('38', '2018-12-22 10:35:18', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('39', '2018-12-22 10:38:02', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('40', '2018-12-22 10:48:45', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('41', '2018-12-22 10:49:55', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('42', '2018-12-22 10:54:43', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('43', '2018-12-22 11:06:32', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('44', '2018-12-22 11:12:05', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('45', '2018-12-22 11:20:59', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('46', '2018-12-22 17:07:28', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('47', '2018-12-22 17:08:05', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('48', '2018-12-22 17:12:03', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('49', '2018-12-22 17:15:17', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('50', '2018-12-22 17:15:32', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('51', '2018-12-22 17:26:56', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('52', '2018-12-22 18:26:24', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('53', '2018-12-22 18:26:41', '0:0:0:0:0:0:0:1', 'guanping');
INSERT INTO `login` VALUES ('54', '2018-12-22 18:27:00', '0:0:0:0:0:0:0:1', 'zhangfei');
INSERT INTO `login` VALUES ('55', '2018-12-22 18:27:19', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('56', '2018-12-22 18:27:36', '0:0:0:0:0:0:0:1', 'liubei');
INSERT INTO `login` VALUES ('57', '2018-12-22 18:28:58', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('58', '2018-12-22 18:54:22', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('59', '2018-12-22 18:55:02', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('60', '2018-12-22 18:56:19', '0:0:0:0:0:0:0:1', 'liubei');
INSERT INTO `login` VALUES ('61', '2018-12-22 19:34:07', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('62', '2018-12-23 16:29:42', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('63', '2018-12-24 09:27:34', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('64', '2018-12-24 09:54:31', '0:0:0:0:0:0:0:1', 'zhangfei');
INSERT INTO `login` VALUES ('65', '2018-12-24 10:15:07', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('66', '2018-12-24 10:17:40', '0:0:0:0:0:0:0:1', 'zhangbao');
INSERT INTO `login` VALUES ('67', '2018-12-24 10:23:38', '0:0:0:0:0:0:0:1', 'zhangfei');
INSERT INTO `login` VALUES ('68', '2018-12-24 11:25:05', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('69', '2018-12-24 12:31:31', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('70', '2018-12-24 14:17:30', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('71', '2018-12-24 14:40:25', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('72', '2018-12-24 15:11:10', '0:0:0:0:0:0:0:1', 'guanyu');
INSERT INTO `login` VALUES ('73', '2018-12-24 15:32:36', '0:0:0:0:0:0:0:1', 'liubei');
INSERT INTO `login` VALUES ('74', '2018-12-24 15:41:23', '0:0:0:0:0:0:0:1', 'liubei');
INSERT INTO `login` VALUES ('75', '2018-12-24 15:55:14', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('76', '2018-12-24 15:56:32', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('77', '2018-12-24 15:56:45', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('78', '2018-12-24 16:00:24', '0:0:0:0:0:0:0:1', 'admin');
INSERT INTO `login` VALUES ('79', '2018-12-24 16:05:46', '0:0:0:0:0:0:0:1', 'admin');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(100) DEFAULT NULL,
  `fatherid` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '组织架构', '0', null);
INSERT INTO `menu` VALUES ('2', '薪酬管理', '0', null);
INSERT INTO `menu` VALUES ('3', '人事管理', '0', null);
INSERT INTO `menu` VALUES ('4', '招聘管理', '0', null);
INSERT INTO `menu` VALUES ('5', '数据分析', '0', null);
INSERT INTO `menu` VALUES ('6', '系统管理', '0', null);
INSERT INTO `menu` VALUES ('11', '用户管理', '1', '/users/findUsers\r\n');
INSERT INTO `menu` VALUES ('12', '岗位管理', '1', '/position/findAll');
INSERT INTO `menu` VALUES ('21', '薪酬标准管理', '2', '/salstand/findAllSalstand');
INSERT INTO `menu` VALUES ('31', '人事档案管理', '3', '/info/findByTime?currnav=1');
INSERT INTO `menu` VALUES ('32', '我的审批', '3', '/info/findMyApproveinfo');
INSERT INTO `menu` VALUES ('41', '招聘发布', '4', '/rec/findSomeRec');
INSERT INTO `menu` VALUES ('42', '招聘列表', '4', '/rec/findAllRec');
INSERT INTO `menu` VALUES ('51', '岗位工资占比图', '5', '/salMaxPieChart');
INSERT INTO `menu` VALUES ('52', '招聘人员比例图', '5', '/recEcharts');
INSERT INTO `menu` VALUES ('53', '最高薪资柱状图', '5', '/salMaxBarChart');
INSERT INTO `menu` VALUES ('54', '档案分布柱状图', '5', '/chartsPieByDept');
INSERT INTO `menu` VALUES ('61', '日志管理', '6', '/log/logListByPage');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `posno` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `ptype` varchar(100) DEFAULT NULL,
  `pdesc` varchar(100) DEFAULT NULL,
  `premark` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `deptno` int(10) DEFAULT NULL,
  PRIMARY KEY (`posno`,`pname`),
  UNIQUE KEY `pname` (`pname`) USING BTREE,
  KEY `fk_position_deptno` (`deptno`),
  KEY `ptype` (`ptype`),
  KEY `posno` (`posno`),
  CONSTRAINT `fk_position_deptno` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '人力资源经理', '行政', '暂无', '人力资源部负责人', '启用', '2');
INSERT INTO `position` VALUES ('2', '人事主任', '行政', '暂无', '人事办公室主任', '启用', '2');
INSERT INTO `position` VALUES ('3', '薪酬主任', '行政', '暂无', '薪酬办公室主任', '启用', '2');
INSERT INTO `position` VALUES ('4', '人事专员', '行政', '暂无', '人事办公室专员', '启用', '2');
INSERT INTO `position` VALUES ('5', '薪酬专员', '行政', '暂无', '薪酬办公室专员', '启用', '2');
INSERT INTO `position` VALUES ('6', '财务经理', '财务', '暂无', '财务部经理', '启用', '5');
INSERT INTO `position` VALUES ('7', '财务专员', '财务', '暂无', '财务部专员', '启用', '5');
INSERT INTO `position` VALUES ('8', '市场经理', '市场', '暂无', '市场部经理', '启用', '6');
INSERT INTO `position` VALUES ('9', '市场专员', '市场', '暂无', '市场部专员', '启用', '6');
INSERT INTO `position` VALUES ('10', '研发经理', '技术', '暂无', '研发部经理', '启用', '7');
INSERT INTO `position` VALUES ('11', '研发专员', '技术', '暂无', '研发部专员', '启用', '7');
INSERT INTO `position` VALUES ('100', '超级管理员', null, null, '超级管理员', '启用', null);
INSERT INTO `position` VALUES ('200', '执行总裁', '行政', '暂无', '总裁', '启用', '1');

-- ----------------------------
-- Table structure for `ptitle`
-- ----------------------------
DROP TABLE IF EXISTS `ptitle`;
CREATE TABLE `ptitle` (
  `ptno` int(10) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(100) DEFAULT NULL,
  `ptremark` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `deptno` int(10) DEFAULT NULL,
  PRIMARY KEY (`ptno`),
  KEY `fk_pitile_deptno` (`deptno`),
  CONSTRAINT `fk_pitile_deptno` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='职称表ptitle';

-- ----------------------------
-- Records of ptitle
-- ----------------------------
INSERT INTO `ptitle` VALUES ('1', '高级人力专家', '高级人力', '启用', '2');
INSERT INTO `ptitle` VALUES ('2', '高级注册会计师', '高级注会', '启用', '5');
INSERT INTO `ptitle` VALUES ('3', '高级市场专家', '高级市场', '启用', '6');
INSERT INTO `ptitle` VALUES ('4', '高级研发工程师', '高级研发', '启用', '7');
INSERT INTO `ptitle` VALUES ('5', '初级人力专员', '初级人力', '启用', '2');
INSERT INTO `ptitle` VALUES ('6', '初级注册会计师', '初级注会', '启用', '5');
INSERT INTO `ptitle` VALUES ('7', '初级市场专员', '初级市场', '启用', '6');
INSERT INTO `ptitle` VALUES ('8', '初级研发工程师', '初级工程师', '启用', '7');

-- ----------------------------
-- Table structure for `recruitment`
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `recno` int(10) NOT NULL AUTO_INCREMENT COMMENT '招聘编号',
  `rectype` varchar(100) DEFAULT NULL COMMENT '招聘方式（校招，社招）',
  `dsname` varchar(100) DEFAULT NULL,
  `recnum` int(10) DEFAULT NULL COMMENT '招聘人数',
  `pname` varchar(100) DEFAULT NULL COMMENT '招聘岗位名称',
  `posno` int(10) DEFAULT NULL COMMENT '岗位编号',
  `postype` varchar(100) DEFAULT NULL COMMENT '招聘类型（行政，财务，技术，市场）',
  `uname` varchar(100) DEFAULT NULL COMMENT '登记人',
  `rectime` varchar(100) DEFAULT NULL COMMENT '登记时间',
  `recdesc` varchar(100) DEFAULT NULL COMMENT '招聘描述',
  `requirement` varchar(100) DEFAULT NULL COMMENT '招聘要求',
  `endtime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`recno`),
  KEY `fk_rec_posno` (`posno`),
  KEY `fk_rec_ptype` (`postype`),
  KEY `fk_rec_uname` (`uname`),
  KEY `fk_rec_pname` (`pname`),
  KEY `fk_rec_dsname` (`dsname`),
  CONSTRAINT `fk_rec_dsname` FOREIGN KEY (`dsname`) REFERENCES `dept` (`dsname`),
  CONSTRAINT `fk_rec_pname` FOREIGN KEY (`pname`) REFERENCES `position` (`pname`),
  CONSTRAINT `fk_rec_posno` FOREIGN KEY (`posno`) REFERENCES `position` (`posno`),
  CONSTRAINT `fk_rec_ptype` FOREIGN KEY (`postype`) REFERENCES `position` (`ptype`),
  CONSTRAINT `fk_rec_uname` FOREIGN KEY (`uname`) REFERENCES `users` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='recruitment招聘管理表';

-- ----------------------------
-- Records of recruitment
-- ----------------------------
INSERT INTO `recruitment` VALUES ('1', '校招', '市场营销部', '5', '市场专员', '7', '市场', 'guanping', '2018-12-11', '招聘市场专员', '学历要求：大专以上', '2018-12-20');
INSERT INTO `recruitment` VALUES ('2', '校招', '技术研发部', '10', '研发专员', '11', '技术', 'guanping', '2018-12-24', '招聘技术研发专员初级工程师，待遇优厚', '招聘技术研发专员初级工程师，待遇优厚', '2018-12-28');
INSERT INTO `recruitment` VALUES ('3', '', '薪酬办公室', '2', '薪酬专员', '5', '行政', 'admin', '2018-12-24', '招聘薪酬管理专员，待遇优厚！欢迎投递简历', '招聘薪酬管理专员，待遇优厚！欢迎投递简历', '2018-12-24');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rolid` int(11) NOT NULL AUTO_INCREMENT,
  `rolname` varchar(100) DEFAULT NULL,
  `posno` int(100) DEFAULT NULL,
  PRIMARY KEY (`rolid`),
  KEY `fk_role_posno` (`posno`),
  CONSTRAINT `fk_role_posno` FOREIGN KEY (`posno`) REFERENCES `position` (`posno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '人力管理负责人', '1');
INSERT INTO `role` VALUES ('2', '人事办主任', '2');
INSERT INTO `role` VALUES ('3', '薪酬办主任', '3');
INSERT INTO `role` VALUES ('4', '人事专员', '4');
INSERT INTO `role` VALUES ('5', '薪酬专员', '5');
INSERT INTO `role` VALUES ('6', '超级管理员', '100');

-- ----------------------------
-- Table structure for `role-menu`
-- ----------------------------
DROP TABLE IF EXISTS `role-menu`;
CREATE TABLE `role-menu` (
  `rolid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`rolid`,`menuid`),
  KEY `pk_rolmenu_menuid` (`menuid`),
  CONSTRAINT `pk_rolmenu_menuid` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`),
  CONSTRAINT `pk_rolmenu_rid` FOREIGN KEY (`rolid`) REFERENCES `role` (`rolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role-menu
-- ----------------------------
INSERT INTO `role-menu` VALUES ('1', '1');
INSERT INTO `role-menu` VALUES ('6', '1');
INSERT INTO `role-menu` VALUES ('1', '2');
INSERT INTO `role-menu` VALUES ('3', '2');
INSERT INTO `role-menu` VALUES ('5', '2');
INSERT INTO `role-menu` VALUES ('6', '2');
INSERT INTO `role-menu` VALUES ('1', '3');
INSERT INTO `role-menu` VALUES ('2', '3');
INSERT INTO `role-menu` VALUES ('4', '3');
INSERT INTO `role-menu` VALUES ('6', '3');
INSERT INTO `role-menu` VALUES ('1', '4');
INSERT INTO `role-menu` VALUES ('2', '4');
INSERT INTO `role-menu` VALUES ('4', '4');
INSERT INTO `role-menu` VALUES ('6', '4');
INSERT INTO `role-menu` VALUES ('1', '5');
INSERT INTO `role-menu` VALUES ('2', '5');
INSERT INTO `role-menu` VALUES ('3', '5');
INSERT INTO `role-menu` VALUES ('4', '5');
INSERT INTO `role-menu` VALUES ('6', '5');
INSERT INTO `role-menu` VALUES ('6', '6');
INSERT INTO `role-menu` VALUES ('1', '11');
INSERT INTO `role-menu` VALUES ('6', '11');
INSERT INTO `role-menu` VALUES ('1', '12');
INSERT INTO `role-menu` VALUES ('6', '12');
INSERT INTO `role-menu` VALUES ('1', '21');
INSERT INTO `role-menu` VALUES ('3', '21');
INSERT INTO `role-menu` VALUES ('5', '21');
INSERT INTO `role-menu` VALUES ('6', '21');
INSERT INTO `role-menu` VALUES ('1', '31');
INSERT INTO `role-menu` VALUES ('2', '31');
INSERT INTO `role-menu` VALUES ('4', '31');
INSERT INTO `role-menu` VALUES ('6', '31');
INSERT INTO `role-menu` VALUES ('1', '32');
INSERT INTO `role-menu` VALUES ('2', '32');
INSERT INTO `role-menu` VALUES ('6', '32');
INSERT INTO `role-menu` VALUES ('1', '41');
INSERT INTO `role-menu` VALUES ('2', '41');
INSERT INTO `role-menu` VALUES ('4', '41');
INSERT INTO `role-menu` VALUES ('6', '41');
INSERT INTO `role-menu` VALUES ('1', '42');
INSERT INTO `role-menu` VALUES ('2', '42');
INSERT INTO `role-menu` VALUES ('4', '42');
INSERT INTO `role-menu` VALUES ('6', '42');
INSERT INTO `role-menu` VALUES ('1', '51');
INSERT INTO `role-menu` VALUES ('3', '51');
INSERT INTO `role-menu` VALUES ('6', '51');
INSERT INTO `role-menu` VALUES ('1', '52');
INSERT INTO `role-menu` VALUES ('2', '52');
INSERT INTO `role-menu` VALUES ('4', '52');
INSERT INTO `role-menu` VALUES ('6', '52');
INSERT INTO `role-menu` VALUES ('1', '53');
INSERT INTO `role-menu` VALUES ('3', '53');
INSERT INTO `role-menu` VALUES ('6', '53');
INSERT INTO `role-menu` VALUES ('1', '54');
INSERT INTO `role-menu` VALUES ('2', '54');
INSERT INTO `role-menu` VALUES ('4', '54');
INSERT INTO `role-menu` VALUES ('6', '54');
INSERT INTO `role-menu` VALUES ('6', '61');

-- ----------------------------
-- Table structure for `role_element`
-- ----------------------------
DROP TABLE IF EXISTS `role_element`;
CREATE TABLE `role_element` (
  `rolid` int(20) NOT NULL,
  `eleid` int(20) NOT NULL,
  PRIMARY KEY (`rolid`,`eleid`),
  KEY `pk_roleEle_eleid` (`eleid`),
  CONSTRAINT `pk_roleEle_eleid` FOREIGN KEY (`eleid`) REFERENCES `element` (`eleid`),
  CONSTRAINT `pk_roleEle_rolid` FOREIGN KEY (`rolid`) REFERENCES `role` (`rolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_element
-- ----------------------------
INSERT INTO `role_element` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `salstandard`
-- ----------------------------
DROP TABLE IF EXISTS `salstandard`;
CREATE TABLE `salstandard` (
  `standno` int(10) NOT NULL AUTO_INCREMENT,
  `standname` varchar(100) DEFAULT NULL,
  `standsum` double(8,2) DEFAULT NULL,
  `creatno` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `standtime` varchar(100) DEFAULT NULL,
  `salupdate` varchar(100) DEFAULT NULL,
  `salaudit` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `salitemno` int(10) DEFAULT NULL,
  PRIMARY KEY (`standno`),
  KEY `fk_salstand_creatno` (`creatno`),
  KEY `fk_salstand_uname` (`uname`),
  KEY `fk_salstand_itemno` (`salitemno`),
  CONSTRAINT `fk_salstand_creatno` FOREIGN KEY (`creatno`) REFERENCES `users` (`uname`),
  CONSTRAINT `fk_salstand_itemno` FOREIGN KEY (`salitemno`) REFERENCES `salstandarditem` (`salitemno`),
  CONSTRAINT `fk_salstand_uname` FOREIGN KEY (`uname`) REFERENCES `users` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='薪酬标准表';

-- ----------------------------
-- Records of salstandard
-- ----------------------------
INSERT INTO `salstandard` VALUES ('1', '高级人力专家', '5300.00', 'zhangfei', 'zhangbao', '2018-12-11', '基础工资欠妥', '驳回', null, '1');
INSERT INTO `salstandard` VALUES ('2', '初级人力专员', '6000.00', 'zhangfei', 'zhangbao', '2018-12-16', null, '审核中', null, '2');
INSERT INTO `salstandard` VALUES ('3', '初级注册会计师', '7000.00', 'zhangfei', 'zhangbao', '2018-10-11', '', '审核中', '', '4');
INSERT INTO `salstandard` VALUES ('4', '初级注册会计师', '5000.00', 'zhangfei', 'zhangbao', '2016-01-01', '', '审核中', '', '5');
INSERT INTO `salstandard` VALUES ('5', '初级注册会计师', '4000.00', 'zhangfei', 'zhangbao', '2018-11-01', '', '审核中', '', '6');
INSERT INTO `salstandard` VALUES ('6', '高级人力专家', '5200.00', 'zhangfei', 'zhangbao', '2018-12-19', null, '驳回', null, '8');
INSERT INTO `salstandard` VALUES ('8', '高级研发工程师', '16000.00', 'zhangfei', 'zhangbao', '2018-12-19', '工资太低', '驳回', null, '10');
INSERT INTO `salstandard` VALUES ('10', '初级注册会计师', '6600.00', 'zhangfei', 'zhangbao', '2018-12-19', '可以批准', '通过', null, '12');
INSERT INTO `salstandard` VALUES ('12', '高级市场专家', '14100.00', 'zhangfei', 'zhangbao', '2018-12-19', null, '起草', null, '14');
INSERT INTO `salstandard` VALUES ('13', '初级研发工程师', '1000.00', 'zhangfei', 'zhangbao', '2018-12-19', null, '起草', null, '15');
INSERT INTO `salstandard` VALUES ('18', '高级研发工程师', '17300.00', 'zhangfei', 'zhangbao', '2018-12-19', null, '审核中', null, '20');
INSERT INTO `salstandard` VALUES ('19', '高级注册会计师', '31000.00', 'zhangfei', 'zhangbao', '2018-12-19', '', '驳回', null, '21');
INSERT INTO `salstandard` VALUES ('20', '高级市场专家', '7500.00', 'zhangfei', 'admin', '2018-12-20', null, '审核中', null, '22');
INSERT INTO `salstandard` VALUES ('21', '初级人力专员', '5400.00', 'zhangfei', 'admin', '2018-12-20', '', '驳回', null, '23');
INSERT INTO `salstandard` VALUES ('22', '初级注册会计师', '7100.00', 'zhangfei', 'admin', '2018-12-20', '差不多', '通过', null, '24');
INSERT INTO `salstandard` VALUES ('28', '高级人力专家', '12900.00', 'zhangfei', 'admin', '2018-12-23', '', '通过', null, '30');
INSERT INTO `salstandard` VALUES ('29', '初级研发工程师', '7400.00', 'zhangfei', 'zhangfei', '2018-12-24', '', '通过', null, '31');
INSERT INTO `salstandard` VALUES ('45', '高级人力专家', '5855.00', 'zhangfei', 'zhangbao', '2018-12-24', '', '通过', null, '47');

-- ----------------------------
-- Table structure for `salstandarditem`
-- ----------------------------
DROP TABLE IF EXISTS `salstandarditem`;
CREATE TABLE `salstandarditem` (
  `salitemno` int(10) NOT NULL AUTO_INCREMENT,
  `base` double(8,2) DEFAULT NULL,
  `comm` double(8,2) DEFAULT NULL,
  `traffic` double(8,2) DEFAULT NULL,
  `mobile` double(8,2) DEFAULT NULL,
  `eat` double(8,2) DEFAULT NULL,
  `house` double(8,2) DEFAULT NULL,
  `travel` double(8,2) DEFAULT NULL,
  `overwork` double(8,2) DEFAULT NULL,
  `subtract` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`salitemno`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='薪酬标准明细表';

-- ----------------------------
-- Records of salstandarditem
-- ----------------------------
INSERT INTO `salstandarditem` VALUES ('1', '3800.00', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '900.00', null);
INSERT INTO `salstandarditem` VALUES ('2', '3000.00', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', null);
INSERT INTO `salstandarditem` VALUES ('4', '4000.00', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500.00', null);
INSERT INTO `salstandarditem` VALUES ('5', '2000.00', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500.00', null);
INSERT INTO `salstandarditem` VALUES ('6', '2000.00', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '500.00', null);
INSERT INTO `salstandarditem` VALUES ('7', '4000.00', '300.00', '300.00', '100.00', '100.00', '100.00', '100.00', '100.00', null);
INSERT INTO `salstandarditem` VALUES ('8', '5000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '200.00', '0.00', null);
INSERT INTO `salstandarditem` VALUES ('10', '12000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '3000.00', '1000.00', null);
INSERT INTO `salstandarditem` VALUES ('12', '4200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '1400.00', null);
INSERT INTO `salstandarditem` VALUES ('14', '8000.00', '4000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', '100.00', null);
INSERT INTO `salstandarditem` VALUES ('15', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null);
INSERT INTO `salstandarditem` VALUES ('20', '17000.00', '200.00', '0.00', '0.00', '0.00', '0.00', '100.00', '0.00', null);
INSERT INTO `salstandarditem` VALUES ('21', '18000.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', '1000.00', null);
INSERT INTO `salstandarditem` VALUES ('22', '1400.00', '5000.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '100.00', null);
INSERT INTO `salstandarditem` VALUES ('23', '3000.00', '200.00', '0.00', '0.00', '0.00', '0.00', '200.00', '2000.00', null);
INSERT INTO `salstandarditem` VALUES ('24', '4000.00', '2000.00', '0.00', '0.00', '0.00', '0.00', '100.00', '1000.00', null);
INSERT INTO `salstandarditem` VALUES ('30', '5900.00', '5000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', '0.00', null);
INSERT INTO `salstandarditem` VALUES ('31', '5000.00', '0.00', '0.00', '0.00', '400.00', '0.00', '2000.00', '0.00', null);
INSERT INTO `salstandarditem` VALUES ('47', '5555.00', '0.00', '0.00', '0.00', '0.00', '0.00', '300.00', '0.00', null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userno` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `posno` int(10) DEFAULT NULL,
  `deptno` int(10) DEFAULT NULL,
  `userdesc` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `superno` int(10) DEFAULT NULL,
  PRIMARY KEY (`userno`,`uname`),
  UNIQUE KEY `uname` (`uname`) USING BTREE,
  KEY `fk_users_posno` (`posno`),
  KEY `fk_users_deptno` (`deptno`),
  CONSTRAINT `fk_users_deptno` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`),
  CONSTRAINT `fk_users_posno` FOREIGN KEY (`posno`) REFERENCES `position` (`posno`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='用户表emp';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'gaoqi', '123', '888888', '200', '1', '总裁', '高淇', '-1');
INSERT INTO `users` VALUES ('2', 'liubei', '123', '888888', '1', '2', '人力经理', '刘备', '1');
INSERT INTO `users` VALUES ('3', 'guanyu', '123', '888888', '2', '3', '人事主任', '关羽', '2');
INSERT INTO `users` VALUES ('4', 'zhangfei', '123', '888888', '3', '4', '薪酬主任', '张飞', '2');
INSERT INTO `users` VALUES ('5', 'guanping', '123', '888888', '4', '3', '人事专员', '关平', '3');
INSERT INTO `users` VALUES ('6', 'zhangbao', '123', '888888', '5', '4', '薪酬专员', '张苞', '4');
INSERT INTO `users` VALUES ('100', 'admin', '123', '888888', '100', null, '管理员', 'admin', '-1');
INSERT INTO `users` VALUES ('101', 'zzxx', 'zzz123123', '13333333333', '5', '4', '薪酬专员', 'xiaozhou', '2');

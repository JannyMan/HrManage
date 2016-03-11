drop database if exists hrm;
create database hrm ;
use hrm;



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_cj`
-- ----------------------------
DROP TABLE IF EXISTS tb_cj;
CREATE TABLE tb_cj (
  cj_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  cj_title varchar(30) NOT NULL,
  cj_type varchar(30) NOT NULL,
  cj_content varchar(100) DEFAULT NULL,
  cj_money decimal(10,0) DEFAULT NULL,
  cj_time datetime DEFAULT NULL,
  PRIMARY KEY (cj_id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cj
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_department`
-- ----------------------------
DROP TABLE IF EXISTS tb_department;
CREATE TABLE tb_department (
  dt_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  dt_creatTime datetime NOT NULL,
  dt_name varchar(50) NOT NULL,
  dt_bz varchar(200) DEFAULT NULL,
  PRIMARY KEY (dt_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_employee`
-- ----------------------------
DROP TABLE IF EXISTS tb_employee;
CREATE TABLE tb_employee (
  em_serialNumber int(11) unsigned NOT NULL AUTO_INCREMENT,
  em_id int(11) NOT NULL,
  em_name varchar(30) NOT NULL,
  em_sex varchar(4) NOT NULL,
  em_age int(11) DEFAULT NULL,
  em_IDCard varchar(18) NOT NULL,
  em_bz varchar(50) DEFAULT NULL,
  em_createName varchar(30) DEFAULT NULL,
  em_createTime datetime DEFAULT NULL,
  em_typeWork varchar(30) DEFAULT NULL,
  em_dt_id int(11) unsigned NOT NULL,
  em_startime datetime DEFAULT NULL,
  em_culture varchar(30) DEFAULT NULL,
  em_speciality varchar(30) DEFAULT NULL,
  em_afterSchool varchar(50) DEFAULT NULL,
  em_address varchar(50) DEFAULT NULL,
  em_tel varchar(30) DEFAULT NULL,
  em_ancestralHome varchar(30) DEFAULT NULL,
  em_visage varchar(30) DEFAULT NULL,
  em_marriage varchar(4) DEFAULT NULL,
  em_nation varchar(50) DEFAULT NULL,
  em_born varchar(50) DEFAULT NULL,
  PRIMARY KEY (em_serialNumber),
  KEY fk_em_dt_id (em_dt_id),
  CONSTRAINT fk_em_dt_id FOREIGN KEY (em_dt_id) REFERENCES tb_department (dt_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_invitejob`
-- ----------------------------
DROP TABLE IF EXISTS tb_invitejob;
CREATE TABLE tb_invitejob(
  ij_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  ij_name varchar(30) NOT NULL,
  ij_sex varchar(4) NOT NULL,
  ij_age int(11) DEFAULT NULL,
  ij_born date DEFAULT NULL,
  ij_isstock tinyint(4) DEFAULT NULL,
  ij_content varchar(100) DEFAULT NULL,
  ij_createtime datetime DEFAULT NULL,
  ij_address varchar(30) DEFAULT NULL,
  ij_tel varchar(30) DEFAULT NULL,
  ij_afterSchool varchar(30) DEFAULT NULL,
  ij_teachSchool varchar(30) DEFAULT NULL,
  ij_experience varchar(30) DEFAULT NULL,
  ij_specialty varchar(30) DEFAULT NULL,
  ij_job varchar(30) DEFAULT NULL,
  PRIMARY KEY (ij_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_invitejob
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_manager`
-- ----------------------------
DROP TABLE IF EXISTS tb_manager;
CREATE TABLE tb_manager (
  mg_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  mg_account varchar(30) NOT NULL,
  mg_pwd varchar(30) DEFAULT NULL,
  mg_managerLevel varchar(30) DEFAULT NULL,
  PRIMARY KEY (mg_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------


------------------------------
-- Table structure for `tb_pay`
------------------------------
DROP TABLE IF EXISTS tb_pay;
CREATE TABLE tb_pay (
  pay_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  pay_em_serialNumber int(11) unsigned NOT NULL,
  pay_emName varchar(30) DEFAULT NULL,
  pay_month date DEFAULT NULL,
  pay_baseMoney decimal(6,2) DEFAULT NULL,
  pay_overtime time DEFAULT NULL,
  pay_safety varchar(20) DEFAULT NULL,
  pay_absent varchar(20) DEFAULT NULL,
  pay_check varchar(20) DEFAULT NULL,
  pay_age int(11) DEFAULT NULL,
  PRIMARY KEY (pay_id),
  KEY fk_pay_em_serialNumber (pay_em_serialNumber),
  CONSTRAINT fk_pay_em_serialNumber FOREIGN KEY (pay_em_serialNumber) REFERENCES tb_employee (em_serialNumber)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_train`
-- ----------------------------
DROP TABLE IF EXISTS tb_train;
CREATE TABLE tb_train (
  tn_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  tn_man varchar(30) NOT NULL,
  tn_content varchar(50) DEFAULT NULL,
  tn_time datetime DEFAULT NULL,
  tn_address varchar(30) DEFAULT NULL,
  tn_join varchar(20) DEFAULT NULL,
  tn_bz varchar(100) DEFAULT NULL,
  PRIMARY KEY (tn_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_train
-- ----------------------------


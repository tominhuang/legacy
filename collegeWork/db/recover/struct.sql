-- MySQL dump 10.9
--
-- Host: localhost    Database: hems
-- ------------------------------------------------------
-- Server version	4.1.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 
-- Table structure for table `bbs`
--  

DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `id` int(4) NOT NULL auto_increment,
  `date` date NOT NULL default '2005-01-01',
  `word` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Table structure for table `class`
--  

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Class_ID` mediumint(5) unsigned NOT NULL default '0',
  `Department` varchar(60) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Year` int(1) unsigned NOT NULL default '0',
  `Class_AB` varchar(4) character set utf8 collate utf8_unicode_ci default NULL,
  `Class_Type` varchar(20) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`Class_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `class`
--  

/*!40000 ALTER TABLE `class` DISABLE KEYS */;
LOCK TABLES `class` WRITE;
INSERT INTO `class` VALUES (10111,'中國文學系',1,'甲班','大學部'),(10112,'中國文學系',1,'乙班','大學部'),(10311,'歷史學系',1,NULL,'大學部'),(10411,'哲學系',1,NULL,'大學部'),(20211,'政治學系',1,NULL,'大學部'),(20411,'社會學系',1,NULL,'大學部'),(20511,'財政學系',1,'甲班','大學部'),(20512,'財政學系',1,'乙班','大學部'),(20611,'公共行政學系',1,NULL,'大學部'),(20713,'地政學系土地管理組',1,NULL,'大學部'),(20714,'地政學系土地資源規劃組',1,NULL,'大學部'),(20715,'地政學系土地測量與資訊組',1,NULL,'大學部'),(20811,'經濟學系',1,'甲班','大學部'),(20812,'經濟學系',1,'乙班','大學部'),(20911,'民族學系',1,NULL,'大學部'),(30111,'國際貿易學系',1,'甲班','大學部'),(30112,'國際貿易學系',1,'乙班','大學部'),(30211,'金融學系',1,NULL,'大學部'),(30311,'會計學系',1,'甲班','大學部'),(30312,'會計學系',1,'乙班','大學部'),(30411,'統計學系',1,NULL,'大學部'),(30511,'企業管理學系',1,'甲班','大學部'),(30512,'企業管理學系',1,'乙班','大學部'),(30611,'資訊管理學系',1,'甲班','大學部'),(30612,'資訊管理學系',1,'乙班','大學部'),(30711,'財務管理學系',1,NULL,'大學部'),(30811,'風險管理與保險學系',1,NULL,'大學部'),(40111,'新聞學系',1,'甲班','大學部'),(40112,'新聞學系',1,'乙班','大學部'),(40211,'廣告學系',1,NULL,'大學部'),(40311,'廣播電視學系',1,NULL,'大學部'),(50111,'英國語文學系',1,'甲班','大學部'),(50112,'英國語文學系',1,'乙班','大學部'),(50211,'阿拉伯語文學系',1,NULL,'大學部'),(50411,'俄國語文學系',1,'甲班','大學部'),(50412,'俄國語文學系',1,'乙班','大學部'),(50611,'日本語文學系',1,NULL,'大學部'),(50711,'韓國語文學系',1,NULL,'大學部'),(50811,'土耳其語文學系',1,NULL,'大學部'),(60111,'法律學系法學組',1,NULL,'大學部'),(60112,'法律學系財經法組',1,NULL,'大學部'),(60113,'法律學系法制組',1,NULL,'大學部'),(70111,'應用數學系',1,NULL,'大學部'),(70211,'心理學系',1,NULL,'大學部'),(70311,'資訊科學系',1,NULL,'大學部'),(20311,'外交學系',1,NULL,'大學部'),(10212,'教育學系國小師資組',1,NULL,'大學部'),(10213,'教育學系中學師資組',1,NULL,'大學部'),(10121,'中國文學系',2,'甲班','大學部'),(10122,'中國文學系',2,'乙班','大學部'),(10321,'歷史學系',2,NULL,'大學部'),(10421,'哲學系',2,NULL,'大學部'),(20221,'政治學系',2,NULL,'大學部'),(20421,'社會學系',2,NULL,'大學部'),(20521,'財政學系',2,'甲班','大學部'),(20522,'財政學系',2,'乙班','大學部'),(20621,'公共行政學系',2,NULL,'大學部'),(20723,'地政學系土地管理組',2,NULL,'大學部'),(20724,'地政學系土地資源規劃組',2,NULL,'大學部'),(20725,'地政學系土地測量與資訊組',2,NULL,'大學部'),(20821,'經濟學系',2,'甲班','大學部'),(20822,'經濟學系',2,'乙班','大學部'),(20921,'民族學系',2,NULL,'大學部'),(30121,'國際貿易學系',2,'甲班','大學部'),(30122,'國際貿易學系',2,'乙班','大學部'),(30221,'金融學系',2,NULL,'大學部'),(30321,'會計學系',2,'甲班','大學部'),(30322,'會計學系',2,'乙班','大學部'),(30421,'統計學系',2,NULL,'大學部'),(30521,'企業管理學系',2,'甲班','大學部'),(30522,'企業管理學系',2,'乙班','大學部'),(30621,'資訊管理學系',2,'甲班','大學部'),(30622,'資訊管理學系',2,'乙班','大學部'),(30721,'財務管理學系',2,NULL,'大學部'),(30821,'風險管理與保險學系',2,NULL,'大學部'),(40121,'新聞學系',2,'甲班','大學部'),(40122,'新聞學系',2,'乙班','大學部'),(40221,'廣告學系',2,NULL,'大學部'),(40321,'廣播電視學系',2,NULL,'大學部'),(50121,'英國語文學系',2,'甲班','大學部'),(50122,'英國語文學系',2,'乙班','大學部'),(50221,'阿拉伯語文學系',2,NULL,'大學部'),(50421,'俄國語文學系',2,'甲班','大學部'),(50422,'俄國語文學系',2,'乙班','大學部'),(50621,'日本語文學系',2,NULL,'大學部'),(50721,'韓國語文學系',2,NULL,'大學部'),(50821,'土耳其語文學系',2,NULL,'大學部'),(60121,'法律學系法學組',2,NULL,'大學部'),(60122,'法律學系財經法組',2,NULL,'大學部'),(60123,'法律學系法制組',2,NULL,'大學部'),(70121,'應用數學系',2,NULL,'大學部'),(70221,'心理學系',2,NULL,'大學部'),(70321,'資訊科學系',2,NULL,'大學部'),(20321,'外交學系',2,NULL,'大學部'),(10222,'教育學系國小師資組',2,NULL,'大學部'),(10223,'教育學系中學師資組',2,NULL,'大學部'),(10131,'中國文學系',3,'甲班','大學部'),(10132,'中國文學系',3,'乙班','大學部'),(10331,'歷史學系',3,NULL,'大學部'),(10431,'哲學系',3,NULL,'大學部'),(20231,'政治學系',3,NULL,'大學部'),(20431,'社會學系',3,NULL,'大學部'),(20531,'財政學系',3,'甲班','大學部'),(20532,'財政學系',3,'乙班','大學部'),(20631,'公共行政學系',3,NULL,'大學部'),(20733,'地政學系土地管理組',3,NULL,'大學部'),(20734,'地政學系土地資源規劃組',3,NULL,'大學部'),(20735,'地政學系土地測量與資訊組',3,NULL,'大學部'),(20831,'經濟學系',3,'甲班','大學部'),(20832,'經濟學系',3,'乙班','大學部'),(20931,'民族學系',3,NULL,'大學部'),(30131,'國際貿易學系',3,'甲班','大學部'),(30132,'國際貿易學系',3,'乙班','大學部'),(30231,'金融學系',3,NULL,'大學部'),(30331,'會計學系',3,'甲班','大學部'),(30332,'會計學系',3,'乙班','大學部'),(30431,'統計學系',3,NULL,'大學部'),(30531,'企業管理學系',3,'甲班','大學部'),(30532,'企業管理學系',3,'乙班','大學部'),(30631,'資訊管理學系',3,'甲班','大學部'),(30632,'資訊管理學系',3,'乙班','大學部'),(30731,'財務管理學系',3,NULL,'大學部'),(30831,'風險管理與保險學系',3,NULL,'大學部'),(40131,'新聞學系',3,'甲班','大學部'),(40132,'新聞學系',3,'乙班','大學部'),(40231,'廣告學系',3,NULL,'大學部'),(40331,'廣播電視學系',3,NULL,'大學部'),(50131,'英國語文學系',3,'甲班','大學部'),(50132,'英國語文學系',3,'乙班','大學部'),(50231,'阿拉伯語文學系',3,NULL,'大學部'),(50431,'俄國語文學系',3,'甲班','大學部'),(50432,'俄國語文學系',3,'乙班','大學部'),(50631,'日本語文學系',3,NULL,'大學部'),(50731,'韓國語文學系',3,NULL,'大學部'),(50831,'土耳其語文學系',3,NULL,'大學部'),(60131,'法律學系法學組',3,NULL,'大學部'),(60132,'法律學系財經法組',3,NULL,'大學部'),(60133,'法律學系法制組',3,NULL,'大學部'),(70131,'應用數學系',3,NULL,'大學部'),(70231,'心理學系',3,NULL,'大學部'),(70331,'資訊科學系',3,NULL,'大學部'),(20331,'外交學系',3,NULL,'大學部'),(10232,'教育學系國小師資組',3,NULL,'大學部'),(10233,'教育學系中學師資組',3,NULL,'大學部'),(10141,'中國文學系',4,'甲班','大學部'),(10142,'中國文學系',4,'乙班','大學部'),(10341,'歷史學系',4,NULL,'大學部'),(10441,'哲學系',4,NULL,'大學部'),(20241,'政治學系',4,NULL,'大學部'),(20441,'社會學系',4,NULL,'大學部'),(20541,'財政學系',4,'甲班','大學部'),(20542,'財政學系',4,'乙班','大學部'),(20641,'公共行政學系',4,NULL,'大學部'),(20743,'地政學系土地管理組',4,NULL,'大學部'),(20744,'地政學系土地資源規劃組',4,NULL,'大學部'),(20745,'地政學系土地測量與資訊組',4,NULL,'大學部'),(20841,'經濟學系',4,'甲班','大學部'),(20842,'經濟學系',4,'乙班','大學部'),(20941,'民族學系',4,NULL,'大學部'),(30141,'國際貿易學系',4,'甲班','大學部'),(30142,'國際貿易學系',4,'乙班','大學部'),(30241,'金融學系',4,NULL,'大學部'),(30341,'會計學系',4,'甲班','大學部'),(30342,'會計學系',4,'乙班','大學部'),(30441,'統計學系',4,NULL,'大學部'),(30541,'企業管理學系',4,'甲班','大學部'),(30542,'企業管理學系',4,'乙班','大學部'),(30641,'資訊管理學系',4,'甲班','大學部'),(30642,'資訊管理學系',4,'乙班','大學部'),(30741,'財務管理學系',4,NULL,'大學部'),(30841,'風險管理與保險學系',4,NULL,'大學部'),(40141,'新聞學系',4,'甲班','大學部'),(40142,'新聞學系',4,'乙班','大學部'),(40241,'廣告學系',4,NULL,'大學部'),(40341,'廣播電視學系',4,NULL,'大學部'),(50141,'英國語文學系',4,'甲班','大學部'),(50142,'英國語文學系',4,'乙班','大學部'),(50241,'阿拉伯語文學系',4,NULL,'大學部'),(50441,'俄國語文學系',4,'甲班','大學部'),(50442,'俄國語文學系',4,'乙班','大學部'),(50641,'日本語文學系',4,NULL,'大學部'),(50741,'韓國語文學系',4,NULL,'大學部'),(50841,'土耳其語文學系',4,NULL,'大學部'),(60141,'法律學系法學組',4,NULL,'大學部'),(60142,'法律學系財經法組',4,NULL,'大學部'),(60143,'法律學系法制組',4,NULL,'大學部'),(70141,'應用數學系',4,NULL,'大學部'),(70241,'心理學系',4,NULL,'大學部'),(70341,'資訊科學系',4,NULL,'大學部'),(20341,'外交學系',4,NULL,'大學部'),(10242,'教育學系國小師資組',4,NULL,'大學部'),(10243,'教育學系中學師資組',4,NULL,'大學部');
UNLOCK TABLES;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;

-- 
-- Table structure for table `disease`
--  

DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `Disease_ID` smallint(3) unsigned NOT NULL default '0',
  `Disease_Name` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`Disease_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `disease`
--  


/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
LOCK TABLES `disease` WRITE;
INSERT INTO `disease` VALUES (1,'肺結核'),(2,'心臟病'),(3,'肝炎'),(4,'氣喘'),(5,'腎臟病'),(6,'癲癇'),(7,'紅斑性狼瘡'),(8,'血友病'),(9,'蠶豆症'),(10,'關節炎'),(11,'糖尿病'),(12,'其他');
UNLOCK TABLES;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;

-- 
-- Table structure for table `exam`
--  

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `HER_ID` int(10) unsigned NOT NULL default '0',
  `Item_ID` smallint(4) unsigned NOT NULL default '0',
  `Exam_Result` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Abnormal` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`HER_ID`,`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


-- 
-- Table structure for table `her`
--  

DROP TABLE IF EXISTS `her`;
CREATE TABLE `her` (
  `HER_ID` int(10) unsigned NOT NULL auto_increment,
  `Stu_ID` int(9) unsigned NOT NULL default '0',
  `Exam_Date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`HER_ID`),
  UNIQUE KEY `Stu_ID` (`Stu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


-- 
-- Table structure for table `item`
--  

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `Item_ID` smallint(4) unsigned NOT NULL default '0',
  `Item_Cname` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Item_Ename` varchar(50) character set utf8 collate utf8_unicode_ci default NULL,
  `Reference` varchar(50) character set utf8 collate utf8_unicode_ci default NULL,
  `Unit` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  `Item_Type` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `item`
--  


/*!40000 ALTER TABLE `item` DISABLE KEYS */;
LOCK TABLES `item` WRITE;
INSERT INTO `item` VALUES (1,'身高','Height',NULL,'cm','一般檢查'),(2,'體重','Weight',NULL,'kg','一般檢查'),(3,'收縮壓','Systolic Pressure','160以下','mmHg','一般檢查'),(4,'舒張壓','Diastolic Pressure','90以下','mmHg','一般檢查'),(5,'祼視左眼視力','Naked Eye Left','0.6以上',NULL,'一般檢查'),(6,'祼視右眼視力','Naked Eye Right','0.6以上',NULL,'一般檢查'),(7,'矯正左眼視力','Corrected Left','0.6以上',NULL,'一般檢查'),(8,'矯正右眼視力','Corrected Right','0.6以上',NULL,'一般檢查'),(9,'左眼近視度數',NULL,NULL,NULL,'一般檢查'),(10,'右眼近視度數',NULL,NULL,NULL,'一般檢查'),(11,'辨色力','Color Blindness','無異樣',NULL,'一般檢查'),(12,'聽力','Hearing Test','無異樣',NULL,'一般檢查'),(18,'酸鹼值','PH','5.0-8.0',NULL,'尿液檢查'),(19,'尿膽素原','Urobili','正常',NULL,'尿液檢查'),(20,'膽紅素','Bili','陰性反應',NULL,'尿液檢查'),(21,'潛血','O.B.','陰性反應',NULL,'尿液檢查'),(22,'亞硝酸鹽','Nitr','陰性反應',NULL,'尿液檢查'),(23,'白血球酯脢','Leuco','陰性反應',NULL,'尿液檢查'),(24,'紅血球','RBC','男:380-600/女:380-550','1000000/uL','血液檢查'),(25,'血紅素','Hb','男:12-18/女:11.5-18','g/dL','血液檢查'),(26,'血球容積比','Ht','男:36-50/女:34-47',NULL,'血液檢查'),(27,'平均血球體積','Mct','80-102',NULL,'血液檢查'),(28,'平均血球血紅素','MCH','27-34','Pg','血液檢查'),(29,'平均血球血紅素濃度','MCHC','32-36','G/dL','血液檢查'),(30,'白血球','WBC','4000-10000','/uL','血液檢查'),(31,'血小板','PL','15-45','1000000/uL','血液檢查'),(32,'血清麩酸草酸轉胺脢','SGOT','5-40','U/L','肝功能檢查'),(33,'血清麩酸丙酮酸轉胺脢','SGPT','5-40','U/L','肝功能檢查'),(34,'B型肝炎表面抗原','HBsAg','陰性反應',NULL,'B型肝炎檢查'),(35,'B型肝炎表面抗體','HBsAb','陽性反應',NULL,'B型肝炎檢查'),(36,'血尿素氮','BUN','8-23','mg/dL','腎功能檢查'),(37,'肌酸酐','Cre','0.6-1.4','mg/dL','腎功能檢查'),(38,'尿酸','UA','2-8','mg/dL','腎功能檢查'),(39,'總膽固醇','T-CHOL','130-200','mg/dL','血脂肪檢查'),(40,'胸部X光檢查','Chest Radiograph','無異樣',NULL,'理學檢查'),(41,'脈搏','Pulsation','60-90','下','其他檢查'),(42,'總膽色素','Tdb','0.5-1.2',NULL,'其他檢查');
UNLOCK TABLES;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 
-- Table structure for table `register`
--  

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `HER_ID` int(10) unsigned NOT NULL default '0',
  `Disease_ID` smallint(3) unsigned NOT NULL default '0',
  `Reg_Date` date NOT NULL default '0000-00-00',
  `Description` text character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`HER_ID`,`Disease_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Stu_ID` int(9) unsigned NOT NULL default '0',
  `Class_ID` mediumint(5) unsigned NOT NULL default '0',
  `Name` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Sex` varchar(2) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Bdate` date default NULL,
  `IDCard` varchar(10) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Address` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  `Phone` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  `Cellphone` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  `Email` varchar(80) character set utf8 collate utf8_unicode_ci default NULL,
  `Trans` tinyint(1) NOT NULL default '0',
  `Studying` varchar(10) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `ECP_Name` varchar(40) character set utf8 collate utf8_unicode_ci default NULL,
  `ECP_Relation` varchar(10) character set utf8 collate utf8_unicode_ci default NULL,
  `ECP_Phone` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  `ECP_Cellphone` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`Stu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Table structure for table `tr`
--  

DROP TABLE IF EXISTS `tr`;
CREATE TABLE `tr` (
  `TR_ID` int(10) unsigned NOT NULL auto_increment,
  `Stu_ID` int(9) unsigned NOT NULL default '0',
  `Treat_Date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`TR_ID`),
  UNIQUE KEY `Stu_ID` (`Stu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `tr`
--  


/*!40000 ALTER TABLE `tr` DISABLE KEYS */;
LOCK TABLES `tr` WRITE;
INSERT INTO `tr` VALUES (1,92101105,'2005-07-10'),(2,92101103,'2005-07-11'),(3,92112233,'2005-07-09');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tr` ENABLE KEYS */;

-- 
-- Table structure for table `treat`
--  

DROP TABLE IF EXISTS `treat`;
CREATE TABLE `treat` (
  `TR_ID` int(10) unsigned NOT NULL default '0',
  `Item_ID` smallint(4) unsigned NOT NULL default '0',
  `Treat_Before` text character set utf8 collate utf8_unicode_ci,
  `Treat_After` text character set utf8 collate utf8_unicode_ci,
  `Treat_Finish` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`TR_ID`,`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


-- 
-- Table structure for table `user`
--  

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(15) collate latin1_general_ci NOT NULL default '',
  `password` varchar(15) collate latin1_general_ci NOT NULL default '',
  `rank` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `user`
--  


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('admin','1234',9),('student','1234',1),('exam','1234',2),('treat','1234',3),('disease','1234',4),('statistic','1234',5),('demo','demo',9),('disable','cheater',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
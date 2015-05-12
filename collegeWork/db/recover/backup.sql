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
  `date` date NOT NULL default '0000-00-00',
  `word` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bbs`
--


/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
LOCK TABLES `bbs` WRITE;
INSERT INTO `bbs` VALUES (1,'2005-07-05','修正新增健檢資料的Referential Integrity　初步完成訊息區（使用Servlet）'),(2,'2005-07-06','完成訊息區　修改超難寫的　最後寫得很漂亮喔　<(▔︶▔)>　初步完成安全機制'),(21,'2005-07-07','完成安全機制　加強防呆措施'),(22,'2005-07-08','將Scriptlet改寫為JSTL　健檢資料項目新增為42項　並改由程式判斷是否異常'),(23,'2005-07-09','新增排序功能　完成健檢查詢全部、單項查詢'),(24,'2005-07-10','Debug老半天　原來是我欄位名稱有改過　程式裡沒改　Servlet好笨哦　不會幫我檢查SQL語法'),(25,'2005-07-11','完成異常明細查詢（學生資料、健檢資料告一段落了~^^)　完成新增、修改矯治記錄'),(26,'2005-07-12','完成查詢矯治記錄（矯治記錄完成）完成特殊疾病記錄'),(27,'2005-07-13','加強排序功能　簡化原始碼　畫面美工　完成班級資料設定'),(28,'2005-07-14','完成刪除資料、資料備份（系統作業完成）'),(31,'2005-07-16','不小心把剛寫好的近視分析弄丟了　我快哭了>__<　只好重寫了　完成統計分析　只剩系統說明了'),(30,'2005-07-15','完成系統說明配置、BMI 計算'),(32,'2005-07-16','新增「資料還原」功能　這樣做備份才比較有意義嘛　被註解搞得一個頭二個大　不過已經解決了');
UNLOCK TABLES;
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;

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
-- Dumping data for table `exam`
--


/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
LOCK TABLES `exam` WRITE;
INSERT INTO `exam` VALUES (1,3,'170',0),(1,4,'80',0),(1,5,'0.7',0),(1,6,'1.0',0),(1,11,'無異樣',0),(1,20,'陰性反應',0),(1,21,'陰性反應',0),(1,23,'陰性反應',0),(1,25,'15',0),(1,26,'44',0),(2,42,'1',0),(2,41,'70',0),(2,12,'無異樣',0),(2,11,'無異樣',0),(2,10,'500',0),(2,9,'500',0),(2,8,'1.2',0),(2,7,'1.2',0),(2,6,'0.3',0),(2,5,'0.3',0),(2,4,'75',0),(2,3,'146',0),(2,2,'50',0),(2,1,'156',0),(21,21,'陰性反應',0),(21,20,'陰性反應',0),(21,19,'正常',0),(21,12,'無異樣',0),(21,11,'無異樣',0),(21,8,'1.0',0),(21,7,'1.0',0),(21,6,'0.5',0),(21,5,'1.0',0),(21,4,'88',0),(21,3,'150',0),(21,2,'60',0),(21,1,'180',0),(22,8,'1.0',0),(22,11,'無異樣',0),(22,12,'無異樣',0),(22,19,'正常',0),(22,20,'陰性反應',0),(22,21,'陰性反應',0),(22,22,'陰性反應',0),(23,1,'180',0),(23,2,'60',0),(23,3,'150',0),(23,4,'88',0),(23,5,'0.3',0),(23,6,'0.5',0),(23,7,'1.0',0),(23,8,'1.0',0),(23,11,'無異樣',0),(23,12,'無異樣',0),(23,19,'正常',0),(23,20,'陰性反應',0),(23,21,'陰性反應',0),(23,22,'陰性反應',0),(23,23,'陰性反應',0),(22,7,'1.0',0),(22,6,'0.5',0),(22,5,'0.3',0),(22,4,'47',0),(22,3,'150',0),(22,2,'60',0),(22,1,'180',0),(21,22,'陰性反應',0),(21,23,'陰性反應',0),(21,34,'陰性反應',0),(21,35,'陽性反應',0),(21,36,'22',0),(21,37,'1.1',0),(21,38,'8',0),(21,39,'140',0),(21,40,'無異樣',0),(1,27,'99',0),(1,2,'70',0),(1,1,'150',0),(24,2,'50',0),(24,3,'180',0),(24,4,'70',0),(24,5,'0.1',1),(24,6,'0.2',1),(24,11,'有異樣',1),(24,19,'正常',0),(24,21,'陰性反應',0),(24,22,'陰性反應',0),(24,23,'陰性反應',0),(24,26,'70',1),(24,27,'50',1),(25,5,'0.9',0),(25,6,'2.0',0),(25,11,'無異樣',0),(25,12,'無異樣',0),(25,20,'陽性反應',1),(25,22,'陽性反應',1),(25,23,'陽性反應',1),(25,29,'20',1),(25,35,'陰性反應',1),(25,40,'有異樣',1),(24,30,'5000',0),(22,23,'陰性反應',0),(22,28,'30',0),(22,29,'33',0),(22,39,'140',0),(22,41,'80',0),(22,42,'1',0),(24,1,'166',0),(28,6,'0.5',0),(28,5,'0.5',0),(28,4,'80',0),(28,3,'150',0),(28,2,'80',0),(28,1,'170',0),(29,1,'180',0),(29,2,'77',0),(29,3,'150',0),(29,4,'130',1),(29,5,'0.6',0),(29,6,'0.7',0),(29,7,'1.0',0),(29,8,'1.0',0),(30,1,'155',0),(30,2,'42',0),(30,3,'150',0),(30,4,'60',0),(30,5,'1.2',0),(30,6,'1.2',0),(15,1,'170',0),(15,2,'80',0),(15,5,'0.9',0),(15,6,'0.8',0),(24,31,'30',0),(24,32,'35',0),(24,33,'20',0),(24,34,'陽性反應',1),(24,35,'陰性反應',1),(24,39,'100',1),(24,41,'50',1),(24,42,'0.1',1),(1,28,'35',1),(1,31,'15',0),(1,33,'25',0),(1,35,'陰性反應',1),(1,36,'11',0),(1,37,'2',1),(1,38,'10',1),(1,39,'170',0),(1,42,'2',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;

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
-- Dumping data for table `her`
--


/*!40000 ALTER TABLE `her` DISABLE KEYS */;
LOCK TABLES `her` WRITE;
INSERT INTO `her` VALUES (1,92101105,'2005-01-01'),(2,92312073,'2005-06-06'),(21,92401011,'2005-06-10'),(22,92407059,'2005-06-10'),(23,92101112,'2005-06-10'),(24,92101103,'2005-05-07'),(25,92112233,'2005-01-01'),(28,92503039,'2005-01-01'),(29,92503040,'2005-04-07'),(30,92503041,'2005-01-01'),(15,92402059,'2005-01-01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `her` ENABLE KEYS */;

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
-- Dumping data for table `register`
--


/*!40000 ALTER TABLE `register` DISABLE KEYS */;
LOCK TABLES `register` WRITE;
INSERT INTO `register` VALUES (2,4,'2005-07-12','空氣潮濕或天氣太冷時會發作'),(2,11,'2005-07-10','吃太多甜食會昏迷'),(25,2,'2005-07-09','看到正妹會喘不過氣'),(25,10,'2005-07-13','關節很容易受傷');
UNLOCK TABLES;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

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
-- Dumping data for table `student`
--


/*!40000 ALTER TABLE `student` DISABLE KEYS */;
LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES (93101101,10111,'許功蓋','女','1986-04-28','E276554763','高雄市某處','87765432','0958123456','test3@msa.hinet.net',0,'在學','','','',''),(92101105,10111,'許某','男','1986-03-01','B132386399','台中','86687781','0958994450','test2@msa.hinet.net',0,'在學','','','',''),(92501019,10111,'王小明','男','1984-10-22','H153205911','中和市景平路280號2樓','22457809','0933778775','test@msa.hinet.net',0,'在學','王大頭','父子','22457809','0933111222'),(92312073,10111,'沈芸','女','1973-12-15','M218197566','南投縣鹿谷鄉鹿谷村田頭路2號','049-2485728','0921586322','92312073@nccu,edu,tw',0,'在學','沈伊齡','母女','049- 2485728','0921772770'),(92402059,10111,'吳家豪','男','1975-02-24','A112302882','台北市民生東路二段170號11樓','02-25081858','0953728458','92402059@nccu.edu.tw',0,'在學','吳國棟','父子','02-58169454','0921061581'),(92407059,10111,'張馨鈴','女','1984-08-20','N211232646','彰化縣二林鄉二林村竹林路12號','047-2627845','0973582955','runnar820@yahoo.com.tw',0,'在學','張軒立',' 父女','047-2184854','0910573728'),(92112233,10111,'吳小美','女','1975-05-07','G112302083','台北市民生東路二段170號11樓','02-25081858','0953728458','92402059@nccu.edu.tw',0,'畢業','吳國棟','父女','02-58169454','0921061581'),(92401011,10111,'陳康治','男','1986-03-31','M101232488','南投縣埔里鎮中正路56號3F','049 -2802061','0951757334','kunge324@yahoo.com.tw',0,'在學','陳昌雄','父子','049-2758185',''),(92101112,10111,'韋小寶','男','1983-03-15','X145932633','北京','02-2129831','0928371261','treasure@china.com',0,'在學','','','',''),(92101103,10111,'林添財','男','1975-07-11','A158428157','高雄美濃','07-2812831','0921323751','money@add.com',0,'在學','','','',''),(92503039,10111,'王小瓜','女','1984-10-22','H153205911','中和市景平路280號2樓','22457809','0933778775','test@msa.hinet.net',0,'在學','王大瓜','父子','22457809','0933111222'),(92503040,10111,'王西瓜','女','1984-10-22','H153205911','中和市景平路280號2樓','22457809','0933778775','test@msa.hinet.net',0,'在學','王東瓜','父子','22457809','0933111222'),(92503041,10111,'王南瓜','女','1984-10-22','H153205911','中和市景平路280號2樓','22457809','0933778775','test@msa.hinet.net',0,'在學','王東瓜','父子','22457809','0933111222');
UNLOCK TABLES;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

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
-- Dumping data for table `treat`
--


/*!40000 ALTER TABLE `treat` DISABLE KEYS */;
LOCK TABLES `treat` WRITE;
INSERT INTO `treat` VALUES (1,3,'很嚴重哦　建議前往公立醫院就診','還沒治好',0),(3,29,'很糟糕呀','有點改善了',0),(2,41,'哈哈呵呵呀','好啦',1),(2,39,'唉呀呀','治好了',1),(2,26,'唉呀呀唉呀呀','治好了',1),(2,6,'唉呀呀','沒好',0),(2,5,'唉呀','還沒好',0),(1,28,'只差一點點而已','治好了',1),(1,42,'真是不幸','治好了',1),(3,20,'檢查錯了','其實是正常的',1),(2,42,'新增一個異常','這個還沒好呀',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `treat` ENABLE KEYS */;

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
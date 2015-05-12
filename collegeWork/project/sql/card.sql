-- phpMyAdmin SQL Dump
-- version 2.8.1
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Jan 11, 2007, 08:39 AM
-- 伺服器版本: 5.0.21
-- PHP 版本: 5.1.4
-- 
-- 資料庫: `card`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `design`
-- 

CREATE TABLE `design` (
  `id` int(11) NOT NULL,
  `page` varchar(15) collate latin1_general_ci NOT NULL,
  `card` varchar(15) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `design`
-- 

INSERT INTO `design` VALUES (1, 'f3.gif', 'yellowwall.gif');
INSERT INTO `design` VALUES (13, 'pinkmoon.gif', 'bluelove.gif');

-- --------------------------------------------------------

-- 
-- 資料表格式： `echo`
-- 

CREATE TABLE `echo` (
  `dns` varchar(50) collate latin1_general_ci NOT NULL,
  `echosite` varchar(100) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `echo`
-- 

INSERT INTO `echo` VALUES ('http://www.google.com.tw/', 'http://www.google.com.tw/echo');
INSERT INTO `echo` VALUES ('http://npc.twbbs.org:8080', 'http://npc.twbbs.org:8080/card/response.jsp');
INSERT INTO `echo` VALUES ('http://140.119.19.149:8080/', 'http://140.119.19.149:8080/bid/response.jsp');

-- --------------------------------------------------------

-- 
-- 資料表格式： `education`
-- 

CREATE TABLE `education` (
  `id` varchar(12) collate latin1_general_ci NOT NULL,
  `elementary` varchar(10) collate latin1_general_ci NOT NULL,
  `Ele_year` year(4) NOT NULL,
  `Ele_month` int(2) NOT NULL,
  `junior_high` varchar(10) collate latin1_general_ci NOT NULL,
  `jun_year` year(4) NOT NULL,
  `jun_month` int(2) NOT NULL,
  `senior_high` varchar(10) collate latin1_general_ci NOT NULL,
  `sen_year` year(4) NOT NULL,
  `sen_month` int(2) NOT NULL,
  `university` varchar(10) collate latin1_general_ci default NULL,
  `uni_year` year(4) default NULL,
  `uni_month` int(2) default NULL,
  `BA` varchar(10) collate latin1_general_ci default NULL,
  `BA_year` year(4) default NULL,
  `BA_month` int(2) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `education`
-- 

INSERT INTO `education` VALUES ('g', '', 0000, 0, 'null', 0000, 0, '', 0000, 0, 'g', 0000, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- 資料表格式： `email`
-- 

CREATE TABLE `email` (
  `email1` varchar(20) collate latin1_general_ci default NULL,
  `email2` varchar(20) collate latin1_general_ci default NULL,
  `email3` varchar(20) collate latin1_general_ci default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `email`
-- 


-- --------------------------------------------------------

-- 
-- 資料表格式： `family`
-- 

CREATE TABLE `family` (
  `id` varchar(12) collate latin1_general_ci NOT NULL,
  `Name` varchar(5) collate latin1_general_ci NOT NULL,
  `Relation` varchar(3) collate latin1_general_ci NOT NULL,
  `intro` text collate latin1_general_ci,
  `picture` varchar(30) collate latin1_general_ci NOT NULL,
  `blog` varchar(30) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `family`
-- 

INSERT INTO `family` VALUES ('', '', '', '', '', '');
INSERT INTO `family` VALUES ('', '', '', '', '', '');
INSERT INTO `family` VALUES ('', '', '', '', '', '');
INSERT INTO `family` VALUES ('', '', '', '', '', '');

-- --------------------------------------------------------

-- 
-- 資料表格式： `identify`
-- 

CREATE TABLE `identify` (
  `no` int(11) NOT NULL,
  `id` varchar(20) collate utf8_unicode_ci NOT NULL,
  `portal` varchar(100) collate utf8_unicode_ci NOT NULL,
  `portalName` varchar(50) collate utf8_unicode_ci NOT NULL,
  `site` varchar(100) collate utf8_unicode_ci NOT NULL,
  `siteTitle` varchar(100) collate utf8_unicode_ci NOT NULL,
  `id2` varchar(20) collate utf8_unicode_ci NOT NULL,
  `kind` varchar(20) collate utf8_unicode_ci NOT NULL,
  `public` binary(1) NOT NULL,
  `receive` binary(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- 列出以下資料庫的數據： `identify`
-- 

INSERT INTO `identify` VALUES (12, '1', 'http://npc.twbbs.org:8080/bid/index.jsp', 'Jimmy''s Bidding Website', 'http://npc.twbbs.org:8080/bid/index.jsp', 'All about Demo', 'Demo', 'default', 0x30, 0x31);
INSERT INTO `identify` VALUES (1, '1', 'http://www.wretch.cc/', '無名小站', 'http://www.wretch.cc/blog/losing917', '尋找遺失的美好', 'losing917', 'Blog', 0x31, 0x31);
INSERT INTO `identify` VALUES (2, '1', 'http://tw.knowledge.yahoo.com/', 'Yahoo 知識+', 'http://tw.knowledge.yahoo.com/question/?qid=1406080908007', '關於神奇寶貝黃版金手指問題', 'cckk', 'default', 0x30, 0x31);
INSERT INTO `identify` VALUES (3, '1', 'http://www.javaworld.com.tw/jute/', 'JavaWord@TW', 'http://www.javaworld.com.tw/jute/post/view?bid=5&id=73697&sty=1&tpg=1&age=0', '[精華] J2SE5.0 新增的好用小功能 ', 'popcorny', 'Java', 0x31, 0x31);
INSERT INTO `identify` VALUES (4, '1', 'http://www.javaworld.com.tw/jute/', 'JavaWord@TW', 'http://www.javaworld.com.tw/jute/post/view?bid=5&id=105545&sty=1&tpg=1&age=0', '[精華] Generics 簡介 ', 'popcorny', 'Java', 0x31, 0x31);
INSERT INTO `identify` VALUES (5, '1', 'http://bbs.ntu.edu.tw/', '椰林風情', 'http://bbs.ntu.edu.tw/cgi-bin/readgem.cgi?board=Java&dir=A0RU40GV&type=file', '請問JSP與PHP...', 'PingYing', 'default', 0x31, 0x31);
INSERT INTO `identify` VALUES (6, '1', 'http://forum.moztw.org/', 'Mozilla Taiwan 討論區', 'http://forum.moztw.org/viewtopic.php?t=12716', '[FX][TB][MZ][NVU] B5F series (1.5.0.6 / 1.0.8) - 安裝程式/壓縮檔', '某A', 'Firefox', 0x31, 0x31);
INSERT INTO `identify` VALUES (7, '1', 'http://www.wretch.cc/', '無名小站', 'http://www.wretch.cc/mypage/ccc', '天上天下，唯我獨尊', 'taiwanNo1', 'default', 0x31, 0x31);
INSERT INTO `identify` VALUES (8, '1', 'http://gaaan.com/', 'Gaaan', 'http://gaaan.com/doreamon', '小哆啦的家', 'dorara', 'default', 0x31, 0x31);
INSERT INTO `identify` VALUES (9, '1', 'http://www.xuite.net/', 'Xuite 整合性的網路服務', 'http://www.xuite.net/ccc', '很開心的哇啦啦', 'happy999477', 'Blog', 0x31, 0x31);
INSERT INTO `identify` VALUES (10, '1', 'http://www.pixnet.net/', 'PIXNET', 'http://www.pixnet.net/album/tanpopo1230/1245264', 'tanpopo1230的相簿', 'tanpopo1230', 'Blog', 0x31, 0x31);
INSERT INTO `identify` VALUES (11, '1', 'http://npc.twbbs.org:8080/book/', '社會化電子書革命', 'http://npc.twbbs.org:8080/book/blog/blog.jsp?id=Mary', 'Mary的收藏屋', 'Mary', 'default', 0x31, 0x31);

-- --------------------------------------------------------

-- 
-- 資料表格式： `job`
-- 

CREATE TABLE `job` (
  `id` varchar(12) collate latin1_general_ci NOT NULL,
  `company` varchar(10) collate latin1_general_ci NOT NULL,
  `title` varchar(10) collate latin1_general_ci NOT NULL,
  `period` varchar(10) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `job`
-- 

INSERT INTO `job` VALUES ('', '', '', '');

-- --------------------------------------------------------

-- 
-- 資料表格式： `location`
-- 

CREATE TABLE `location` (
  `Street` varchar(20) collate latin1_general_ci NOT NULL,
  `City` varchar(10) collate latin1_general_ci NOT NULL,
  `Country` varchar(10) collate latin1_general_ci NOT NULL,
  `Zip_Code` varchar(10) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `location`
-- 


-- --------------------------------------------------------

-- 
-- 資料表格式： `user`
-- 

CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `nickName` varchar(20) NOT NULL,
  `birthMonth` int(11) NOT NULL,
  `birthDay` int(11) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `sex` binary(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 列出以下資料庫的數據： `user`
-- 

INSERT INTO `user` VALUES (14, 'abcd', '小明', '王', '阿明', 2, 17, 1982, 0x31, 'ming@yahoo.com.tw', '政大商學院501', '0921838238', '140.119.19.149');
INSERT INTO `user` VALUES (3, 'aaa', '小綠', '白', '小綠', 1, 13, 1972, 0x31, 'green@nccu.edu.tw', '國立政治大學', '0921848392', '140.119.19.149');
INSERT INTO `user` VALUES (2, 'ccc', '小黃', '白', '小黃', 7, 12, 1988, 0x31, 'yellow@nccu.edu.tw', '國立政治大學', '0921842292', '140.119.19.149');
INSERT INTO `user` VALUES (4, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (5, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (6, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (7, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (8, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (9, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (10, 'ccc', 'Water', 'Chen', 'A.Bian', 1, 9, 1905, 0x31, 'chen@gov.tw', '台北市總統府', '028318231', '140.119.19.149');
INSERT INTO `user` VALUES (11, 'abcd', 'Java', 'Home', 'Big J', 1, 7, 1976, 0x31, 'jjj@gmail.com', '�x�j�k�ͤK��8101', '0928391332', '140.119.195.9');
INSERT INTO `user` VALUES (12, '12', 'e', 'w', 'e', 1, 12, 1998, 0x31, '', '', '', '140.119.195.9');
INSERT INTO `user` VALUES (13, '12', 'Roger', 'Lin', 'Nat', 1, 12, 1979, 0x31, 'RogerLin@gmail.com', '84 Union St', '0912345678', '140.119.195.9');
INSERT INTO `user` VALUES (1, 'abcdabcd', '王', '小花', '阿花花', 3, 28, 1973, 0x30, 'flower234321@gmail.com', '國立政治大學', '0928417832', '140.119.18.1');

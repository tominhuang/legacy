-- phpMyAdmin SQL Dump
-- version 2.6.1-pl3
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Jun 12, 2005, 02:30 PM
-- 伺服器版本: 4.1.11
-- PHP 版本: 4.3.11
-- 
-- 資料庫: `sa`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `message_single`
-- 

CREATE TABLE `message_single` (
  `value` binary(1) NOT NULL default '',
  `push_name` varchar(12) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `push_word` varchar(80) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `IP` varchar(15) collate latin1_general_ci NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  `time` time NOT NULL default '00:00:00',
  `article_id` int(4) NOT NULL default '0',
  PRIMARY KEY  (`date`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `message_single`
-- 

INSERT INTO `message_single` VALUES (0x31, '土銘', '我推推推', '192.168.1.254', '2005-06-12', '12:25:58', 1);

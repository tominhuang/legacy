-- phpMyAdmin SQL Dump
-- version 2.6.1-pl3
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Jun 12, 2005, 02:32 PM
-- 伺服器版本: 4.1.11
-- PHP 版本: 4.3.11
-- 
-- 資料庫: `sa`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `message_whole`
-- 

CREATE TABLE `message_whole` (
  `id` int(4) NOT NULL default '1',
  `author` varchar(12) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `title` varchar(90) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  `time` time NOT NULL default '00:00:00',
  `article` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `IP` varchar(15) collate latin1_general_ci NOT NULL default '',
  `value` int(3) NOT NULL default '0',
  `isReply` binary(1) NOT NULL default '0',
  `password` varchar(12) character set utf8 collate utf8_unicode_ci NOT NULL default '00000',
  `type` varchar(10) collate latin1_general_ci NOT NULL default 'normal',
  `top` binary(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `message_whole`
-- 

INSERT INTO `message_whole` VALUES (1, '土銘', '這篇給大家測試', '2005-06-12', '03:07:56', '隨便玩呀\r\n密碼是1234\r\n不要刪掉呀\r\n刪掉就沒得玩了\r\n\r\n我已經測試過很多了\r\n應該沒什麼大問題', '192.168.1.254', 1, 0x30, '1234', 'normal', 0x30);
INSERT INTO `message_whole` VALUES (2, '土銘', '第二篇', '2005-06-12', '03:29:29', '算了吧\r\n明天', '192.168.1.254', 0, 0x30, '1234', 'normal', 0x30);
INSERT INTO `message_whole` VALUES (3, '土銘', '第三篇', '2005-06-12', '03:36:12', '', '192.168.1.254', 0, 0x30, '1234', 'normal', 0x30);
INSERT INTO `message_whole` VALUES (4, '土銘', '再試試', '2005-06-12', '12:26:32', 'ok', '192.168.1.254', 0, 0x30, '1234', 'normal', 0x30);

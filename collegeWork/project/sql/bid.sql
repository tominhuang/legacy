-- phpMyAdmin SQL Dump
-- version 2.8.1
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Jan 11, 2007, 08:39 AM
-- 伺服器版本: 5.0.21
-- PHP 版本: 5.1.4
-- 
-- 資料庫: `bid`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `product`
-- 

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `oneBuy` int(11) NOT NULL,
  `differ` int(11) NOT NULL,
  `owner` varchar(20) collate utf8_unicode_ci NOT NULL,
  `bidder` varchar(20) collate utf8_unicode_ci NOT NULL,
  `nowPrice` int(11) NOT NULL,
  `true` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- 列出以下資料庫的數據： `product`
-- 

INSERT INTO `product` VALUES (1, '☆東京著衣☆【彷彿置身充滿香氛的浪漫情境☆15520☆清香花網兩件式-可可咖】', '這件超值兩件式美衣\r\n\r\n裡面的小可愛與外罩衫互相搭配，胸口滾著雕花刺繡綴邊\r\n\r\n花心處綴以富有光澤的小珍珠增添質感\r\n\r\n短版外套周圍滾著清新雪紡荷葉邊\r\n\r\n以編織網狀鏤空質地為襯底\r\n\r\n搭配起來極具夏日清爽風情，彷彿帶著清香氣息的它\r\n\r\n將為妳透露出典雅的迷人風采^^ ', 280, 10, 'mayuki0920', 'ccc', 220, 1);
INSERT INTO `product` VALUES (2, 'PQI Card Drive U510名片碟 8GB 最輕便的隨身硬碟 一元起標無底價', 'Card Drive U510名片碟是針對需要大容量、重視資料保護和高度行動者所設計的，如：商務人士、享受影音生活者、設計師、遊戲迷等，屬於中高階的旅行碟產品。如同最輕便的隨身硬碟，僅有20g~25g的重量，而且擁有比硬碟不怕摔、不怕震和省電等優點，加上裡面內建安全防護軟體，讓所有重要資料得到完全保護。\r\n\r\nPQI推出的Card Drive U510名片碟有別於市場上一般長方體的旅行碟模樣，薄薄一片的外觀，創造出不同的攜帶方式，而驚艷的超高容量將打破與硬碟之間的藩籬，創造旅行碟新時代。 ', 1000, 30, 'beetle3330', 'sharon12041204', 530, 0);
INSERT INTO `product` VALUES (3, '＊┐人漁公主┌＊絕美氣質獨賣款＊荷葉立領壓摺蕾絲長... [有設直接購買價] ', '', 0, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (4, 'comoEshop~A 翻領 立領絲T(絲質上衣,套頭,高領.內搭棉... [有設直接購買價] ', '', 0, 0, 'beetle3330', '', 0, 0);
INSERT INTO `product` VALUES (5, 'Miss 小舖 韓國精品服飾 ～～立領土耳其藍五分袖針織上...', '', 0, 0, 'beetle3330', '', 0, 0);
INSERT INTO `product` VALUES (6, '轉賣:：◎◎小妹大◎◎深咖啡色壓皺小立領襯衫(附內搭...', '', 0, 0, 'beetle3330', '', 0, 0);
INSERT INTO `product` VALUES (7, '＊┐人漁公主┌＊絕美氣百貨專櫃MORGAN粉紅色牛奶絲5分袖立領上衣~~出清衣櫃~...', '', 100, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (8, '全新花邊立領8扣半開襟(黑蘭相間)直條紋上衣，可當連身... [有設直接購買價] ', '', 0, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (9, '＊綺丹尼＊【活潑俏麗】 MLWL9803印花荷葉立領襯衫 [有設直接購買價] ', '', 0, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (10, 'ο°＊依築＊°ο小性感時尚mango風【ZI-8022】╭＊設... [有設直接購買價] ', '', 0, 0, '', '', 0, 0);
INSERT INTO `product` VALUES (11, '復古華麗宮廷風～MANGO 金色深Ｖ鑲珠後綁緞帶蝴蝶結小...', '', 0, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (12, '＊～衣食無缺～＊飄逸雪紡紗＊碎花復古．立領上衣 [有設直接購買價] ', '', 0, 0, '', '', 0, 1);
INSERT INTO `product` VALUES (13, '《那本書》大特價喔！要買要快！', '嘿嘿', 1000, 200, 'demo', 'ggg', 500, 1);

-- --------------------------------------------------------

-- 
-- 資料表格式： `product_talk`
-- 

CREATE TABLE `product_talk` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `id` varchar(50) collate utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `word` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- 列出以下資料庫的數據： `product_talk`
-- 

INSERT INTO `product_talk` VALUES (1, 1, 'qqq', '2006-09-07 00:00:00', '這東西有保固嗎？\r\n是全新的嗎？\r\n有沒有瑕疵？');
INSERT INTO `product_talk` VALUES (2, 1, 'ggg', '2006-09-11 15:03:03', '可以賣給我嗎？\r\n我要買一百件，有打折嗎？');
INSERT INTO `product_talk` VALUES (3, 1, 'ccc', '0000-00-00 00:00:00', 'textarea');
INSERT INTO `product_talk` VALUES (4, 1, 'ccc', '0000-00-00 00:00:00', 'Oops, it is wrong message above.\r\nI want to know the thing more.\r\nCan you contact me?\r\nMy Email: ccc@gmail.com');
INSERT INTO `product_talk` VALUES (5, 1, 'ccc', '0000-00-00 00:00:00', 'Test');
INSERT INTO `product_talk` VALUES (6, 1, 'ccc', '0000-00-00 00:00:00', 'hey');
INSERT INTO `product_talk` VALUES (7, 1, 'ccc', '0000-00-00 00:00:00', 'hey');
INSERT INTO `product_talk` VALUES (8, 1, 'ccc', '0000-00-00 00:00:00', 'hey');
INSERT INTO `product_talk` VALUES (9, 1, 'ccc', '0000-00-00 00:00:00', 'hey');

-- --------------------------------------------------------

-- 
-- 資料表格式： `pti`
-- 

CREATE TABLE `pti` (
  `cid` int(11) NOT NULL,
  `identifySite` varchar(50) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `pti`
-- 

INSERT INTO `pti` VALUES (2, 'http://npc.twbbs.org:8080/card/');

-- --------------------------------------------------------

-- 
-- 資料表格式： `user`
-- 

CREATE TABLE `user` (
  `id` varchar(20) collate utf8_unicode_ci NOT NULL,
  `password` varchar(20) collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- 列出以下資料庫的數據： `user`
-- 

INSERT INTO `user` VALUES ('1', 'abcd');
INSERT INTO `user` VALUES ('qqq', 'qqq');
INSERT INTO `user` VALUES ('ggg', 'ggg');
INSERT INTO `user` VALUES ('demo', '1234');

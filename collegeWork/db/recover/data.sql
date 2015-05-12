-- phpMyAdmin SQL Dump
-- version 2.6.1-pl3
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Jul 17, 2005, 02:25 PM
-- 伺服器版本: 4.1.11
-- PHP 版本: 4.3.11
-- 
-- 資料庫: `hems`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `bbs`
-- 

CREATE TABLE `bbs` (
  `id` int(4) NOT NULL auto_increment,
  `date` date NOT NULL default '0000-00-00',
  `word` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=33 ;

-- 
-- 列出以下資料庫的數據： `bbs`
-- 

INSERT INTO `bbs` VALUES (1, '2005-07-05', '修正新增健檢資料的Referential Integrity　初步完成訊息區（使用Servlet）');
INSERT INTO `bbs` VALUES (2, '2005-07-06', '完成訊息區　修改超難寫的　最後寫得很漂亮喔　<(▔︶▔)>　初步完成安全機制');
INSERT INTO `bbs` VALUES (21, '2005-07-07', '完成安全機制　加強防呆措施');
INSERT INTO `bbs` VALUES (22, '2005-07-08', '將Scriptlet改寫為JSTL　健檢資料項目新增為42項　並改由程式判斷是否異常');
INSERT INTO `bbs` VALUES (23, '2005-07-09', '新增排序功能　完成健檢查詢全部、單項查詢');
INSERT INTO `bbs` VALUES (24, '2005-07-10', 'Debug老半天　原來是我欄位名稱有改過　程式裡沒改　Servlet好笨哦　不會幫我檢查SQL語法');
INSERT INTO `bbs` VALUES (25, '2005-07-11', '完成異常明細查詢（學生資料、健檢資料告一段落了~^^)　完成新增、修改矯治記錄');
INSERT INTO `bbs` VALUES (26, '2005-07-12', '完成查詢矯治記錄（矯治記錄完成）完成特殊疾病記錄');
INSERT INTO `bbs` VALUES (27, '2005-07-13', '加強排序功能　簡化原始碼　畫面美工　完成班級資料設定');
INSERT INTO `bbs` VALUES (28, '2005-07-14', '完成刪除資料、資料備份（系統作業完成）');
INSERT INTO `bbs` VALUES (31, '2005-07-16', '不小心把剛寫好的近視分析弄丟了　我快哭了~>__<~　只好重寫了　完成統計分析　只剩系統說明了');
INSERT INTO `bbs` VALUES (30, '2005-07-15', '完成系統說明配置、BMI 計算');
INSERT INTO `bbs` VALUES (32, '2005-07-16', '新增「資料還原」功能　這樣做備份才比較有意義嘛　被註解搞得一個頭二個大　不過已經解決了^^');

-- --------------------------------------------------------

-- 
-- 資料表格式： `class`
-- 

CREATE TABLE `class` (
  `Class_ID` mediumint(5) unsigned NOT NULL default '0',
  `Department` varchar(60) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Year` int(1) unsigned NOT NULL default '0',
  `Class_AB` varchar(4) character set utf8 collate utf8_unicode_ci default NULL,
  `Class_Type` varchar(20) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`Class_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `class`
-- 

INSERT INTO `class` VALUES (10111, '中國文學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (10112, '中國文學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (10311, '歷史學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (10411, '哲學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20211, '政治學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20411, '社會學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20511, '財政學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (20512, '財政學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (20611, '公共行政學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20713, '地政學系土地管理組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20714, '地政學系土地資源規劃組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20715, '地政學系土地測量與資訊組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20811, '經濟學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (20812, '經濟學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (20911, '民族學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (30111, '國際貿易學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (30112, '國際貿易學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (30211, '金融學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (30311, '會計學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (30312, '會計學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (30411, '統計學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (30511, '企業管理學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (30512, '企業管理學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (30611, '資訊管理學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (30612, '資訊管理學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (30711, '財務管理學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (30811, '風險管理與保險學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (40111, '新聞學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (40112, '新聞學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (40211, '廣告學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (40311, '廣播電視學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (50111, '英國語文學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (50112, '英國語文學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (50211, '阿拉伯語文學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (50411, '俄國語文學系', 1, '甲班', '大學部');
INSERT INTO `class` VALUES (50412, '俄國語文學系', 1, '乙班', '大學部');
INSERT INTO `class` VALUES (50611, '日本語文學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (50711, '韓國語文學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (50811, '土耳其語文學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (60111, '法律學系法學組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (60112, '法律學系財經法組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (60113, '法律學系法制組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (70111, '應用數學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (70211, '心理學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (70311, '資訊科學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (20311, '外交學系', 1, NULL, '大學部');
INSERT INTO `class` VALUES (10212, '教育學系國小師資組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (10213, '教育學系中學師資組', 1, NULL, '大學部');
INSERT INTO `class` VALUES (10121, '中國文學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (10122, '中國文學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (10321, '歷史學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (10421, '哲學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20221, '政治學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20421, '社會學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20521, '財政學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (20522, '財政學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (20621, '公共行政學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20723, '地政學系土地管理組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20724, '地政學系土地資源規劃組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20725, '地政學系土地測量與資訊組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20821, '經濟學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (20822, '經濟學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (20921, '民族學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (30121, '國際貿易學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (30122, '國際貿易學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (30221, '金融學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (30321, '會計學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (30322, '會計學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (30421, '統計學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (30521, '企業管理學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (30522, '企業管理學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (30621, '資訊管理學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (30622, '資訊管理學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (30721, '財務管理學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (30821, '風險管理與保險學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (40121, '新聞學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (40122, '新聞學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (40221, '廣告學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (40321, '廣播電視學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (50121, '英國語文學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (50122, '英國語文學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (50221, '阿拉伯語文學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (50421, '俄國語文學系', 2, '甲班', '大學部');
INSERT INTO `class` VALUES (50422, '俄國語文學系', 2, '乙班', '大學部');
INSERT INTO `class` VALUES (50621, '日本語文學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (50721, '韓國語文學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (50821, '土耳其語文學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (60121, '法律學系法學組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (60122, '法律學系財經法組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (60123, '法律學系法制組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (70121, '應用數學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (70221, '心理學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (70321, '資訊科學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (20321, '外交學系', 2, NULL, '大學部');
INSERT INTO `class` VALUES (10222, '教育學系國小師資組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (10223, '教育學系中學師資組', 2, NULL, '大學部');
INSERT INTO `class` VALUES (10131, '中國文學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (10132, '中國文學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (10331, '歷史學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (10431, '哲學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20231, '政治學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20431, '社會學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20531, '財政學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (20532, '財政學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (20631, '公共行政學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20733, '地政學系土地管理組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20734, '地政學系土地資源規劃組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20735, '地政學系土地測量與資訊組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20831, '經濟學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (20832, '經濟學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (20931, '民族學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (30131, '國際貿易學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (30132, '國際貿易學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (30231, '金融學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (30331, '會計學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (30332, '會計學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (30431, '統計學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (30531, '企業管理學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (30532, '企業管理學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (30631, '資訊管理學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (30632, '資訊管理學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (30731, '財務管理學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (30831, '風險管理與保險學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (40131, '新聞學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (40132, '新聞學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (40231, '廣告學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (40331, '廣播電視學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (50131, '英國語文學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (50132, '英國語文學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (50231, '阿拉伯語文學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (50431, '俄國語文學系', 3, '甲班', '大學部');
INSERT INTO `class` VALUES (50432, '俄國語文學系', 3, '乙班', '大學部');
INSERT INTO `class` VALUES (50631, '日本語文學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (50731, '韓國語文學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (50831, '土耳其語文學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (60131, '法律學系法學組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (60132, '法律學系財經法組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (60133, '法律學系法制組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (70131, '應用數學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (70231, '心理學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (70331, '資訊科學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (20331, '外交學系', 3, NULL, '大學部');
INSERT INTO `class` VALUES (10232, '教育學系國小師資組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (10233, '教育學系中學師資組', 3, NULL, '大學部');
INSERT INTO `class` VALUES (10141, '中國文學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (10142, '中國文學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (10341, '歷史學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (10441, '哲學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20241, '政治學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20441, '社會學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20541, '財政學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (20542, '財政學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (20641, '公共行政學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20743, '地政學系土地管理組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20744, '地政學系土地資源規劃組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20745, '地政學系土地測量與資訊組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20841, '經濟學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (20842, '經濟學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (20941, '民族學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (30141, '國際貿易學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (30142, '國際貿易學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (30241, '金融學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (30341, '會計學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (30342, '會計學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (30441, '統計學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (30541, '企業管理學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (30542, '企業管理學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (30641, '資訊管理學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (30642, '資訊管理學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (30741, '財務管理學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (30841, '風險管理與保險學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (40141, '新聞學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (40142, '新聞學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (40241, '廣告學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (40341, '廣播電視學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (50141, '英國語文學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (50142, '英國語文學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (50241, '阿拉伯語文學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (50441, '俄國語文學系', 4, '甲班', '大學部');
INSERT INTO `class` VALUES (50442, '俄國語文學系', 4, '乙班', '大學部');
INSERT INTO `class` VALUES (50641, '日本語文學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (50741, '韓國語文學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (50841, '土耳其語文學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (60141, '法律學系法學組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (60142, '法律學系財經法組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (60143, '法律學系法制組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (70141, '應用數學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (70241, '心理學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (70341, '資訊科學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (20341, '外交學系', 4, NULL, '大學部');
INSERT INTO `class` VALUES (10242, '教育學系國小師資組', 4, NULL, '大學部');
INSERT INTO `class` VALUES (10243, '教育學系中學師資組', 4, NULL, '大學部');

-- --------------------------------------------------------

-- 
-- 資料表格式： `disease`
-- 

CREATE TABLE `disease` (
  `Disease_ID` smallint(3) unsigned NOT NULL default '0',
  `Disease_Name` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`Disease_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `disease`
-- 

INSERT INTO `disease` VALUES (1, '肺結核');
INSERT INTO `disease` VALUES (2, '心臟病');
INSERT INTO `disease` VALUES (3, '肝炎');
INSERT INTO `disease` VALUES (4, '氣喘');
INSERT INTO `disease` VALUES (5, '腎臟病');
INSERT INTO `disease` VALUES (6, '癲癇');
INSERT INTO `disease` VALUES (7, '紅斑性狼瘡');
INSERT INTO `disease` VALUES (8, '血友病');
INSERT INTO `disease` VALUES (9, '蠶豆症');
INSERT INTO `disease` VALUES (10, '關節炎');
INSERT INTO `disease` VALUES (11, '糖尿病');
INSERT INTO `disease` VALUES (12, '其他');

-- --------------------------------------------------------

-- 
-- 資料表格式： `exam`
-- 

CREATE TABLE `exam` (
  `HER_ID` int(10) unsigned NOT NULL default '0',
  `Item_ID` smallint(4) unsigned NOT NULL default '0',
  `Exam_Result` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `Abnormal` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`HER_ID`,`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `exam`
-- 

INSERT INTO `exam` VALUES (1, 3, '170', 0);
INSERT INTO `exam` VALUES (1, 4, '80', 0);
INSERT INTO `exam` VALUES (1, 5, '0.7', 0);
INSERT INTO `exam` VALUES (1, 6, '1.0', 0);
INSERT INTO `exam` VALUES (1, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (1, 20, '陰性反應', 0);
INSERT INTO `exam` VALUES (1, 21, '陰性反應', 0);
INSERT INTO `exam` VALUES (1, 23, '陰性反應', 0);
INSERT INTO `exam` VALUES (1, 25, '15', 0);
INSERT INTO `exam` VALUES (1, 26, '44', 0);
INSERT INTO `exam` VALUES (2, 42, '1', 0);
INSERT INTO `exam` VALUES (2, 41, '70', 0);
INSERT INTO `exam` VALUES (2, 12, '無異樣', 0);
INSERT INTO `exam` VALUES (2, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (2, 10, '500', 0);
INSERT INTO `exam` VALUES (2, 9, '500', 0);
INSERT INTO `exam` VALUES (2, 8, '1.2', 0);
INSERT INTO `exam` VALUES (2, 7, '1.2', 0);
INSERT INTO `exam` VALUES (2, 6, '0.3', 0);
INSERT INTO `exam` VALUES (2, 5, '0.3', 0);
INSERT INTO `exam` VALUES (2, 4, '75', 0);
INSERT INTO `exam` VALUES (2, 3, '146', 0);
INSERT INTO `exam` VALUES (2, 2, '50', 0);
INSERT INTO `exam` VALUES (2, 1, '156', 0);
INSERT INTO `exam` VALUES (21, 21, '陰性反應', 0);
INSERT INTO `exam` VALUES (21, 20, '陰性反應', 0);
INSERT INTO `exam` VALUES (21, 19, '正常', 0);
INSERT INTO `exam` VALUES (21, 12, '無異樣', 0);
INSERT INTO `exam` VALUES (21, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (21, 8, '1.0', 0);
INSERT INTO `exam` VALUES (21, 7, '1.0', 0);
INSERT INTO `exam` VALUES (21, 6, '0.5', 0);
INSERT INTO `exam` VALUES (21, 5, '1.0', 0);
INSERT INTO `exam` VALUES (21, 4, '88', 0);
INSERT INTO `exam` VALUES (21, 3, '150', 0);
INSERT INTO `exam` VALUES (21, 2, '60', 0);
INSERT INTO `exam` VALUES (21, 1, '180', 0);
INSERT INTO `exam` VALUES (22, 8, '1.0', 0);
INSERT INTO `exam` VALUES (22, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (22, 12, '無異樣', 0);
INSERT INTO `exam` VALUES (22, 19, '正常', 0);
INSERT INTO `exam` VALUES (22, 20, '陰性反應', 0);
INSERT INTO `exam` VALUES (22, 21, '陰性反應', 0);
INSERT INTO `exam` VALUES (22, 22, '陰性反應', 0);
INSERT INTO `exam` VALUES (23, 1, '180', 0);
INSERT INTO `exam` VALUES (23, 2, '60', 0);
INSERT INTO `exam` VALUES (23, 3, '150', 0);
INSERT INTO `exam` VALUES (23, 4, '88', 0);
INSERT INTO `exam` VALUES (23, 5, '0.3', 0);
INSERT INTO `exam` VALUES (23, 6, '0.5', 0);
INSERT INTO `exam` VALUES (23, 7, '1.0', 0);
INSERT INTO `exam` VALUES (23, 8, '1.0', 0);
INSERT INTO `exam` VALUES (23, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (23, 12, '無異樣', 0);
INSERT INTO `exam` VALUES (23, 19, '正常', 0);
INSERT INTO `exam` VALUES (23, 20, '陰性反應', 0);
INSERT INTO `exam` VALUES (23, 21, '陰性反應', 0);
INSERT INTO `exam` VALUES (23, 22, '陰性反應', 0);
INSERT INTO `exam` VALUES (23, 23, '陰性反應', 0);
INSERT INTO `exam` VALUES (22, 7, '1.0', 0);
INSERT INTO `exam` VALUES (22, 6, '0.5', 0);
INSERT INTO `exam` VALUES (22, 5, '0.3', 0);
INSERT INTO `exam` VALUES (22, 4, '47', 0);
INSERT INTO `exam` VALUES (22, 3, '150', 0);
INSERT INTO `exam` VALUES (22, 2, '60', 0);
INSERT INTO `exam` VALUES (22, 1, '180', 0);
INSERT INTO `exam` VALUES (21, 22, '陰性反應', 0);
INSERT INTO `exam` VALUES (21, 23, '陰性反應', 0);
INSERT INTO `exam` VALUES (21, 34, '陰性反應', 0);
INSERT INTO `exam` VALUES (21, 35, '陽性反應', 0);
INSERT INTO `exam` VALUES (21, 36, '22', 0);
INSERT INTO `exam` VALUES (21, 37, '1.1', 0);
INSERT INTO `exam` VALUES (21, 38, '8', 0);
INSERT INTO `exam` VALUES (21, 39, '140', 0);
INSERT INTO `exam` VALUES (21, 40, '無異樣', 0);
INSERT INTO `exam` VALUES (1, 27, '99', 0);
INSERT INTO `exam` VALUES (1, 2, '70', 0);
INSERT INTO `exam` VALUES (1, 1, '150', 0);
INSERT INTO `exam` VALUES (24, 2, '50', 0);
INSERT INTO `exam` VALUES (24, 3, '180', 0);
INSERT INTO `exam` VALUES (24, 4, '70', 0);
INSERT INTO `exam` VALUES (24, 5, '0.1', 1);
INSERT INTO `exam` VALUES (24, 6, '0.2', 1);
INSERT INTO `exam` VALUES (24, 11, '有異樣', 1);
INSERT INTO `exam` VALUES (24, 19, '正常', 0);
INSERT INTO `exam` VALUES (24, 21, '陰性反應', 0);
INSERT INTO `exam` VALUES (24, 22, '陰性反應', 0);
INSERT INTO `exam` VALUES (24, 23, '陰性反應', 0);
INSERT INTO `exam` VALUES (24, 26, '70', 1);
INSERT INTO `exam` VALUES (24, 27, '50', 1);
INSERT INTO `exam` VALUES (25, 5, '0.9', 0);
INSERT INTO `exam` VALUES (25, 6, '2.0', 0);
INSERT INTO `exam` VALUES (25, 11, '無異樣', 0);
INSERT INTO `exam` VALUES (25, 12, '無異樣', 0);
INSERT INTO `exam` VALUES (25, 20, '陽性反應', 1);
INSERT INTO `exam` VALUES (25, 22, '陽性反應', 1);
INSERT INTO `exam` VALUES (25, 23, '陽性反應', 1);
INSERT INTO `exam` VALUES (25, 29, '20', 1);
INSERT INTO `exam` VALUES (25, 35, '陰性反應', 1);
INSERT INTO `exam` VALUES (25, 40, '有異樣', 1);
INSERT INTO `exam` VALUES (24, 30, '5000', 0);
INSERT INTO `exam` VALUES (22, 23, '陰性反應', 0);
INSERT INTO `exam` VALUES (22, 28, '30', 0);
INSERT INTO `exam` VALUES (22, 29, '33', 0);
INSERT INTO `exam` VALUES (22, 39, '140', 0);
INSERT INTO `exam` VALUES (22, 41, '80', 0);
INSERT INTO `exam` VALUES (22, 42, '1', 0);
INSERT INTO `exam` VALUES (24, 1, '166', 0);
INSERT INTO `exam` VALUES (28, 6, '0.5', 0);
INSERT INTO `exam` VALUES (28, 5, '0.5', 0);
INSERT INTO `exam` VALUES (28, 4, '80', 0);
INSERT INTO `exam` VALUES (28, 3, '150', 0);
INSERT INTO `exam` VALUES (28, 2, '80', 0);
INSERT INTO `exam` VALUES (28, 1, '170', 0);
INSERT INTO `exam` VALUES (29, 1, '180', 0);
INSERT INTO `exam` VALUES (29, 2, '77', 0);
INSERT INTO `exam` VALUES (29, 3, '150', 0);
INSERT INTO `exam` VALUES (29, 4, '130', 1);
INSERT INTO `exam` VALUES (29, 5, '0.6', 0);
INSERT INTO `exam` VALUES (29, 6, '0.7', 0);
INSERT INTO `exam` VALUES (29, 7, '1.0', 0);
INSERT INTO `exam` VALUES (29, 8, '1.0', 0);
INSERT INTO `exam` VALUES (30, 1, '155', 0);
INSERT INTO `exam` VALUES (30, 2, '42', 0);
INSERT INTO `exam` VALUES (30, 3, '150', 0);
INSERT INTO `exam` VALUES (30, 4, '60', 0);
INSERT INTO `exam` VALUES (30, 5, '1.2', 0);
INSERT INTO `exam` VALUES (30, 6, '1.2', 0);
INSERT INTO `exam` VALUES (15, 1, '170', 0);
INSERT INTO `exam` VALUES (15, 2, '80', 0);
INSERT INTO `exam` VALUES (15, 5, '0.9', 0);
INSERT INTO `exam` VALUES (15, 6, '0.8', 0);
INSERT INTO `exam` VALUES (24, 31, '30', 0);
INSERT INTO `exam` VALUES (24, 32, '35', 0);
INSERT INTO `exam` VALUES (24, 33, '20', 0);
INSERT INTO `exam` VALUES (24, 34, '陽性反應', 1);
INSERT INTO `exam` VALUES (24, 35, '陰性反應', 1);
INSERT INTO `exam` VALUES (24, 39, '100', 1);
INSERT INTO `exam` VALUES (24, 41, '50', 1);
INSERT INTO `exam` VALUES (24, 42, '0.1', 1);
INSERT INTO `exam` VALUES (1, 28, '35', 1);
INSERT INTO `exam` VALUES (1, 31, '15', 0);
INSERT INTO `exam` VALUES (1, 33, '25', 0);
INSERT INTO `exam` VALUES (1, 35, '陰性反應', 1);
INSERT INTO `exam` VALUES (1, 36, '11', 0);
INSERT INTO `exam` VALUES (1, 37, '2', 1);
INSERT INTO `exam` VALUES (1, 38, '10', 1);
INSERT INTO `exam` VALUES (1, 39, '170', 0);
INSERT INTO `exam` VALUES (1, 42, '2', 1);

-- --------------------------------------------------------

-- 
-- 資料表格式： `her`
-- 

CREATE TABLE `her` (
  `HER_ID` int(10) unsigned NOT NULL auto_increment,
  `Stu_ID` int(9) unsigned NOT NULL default '0',
  `Exam_Date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`HER_ID`),
  UNIQUE KEY `Stu_ID` (`Stu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=32 ;

-- 
-- 列出以下資料庫的數據： `her`
-- 

INSERT INTO `her` VALUES (1, 92101105, '2005-01-01');
INSERT INTO `her` VALUES (2, 92312073, '2005-06-06');
INSERT INTO `her` VALUES (21, 92401011, '2005-06-10');
INSERT INTO `her` VALUES (22, 92407059, '2005-06-10');
INSERT INTO `her` VALUES (23, 92101112, '2005-06-10');
INSERT INTO `her` VALUES (24, 92101103, '2005-05-07');
INSERT INTO `her` VALUES (25, 92112233, '2005-01-01');
INSERT INTO `her` VALUES (28, 92503039, '2005-01-01');
INSERT INTO `her` VALUES (29, 92503040, '2005-04-07');
INSERT INTO `her` VALUES (30, 92503041, '2005-01-01');
INSERT INTO `her` VALUES (15, 92402059, '2005-01-01');

-- --------------------------------------------------------

-- 
-- 資料表格式： `item`
-- 

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
-- 列出以下資料庫的數據： `item`
-- 

INSERT INTO `item` VALUES (1, '身高', 'Height', NULL, 'cm', '一般檢查');
INSERT INTO `item` VALUES (2, '體重', 'Weight', NULL, 'kg', '一般檢查');
INSERT INTO `item` VALUES (3, '收縮壓', 'Systolic Pressure', '160以下', 'mmHg', '一般檢查');
INSERT INTO `item` VALUES (4, '舒張壓', 'Diastolic Pressure', '90以下', 'mmHg', '一般檢查');
INSERT INTO `item` VALUES (5, '祼視左眼視力', 'Naked Eye Left', '0.6以上', NULL, '一般檢查');
INSERT INTO `item` VALUES (6, '祼視右眼視力', 'Naked Eye Right', '0.6以上', NULL, '一般檢查');
INSERT INTO `item` VALUES (7, '矯正左眼視力', 'Corrected Left', '0.6以上', NULL, '一般檢查');
INSERT INTO `item` VALUES (8, '矯正右眼視力', 'Corrected Right', '0.6以上', NULL, '一般檢查');
INSERT INTO `item` VALUES (9, '左眼近視度數', NULL, NULL, NULL, '一般檢查');
INSERT INTO `item` VALUES (10, '右眼近視度數', NULL, NULL, NULL, '一般檢查');
INSERT INTO `item` VALUES (11, '辨色力', 'Color Blindness', '無異樣', NULL, '一般檢查');
INSERT INTO `item` VALUES (12, '聽力', 'Hearing Test', '無異樣', NULL, '一般檢查');
INSERT INTO `item` VALUES (18, '酸鹼值', 'PH', '5.0-8.0', NULL, '尿液檢查');
INSERT INTO `item` VALUES (19, '尿膽素原', 'Urobili', '正常', NULL, '尿液檢查');
INSERT INTO `item` VALUES (20, '膽紅素', 'Bili', '陰性反應', NULL, '尿液檢查');
INSERT INTO `item` VALUES (21, '潛血', 'O.B.', '陰性反應', NULL, '尿液檢查');
INSERT INTO `item` VALUES (22, '亞硝酸鹽', 'Nitr', '陰性反應', NULL, '尿液檢查');
INSERT INTO `item` VALUES (23, '白血球酯脢', 'Leuco', '陰性反應', NULL, '尿液檢查');
INSERT INTO `item` VALUES (24, '紅血球', 'RBC', '男:380-600/女:380-550', '1000000/uL', '血液檢查');
INSERT INTO `item` VALUES (25, '血紅素', 'Hb', '男:12-18/女:11.5-18', 'g/dL', '血液檢查');
INSERT INTO `item` VALUES (26, '血球容積比', 'Ht', '男:36-50/女:34-47', NULL, '血液檢查');
INSERT INTO `item` VALUES (27, '平均血球體積', 'Mct', '80-102', NULL, '血液檢查');
INSERT INTO `item` VALUES (28, '平均血球血紅素', 'MCH', '27-34', 'Pg', '血液檢查');
INSERT INTO `item` VALUES (29, '平均血球血紅素濃度', 'MCHC', '32-36', 'G/dL', '血液檢查');
INSERT INTO `item` VALUES (30, '白血球', 'WBC', '4000-10000', '/uL', '血液檢查');
INSERT INTO `item` VALUES (31, '血小板', 'PL', '15-45', '1000000/uL', '血液檢查');
INSERT INTO `item` VALUES (32, '血清麩酸草酸轉胺脢', 'SGOT', '5-40', 'U/L', '肝功能檢查');
INSERT INTO `item` VALUES (33, '血清麩酸丙酮酸轉胺脢', 'SGPT', '5-40', 'U/L', '肝功能檢查');
INSERT INTO `item` VALUES (34, 'B型肝炎表面抗原', 'HBsAg', '陰性反應', NULL, 'B型肝炎檢查');
INSERT INTO `item` VALUES (35, 'B型肝炎表面抗體', 'HBsAb', '陽性反應', NULL, 'B型肝炎檢查');
INSERT INTO `item` VALUES (36, '血尿素氮', 'BUN', '8-23', 'mg/dL', '腎功能檢查');
INSERT INTO `item` VALUES (37, '肌酸酐', 'Cre', '0.6-1.4', 'mg/dL', '腎功能檢查');
INSERT INTO `item` VALUES (38, '尿酸', 'UA', '2-8', 'mg/dL', '腎功能檢查');
INSERT INTO `item` VALUES (39, '總膽固醇', 'T-CHOL', '130-200', 'mg/dL', '血脂肪檢查');
INSERT INTO `item` VALUES (40, '胸部X光檢查', 'Chest Radiograph', '無異樣', NULL, '理學檢查');
INSERT INTO `item` VALUES (41, '脈搏', 'Pulsation', '60-90', '下', '其他檢查');
INSERT INTO `item` VALUES (42, '總膽色素', 'Tdb', '0.5-1.2', NULL, '其他檢查');

-- --------------------------------------------------------

-- 
-- 資料表格式： `register`
-- 

CREATE TABLE `register` (
  `HER_ID` int(10) unsigned NOT NULL default '0',
  `Disease_ID` smallint(3) unsigned NOT NULL default '0',
  `Reg_Date` date NOT NULL default '0000-00-00',
  `Description` text character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`HER_ID`,`Disease_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `register`
-- 

INSERT INTO `register` VALUES (2, 4, '2005-07-12', '空氣潮濕或天氣太冷時會發作');
INSERT INTO `register` VALUES (2, 11, '2005-07-10', '吃太多甜食會昏迷');
INSERT INTO `register` VALUES (25, 2, '2005-07-09', '看到正妹會喘不過氣');
INSERT INTO `register` VALUES (25, 10, '2005-07-13', '關節很容易受傷');

-- --------------------------------------------------------

-- 
-- 資料表格式： `student`
-- 

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
-- 列出以下資料庫的數據： `student`
-- 

INSERT INTO `student` VALUES (93101101, 10111, '許功蓋', '女', '1986-04-28', 'E276554763', '高雄市某處', '87765432', '0958123456', 'test3@msa.hinet.net', 0, '在學', '', '', '', '');
INSERT INTO `student` VALUES (92101105, 10111, '許某', '男', '1986-03-01', 'B132386399', '台中', '86687781', '0958994450', 'test2@msa.hinet.net', 0, '在學', '', '', '', '');
INSERT INTO `student` VALUES (92501019, 10111, '王小明', '男', '1984-10-22', 'H153205911', '中和市景平路280號2樓', '22457809', '0933778775', 'test@msa.hinet.net', 0, '在學', '王大頭', '父子', '22457809', '0933111222');
INSERT INTO `student` VALUES (92312073, 10111, '沈芸', '女', '1973-12-15', 'M218197566', '南投縣鹿谷鄉鹿谷村田頭路2號', '049-2485728', '0921586322', '92312073@nccu,edu,tw', 0, '在學', '沈伊齡', '母女', '049- 2485728', '0921772770');
INSERT INTO `student` VALUES (92402059, 10111, '吳家豪', '男', '1975-02-24', 'A112302882', '台北市民生東路二段170號11樓', '02-25081858', '0953728458', '92402059@nccu.edu.tw', 0, '在學', '吳國棟', '父子', '02-58169454', '0921061581');
INSERT INTO `student` VALUES (92407059, 10111, '張馨鈴', '女', '1984-08-20', 'N211232646', '彰化縣二林鄉二林村竹林路12號', '047-2627845', '0973582955', 'runnar820@yahoo.com.tw', 0, '在學', '張軒立', ' 父女', '047-2184854', '0910573728');
INSERT INTO `student` VALUES (92112233, 10111, '吳小美', '女', '1975-05-07', 'G112302083', '台北市民生東路二段170號11樓', '02-25081858', '0953728458', '92402059@nccu.edu.tw', 0, '畢業', '吳國棟', '父女', '02-58169454', '0921061581');
INSERT INTO `student` VALUES (92401011, 10111, '陳康治', '男', '1986-03-31', 'M101232488', '南投縣埔里鎮中正路56號3F', '049 -2802061', '0951757334', 'kunge324@yahoo.com.tw', 0, '在學', '陳昌雄', '父子', '049-2758185', '');
INSERT INTO `student` VALUES (92101112, 10111, '韋小寶', '男', '1983-03-15', 'X145932633', '北京', '02-2129831', '0928371261', 'treasure@china.com', 0, '在學', '', '', '', '');
INSERT INTO `student` VALUES (92101103, 10111, '林添財', '男', '1975-07-11', 'A158428157', '高雄美濃', '07-2812831', '0921323751', 'money@add.com', 0, '在學', '', '', '', '');
INSERT INTO `student` VALUES (92503039, 10111, '王小瓜', '女', '1984-10-22', 'H153205911', '中和市景平路280號2樓', '22457809', '0933778775', 'test@msa.hinet.net', 0, '在學', '王大瓜', '父子', '22457809', '0933111222');
INSERT INTO `student` VALUES (92503040, 10111, '王西瓜', '女', '1984-10-22', 'H153205911', '中和市景平路280號2樓', '22457809', '0933778775', 'test@msa.hinet.net', 0, '在學', '王東瓜', '父子', '22457809', '0933111222');
INSERT INTO `student` VALUES (92503041, 10111, '王南瓜', '女', '1984-10-22', 'H153205911', '中和市景平路280號2樓', '22457809', '0933778775', 'test@msa.hinet.net', 0, '在學', '王東瓜', '父子', '22457809', '0933111222');

-- --------------------------------------------------------

-- 
-- 資料表格式： `tr`
-- 

CREATE TABLE `tr` (
  `TR_ID` int(10) unsigned NOT NULL auto_increment,
  `Stu_ID` int(9) unsigned NOT NULL default '0',
  `Treat_Date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`TR_ID`),
  UNIQUE KEY `Stu_ID` (`Stu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- 
-- 列出以下資料庫的數據： `tr`
-- 

INSERT INTO `tr` VALUES (1, 92101105, '2005-07-10');
INSERT INTO `tr` VALUES (2, 92101103, '2005-07-11');
INSERT INTO `tr` VALUES (3, 92112233, '2005-07-09');

-- --------------------------------------------------------

-- 
-- 資料表格式： `treat`
-- 

CREATE TABLE `treat` (
  `TR_ID` int(10) unsigned NOT NULL default '0',
  `Item_ID` smallint(4) unsigned NOT NULL default '0',
  `Treat_Before` text character set utf8 collate utf8_unicode_ci,
  `Treat_After` text character set utf8 collate utf8_unicode_ci,
  `Treat_Finish` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`TR_ID`,`Item_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `treat`
-- 

INSERT INTO `treat` VALUES (1, 3, '很嚴重哦　建議前往公立醫院就診', '還沒治好', 0);
INSERT INTO `treat` VALUES (3, 29, '很糟糕呀', '有點改善了', 0);
INSERT INTO `treat` VALUES (2, 41, '哈哈呵呵呀', '好啦', 1);
INSERT INTO `treat` VALUES (2, 39, '唉呀呀', '治好了', 1);
INSERT INTO `treat` VALUES (2, 26, '唉呀呀唉呀呀', '治好了', 1);
INSERT INTO `treat` VALUES (2, 6, '唉呀呀', '沒好', 0);
INSERT INTO `treat` VALUES (2, 5, '唉呀', '還沒好', 0);
INSERT INTO `treat` VALUES (1, 28, '只差一點點而已', '治好了', 1);
INSERT INTO `treat` VALUES (1, 42, '真是不幸', '治好了', 1);
INSERT INTO `treat` VALUES (3, 20, '檢查錯了', '其實是正常的', 1);
INSERT INTO `treat` VALUES (2, 42, '新增一個異常', '這個還沒好呀', 0);

-- --------------------------------------------------------

-- 
-- 資料表格式： `user`
-- 

CREATE TABLE `user` (
  `id` varchar(15) collate latin1_general_ci NOT NULL default '',
  `password` varchar(15) collate latin1_general_ci NOT NULL default '',
  `rank` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- 列出以下資料庫的數據： `user`
-- 

INSERT INTO `user` VALUES ('admin', '1234', 9);
INSERT INTO `user` VALUES ('student', '1234', 1);
INSERT INTO `user` VALUES ('exam', '1234', 2);
INSERT INTO `user` VALUES ('treat', '1234', 3);
INSERT INTO `user` VALUES ('disease', '1234', 4);
INSERT INTO `user` VALUES ('statistic', '1234', 5);
INSERT INTO `user` VALUES ('demo', 'demo', 9);
INSERT INTO `user` VALUES ('disable', 'cheater', 0);

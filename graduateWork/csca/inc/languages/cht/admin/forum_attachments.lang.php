<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: forum_attachments.lang.php 4017 2008-07-13 16:53:06Z MyBB中文化團隊 $
 */

// Tabs
$l['attachments'] = "附件";
$l['stats'] = "統計";
$l['find_attachments'] = "查找附件";
$l['find_attachments_desc'] = "使用附件搜索系統，您可以搜索用戶已經發布到您的論壇的特定文件。首先進入搜索字詞如下。所有字段是可選的，也不會被列入標準，除非它們包含一個值。";
$l['find_orphans'] = "查找孤兒附件";
$l['find_orphans_desc'] = "孤兒附件是出於某種原因遺失在數據庫或文件系統中的附件。此實用工具將幫助您尋找並消除它們。";
$l['attachment_stats'] = "附件統計資料";
$l['attachment_stats_desc'] = "下面是論壇目前的附件統計資料。";

// Errors
$l['error_nothing_selected'] = "請選擇一個或多個附件刪除。";
$l['error_no_attachments'] = "論壇目前還沒有任何附件，當存在附件的時候您才可以訪問此標簽。";
$l['error_not_all_removed'] = "只有一些孤兒附件被成功刪除，其它的無法從上傳目錄中刪除。";
$l['error_invalid_username'] = "輸入的用戶名無效。";
$l['error_invalid_forums'] = "您選擇的一個或多個版塊是無效的。";
$l['error_no_results'] = "沒有搜索到附件。";
$l['error_not_found'] = "上傳目錄中找不到附件。";
$l['error_not_attached'] = "附件已上傳超過24小時，但並沒有附加到帖子中。";
$l['error_does_not_exist'] = "這個附件所在的主題或帖子已不存在。";

// Success
$l['success_deleted'] = "選擇的附件刪除成功。";
$l['success_orphan_deleted'] = "選擇的孤兒附件刪除成功。";
$l['success_no_orphans'] = "沒有孤兒附件。";

// Confirm
$l['confirm_delete'] = "確定刪除?";

// == Pages
// = Stats
$l['general_stats'] = "統計資料";
$l['stats_attachment_stats'] = "附件 - 附件統計資料";
$l['num_uploaded'] = "<strong>No. 上傳的附件</strong>";
$l['space_used'] = "<strong>附件占用空間</strong>";
$l['bandwidth_used'] = "<strong>估計附件帶寬使用</strong>";
$l['average_size'] = "<strong>附件平均大小</strong>";
$l['size'] = "大小";
$l['posted_by'] = "發帖用戶";
$l['thread'] = "主題";
$l['downloads'] = "下載";
$l['date_uploaded'] = "上傳日期";
$l['popular_attachments'] = "最熱門的5個附件";
$l['largest_attachments'] = "最大的5個附件";
$l['users_diskspace'] = "使用空間最多的5個用戶";
$l['username'] = "用戶名";
$l['total_size'] = "總大小";

// = Orphans
$l['orphan_results'] = "孤兒附件搜索 - 結果";
$l['orphan_attachments_search'] = "孤兒附件搜索";
$l['reason_orphaned'] = "原因";
$l['reason_not_in_table'] = "不在附件表中";
$l['reason_file_missing'] = "附件文件丟失";
$l['reason_thread_deleted'] = "主題刪除";
$l['reason_post_never_made'] = "帖子從未發表";
$l['unknown'] = "未知";
$l['results'] = "結果";
$l['step1'] = "第1步";
$l['step2'] = "第2步";
$l['step1of2'] = "第1步/共2步 - 文件系統掃描";
$l['step2of2'] = "第2步/共2步 - 數據庫掃描";
$l['step1of2_line1'] = "請稍等，當前正在掃描文件系統中的孤兒附件。";
$l['step2of2_line1'] = "請稍等，當前正在掃描數據庫中的孤兒附件。";
$l['step_line2'] = "當前過程完成後將自動進行下一步。";

// = Attachments / Index
$l['index_find_attachments'] = "附件 - 查找附件";
$l['find_where'] = "查找附件...";
$l['name_contains'] = "文件名包括";
$l['name_contains_desc'] = "要使用通配符搜索請輸入 *.[文件擴展名]。例如: *.zip。";
$l['type_contains'] = "文件類型包括";
$l['forum_is'] = "版塊";
$l['username_is'] = "發帖用戶";
$l['more_than'] = "大於";
$l['greater_than'] = "大於";
$l['is_exactly'] = "等於";
$l['less_than'] = "小於";
$l['date_posted_is'] = "發帖日期";
$l['days_ago'] = "天前";
$l['file_size_is'] = "文件大小";
$l['kb'] = "KB";
$l['download_count_is'] = "下載次數";
$l['display_options'] = "顯示選項";
$l['filename'] = "文件名";
$l['filesize'] = "文件大小";
$l['download_count'] = "下載次數";
$l['post_username'] = "發帖用戶名";
$l['asc'] = "順序";
$l['desc'] = "倒序";
$l['sort_results_by'] = "排序結果";
$l['results_per_page'] = "每頁結果數";
$l['in'] = "按照";

// Buttons
$l['button_delete_orphans'] = "刪除檢查過的孤兒附件";
$l['button_delete_attachments'] = "刪除檢查過的附件";
$l['button_find_attachments'] = "查找附件";

?>
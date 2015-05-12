<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: tools_system_health.lang.php 3921 2008-06-16 02:51:24Z MyBB中文化團隊 $
 */

$l['system_health'] = "系統狀況";
$l['system_health_desc'] = "這裏可以查看系統狀況相關信息。";
$l['utf8_conversion'] = "UTF-8轉換";
$l['utf8_conversion_desc'] = "您當前正在轉換一個數據庫表到 UTF-8 格式。請註意，這個過程可能需要幾個小時，這取決於您的論壇和這張表的大小。當過程完成後，您將返回到UTF-8轉換的主頁。";
$l['utf8_conversion_desc2'] = "這個工具檢查數據庫表是否為UTF-8格式，如果不是就允許您進行轉換。";

$l['convert_all'] = "轉換全部";
$l['converting_to_utf8'] = "MyBB正在將表 \"{1}\" 從 {2} 編碼轉換到 UTF-8 編碼。";
$l['convert_to_utf8'] = "您正在將表 \"{1}\" 從 {2} 編碼轉換到 UTF-8 編碼。";
$l['convert_all_to_utf'] = "您正在將所有表從 {1} 編碼轉換到 UTF-8 編碼。";
$l['please_wait'] = "請稍等...";
$l['converting_table'] = "轉換表:";
$l['convert_table'] = "轉換表";
$l['convert_tables'] = "轉換所有表";
$l['convert_database_table'] = "轉換數據庫表";
$l['convert_database_tables'] = "轉換所有數據庫表";
$l['table'] = "表";
$l['status'] = "狀態";
$l['convert_now'] = "現在轉換";
$l['totals'] = "總計";
$l['attachments'] = "附件";
$l['total_database_size'] = "數據庫大小";
$l['attachment_space_used'] = "附件占用空間";
$l['total_cache_size'] = "緩存大小";
$l['estimated_attachment_bandwidth_usage'] = "估計附件帶寬使用";
$l['max_upload_post_size'] = "最大 上傳/提交 大小";
$l['average_attachment_size'] = "附件平均大小";
$l['stats'] = "統計資料";
$l['task'] = "任務";
$l['run_time'] = "運行時間";
$l['next_3_tasks'] = "下3個任務";
$l['backup_time'] = "備份時間";
$l['no_backups'] = "當前沒有備份文件。";
$l['existing_db_backups'] = "已存在的數據庫備份文件";
$l['writable'] = "可寫";
$l['not_writable'] = "不可寫";
$l['please_chmod_777'] = "請 CHMOD 為 777.";
$l['chmod_info'] = "請改變下面指定文件的 CHMOD 設置。欲了解更多有關CHMODing，看這";
$l['file'] = "文件";
$l['location'] = "位置";
$l['settings_file'] = "設置文件";
$l['config_file'] = "配置文件";
$l['file_upload_dir'] = "文件上傳目錄";
$l['avatar_upload_dir'] = "頭像上傳目錄";
$l['language_files'] = "語言文件";
$l['backup_dir'] = "備份目錄";
$l['cache_dir'] = "緩存目錄";
$l['themes_dir'] = "主題目錄";
$l['chmod_files_and_dirs'] = "CHMOD 文件和目錄";

$l['notice_process_long_time'] = "這個過程可能需要幾個小時，這取決於您的論壇和這張表的大小。";

$l['error_chmod'] = "必要的文件和目錄沒有適當的屬性設置。";
$l['error_invalid_table'] = "指定的表不存在。";
$l['error_db_encoding_not_set'] = "您當前安裝的MyBB還不能使用這個工具。請查看<a href=\"http://wiki.mybboard.net/index.php/UTF8_Setup\">the wiki</a>獲取更多信息。";
$l['error_not_supported'] = "您當前的數據庫引擎不支持UTF-8轉換工具。";

$l['success_all_tables_already_converted'] = "所有表已經轉換為或者已經是UTF-8格式。";
$l['success_table_converted'] = "選擇的表 \"{1}\" 成功轉換為UTF-8格式。";
$l['success_chmod'] = "所有必要的文件和目錄擁有適當的屬性設置。";

?>
<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: tools_backupdb.lang.php 3892 2008-06-09 00:16:11Z MyBB中文化團隊 $
 */


$l['database_backups'] = "數據庫備份";
$l['database_backups_desc'] = "這裏是當前您服務器MyBB備份目錄裏存在的數據庫備份列表。";
$l['new_database_backup'] = "新建備份";
$l['new_backup'] = "新建備份";
$l['new_backup_desc'] = "這裏您可以備份數據庫。";
$l['backups'] = "備份";
$l['existing_database_backups'] = "存在的數據庫備份";

$l['backup_saved_to'] = "備份文件存放在:";
$l['download'] = "下載到本地";
$l['table_selection'] = "選擇表";
$l['backup_options'] = "備份選項";
$l['table_select_desc'] = "選擇想要備份的表，按住CTRL可以選擇多個表。";
$l['select_all'] = "全選";
$l['deselect_all'] = "取消全選";
$l['select_forum_tables'] = "選擇版塊表";
$l['file_type'] = "文件類型";
$l['file_type_desc'] = "選擇一個備份數據庫的文件類型。";
$l['gzip_compressed'] = "GZIP壓縮";
$l['plain_text'] = "文本";
$l['save_method'] = "保存方式";
$l['save_method_desc'] = "選擇一種保存備份數據庫文件的方式";
$l['backup_directory'] = "保存在備份目錄";
$l['backup_contents'] = "備份內容";
$l['backup_contents_desc'] = "選擇您想備份的內容。";
$l['structure_and_data'] = "結構和數據";
$l['structure_only'] = "結構";
$l['data_only'] = "數據";
$l['analyze_and_optimize'] = "分析並優化選擇的表";
$l['analyze_and_optimize_desc'] = "您想在備份過程中分析並優化選定的表？";
$l['perform_backup'] = "執行備份";
$l['backup_filename'] = "備份文件名";
$l['file_size'] = "文件大小";
$l['creation_date'] = "備份日期";
$l['no_backups'] = "當前還沒有備份。";

$l['error_file_not_specified'] = "沒有指定要下載的數據庫備份文件。";
$l['error_invalid_backup'] = "選定的備份文件無效或者不存在。";
$l['error_backup_doesnt_exist'] = "指定的備份文件不存在";
$l['error_backup_not_deleted'] = "備份並沒有被刪除。";
$l['error_tables_not_selected'] = "沒有選擇任何表。";
$l['error_no_zlib'] = "當前PHP配置沒有啟用zlib庫 - 無法使用GZIP壓縮。";

$l['alert_not_writable'] = "備份目錄（在管理員目錄裏面）不可寫，無法保存在服務器上。";

$l['confirm_backup_deletion'] = "確定刪除?";

$l['success_backup_deleted'] = "備份文件刪除成功。";
$l['success_backup_created'] = "備份文件創建成功。";

?>
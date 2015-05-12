<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: tools_tasks.lang.php 3892 2008-06-09 00:16:11Z MyBB中文化團隊 $
 */

$l['task_manager'] = "任務管理";
$l['add_new_task'] = "添加任務";
$l['add_new_task_desc'] = "您可以在這裏添加由論壇系統自動運行的計劃任務。";
$l['edit_task'] = "編輯任務";
$l['edit_task_desc'] = "您可以在下面為該計劃任務編輯各種設置。";
$l['task_logs'] = "任務日誌";
$l['view_task_logs'] = "查看任務日誌";
$l['view_task_logs_desc'] = "當啟用日誌時，每個任務運行時產生的任何結果或錯誤都將列在下表中。系統會自動刪除30天前的記錄。";
$l['scheduled_tasks'] = "計劃任務";
$l['scheduled_tasks_desc'] = "您可以在這裏管理自動運行在論壇中的任務。點擊任務右側的圖標可立即運行該任務。";

$l['title'] = "標題";
$l['short_description'] = "簡短描述";
$l['task_file'] = "任務文件";
$l['task_file_desc'] = "選擇本任務要執行的任務文件。";
$l['time_minutes'] = "時間：分";
$l['time_minutes_desc'] = "輸入用“,”（英文標點符號）分割的分鐘(0-59)列表，以設置在哪些分鐘執行本任務。如果要每分鐘運行本任務，請輸入“*”";
$l['time_hours'] = "時間：小時";
$l['time_hours_desc'] = "輸入用“,”（英文標點符號）分割的小時(0-23)列表，以設置在哪些小時執行本任務。如果要每小時運行本任務，請輸入“*”";
$l['time_days_of_month'] = "時間：天";
$l['time_days_of_month_desc'] = "輸入用“,”（英文標點符號）分割的天(1-31)列表，以設置在哪些天執行本任務。 如果要每天運行本任務或者你想在下面設置中指定某些工作日運行，請輸入“*”";
$l['every_weekday'] = "每周";
$l['sunday'] = "周日";
$l['monday'] = "周一";
$l['tuesday'] = "周二";
$l['wednesday'] = "周三";
$l['thursday'] = "周四";
$l['friday'] = "周五";
$l['saturday'] = "周六";
$l['time_weekdays'] = "時間：工作日";
$l['time_weekdays_desc'] = "選擇那些工作日運行本程序。按住CTRL鍵可同時選取多個工作日。如果要每個工作日或者已經在上面填入了某個預定義的特殊日子，請選擇“每周”。";
$l['every_month'] = "每月";
$l['time_months'] = "時間：月";
$l['time_months_desc'] = "選擇那些月份運行本程序。按住CTRL鍵選取多個月份。如果要每個月份都運行本任務，請選擇“每月”。";
$l['enabled'] = "是否啟用任務？";
$l['enable_logging'] = "是否啟用日誌？";
$l['save_task'] = "保存任務";
$l['task'] = "任務";
$l['date'] = "日期";
$l['data'] = "數據";
$l['no_task_logs'] = "暫無計劃任務日誌。";
$l['next_run'] = "下次運行";
$l['run_task_now'] = "現在運行本任務";
$l['run_task'] = "運行";
$l['disable_task'] = "禁用任務";
$l['enable_task'] = "啟用任務";
$l['delete_task'] = "刪除任務";
$l['alt_enabled'] = "啟用";
$l['alt_disabled'] = "禁用";

$l['error_invalid_task'] = "指定任務不存在。";
$l['error_missing_title'] = "你沒有填寫計劃任務標題。";
$l['error_missing_description'] = "你沒有填寫計劃任務簡短描述。";
$l['error_invalid_task_file'] = "你選擇的任務文件不存在。";
$l['error_invalid_minute'] = "你輸入的分鐘無效。";
$l['error_invalid_hour'] = "你輸的小時無效。";
$l['error_invalid_day'] = "你輸入的天無效。";
$l['error_invalid_weekday'] = "你選擇的工作日無效。";
$l['error_invalid_month'] = "你選擇的月份無效。";

$l['success_task_created'] = "任務創建成功。";
$l['success_task_updated'] = "選中任務更新成功。";
$l['success_task_deleted'] = "選中任務刪除成功。";
$l['success_task_enabled'] = "選中任啟用成功。";
$l['success_task_disabled'] = "選中任務禁用成功。";
$l['success_task_run'] = "選中任務運行成功。";

$l['confirm_task_deletion'] = "確定刪除這個計劃任務？";
$l['confirm_task_enable'] = "<strong>警告：</strong> 您即將啟用一個通過計劃任務運行的任務 (Crontab，請瀏覽<a href=\"http://wiki.mybboard.net/\" target=\"_blank\">MyBB Wiki</a>獲取更多信息)。是否繼續？";

?>
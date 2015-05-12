<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 *
 * $Id: datahandler_event.lang.php 3790 2008-04-23 22:50:33Z MyBB中文化團隊 $
 */

$l['eventdata_missing_name'] = '缺少事件的名稱. 請輸入一個事件名稱.';
$l['eventdata_missing_description'] = '缺少事件的內容描述. 請輸入事件描述.';

$l['eventdata_invalid_start_date'] = '您輸入的事件開始日期是錯誤不合法的. 您必須確認檢查您指定的日期, 月份以及年份是正確的, 有些特別的月份不包含某些日期.';
$l['eventdata_invalid_start_year'] = "只能創建最近 5 年內的事件. 請從列表中選擇一個合理的開始年份。";
$l['eventdata_invalid_start_month'] = '您輸入的開始月份是不正確的. 請輸入一個合法的開始月份.';

$l['eventdata_invalid_end_date'] = '您輸入的事件結束日期是不正確的. 您必須確認檢查您指定的日期, 月份以及年份是正確的, 有些特別的月份不包含某些日期.';
$l['eventdata_invalid_end_year'] = "只能創建最近 5 年內的事件. 請從列表中選擇一個合理的結束年份。";
$l['eventdata_invalid_end_month'] = '您輸入的事件結束月份是不正確的. 請輸入一個合法的結束月份.';
$l['eventdata_invalid_end_day'] = '您輸入的結束日期不正確不合法. 您選擇的日期可能超過了這個月應有的天數.';

$l['eventdata_cant_specify_one_time'] = "如果您指定了事件的開始時間, 您必須同時指定事件的結束時間。";
$l['eventdata_start_time_invalid'] = "您輸入的開始時間不正確. 正確的格式應該是像這樣的: 12am, 12:01am, 00:01。";
$l['eventdata_end_time_invalid'] = "您輸入的結束時間不正確. 正確的格式應該是像這樣的: 12am, 12:01am, 00:01。";
$l['eventdata_invalid_timezone'] = "您在事件中選定的時區是不合法的。";
$l['eventdata_end_in_past'] = "結束日期或時間在開始日期或時間之前。";

$l['eventdata_only_ranged_events_repeat'] = "只有範圍事件 (帶有開始和結束日期) 可以重復。";
$l['eventdata_invalid_repeat_day_interval'] = "您輸入了一個不合法的重復間隔天數。";
$l['eventdata_invalid_repeat_week_interval'] = "您輸入了一個不合法的重復間隔星期(周)數。";
$l['eventdata_invalid_repeat_weekly_days'] = "您沒有選擇事件發生的某個工作日。";
$l['eventdata_invalid_repeat_month_interval'] = "您輸入了一個不合法的重復間隔月數。";
$l['eventdata_invalid_repeat_year_interval'] = "您輸入了一個不合法的重復間隔年數。";
$l['eventdata_event_wont_occur'] = "在指定的開始和結束時間裏使用您的重復設定的話, 這個事件根本不會發生。";

$l['eventdata_no_permission_private_event'] = "您沒有權限發布私人事件。";
?>
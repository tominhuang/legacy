<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: user_banning.lang.php 3892 2008-06-09 00:16:11Z MyBB中文化團隊 $
 */

// Tabs
$l['banning'] = "禁用";
$l['banned_accounts'] = "被禁止的帳號";
$l['banned_accounts_desc'] = "這裏可以管理禁止訪問論壇的用戶。";
$l['ban_a_user'] = "封禁一個用戶";
$l['ban_a_user_desc'] = "這裏可以封禁一個用戶。";
$l['edit_ban'] = "編輯";
$l['edit_ban_desc'] = "這裏可以修改目前禁止用戶的原因和時長。";
$l['banned_ips'] = "被禁止的IP";
$l['disallowed_usernames'] = "不允許的用戶名";
$l['disallowed_email_addresses'] = "不允許使用的Email地址";

// Errors
$l['error_invalid_ban'] = "您選擇了一個無效的封禁編輯。";
$l['error_invalid_username'] = "輸入的用戶名無效或不存在。";
$l['error_no_perm_to_ban'] = "您沒有權限封禁該用戶。";
$l['error_already_banned'] = "這個用戶已經屬於封禁用戶組。";
$l['error_ban_self'] = "無法封禁自己。";
$l['error_no_reason'] = "沒有輸入原因。";

// Success
$l['success_ban_lifted'] = "成功解除。";
$l['success_banned'] = "選定的用戶封禁成功。";
$l['success_ban_updated'] = "更新成功。";

// Confirm
$l['confirm_lift_ban'] = "確定解除?";

//== Pages
//= Add / Edit
$l['ban_username'] = "用戶名 <em>*</em>";
$l['autocomplete_enabled'] = "這個字段禁止了自動完成功能。";
$l['ban_reason'] = "原因";
$l['ban_group'] = "被禁止的組 <em>*</em>";
$l['ban_group_desc'] = "為了禁用該用戶，他將被移動到封禁用戶組。";
$l['ban_time'] = "封禁時長 <em>*</em>";

//= Index
$l['user'] = "用戶";
$l['ban_lifts_on'] = "封禁解除於";
$l['time_left'] = "剩余時間";
$l['permenantly'] = "永久";
$l['na'] = "N/A";
$l['for'] = "for";
$l['bannedby_x_on_x'] = "<strong>{1}</strong><br /><small>被 {2} 封禁，在 {3} {4}</small>";
$l['lift'] = "解除";
$l['no_banned_users'] = "沒有禁止用戶。";

// Buttons
$l['ban_user'] = "封禁用戶";
$l['update_ban'] = "更新";

?>
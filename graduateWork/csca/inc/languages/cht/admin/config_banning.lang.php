<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: config_banning.lang.php 4031 2008-07-20 20:56:39Z MyBB中文化團隊 $
 */
 
$l['banning'] = "封禁系統";
$l['banned_ips'] = "被禁止的IP";
$l['banned_ips_desc'] = "這裏您可以管理被禁止訪問您的論壇的IP地址。";
$l['banned_accounts'] = "被禁止的帳號";
$l['disallowed_usernames'] = "不允許的用戶名";
$l['disallowed_usernames_desc'] = "這裏您可以管理一個不能被用戶使用或註冊的用戶名列表。這個特性同樣可以用來保留用戶名。";
$l['disallowed_email_addresses'] = "不允許使用的Email地址";
$l['disallowed_email_addresses_desc'] = "這裏您可以管理一個不允許用戶使用或註冊的Email地址列表。";

$l['banned_ip_addresses'] = "被禁止的IP地址";
$l['username'] = "用戶名";
$l['date_disallowed'] = "被禁止的日期";
$l['last_attempted_use'] = "最近一次試圖使用";
$l['email_address'] = "Email地址";
$l['ip_address'] = "IP地址";
$l['ban_date'] = "禁止日期";
$l['last_access'] = "最近訪問";
$l['no_bans'] = "目前還沒有被禁止的。";
$l['add_disallowed_username'] = "增加一個不被允許的用戶名";
$l['username_desc'] = "註意：要指定通配符，請使用“*”";
$l['disallow_username'] = "不允許的用戶名";
$l['add_disallowed_email_address'] = "增加一個不被允許的Email地址";
$l['email_address_desc'] = "註意：要指定通配符，請使用“*”";
$l['disallow_email_address'] = "不允許的Email地址";
$l['ban_ip_address'] = "禁止一個IP地址";
$l['ip_address_desc'] = "註意：要禁止一個IP地址範圍請使用“*”（例如: 127.0.0.*）";
$l['ban_ip_address'] = "封禁IP地址";

$l['error_missing_ban_input'] = "您沒有為這個禁止規則指定一個值。";
$l['error_invalid_filter'] = "指定的過濾器不存在。";

$l['success_ip_banned'] = "該IP地址已成功被禁止。";
$l['success_username_disallowed'] = "該用戶名已成功被禁止。";
$l['success_email_disallowed'] = "該Email地址已成功被禁止。";
$l['success_ban_deleted'] = "指定的封禁規則已經成功刪除。";

$l['confirm_ban_deletion'] = "您確定要刪除這條封禁？";

?>
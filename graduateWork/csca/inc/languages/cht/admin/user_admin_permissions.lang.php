<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: user_admin_permissions.lang.php 3892 2008-06-09 00:16:11Z MyBB中文化團隊 $
 */

$l['admin_permissions'] = "管理員權限";
$l['user_permissions'] = "用戶權限";
$l['user_permissions_desc'] = "這裏您可以管理管理員的權限，包括可以控制每個管理員使用不同的後臺控制功能。";
$l['group_permissions'] = "組權限";
$l['group_permissions_desc'] = "管理員權限也可以應用於具有訪問管理員控制面板權限的組。當然也可以控制每個組使用不同的後臺控制功能。";
$l['default_permissions'] = "預設權限";
$l['default_permissions_desc'] = "預設權限適用於那些沒有自定義管理員權限或沒有繼承管理員組權限的用戶。";

$l['admin_permissions_updated'] = "權限更新成功。";
$l['revoke_permissions'] = "撤銷權限";
$l['edit_permissions'] = "編輯權限";
$l['set_permissions'] = "設置權限";
$l['edit_permissions_desc'] = "這裏您可以限制允許進入的標簽或個人頁面。但是 \"主頁\" 標簽是所有管理員都可以訪問的。";
$l['update_permissions'] = "更新權限";
$l['view_log'] = "查看日誌";
$l['permissions_type_group'] = "組權限類型";
$l['permissions_type_user'] = "用戶權限類型";
$l['no_group_perms'] = "目前沒有設置組權限。";
$l['no_user_perms'] = "目前沒有設置用戶權限。";
$l['edit_user'] = "編輯用戶個人資料";
$l['using_individual_perms'] = "使用個人權限";
$l['using_custom_perms'] = "使用自定義權限";
$l['using_group_perms'] = "使用組權限";
$l['using_default_perms'] = "使用預設權限";
$l['last_active'] = "最後活動";
$l['user'] = "用戶";
$l['edit_group'] = "編輯組";
$l['default'] = "默認";
$l['group'] = "組";

$l['error_delete_super_admin'] = '抱歉，但您無法對此用戶執行該操作，因為此用戶是超級管理員。<br /><br />要執行該操作，您必須在 inc/config.php 文件中添加您的用戶ID到超級管理員列表。';
$l['error_delete_no_uid'] = '沒有指定權限ID';
$l['error_delete_invalid_uid'] = '指定的權限ID無效';

$l['success_perms_deleted'] = '權限成功撤銷。';

$l['confirm_perms_deletion'] = "確定撤銷權限?";
$l['confirm_perms_deletion2'] = "確定撤銷該用戶權限?";

?>
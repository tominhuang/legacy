<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: config_settings.lang.php 4159 2008-08-31 01:05:54Z MyBB中文化團隊 $
 */
 
$l['board_settings'] = "全局設置";
$l['change_settings'] = "更改設置";
$l['change_settings_desc'] = "這裏您可以管理論壇相關的各項設置。在下列設置組中選擇一個可以管理跟這個組相關的設置。";
$l['add_new_setting'] = "添加設置";
$l['add_new_setting_desc'] = "這裏您可以為論壇添加新的設置。";
$l['modify_existing_settings'] = "修改設置";
$l['modify_existing_settings_desc'] = "這裏您可以修改論壇中已存在的設置。";
$l['add_new_setting_group'] = "添加設置組";
$l['add_new_setting_group_desc'] = "這裏您可以創建一個設置組歸類個人設置。";
$l['edit_setting_group'] = "編輯設置組";
$l['edit_setting_group_desc'] = "這裏您可以編輯已存在的設置組。";

$l['title'] = "標題";
$l['description'] = "描述";
$l['group'] = "組";
$l['display_order'] = "顯示順序";
$l['name'] = "標識符";
$l['name_desc'] = "這個唯一的標識符用於設置數組中引用這個設置（在腳本, 翻譯文件和模板中）。";
$l['group_name_desc'] = "這個唯一的標識符用於翻譯系統。";
$l['text'] = "文本";
$l['textarea'] = "文本域";
$l['yesno'] = "是/否 選擇";
$l['onoff'] = "開/關 選擇";
$l['select'] = "選擇框";
$l['radio'] = "單選框";
$l['checkbox'] = "復選框";
$l['language_selection_box'] = "語言選擇框";
$l['adminlanguage'] = "管理員語言選擇框";
$l['cpstyle'] = "控制面板樣式選擇框";
$l['php'] = "Evaluated PHP";
$l['type'] = "類型"; 
$l['extra'] = "額外";
$l['extra_desc'] = "如果選擇了這項：選擇框、單選框或復選框，請在下面輸入一個配對(格式為：值=項)，每個單獨的項占一行。If PHP, enter the PHP to be evaluated.";
$l['value'] = "值";
$l['insert_new_setting'] = "添加設置";
$l['edit_setting'] = "編輯設置";
$l['delete_setting'] = "刪除設置";
$l['setting_configuration'] = "設置配置";
$l['update_setting'] = "更新設置";
$l['save_settings'] = "保存設置";
$l['setting_groups'] = "設置組";
$l['bbsettings'] = "設置";
$l['insert_new_setting_group'] = "添加設置組";
$l['setting_group_setting'] = "設置組/設置";
$l['order'] = "順序";
$l['edit_setting_group'] = "編輯設置組";
$l['delete_setting_group'] = "刪除設置組";
$l['save_display_orders'] = "保存顯示順序";
$l['update_setting_group'] = "更新設置組";
$l['modify_setting'] = "修改設置";
$l['search'] = "搜索";

$l['show_all_settings'] = "顯示所有設置";
$l['settings_search'] = "搜索設置";

$l['confirm_setting_group_deletion'] = "您確定要刪除這個設置組？";
$l['confirm_setting_deletion'] = "您確定要刪除這個設置？";

$l['error_missing_title'] = "您沒有為這個設置指定名稱";
$l['error_missing_group_title'] = "您沒有為這個設置組指定名稱";
$l['error_invalid_gid'] = "您沒有選定一個有效的組來放置這個設置";
$l['error_invalid_gid2'] = "您循著鏈接到了一個無效的設置組。請確認它存在。";
$l['error_missing_name'] = "您沒有為這個設置指定標識符";
$l['error_missing_group_name'] = "您沒有為這個設置組指定標識符";
$l['error_invalid_type'] = "您沒有為這個設置選擇一個有效值";
$l['error_invalid_sid'] = "指定的設置不存在";
$l['error_duplicate_name'] = "指定的標識符已經被 \"{1}\" 設置使用 -- 它必須是唯一的";
$l['error_duplicate_group_name'] = "指定的標識符已經被 \"{1}\" 設置組使用 -- 它必須是唯一的";
$l['error_no_settings_found'] = "找不到符合指定搜索詞的設置。";
$l['error_cannot_edit_default'] = "默認的設置和組不可編輯或移除。";
$l['error_cannot_edit_php'] = "這是一個特殊的不可編輯的設置。";
$l['error_ajax_search'] = "搜索設置時出現問題：";
$l['error_ajax_unknown'] = "搜索設置時出現了未知錯誤。";

$l['success_setting_added'] = "設置已經創建成功。";
$l['success_setting_updated'] = "設置已經更新成功。";
$l['success_setting_deleted'] = "選定的設置已經成功刪除。";
$l['success_settings_updated'] = "設置已經更新成功。";
$l['success_display_orders_updated'] = "設置的顯示順序已經更新成功。";
$l['success_setting_group_added'] = "設置組已經創建成功。";
$l['success_setting_group_updated'] = "設置組已經更新成功。";
$l['success_setting_group_deleted'] = "選定的設置組已經成功刪除。";
$l['success_duplicate_settings_deleted'] = "所有復制的設置組已經成功刪除。";
?>
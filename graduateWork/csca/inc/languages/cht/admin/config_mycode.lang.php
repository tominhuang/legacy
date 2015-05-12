<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: config_mycode.lang.php 3922 2008-06-16 04:00:58Z MyBB中文化團隊 $
 */

$l['custom_mycode'] = "自定義MyCode";
$l['mycode'] = "MyCode";
$l['mycode_desc'] = "自定義MyCode允許您添加附加的MyCode，讓用戶在他們的帖子中使用。";
$l['add_new_mycode'] = "添加MyCode";
$l['add_new_mycode_desc'] = "這裏可以添加一個新的自定義MyCode。您可以在保存前使用表單下面的沙盒測試您的正則表達式和替換是否正確。";
$l['edit_mycode_desc'] = "這裏您可以編輯自定義MyCode。您可以在保存前使用表單下面的沙盒測試您的正則表達式和替換是否正確。";

$l['title'] = "名稱";
$l['short_description'] = "簡短描述";
$l['regular_expression'] = "正則表達式";
$l['regular_expression_desc'] = "輸入一個正則表達式，將搜索特定的組合字符。您必須確保正則表達式是有效和安全的&mdash;系統不會進行驗證。";
$l['replacement'] = "替換為";
$l['replacement_desc'] = "在這裏輸入需要替換為什麽。";
$l['example'] = "例子:";
$l['enabled'] = "啟用?";
$l['parse_order'] = "解析順序";
$l['parse_order_desc'] = "MyCodes將按照順序相對於其它MyCodes。";
$l['edit_mycode'] = "編輯MyCode";
$l['activate_mycode'] = "激活MyCode";
$l['deactivate_mycode'] = "取消激活MyCode";
$l['delete_mycode'] = "刪除MyCode";
$l['no_mycode'] = "沒有自定義MyCodes。";
$l['save_mycode'] = "保存MyCode";
$l['add_mycode'] = "添加MyCode";
$l['changes_not_saved'] = "您的改動還沒有保存。";
$l['deactivated'] = "未激活的";

$l['sandbox'] = "沙盒";
$l['sandbox_desc'] = "您可以在保存前利用這裏測試您的正則表達式和替換。";
$l['test_value'] = "測試值";
$l['test_value_desc'] = "在下面的框中輸入要測試的文本。";
$l['result_html'] = "HTML結果";
$l['result_html_desc'] = "下面的文本域顯示測試後的HTML結果。";
$l['result_actual'] = "實際效果";
$l['result_actual_desc'] = "下面的區域顯示實際的效果。";
$l['test'] = "測試MyCode";

$l['error_missing_title'] = "沒有輸入名稱。";
$l['error_missing_regex'] = "沒有輸入正則表達式。";
$l['error_missing_replacement'] = "沒有輸入替換為什麽。";
$l['error_invalid_mycode'] = "指定的MyCode不存在。";

$l['success_added_mycode'] = "添加成功。";
$l['success_deleted_mycode'] = "刪除成功。";
$l['success_updated_mycode'] = "更新成功。";
$l['success_deactivated_mycode'] = "取消激活成功。";
$l['success_activated_mycode'] = "激活成功。";

$l['confirm_mycode_deletion'] = "確定刪除?";


?>
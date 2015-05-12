<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: config_attachment_types.lang.php 3813 2008-05-03 13:52:18Z MyBB中文化團隊 $
 */

$l['attachment_types'] = "附件類型";
$l['attachment_types_desc'] = "這裏可以管理或者創建附件類型。";
$l['add_new_attachment_type'] = "添加新附件類型";
$l['add_attachment_type'] = "添加附件類型";
$l['add_attachment_type_desc'] = "添加一個新的附件類型，將允許用戶在帖子中上傳這種類型的附件。您可以控制每個附件類型的擴展名、MIME類型、最大文件大小和顯示的小圖標。";
$l['edit_attachment_type'] = "編輯";
$l['edit_attachment_type_desc'] = "您可以編輯這個附件類型的擴展名、MIME類型、最大文件大小和顯示的小圖標。";

$l['extension'] = "擴展名";
$l['maximum_size'] = "最大文件大小";
$l['no_attachment_types'] = "沒有附件類型。";

$l['file_extension'] = "文件擴展名";
$l['file_extension_desc'] = "在這裏輸入允許上傳的文件的擴展名（不包括圓點）（例如: txt）";
$l['mime_type'] = "MIME類型";
$l['mime_type_desc'] = "輸入MIME類型（<a href=\"http://mybb.netmkt.cn/thread-7.html\" target=\"_blank\">點這裏查看MIME類型列表</a>）";
$l['maximum_file_size'] = "最大文件大小（KB）";
$l['maximum_file_size_desc'] = "限定單個上傳文件的最大大小（1 MB = 1024 KB）";
$l['limit_intro'] = "請確定這個大小小於PHP的最大值:";
$l['limit_post_max_size'] = "最大提交: {1}";
$l['limit_upload_max_filesize'] = "上傳文件最大: {1}";
$l['attachment_icon'] = "附件圖標";
$l['attachment_icon_desc'] = "在這裏輸入附件圖標路徑。{theme}代表主題目錄，這樣做可以允許對於不同主題使用不同圖標。";
$l['save_attachment_type'] = "保存";

$l['error_invalid_attachment_type'] = "選擇了一個無效附件類型";
$l['error_missing_mime_type'] = "沒有輸入MIME類型";
$l['error_missing_extension'] = "沒有輸入文件擴展名";

$l['success_attachment_type_created'] = "添加成功。";
$l['success_attachment_type_updated'] = "更新成功。";
$l['success_attachment_type_deleted'] = "刪除成功。";

$l['confirm_attachment_type_deletion'] = "確定刪除?";

?>
<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: user_users.lang.php 3373 2007-10-06 17:35:33Z MyBB中文化團隊 $
 */

$l['forum_management'] = "論壇管理";
$l['forum_management_desc'] = "本節允許您管理論壇的版塊或分區。您可以管理版塊權限和版塊特定的版主。如果您改變了一個或多個版塊或分區的顯示次序，不要忘了點擊頁面底部的按鈕保存。";
$l['add_forum'] = "添加版塊";
$l['add_forum_desc'] = "這裏您可以添加一個新的版塊或分區。您還可以為此版塊設置初始權限。";
$l['copy_forum'] = "復制版塊";
$l['copy_forum_desc'] = "這裏您可以復制版塊設置或權限，從一個已存在的版塊到另一個版塊或者新版塊。";
$l['forum_permissions'] = "權限";
$l['forum_permissions_desc'] = "這裏您可以修改單個版塊的個人組的全部權限。";
$l['view_forum'] = "查看版塊";
$l['view_forum_desc'] = "這裏您可以查看子版塊，快速編輯權限和添加版主。";
$l['add_child_forum'] = "添加子版塊";
$l['edit_forum_settings'] = "編輯版塊設置";
$l['edit_forum_settings_desc'] = "這裏您可以編輯一個已經存在的版塊的設置和它的權限。";
$l['edit_forum'] = "編輯版塊";
$l['edit_mod'] = "編輯版主";
$l['edit_mod_desc'] = "在這裏您可以修改特定版主的設置。";
$l['forum_moderators'] = "版塊版主";
$l['forum_permissions2'] = "版塊權限";
$l['more_subforums'] = "and {1} more.";

$l['manage_forums'] = "管理版塊";
$l['forum'] = "版塊";
$l['order'] = "次序";

$l['edit_forum'] = "編輯版塊";
$l['subforums'] = "子版塊";
$l['moderators'] = "版主";
$l['permissions'] = "權限";
$l['add_child_forum'] = "添加子版塊";
$l['delete_forum'] = "刪除版塊";

$l['sub_forums'] = "子版塊";
$l['update_forum_orders'] = "保存版塊次序";
$l['update_forum_permissions'] = "保存版塊權限";
$l['reset'] = "重置";
$l['in_forums'] = "\"{1}\" 子版塊";
$l['forum_permissions_in'] = "\"{1}\" 版塊權限";
$l['moderators_assigned_to'] = "\"{1}\" 版主列表";
$l['add_moderator'] = "添加版主 >>";
$l['quick_permissions'] = "快速權限 >>";
$l['edit_permissions'] = "編輯權限";
$l['set_permissions'] = "設置權限";
$l['using_custom_perms'] = "使用自定義權限";
$l['using_default_perms'] = "使用默認權限";

$l['permissions_use_group_default'] = "使用組預設";
$l['permissions_group'] = "組";
$l['permissions_canview'] = "可以查看?";
$l['permissions_canpostthreads'] = "可以發布主題?";
$l['permissions_canpostreplys'] = "可以回復?";
$l['permissions_canpostpolls'] = "可以發布投票?";
$l['permissions_canuploadattachments'] = "可以上傳附件?";
$l['permissions_all'] = "全部?";

$l['moderator_permissions'] = "版主權限";
$l['forum_desc'] = "管理版主";
$l['edit_mod_for'] = "編輯版主選項： \"{1}\"";
$l['can_edit_posts'] = "可以編輯帖子?";
$l['can_delete_posts'] = "可以刪除帖子?";
$l['can_view_ips'] = "可以查看IP?";
$l['can_open_close_threads'] = "可以 打開/關閉 主題?";
$l['can_manage_threads'] = "可以管理主題（分割、移動、復制、合並）?";
$l['can_move_to_other_forums'] = "該用戶不是版主，可以移動主題到另一個版塊?";
$l['save_mod'] = "保存版主";

$l['no_forums'] = "沒有版塊。";
$l['no_moderators'] = "沒有版主。";

$l['success_forum_disporder_updated'] = "版塊顯示次序更新成功。";
$l['success_forum_deleted'] = "選擇的版塊刪除成功。";
$l['success_moderator_deleted'] = "選擇的版主刪除成功。";
$l['success_forum_permissions_updated'] = "版塊權限更新成功。";
$l['success_forum_updated'] = "版塊設置更新成功。";
$l['success_moderator_updated'] = "選擇的版主更新成功。";

$l['error_invalid_forum'] = "請選擇一個有效的版塊。";
$l['error_invalid_moderator'] = "請刪除有效的版主刪除。";
$l['error_invalid_fid'] = "選擇的版塊ID無效。";
$l['error_forum_parent_child'] = "您不能設置此版塊的父版塊為它的子版塊。";
$l['error_forum_parent_itself'] = "這個版塊的父版塊不能是它自己。";
$l['error_incorrect_moderator'] = "請選擇一個有效的版主。";

$l['confirm_moderator_deletion'] = "確定從此版塊移除該版主?";
$l['confirm_forum_deletion'] = "確定刪除此版塊?";

$l['create_a'] = "創建一個";
$l['create_a_desc'] = "選擇一個創建的類型 - 版塊可以發帖，或者包含其它版塊的分區。";
$l['forum'] = "版塊";
$l['category'] = "分區";
$l['title'] = "名稱";
$l['description'] = "描述";
$l['save_forum'] = "保存版塊";
$l['parent_forum'] = "父版塊";
$l['parent_forum_desc'] = "包含此版塊的版塊。分區沒有父版塊 - 這種情況下，選擇“無” - 但是，分區也可以指定一個父版塊。";
$l['none'] = "無";
$l['display_order'] = "顯示次序";

$l['show_additional_options'] = "顯示附加選項";
$l['hide_additional_options'] = "隱藏附加選項";
$l['additional_forum_options'] = "附加的版塊選項";
$l['forum_link'] = "版塊鏈接";
$l['forum_link_desc'] = "為了使論壇重定向到另一個位置，輸入要重定向到的目的URL。這將刪除論壇功能，但是，仍然可以為它規定相應的權限。";
$l['forum_password'] = "版塊密碼";
$l['forum_password_desc'] = "為了進一步保護此版塊，您可以設置一個密碼，只有輸入正確的密碼才能進入。註意：用戶組仍然需要相應的權限才能夠訪問此版塊。";
$l['access_options'] = "訪問選項";
$l['forum_is_active'] = "版塊是活動的?";
$l['forum_is_active_desc'] = "如果不選擇，則此版塊將不會顯示給用戶，並且將不“存在”。";
$l['forum_is_open'] = "版塊是開啟的?";
$l['forum_is_open_desc'] = "如果不選擇，則不管權限如何，用戶都不能在此版塊發帖。";

$l['copy_to_new_forum'] = "復制到新版塊";
$l['source_forum'] = "源版塊";
$l['source_forum_desc'] = "從此版塊復制設置 和/或 權限。";
$l['destination_forum'] = "目標版塊";
$l['destination_forum_desc'] = "復制設置 和/或 權限到此版塊。";
$l['new_forum_settings'] = "新版塊設置";
$l['copy_settings_and_properties'] = "復制版塊設置和屬性";
$l['copy_settings_and_properties_desc'] = "只應用於目標版塊存在的情況。";
$l['copy_user_group_permissions'] = "復制用戶組權限。";
$l['copy_user_group_permissions_desc'] = "按住CTRL選擇多個組。";

$l['moderation_options'] = "版主選項";
$l['mod_new_posts'] = "是的，處理新帖";
$l['mod_new_threads'] = "是的，處理新主題";
$l['mod_new_attachments'] = "是的，處理新附件";
$l['mod_after_edit'] = "是的，編輯以後處理帖子";
$l['override_user_style'] = "是的，覆蓋用戶選擇的樣式";
$l['style_options'] = "樣式選項";
$l['forum_specific_style'] = "版塊的具體樣式：";
$l['use_default'] = "使用預設";
$l['dont_display_rules'] = "不顯示版塊規則";
$l['display_rules_inline'] = "版塊規則顯示在主題列表";
$l['display_rules_link'] = "版塊規則顯示為鏈接";
$l['display_method'] = "顯示方式:";
$l['rules'] = "規則:";
$l['forum_rules'] = "版塊規則";
$l['username'] = "用戶名";
$l['moderator_username_desc'] = "要添加為版主的用戶名";
$l['add_moderator'] = "添加版主";

$l['default_view_options'] = "默認查看選項";
$l['default_date_cut'] = "默認日期裁減:";
$l['default_sort_by'] = "默認排序方式:";
$l['default_sort_order'] = "默認排序:";

$l['board_default'] = "論壇默認";

$l['datelimit_1day'] = "昨天";
$l['datelimit_5days'] = "過去5天";
$l['datelimit_10days'] = "過去10天";
$l['datelimit_20days'] = "過去20天";
$l['datelimit_50days'] = "過去50天";
$l['datelimit_75days'] = "過去75天";
$l['datelimit_100days'] = "過去100天";
$l['datelimit_lastyear'] = "去年";
$l['datelimit_beginning'] = "開始";

$l['sort_by_subject'] = "主題標題";
$l['sort_by_lastpost'] = "最後發帖時間";
$l['sort_by_starter'] = "主體首發";
$l['sort_by_started'] = "主題創建時間";
$l['sort_by_rating'] = "主題評分";
$l['sort_by_replies'] = "回帖數";
$l['sort_by_views'] = "閱覽次數";

$l['sort_order_asc'] = "順序";
$l['sort_order_desc'] = "倒序";

$l['misc_options'] = "維護選項";
$l['allow_html'] = "是的，在帖子中允許HTML";
$l['allow_mycode'] = "是的，在帖子中允許MyCode";
$l['allow_smilies'] = "是的，在帖子中允許表情";
$l['allow_img_code'] = "是的，在帖子中允許 [img] 代碼";
$l['allow_post_icons'] = "是的，允許發帖時使用帖子圖標";
$l['allow_thread_ratings'] = "是的，允許主題評分";
$l['show_forum_jump'] = "是的，在“版塊跳轉”菜單顯示此版塊";
$l['use_postcounts'] = "是的，在此版塊發帖將增加用戶發帖數。";

$l['use_permissions'] = "使用權限";
$l['use_permissions_desc'] = "選擇該用戶組權限 - 繼承權限（將刪除自定義權限）或者自定義權限。";
$l['inherit_permissions'] = "使用用戶組權限或者從父版塊繼承權限";
$l['custom_permissions'] = "使用自定義權限（下面）";

$l['save_permissions'] = "保存版塊權限";

$l['error_missing_title'] = "您必須輸入一個名稱。";
$l['error_no_parent'] = "您必須選擇一個父版塊。";

$l['success_forum_added'] = "版塊創建成功。";
$l['success_moderator_added'] = "版主成功添加到該版塊。";
$l['success_forum_permissions_saved'] = "版塊權限保存成功。";
$l['success_forum_copied'] = "選定的版塊復制成功。";

$l['error_moderator_already_added'] = "選定的用戶已經是當前版塊的版主。";
$l['error_moderator_not_found'] = "指定的用戶名沒有找到。";
$l['error_new_forum_needs_name'] = "新版塊必須要有名稱。";
$l['error_invalid_source_forum'] = "無效的來源論壇。";
$l['error_invalid_destination_forum'] = "無效的目的論壇。";

$l['group_viewing'] = "查看";
$l['group_posting_rating'] = "發布/評分";
$l['group_editing'] = "編輯";
$l['group_polls'] = "投票";
$l['group_misc'] = "維護";

$l['viewing_field_canview'] = "可以查看版塊?";
$l['viewing_field_canviewthreads'] = "可以查看版塊中的主題?";
$l['viewing_field_candlattachments'] = "可以下載附件?";

$l['posting_rating_field_canpostthreads'] = "可以發布主題?";
$l['posting_rating_field_canpostreplys'] = "可以發布回復?";
$l['posting_rating_field_canpostattachments'] = "可以發布附件?";
$l['posting_rating_field_canratethreads'] = "可以給主題評分?";

$l['editing_field_caneditposts'] = "可以編輯自己的帖子?";
$l['editing_field_candeleteposts'] = "可以刪除自己的帖子?";
$l['editing_field_candeletethreads'] = "可以刪除自己的主題?";
$l['editing_field_caneditattachments'] = "可以編輯自己的附件?";

$l['polls_field_canpostpolls'] = "可以發布投票?";
$l['polls_field_canvotepolls'] = "可以投票?";

$l['misc_field_cansearch'] = "可以搜索論壇?";

?>
<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: user_users.lang.php 4005 2008-07-10 17:53:25Z MyBB中文化團隊 $
 */

$l['users'] = "用戶";

$l['search_for_user'] = "搜索用戶";
$l['browse_users'] = "瀏覽用戶";
$l['browse_users_desc'] = "在下面您可以很方便的瀏覽您論壇的不同用戶。這種方式對於生成不同的結果或設置不同的信息特別有用，搜索起來也是如此。";
$l['find_users'] = "查找用戶";
$l['find_users_desc'] = "在這裏您可以搜索您論壇的用戶。填寫的信息越詳細，結果越精確。";
$l['create_user'] = "添加用戶";
$l['create_user_desc'] = "您可以在這裏添加一個新用戶。";
$l['merge_users'] = "合並用戶";
$l['merge_users_desc'] = "這裏您可以將兩個賬戶合成一個賬戶。\"來源帳戶\" 將被合並到 \"目標帳戶\" ，<strong>只保留目標賬戶</strong>。來源帳戶的主題、回復、私人短信、日歷事件、發帖計數器和好友列表都將被合並到目標帳戶<br /><span style=\"font-size: 15px;\">請註意，此過程將無法復原！</span>";
$l['edit_user'] = "編輯用戶";
$l['edit_user_desc'] = "這裏您可以編輯用戶個人資料、設置和簽名；查看一般統計信息；和訪問有關這個用戶的其他網頁的詳細信息。";
$l['show_referrers'] = "查看引用";
$l['show_referrers_desc'] = "您的搜索結果如下所示。您可以列表或名片的方式查看結果。";
$l['show_ip_addresses'] = "顯示IP地址";
$l['show_ip_addresses_desc'] = "選定的用戶的註冊IP地址和發帖IP地址如下所示。第一個IP地址是註冊的IP地址（標示為此類）。任何其他的IP地址是發帖IP地址。";

$l['error_avatartoobig'] = "抱歉，但是無法更新你的頭像，因為你指定的頭像太大。最大尺寸時 {1}x{2} (寬 x 高)";
$l['error_invalidavatarurl'] = "您輸入的頭像URL地址似乎無效。請確認您輸入的URL地址正確。";
$l['error_invalid_user'] = "您選擇了一個無效用戶。";
$l['error_no_perms_super_admin'] = "您無權編輯此用戶，因為您不是超級管理員。";
$l['error_invalid_user_source'] = "您輸入的來源帳戶不存在。";
$l['error_invalid_user_destination'] = "您輸入的目標帳戶不存在。";
$l['error_cannot_merge_same_account'] = "來源賬戶和目標帳戶必須不同。";
$l['error_no_users_found'] = "沒有搜索到用戶。請修改參數再試一次。";
$l['error_invalid_admin_view'] = "您的選擇無效";
$l['error_missing_view_title'] = "沒有輸入標題";
$l['error_no_view_fields'] = "沒有選擇任何要顯示的字段";
$l['error_invalid_view_perpage'] = "每頁顯示結果數不是有效的數字";
$l['error_invalid_view_sortby'] = "選擇的排序字段無效";
$l['error_invalid_view_sortorder'] = "選擇的排序順序無效";
$l['error_invalid_view_delete'] = "要刪除的無效";
$l['error_cannot_delete_view'] = "至少要有一個管理員的快速查看。";

$l['user_deletion_confirmation'] = "確定刪除此用戶?";

$l['success_coppa_activated'] = "選定的COPPA用戶已經成功激活。";
$l['success_activated'] = "選擇的用戶激活成功。";
$l['success_user_created'] = "添加用戶成功。";
$l['success_user_updated'] = "選擇的用戶更新成功。";
$l['success_user_deleted'] = "選擇的用戶刪除成功。";
$l['success_merged'] = "已經成功合並到";
$l['succuss_view_set_as_default'] = "成功設置為默認。";
$l['success_view_created'] = "成功創建。";
$l['success_view_updated'] = "成功更新。";
$l['success_view_deleted'] = "成功刪除。";

$l['confirm_view_deletion'] = "您確定要刪除選定的查看?";

$l['warning_coppa_user'] = "<p class=\"alert\"><strong>警告: </strong> 此用戶正在等待 COPPA 審核。 <a href=\"index.php?module=user/users&amp;action=activate_user&amp;uid={1}\">激活帳戶</a></p>";

$l['required_profile_info'] = "個人資料信息";
$l['password'] = "密碼";
$l['confirm_password'] = "確認密碼";
$l['email_address'] = "Email地址";
$l['use_primary_user_group'] = "使用主用戶組";
$l['primary_user_group'] = "主用戶組";
$l['additional_user_groups'] = "附加用戶組";
$l['additional_user_groups_desc'] = "按住 CTRL 選擇多個組";
$l['display_user_group'] = "顯示用戶組";
$l['save_user'] = "保存用戶";

$l['overview'] = "概覽";
$l['profile'] = "個人資料";
$l['account_settings'] = "帳戶設定";
$l['signature'] = "簽名";
$l['avatar'] = "頭像";
$l['general_account_stats'] = "一般帳戶統計";
$l['local_time'] = "本地時間";
$l['posts'] = "發帖數";
$l['age'] = "年齡";
$l['posts_per_day'] = "平均每日發帖";
$l['percent_of_total_posts'] = "占總發帖數的百分比";
$l['user_overview'] = "用戶概覽";

$l['new_password'] = "新密碼";
$l['new_password_desc'] = "留空不改變";
$l['confirm_new_password'] = "確認新密碼";

$l['optional_profile_info'] = "選擇性個人信息";
$l['custom_user_title'] = "自定義用戶頭銜";
$l['custom_user_title_desc'] = "如果留空，使用用戶組頭銜";
$l['website'] = "網站";
$l['icq_number'] = "ICQ";
$l['aim_handle'] = "AIM";
$l['yahoo_messanger_handle'] = "Yahoo!";
$l['msn_messanger_handle'] = "MSN";

$l['hide_from_whos_online'] = "不顯示在“誰在線”列表";
$l['remember_login_details'] = "記住登陸信息";
$l['login_cookies_privacy'] = "登陸, Cookies &amp; 隱私";
$l['recieve_admin_emails'] = "接收管理員郵件";
$l['hide_email_from_others'] = "對其他用戶隱藏Email地址";
$l['recieve_pms_from_others'] = "接收其他用戶短信";
$l['alert_new_pms'] = "收到新短信時通知我";
$l['email_notify_new_pms'] = "收到新短信時發郵件給我";
$l['default_thread_subscription_mode'] = "默認主題訂閱模式";
$l['do_not_subscribe'] = "不訂閱";
$l['no_email_notification'] = "沒有電子郵件通知";
$l['instant_email_notification'] = "即時電子郵件通知";
$l['messaging_and_notification'] = "消息和通知";
$l['use_default'] = "使用默認";
$l['date_format'] = "日期格式";
$l['time_format'] = "時間格式";
$l['time_zone'] = "時區";
$l['daylight_savings_time_correction'] = "DST(夏令時)更正";
$l['automatically_detect'] = "自動檢測 DST 設置";
$l['always_use_dst_correction'] = "總是使用 DST 更正";
$l['never_use_dst_correction'] = "不使用 DST 更正";
$l['date_and_time_options'] = "日期和時間選項";
$l['show_threads_last_day'] = "顯示昨天發布的主題";
$l['show_threads_last_5_days'] = "顯示最近5天的主題";
$l['show_threads_last_10_days'] = "顯示最近10天的主題";
$l['show_threads_last_20_days'] = "顯示最近20天的主題";
$l['show_threads_last_50_days'] = "顯示最近50天的主題";
$l['show_threads_last_75_days'] = "顯示最近75天的主題";
$l['show_threads_last_100_days'] = "顯示最近100天的主題";
$l['show_threads_last_year'] = "顯示去年的主題";
$l['show_all_threads'] = "顯示所有主題";
$l['threads_per_page'] = "每頁主題數";
$l['default_thread_age_view'] = "默認主題查看";
$l['forum_display_options'] = "論壇顯示選項";
$l['display_users_sigs'] = "在帖子中顯示簽名";
$l['display_users_avatars'] = "在帖子中顯示頭像";
$l['show_quick_reply'] = "顯示快速回復框在主題下面";
$l['posts_per_page'] = "每頁回帖數";
$l['default_thread_view_mode'] = "默認主題顯示模式";
$l['linear_mode'] = "線性模式";
$l['threaded_mode'] = "交織模式";
$l['thread_view_options'] = "主題查看選項";
$l['show_redirect'] = "顯示友好重定向頁面";
$l['show_code_buttons'] = "在發帖頁顯示 MyCode 格式化選項";
$l['theme'] = "主題";
$l['board_language'] = "全局語言";
$l['other_options'] = "其它選項";
$l['signature_desc'] = "格式化選項: MyCode 是 {1}, 表情是 {2}, IMG 代碼是 {3}, HTML 是 {4}";
$l['enable_sig_in_all_posts'] = "在所有帖子中允許簽名";
$l['disable_sig_in_all_posts'] = "在所有帖子中禁止簽名";
$l['do_nothing'] = "不改變簽名偏好";
$l['signature_preferences'] = "簽名偏好";

$l['username'] = "用戶名";
$l['email'] = "Email";
$l['primary_group'] = "主組";
$l['additional_groups'] = "附加組";
$l['registered'] = "註冊時間";
$l['last_active'] = "最後活動";
$l['post_count'] = "發帖數";
$l['reputation'] = "聲望";
$l['warning_level'] = "警告級別";
$l['registration_ip'] = "註冊IP";
$l['last_known_ip'] = "最後登陸IP";
$l['registration_date'] = "註冊日期";

$l['avatar_gallery'] = "頭像圖集";
$l['current_avatar'] = "當前頭像";
$l['user_current_using_uploaded_avatar'] = "此用戶當前使用的是上傳的頭像。";
$l['user_current_using_gallery_avatar'] = "此用戶當前使用的是頭像圖集中的頭像。";
$l['user_currently_using_remote_avatar'] = "此用戶當前使用的是遠程鏈接的頭像。";
$l['max_dimensions_are'] = "頭像最大尺寸是";
$l['avatar_max_size'] = "頭像最大可以為";
$l['remove_avatar'] = "刪除當前頭像?";
$l['avatar_desc'] = "在下面您可以管理此用戶的頭像。作者用戶名下方的頭像是用來供識別的小圖片。";
$l['avatar_auto_resize'] = "如果圖片過大，它們將會自動改變大小。";
$l['attempt_to_auto_resize'] = "如果頭像過大嘗試自動改變大小?";
$l['specify_custom_avatar'] = "指定自定義頭像";
$l['upload_avatar'] = "上傳頭像";
$l['or_specify_avatar_url'] = "或者指定遠程頭像URL";
$l['or_select_avatar_gallery'] = "或者從頭像圖集中選擇";

$l['ip_addresses'] = "IP地址";
$l['ip_address'] = "IP地址";
$l['show_users_regged_with_ip'] = "顯示使用此IP地址註冊的用戶";
$l['show_users_posted_with_ip'] = "顯示使用此IP地址發帖的用戶";
$l['ban_ip'] = "禁用IP";
$l['ip_address_for'] = "IP 地址：";

$l['source_account'] = "來源賬戶";
$l['source_account_desc'] = "此賬戶將被合並到目標賬戶，並在合並完畢後刪除";
$l['destination_account'] = "目標賬戶";
$l['destination_account_desc'] = "此賬戶是合並後保留的賬戶。";
$l['merge_user_accounts'] = "合並賬戶";

$l['display_options'] = "顯示選項";
$l['ascending'] = "順序";
$l['descending'] = "倒序";
$l['sort_results_by'] = "排序方式";
$l['in'] = "按照";
$l['results_per_page'] = "每頁顯示結果數";
$l['display_results_as'] = "顯示方式";
$l['business_card'] = "名片";
$l['views'] = "快速查看";
$l['views_desc'] = "快速查看管理器允許您建立不同種類的查看方式顯示在這一特定領域。不同的查看方式對於生成各種報告非常有用。";
$l['manage_views'] = "管理";
$l['none'] = "無";
$l['search'] = "搜索";

$l['edit_profile_and_settings'] = "編輯個人資料和設置";
$l['ban_user'] = "封禁用戶";
$l['approve_coppa_user'] = "激活 COPPA 用戶";
$l['approve_user'] = "激活用戶";
$l['delete_user'] = "刪除用戶";
$l['show_referred_users'] = "查看引用用戶";
$l['show_attachments'] = "顯示附件";
$l['table_view'] = "列表模式";
$l['card_view'] = "名片模式";

$l['find_users_where'] = "查找用戶...";
$l['username_contains'] = "用戶名包括";
$l['email_address_contains'] = "Email地址包括";
$l['is_member_of_groups'] = "用戶屬於這裏的一個或多個組";
$l['website_contains'] = "網站包括";
$l['icq_number_contains'] = "ICQ包括";
$l['aim_handle_contains'] = "AIM包括";
$l['yahoo_contains'] = "Yahoo!包括";
$l['msn_contains'] = "MSN包括";
$l['signature_contains'] = "簽名包括";
$l['user_title_contains'] = "自定義頭銜包括";
$l['greater_than'] = "大於";
$l['is_exactly'] = "等於";
$l['less_than'] = "小於";
$l['post_count_is'] = "發帖數是";
$l['reg_ip_matches'] = "註冊IP地址";
$l['wildcard'] = "* 代表通配符";
$l['last_known_ip'] = "最後登陸IP地址";
$l['posted_with_ip'] = "發帖IP地址";

$l['view'] = "快速查看";
$l['create_new_view'] = "添加快速查看";
$l['create_new_view_desc'] = "在這裏您可以自定義一個新的快速查看。您可以自定義要顯示的字段、搜索參數和排序方式。";
$l['view_manager'] = "快速查看管理器";
$l['set_as_default_view'] = "設為默認?";
$l['enabled'] = "啟用";
$l['disabled'] = "禁用";
$l['fields_to_show'] = "顯示的字段";
$l['fields_to_show_desc'] = "請選擇需要顯示的字段";
$l['edit_view'] = "編輯";
$l['edit_view_desc'] = "在這裏您可以編輯快速查看。您可以自定義要顯示的字段、搜索參數和排序方式。";
$l['private'] = "私有";
$l['private_desc'] = "只有您能看得見。";
$l['public'] = "公開";
$l['public_desc'] = "其它管理員也可以看到。";
$l['visibility'] = "可見";
$l['save_view'] = "保存";
$l['created_by'] = "創建者：";
$l['default'] = "默認";
$l['this_is_a_view'] = "這是一個 {1} 快速查看";
$l['set_as_default'] = "設為默認";
$l['delete_view'] = "刪除";
$l['default_view_desc'] = "默認快速查看由MyBB創建。無法編輯或刪除。";
$l['public_view_desc'] = "公開的快速查看所有管理員都可以看到。";
$l['private_view_desc'] = "私有的快速查看只有你自己能看到。";
$l['table'] = "列表";
$l['title'] = "標題";

$l['view_title_1'] = "所有用戶";

?>
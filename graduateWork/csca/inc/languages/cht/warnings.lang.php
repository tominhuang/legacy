<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: warnings.lang.php 3790 2008-04-23 22:50:33Z MyBB中文化團隊 $
 */
 
$l['nav_profile'] = "{1} 的個人資料";
$l['nav_warning_log'] = "警告日誌";
$l['nav_add_warning'] = "警告用戶";
$l['nav_view_warning'] = "警告詳情";

$l['warning_for_post'] = ".. 帖子:";
$l['already_expired'] = "已過期";
$l['warning_active'] = "現行中";
$l['warning_revoked'] = "已撤銷";
$l['warning_log'] = "警告日誌";
$l['warning'] = "警告";
$l['issued_by'] = "執行者";
$l['date_issued'] = "發生時間";
$l['expiry_date'] = "到期時間";
$l['active_warnings'] = "現行警告(起作用的)";
$l['expired_warnings'] = "已過期警告";
$l['warning_points'] = "({1} 點)";
$l['no_warnings'] = "這個用戶沒有收到任何警告, 或已被全部刪除。";
$l['warn_user'] = "警告用戶";
$l['warn_user_desc'] = "";
$l['post'] = "帖子:";
$l['warning_note'] = "管理備註:";
$l['warning_type'] = "警告類型:";
$l['custom'] = "自定義原因";
$l['reason'] = "原因:";
$l['points'] = "點數:";
$l['warn_user_desc'] = "如果用戶違反了一個或更多的規則, 您可以在這裏增加用戶的警告等級。";
$l['send_pm'] = "通知用戶:";
$l['send_user_warning_pm'] = "給這個用戶發送一條私人短信通知他這個警告。";
$l['send_pm_subject'] = "標題:";
$l['warning_pm_subject'] = "您收到了一條警告。";
$l['send_pm_message'] = "內容:";
$l['warning_pm_message'] = "親愛的 {1}

您收到了一條來自{2}管理員的警告.
--

--";
$l['expiration_hours'] = "小時";
$l['expiration_days'] = "天";
$l['expiration_weeks'] = "星期";
$l['expiration_months'] = "個月";
$l['redirect_warned_banned'] = "這個用戶同時被移入了 {1} 組, 持續時間 {2}。";
$l['redirect_warned_suspended'] = "這個用戶的發帖權限已經被暫停, 持續時間 {1}。";
$l['redirect_warned_moderate'] = "這個用戶的所有發帖將要求審核, 持續時間 {1} {2}。";
$l['redirect_warned'] = "{1} 的警告等級已經被增加到 {2}%.{3}<br /><br />您現在將轉入您原來的位置。";
$l['error_warning_system_disabled'] = "您不能使用警告系統, 因為論壇管理員已經禁用這個功能。";
$l['reached_max_warnings_day'] = "您不能發出警告了, 因為您已經達到了每日可以發送的警告數量上限.<br /><br />您每天可以發出的警告最多次數為 {1}。";
$l['user_reached_max_warning'] = "這個用戶不能再被警告了, 因為他已經達到了警告等級的最大值。";
$l['error_cant_warn_group'] = "您沒有權限警告這個組的用戶。";
$l['error_no_note'] = "您沒有針對這條警告輸入任何管理備註。";
$l['error_invalid_type'] = "您選擇了一個無效的警告類型。";
$l['error_cant_custom_warn'] = "您沒有權限對用戶發出自定義警告。";
$l['error_no_custom_reason'] = "您沒有針對您的自定義警告輸入原因。";
$l['error_invalid_custom_points'] = "您沒有輸入一個有效要增加的警告點數. 您需要輸入一個大於 0 並且小於或等於 {1} 的數字。";
$l['details'] = "詳情";
$l['view'] = "查看";
$l['current_warning_level'] = "當前警告等級: <strong>{1}%</strong> ({2}/{3})";
$l['warning_details'] = "警告詳細情況";
$l['revoke_warning'] = "撤銷這個警告";
$l['revoke_warning_desc'] = "右要撤銷這條警告, 請在下面輸入原因. 這不會解除因這條警告同時引起的權限封禁或暫停。";
$l['reason'] = "理由:";
$l['warning_is_revoked'] = "這條警告已撤銷";
$l['revoked_by'] = "撤銷者:";
$l['date_revoked'] = "撤銷日期:";
$l['warning_already_revoked'] = "這條警告已經被撤銷。";
$l['no_revoke_reason'] = "您沒有輸入原因說明你為什麽要撤銷這條警告。";
$l['redirect_warning_revoked'] = "這條警告已經成功撤銷, 用戶的警告等級也隨之下降.<br /><br />現在將返回到那個警告。";
$l['result_banned'] = "用戶將被移入一個封禁組({1}) {2}";
$l['result_suspended'] = "發表權限將被暫停 {1}";
$l['result_moderated'] = "發帖將要求審核 {1}";
$l['result_period'] = "{1} {2}";
$l['hour_or_hours'] = "小時";
$l['day_or_days'] = "天";
$l['week_or_weeks'] = "星期";
$l['month_or_months'] = "個月";
$l['expires'] = "持續時間:";
$l['new_warning_level'] = "新警告等級:";
$l['cannot_warn_self'] = "您不能給自己增加警告等級。";
$l['error_cant_warn_user'] = "您沒有權限對這個用戶發出警告。";
$l['existing_post_warnings'] = "這個帖子現有的警告";
?>
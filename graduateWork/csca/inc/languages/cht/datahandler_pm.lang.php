<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 *
 * $Id: datahandler_pm.lang.php 4269 2008-11-13 05:48:19Z MyBB中文化團隊 $
 */

$l['pmdata_too_long_subject'] = '您輸入的私人短信標題太長, 請輸入短一點的標題.';
$l['pmdata_code_no_subject'] = '[無主題]';
$l['pmdata_missing_subject'] = '您沒有輸入短信標題, 請輸入.';
$l['pmdata_missing_message'] = '您沒有輸入要發送的短信內容, 請輸入.';
$l['pmdata_invalid_recipients'] = "您輸入指定的收件人包含非註冊用戶名. 非法的收件人: {1}";
$l['pmdata_no_recipients'] = "您沒有輸入任何短信收件人, 在 'To' 欄項裏, 至少需要輸入一個收件人的用戶名。";
$l['pmdata_too_many_recipients'] = "您無權同時發送私人短信給 {1} 個用戶。";
$l['pmdata_recipient_is_ignoring'] = "你無權發送私人短信給 {1}, 因為您在對方的黑名單中。";
$l['pmdata_recipient_pms_disabled'] = '{1} 已經禁用了站內私人短信功能. 您無法發送私人短信給這個使用者.';
$l['pmdata_recipient_reached_quota'] = '{1} 已經達到了短信額度上限, 所以您的短信無法成功寄出.';

$l['pmdata_pm_flooding'] = '您發送短信的速度太快。請等待 {1} 秒。';
$l['pmdata_pm_flooding_one_second'] = '您發送短信的速度太快。請等待 1 秒。';
?>
<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: messages.lang.php 3990 2008-07-06 01:01:20Z MyBB中文化團隊 $
 */

$l['click_no_wait'] = "如果您不想等待請點擊這裏。";
$l['redirect_return_forum'] = "<br /><br />您也可以, <a href=\"{1}\">返回論壇版面</a>。";
$l['redirect_emailsent'] = "您的 E-mail 已經成功寄出了。";
$l['redirect_loggedin'] = "您已經成功登錄.<br />現在即將轉入原來的頁面。";

$l['error_incompletefields'] = "似乎有一個或多個必填項您沒有填寫, 請返回並輸入必填的項目。"; 
$l['error_alreadyuploaded'] = "這個帖子已經包含了一個相同名字的附件. 請重命名這個文件然後重新上載。";
$l['error_nomessage'] = "抱歉, 由於您沒有輸入正確有效的內容, 所以我們不能繼續操作. 請返回重填。";
$l['error_invalidemail'] = "您沒有輸入一個有效的 Email 地址。";
$l['error_nomember'] = "您輸入的會員是無效或不存在的。";
$l['error_maxposts'] = "抱歉, 您每日的發帖數已經達到上限. 請等到明天再發表或聯系管理員.<br /><br />您每天最多可以發表的帖子數量是 {1}";
$l['error_nohostname'] = "找不到您輸入的 IP 對應的主機名。";
$l['error_invalidthread'] = "指定的主題不存在。";
$l['error_invalidpost'] = "指定的帖子不存在。";
$l['error_invalidattachment'] = "指定的附件不存在。";
$l['error_invalidforum'] = "非法無效的論壇版面";
$l['error_closedinvalidforum'] = "您不可以在這個論壇版面裏發帖, 可能是由於它已經關閉或只是一個分類。";
$l['error_attachtype'] = "您附上的文件類型是不被允許的. 請刪除這個附件或換其它類型的文件。";
$l['error_attachsize'] = "您附上的文件太大了. 這個類型的文件大小不能超過 {1} KB。";
$l['error_uploadsize'] = "您上傳的文件太大了。";
$l['error_uploadfailed'] = "文件上傳失敗, 請選擇一個有效的文件並重試。";
$l['error_uploadfailed_detail'] = "錯誤詳細情況: ";
$l['error_uploadfailed_php1'] = "PHP 返回: 上傳的文件超過了 php.ini 中 upload_max_filesize 的設定值. 請將這個錯誤報告給論壇管理員。";
$l['error_uploadfailed_php2'] = "上載的文件超出了設定的文件大小上限。";
$l['error_uploadfailed_php3'] = "文件上載不完全。";
$l['error_uploadfailed_php4'] = "沒有文件上傳。";
$l['error_uploadfailed_php6'] = "PHP 返回: 缺少上傳的臨時目錄. 請將這個錯誤報告給論壇管理員。";
$l['error_uploadfailed_php7'] = "PHP 返回: 無法將文件寫入磁盤. 將將這個錯誤報告給論壇管理員。";
$l['error_uploadfailed_phpx'] = "PHP 返回的錯誤代碼: {1}. 請將這個錯誤報告給論壇管理員。";
$l['error_uploadfailed_nothingtomove'] = "指定了一個無效的文件, 因此上傳的文件無法被移入目標位置。";
$l['error_uploadfailed_movefailed'] = "在將上傳的文件移入目標位置時發生了一個問題。";
$l['error_uploadfailed_lost'] = "服務器上沒有找到這個附件(丟失了)。";
$l['error_emailmismatch'] = "您輸入的 Email 地址不匹配. 請返回重試";
$l['error_nopassword'] = "您沒有輸入一個有效的密碼。";
$l['error_usernametaken'] = "您選用的用戶名已經被註冊了。";
$l['error_nousername'] = "您沒有輸入用戶名。";
$l['error_invalidusername'] = "您輸入的用戶名看來是無效的。";
$l['error_invalidpassword'] = "您輸入的密碼不正確. 如果您已經忘了密碼, 點擊<a href=\"member.php?action=lostpw\">這裏</a>. 若不是, 請返回重試。";
$l['error_postflooding'] = "很抱歉, 我們不能處理您的帖子. 管理員設定只允許您每 {1} 秒發表一篇帖子。";
$l['error_nopermission_guest_1'] = "您可能是沒有登錄或沒有權限瀏覽這個頁面. 這可能是以下原因的其中一個造成的:";
$l['error_nopermission_guest_2'] = "您還沒有登錄或註冊. 請使用頁面底部的表單進行登錄。";
$l['error_nopermission_guest_3'] = "您沒有權限可以訪問這個頁面. 您是不是在嘗試訪問管理頁面或其它不屬於您的資源? 請檢查論壇規則是否允許您的這個行為。";
$l['error_nopermission_guest_4'] = "您的帳號可能已經被管理員禁用了, 或者您的帳號正在等候激活。";
$l['login'] = "登錄";
$l['need_reg'] = "還沒註冊?";
$l['forgot_password'] = "忘記密碼了?";
$l['error_nopermission_user_1'] = "您沒有權限訪問這個頁面, 這可能是以下原因的其中一個造成的:";
$l['error_nopermission_user_ajax'] = "您沒有權限訪問這個頁面。";
$l['error_nopermission_user_2'] = "您的帳號可能已經被暫停了或者您無權訪問這項資源。";
$l['error_nopermission_user_3'] = "您沒有權限訪問這個頁面, 您是不是在嘗試訪問管理頁面或其它不屬於您的資源? 請檢查論壇規則是否允許您的這個行為。";
$l['error_nopermission_user_4'] = "您的帳號正在等候激活或批準(審核)。";
$l['error_nopermission_user_resendactivation'] = "重發激活驗證碼";
$l['error_nopermission_user_5'] = "您目前已經登錄, 用戶名是: '{1}'";
$l['logged_in_user'] = "登錄用戶";
$l['error_too_many_images'] = "圖片太多了。";
$l['error_too_many_images2'] = "我們感到抱歉, 由於您的帖子包含了太多的圖片所以無法處理. 請從您的帖子中刪除部分圖片以繼續。";
$l['error_too_many_images3'] = "<b>註意:</b> 每個帖子允許的圖片最大數量是";
$l['error_attach_file'] = "附加文件錯誤";
$l['please_correct_errors'] = "在繼續之前請修正下列錯誤:";
$l['error_reachedattachquota'] = "抱歉, 您無法附加這個文件, 因為您的附件配額已經達到 {1}";
$l['error_invaliduser'] = "指定的用戶無效或不存在。";
$l['error_invalidaction'] = "非法(無效)的行為";
$l['error_messagelength'] = "抱歉, 您的內容太長, 無法發布. 請嘗試縮短內容然後再試。";
$l['error_message_too_short'] = "抱歉, 您的內容太短, 無法發布。";
$l['failed_login_wait'] = "您在限定的嘗試次數內登錄失敗. 您現在必須等待 {1}小時 {2}分 {3}秒, 才能再次登錄。";
$l['failed_login_again'] = "<br />您還有 <strong>{1}</strong> 次機會嘗試登錄。";
$l['error_max_emails_day'] = "您不能使用 '發送主題給朋友' 或 '給用戶寄 Email' 的功能, 因為您已經用光了 24 小時內發送 {1} 封郵件的額度。";
        
$l['emailsubject_lostpw'] = "在 '{1}' 密碼重設";
$l['emailsubject_passwordreset'] = "在 '{1}' 的新密碼";
$l['emailsubject_subscription'] = "對 '{1}' 的新回復";
$l['emailsubject_randompassword'] = "您在 '{1}' 的密碼";
$l['emailsubject_activateaccount'] = "'{1}' 的帳號激活說明";
$l['emailsubject_forumsubscription'] = "在 '{1}' 有新主題";
$l['emailsubject_reportpost'] = "'{1}' 的帖子舉報";
$l['emailsubject_reachedpmquota'] = "您在 '{1}' 上的私人短信(PM)配額已用完";
$l['emailsubject_changeemail'] = "您在 '{1}'更換 Email";
$l['emailsubject_newpm'] = "您在 '{1}' 有新的私人短信";
$l['emailsubject_sendtofriend'] = "在 '{1}' 上的有趣主題";
$l['emailbit_viewthread'] = "... (訪問主題以讀取詳情..)";

$l['email_lostpw'] = "{1},

為了在 {2} 完成重設您的密碼, 您需要在您的瀏覽器中訪問下面的 URL.

{3}/member.php?action=resetpassword&uid={4}&code={5}

如果上面的鏈接無法正確地運作, 請前往

{3}/member.php?action=resetpassword

然後輸入下面的資料:
用戶名: {1}
激活驗證碼: {5}

謝謝,
{2} 管理團隊";


$l['email_reportpost'] = "{1} 來自 {2} 舉報了這個帖子:

{3}
{4}/{5}

他的舉報理由如下:
{7}

這條消息已經發送給這個論壇版面的所有版主, 如果沒有版主則發送給了所有的管理或和超級版主.

請盡快檢查這個帖子。";

$l['email_passwordreset'] = "{1},

您在 {2} 的密碼已經重設.

您的新密碼是: {3}

請使用這個密碼登錄論壇, 當您登錄的時候請前往您的 \"用戶面板\" 修改它.

謝謝,
{2} 管理團隊";

$l['email_randompassword'] = "{1},

感謝您在 {2} 註冊. 下面是您的用戶名和隨機生成的密碼. 若要登錄 {2}, 您需要這些資料.

用戶名: {3}
密碼: {4}

強烈建議您登錄後立即修改密碼. 您可以前往您的 \"用戶面板\" 然後點擊左側菜單裏的修改密碼來做這件事.

謝謝,
{2} 管理團隊";

$l['email_sendtofriend'] = "您好,

來自 {2} 的 {1} 認為您可能對下面的主題感興趣:

{3}

{1} 還包含了以下訊息:
------------------------------------------
{4}
------------------------------------------

謝謝,
{2} 管理團隊
";

$l['email_forumsubscription'] = "{1},

{2} 上已經在 {3} 開啟了一個新的主題. 這個論壇是您在 {4} 訂閱的.

主題標題是: {5}

以下是主題的內容摘要:
--
{6}
--

若要查看這個主題, 請前往下面的 URL:
{7}/{8}

論壇裏或許已經有了新的主題和回復, 但在您訪問論壇之前您不會再收到這類通知.

謝謝,
{4} 管理團隊

------------------------------------------
取消訂閱說明:

您不願意再接收這個論壇(版面)的新主題通知, 請在您的瀏覽器中訪問下面的 URL:
{7}/usercp2.php?action=removesubscription&type=forum&fid={9}

------------------------------------------";

$l['email_activateaccount'] = "{1},

為了完成在 {2} 的註冊步驟, 需要您在瀏覽器中訪問下面的 URL.

{3}/member.php?action=activate&uid={4}&code={5}

如果上面的鏈接無法正確地運作, 請前往

{3}/member.php?action=activate

然後輸入下面的資料:
用戶名: {1}
激活驗證碼: {5}

謝謝,
{2} 管理團隊";

$l['email_subscription'] = "{1},

{2} 剛剛回復了您在 {3} 訂閱的主題. 這個主題的標題是: {4}.

以下是回帖的內容摘要:
------------------------------------------
{5}
------------------------------------------

若要瀏覽這個主題, 請前往下面的 URL:
{6}/{7}

這個主題可能已經有了其它的回復, 不過在您訪問論壇之前不會再收到這類通知.

謝謝,
{3} 管理團隊

------------------------------------------
取消訂閱說明:

您不願意再接收這個主題的回復通知, 請在您的瀏覽器中訪問下面的 URL:
{6}/usercp2.php?action=removesubscription&tid={8}&key={9}

------------------------------------------";
$l['email_reachedpmquota'] = "{1},

這是一封來自 {2} 自動發送的 Email, 為的是讓您知道您的私人短信收件箱容量已經滿了.

可能有人嘗試過給您發送私人短信並因此而無法成功發送.

請刪除您保存下來的一些私人短信, 記得也要將它們從 '垃圾箱' 中清除.

謝謝,
{2} 管理團隊
{3}";
$l['email_changeemail'] = "{1},

我們在 {2} 上收到請求要改變您的 Email 地址(詳情看下面).

原 Email 地址: {3}
新 Email 地址: {4}

如果這些更改是正確的, 請在瀏覽器中前往訪問下面的 URL, 以完成驗證過程.

{5}/member.php?action=activate&uid={8}&code={6}

如果上面的鏈接無法正確地運作, 請前往

{5}/member.php?action=activate

然後輸入下面的資料:
用戶名: {7}
激活驗證碼: {6}

如果您選擇不驗證您的新 email, 那麽您的個人資料不會更新並且仍然包含您的現有 Email 地址.

謝謝,
{2} 管理團隊
{5}";

$l['email_newpm'] = "{1},
        
您在 {3} 收到了一條來自 {2} 的私人短信(PM). 若要閱讀這條短信, 您可以先訪問下面的鏈接:

{4}/private.php

請註意在您訪問 {3} 之前, 您不會再收到有新短信的通知..

您可以在您的帳號選項頁裏禁用有新短信的通知:

{4}/usercp.php?action=options

謝謝,
{3} 管理團隊
{4}";

$l['email_emailuser'] = "{1},

{3} 上的 {2} 發送了以下消息給您:
------------------------------------------
{5}
------------------------------------------

謝謝,
{3} 管理團隊
{4}

------------------------------------------
不想收到其它會員的 Email 消息?

如果您不希望其它會員給您發 Email 消息, 請在論壇中進入您的 \"用戶面板\" 並啟用 '對其它會員隱藏 Email 地址' 的選項:
{4}/usercp.php?action=options

------------------------------------------";
?>
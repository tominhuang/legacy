<?php
/**
 * MyBB 1.4.4 繁體中文語言包
 * Copyright © 2008 MyBB Group, All Rights Reserved
 * 翻譯制作: MyBB中文化團隊 MyBB中文化官方網站: http://mybb.netmkt.cn/
 * 
 * $Id: helpdocs.lang.php 4276 2008-11-23 03:01:33Z MyBB中文化團隊 $
 */

// Help Document 1
$l['d1_name'] = "用戶註冊";
$l['d1_desc'] = "通過註冊獲得個性化與權限訪問。";
$l['d1_document'] = "這個論壇的某些部分或許要求您先登錄與註冊. 註冊是完全免費的, 只需要花費您幾分鐘便可完成.
<br /><br />我們鼓勵用戶進行註冊; 一旦註冊您就可以發布帖子(消息), 設定您自己的偏好習慣, 以及維護一份個人資料.
<br /><br />需要註冊的一些功能特色包括訂閱, 改變風格, 訪問個人便箋(簡易記事本), 給論壇會員發送私人短信及 Email。";

// Help Document 2
$l['d2_name'] = "更新個人資料";
$l['d2_desc'] = "修改您當前的數據檔案。";
$l['d2_document'] = "您在站上的某些時候, 您可能需要修改一些資料信息, 諸如即時通信信息, 您的密碼, 或許可能需要修改您的 Email 地址. 您可以在用戶控制面板中修改這些個人信息. 若要訪問這個控制面板, 只需點擊大部分頁面右上角標為 \"用戶面板\" 的鏈接. 在那裏, 只要選擇 \"編輯個人資料\" 就可以修改所有想改的項目, 然後點擊頁面底部的提交按鈕進行保存才能生效。";

// Help Document 3
$l['d3_name'] = "MyBB中Cookie的使用";
$l['d3_desc'] = "MyBB使用cookie保存和您註冊登錄有關的特定信息。";
$l['d3_document'] = "如果您是註冊用戶，MyBB使用cookie保存您的登錄信息，如果不是則保存您的最近訪問信息。
<br /><br />Cookie是一個保存在您電腦裏的小型的文本文檔；論壇中所設置的cookie僅可以在這個網站裏使用並不會引起安全風險。
<br /><br />論壇中的Cookie同時也記錄您最近讀過的那個主題。
<br /><br />若要清除這個論壇設定的cookie，您可以點擊<a href=\"misc.php?action=clearcookies\">這裏</a>。";

// Help Document 4
$l['d4_name'] = "登錄與退出";
$l['d4_desc'] = "如何登錄與退出(註銷)。";
$l['d4_document'] = "在您登錄的時候，在您的機器上設定了一個 cookie 保存登錄信息，因此您在訪問論壇裏不需要每次重新輸入您的用戶名與密碼。退出時則清除那個cookie，以確保其它人不會以您的身份來訪問論壇。
<br /><br />若要登錄，只需點擊論壇右上方的登錄鏈接。若要退出，在相同的地方點擊退出鏈接即可。如果您無法退出，那麽點擊<a href=\"misc.php?action=clearcookies\">這裏</a>清除您機器上的cookie也可以達到同樣的效果。";

// Help Document 5
$l['d5_name'] = "發表新話題";
$l['d5_desc'] = "在論壇中發起一個新主題。";
$l['d5_document'] = "當您進入一個您感興趣的論壇並打算建立一個新的話題(或主題)時, 您只要點擊版面頂部或底部標為 \"發表新主題\" 的圖片即可. 請註意您可能不一定有權限在所有論壇創建新話題, 有時候管理員將某些特定論壇版面用於內部討論或僅用於存檔歸檔。";

// Help Document 6
$l['d6_name'] = "發表回復";
$l['d6_desc'] = "在論壇中對一個話題發表回帖。";
$l['d6_document'] = "在您訪問的過程中, 您可能碰到某些話題(或主題)想進行回復. 很簡單, 您只要在主題瀏覽頁的上部或下部點擊標為 \"發表回復\" 圖片. 請註意管理員有可能會對某些特殊的論壇版面作出限制, 從而只有特定的用戶可以發表.
<br /><br />此外, 管理員或版主可能會對一個主題進行鎖定, 這意味著不能再回復這個主題. 如果沒有管理員或版主的幫助, 普通用戶是沒有辦法打開這樣的話題的。";

// Help Document 7
$l['d7_name'] = "MyCode";
$l['d7_desc'] = "學習如何使用 MyCode 增強您的帖子。";
$l['d7_document'] = "您可以使用 MyCode - 一個簡化版的HTML, 以便在您的帖子種建立特定的效果.
<p><br />[b]這是粗體字[/b]<br />&nbsp;&nbsp;&nbsp;<b>這是粗體字</b>
<p>[i]這是斜體字[/i]<br />&nbsp;&nbsp;&nbsp;<i>這是斜體字</i>
<p>[u]文字帶下劃線[/u]<br />&nbsp;&nbsp;&nbsp;<u>文字帶下劃線</u>
<p>[s]文字帶劃除線[/s]<br />&nbsp;&nbsp;&nbsp;<strike>文字帶劃除線</strike>
<p><br />[url]http://mybb.netmkt.cn/[/url]<br />&nbsp;&nbsp;&nbsp;<a href=\"http://mybb.netmkt.cn/\">http://mybb.netmkt.cn/</a>
<p>[url=http://netmkt.cn/]Netmkt.cn[/url]<br />&nbsp;&nbsp;&nbsp;<a href=\"http://netmkt.cn/\">Netmkt.cn</a>
<p>[email]example@example.com[/email]<br />&nbsp;&nbsp;&nbsp;<a href=\"mailto:example@example.com\">example@example.com</a>
<p>[email=example@example.com]給我發 E-mail![/email]<br />&nbsp;&nbsp;&nbsp;<a href=\"mailto:example@example.com\">給我發 E-mail!</a>
<p>[email=example@example.com?subject=spam]包含標題的 E-mail[/email]<br />&nbsp;&nbsp;&nbsp;<a href=\"mailto:example@example.com?subject=spam\">包含標題的 E-mail</a>
<p><br />[quote]這裏是引文[/quote]<br />&nbsp;&nbsp;&nbsp;<quote>這裏是引文</quote>
<p>[code]保留格式的文字[/code]<br />&nbsp;&nbsp;&nbsp;<code>保留格式的文字</code>
<p><br />[img]http://www.php.net/images/php.gif[/img]<br />&nbsp;&nbsp;&nbsp;<img src=\"http://www.php.net/images/php.gif\">
<p>[img=50x50]http://www.php.net/images/php.gif[/img]<br />&nbsp;&nbsp;&nbsp;<img src=\"http://www.php.net/images/php.gif\" width=\"50\" height=\"50\">
<p><br />[color=red]紅色文字[/color]<br />&nbsp;&nbsp;&nbsp;<font color=\"red\">紅色文字</font>
<p>[size=3]3號大小的文字[/size]<br />&nbsp;&nbsp;&nbsp;<font size=\"3\">3號大小的文字</font>
<p>[font=Tahoma]This font is Tahoma[/font]<br />&nbsp;&nbsp;&nbsp;<font face=\"Tahoma\">This font is Tahoma</font>
<p><br />[align=center]居中對齊[/align]<div align=\"center\">居中對齊</div>
<p>[align=right]靠右對齊[/align]<div align=\"right\">靠右對齊</div>
<p><br />[list]<br />[*]列表項 #1<br />[*]列表項 #2<br />[*]列表項 #3<br />[/list]<br /><ul><li>列表項 #1</li><li>列表項 #2</li><li>列表項 #3</li>
</ul>
<p>您也可以用 [list=1] 創建一個數字順序列表, 用 [list=a] 創建字母順序列表.</p>";
?>
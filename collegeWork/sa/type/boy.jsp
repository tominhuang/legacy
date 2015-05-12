<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>少年漫畫</title>
</head>

<body>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<table width="80%" height="971" border="1" align="center" bgcolor="#00CCFF">
  <tr>
    <td width="10%" height="68">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">更改註冊資料</a>　<a href="check.jsp">查詢借閱狀況</a>　<a href="order.jsp">預約新書</a>　<a href="preview.jsp">線上試閱</a>　　</p>
    </td>
  </tr>
  <tr valign="top">
    <td><p>你好,帥哥</p>
    <p><a href="logout.jsp">登出</a></p></td>
    <td>    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="7"><strong>少年漫畫書籍排行 </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="45"><strong>名次 </strong></td>
        <td class="tabletitle" width="82"><strong>類別 </strong></td>
        <td class="tabletitle" width="149"><strong>書名 </strong></td>
        <td class="tabletitle" width="84"><strong>最新集數 </strong></td>
        <td class="tabletitle" width="83"><strong>出版社 </strong></td>
        <td class="tabletitle" width="95"><strong>作者 </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 龍狼傳 </td>
        <td class="tableword">33 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">山原義人 </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 魔偶馬戲團 </td>
        <td class="tableword">36 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">藤田和日 </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> HUNTER*HUNTER獵人 </td>
        <td class="tableword">21 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">富堅義博 </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 犬夜叉 </td>
        <td class="tableword">39 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">高橋留美 </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 火影忍者NARUTO </td>
        <td class="tableword">26 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">岸本齊史 </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 烙印勇士 </td>
        <td class="tableword">28 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">三浦建太 </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 網球王子 </td>
        <td class="tableword">27 </td>
        <td class="tableword">青文 </td>
        <td class="tableword">許斐剛 </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 天下無雙 </td>
        <td class="tableword">3 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">宮下亞喜 </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> KATSU!青春交叉 </td>
        <td class="tableword">13 </td>
        <td class="tableword">青文 </td>
        <td class="tableword">安達充 </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 鋼之鍊金術師 </td>
        <td class="tableword">10 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">荒川弘 </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> ONE PIECE海賊王 </td>
        <td class="tableword">36 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">尾田榮一 </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 20世紀少年 </td>
        <td class="tableword">18 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">浦澤直樹 </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 魔帝 </td>
        <td class="tableword">12 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">金宰煥 </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 魁!男塾 </td>
        <td class="tableword">10 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">宮下亞喜 </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 棒球大聯盟 </td>
        <td class="tableword">52 </td>
        <td class="tableword">青文 </td>
        <td class="tableword">滿田拓也 </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 死亡筆記DEATHNOTE </td>
        <td class="tableword">5 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">小田健 </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> BLEACH死神 </td>
        <td class="tableword">16 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">久保帶人 </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 新鐵拳小子 </td>
        <td class="tableword">20 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">前川剛 </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 火鳳燎原 </td>
        <td class="tableword">18 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">陳某 </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 快速球 </td>
        <td class="tableword">40 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">川三番地 </td>
      </tr>
      <tr>
        <td class="tableword">21 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 醫龍 </td>
        <td class="tableword">8 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">乃木阪太 </td>
      </tr>
      <tr>
        <td class="tableword">22 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 玫命病毒 </td>
        <td class="tableword">1 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">外園昌也 </td>
      </tr>
      <tr>
        <td class="tableword">23 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 料理復活王 </td>
        <td class="tableword">27 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">土山 </td>
      </tr>
      <tr>
        <td class="tableword">24 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 史上最強弟子兼一 </td>
        <td class="tableword">14 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">松江名俊 </td>
      </tr>
      <tr>
        <td class="tableword">25 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 鬼眼狂刀KYO </td>
        <td class="tableword">31 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">上條明峰 </td>
      </tr>
      <tr>
        <td class="tableword">26 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 灌籃少年ACT2 </td>
        <td class="tableword">18 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">八神浩樹 </td>
      </tr>
      <tr>
        <td class="tableword">28 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 蒼天之拳 </td>
        <td class="tableword">12 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">原哲夫 </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 刃牙II </td>
        <td class="tableword">24 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">板垣惠介 </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 最終進化少年 </td>
        <td class="tableword">4 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">河島正 </td>
      </tr>
      <tr>
        <td class="tableword">30 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 大正夢幻奇譚 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">冰栗優 </td>
      </tr>
      <tr>
        <td class="tableword">31 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> D-LIVE生存競爭 </td>
        <td class="tableword">9 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">皆川亮二 </td>
      </tr>
      <tr>
        <td class="tableword">32 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 王牌至尊 </td>
        <td class="tableword">23 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">安童夕馬 </td>
      </tr>
      <tr>
        <td class="tableword">33 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 奈緒子 </td>
        <td class="tableword">30 </td>
        <td class="tableword">台灣東販 </td>
        <td class="tableword">中原裕 </td>
      </tr>
      <tr>
        <td class="tableword">34 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 我家開葬儀社 </td>
        <td class="tableword">1 </td>
        <td class="tableword">台灣東販 </td>
        <td class="tableword">水野圖筆 </td>
      </tr>
      <tr>
        <td class="tableword">35 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> ZETMAN超魔人 </td>
        <td class="tableword">4 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">桂正和 </td>
      </tr>
      <tr>
        <td class="tableword">36 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 特殊救難隊 </td>
        <td class="tableword">5 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">久保美津 </td>
      </tr>
      <tr>
        <td class="tableword">37 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 美味大挑戰 </td>
        <td class="tableword">22 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">花喋昭 </td>
      </tr>
      <tr>
        <td class="tableword">38 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 巨人 </td>
        <td class="tableword">8 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">山田芳裕 </td>
      </tr>
      <tr>
        <td class="tableword">39 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 草莓100% </td>
        <td class="tableword">14 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">河下水希 </td>
      </tr>
      <tr>
        <td class="tableword">40 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 魔兵傳奇 </td>
        <td class="tableword">8 </td>
        <td class="tableword">青文 </td>
        <td class="tableword">安西信行 </td>
      </tr>
      <tr>
        <td class="tableword">41 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 野獸之都 </td>
        <td class="tableword">1 </td>
        <td class="tableword">長鴻 </td>
        <td class="tableword">武 </td>
      </tr>
      <tr>
        <td class="tableword">42 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 天使心 </td>
        <td class="tableword">14 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">北條司 </td>
      </tr>
      <tr>
        <td class="tableword">43 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 內衣教父 </td>
        <td class="tableword">71 </td>
        <td class="tableword">大然 </td>
        <td class="tableword">新田 </td>
      </tr>
      <tr>
        <td class="tableword">44 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 怨恨屋本舖 </td>
        <td class="tableword">8 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">栗原正尚 </td>
      </tr>
      <tr>
        <td class="tableword">45 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 閃靈2人組 </td>
        <td class="tableword">29 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">綾峰欄人 </td>
      </tr>
      <tr>
        <td class="tableword">46 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 愛的空位 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">青海信濃 </td>
      </tr>
      <tr>
        <td class="tableword">47 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 棒球兄弟 </td>
        <td class="tableword">20 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">松島幸太 </td>
      </tr>
      <tr>
        <td class="tableword">48 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 異變者 </td>
        <td class="tableword">5 </td>
        <td class="tableword">台灣東販 </td>
        <td class="tableword">山本英夫 </td>
      </tr>
      <tr>
        <td class="tableword">49 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 虛天遊方記 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">蓮見桃衣 </td>
      </tr>
      <tr>
        <td class="tableword">50 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> TSUBASA翼 </td>
        <td class="tableword">9 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">CLAMP </td>
      </tr>
      <tr>
        <td class="tableword">51 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 替身情人 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">深井結己 </td>
      </tr>
      <tr>
        <td class="tableword">52 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 藥師寺涼子怪奇事件簿 </td>
        <td class="tableword">1 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">垣野內成 </td>
      </tr>
      <tr>
        <td class="tableword">53 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 把心放進來 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">新也美樹 </td>
      </tr>
      <tr>
        <td class="tableword">54 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 海難英雄 </td>
        <td class="tableword">1 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">武內勇治 </td>
      </tr>
      <tr>
        <td class="tableword">55 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 心理醫恭介 </td>
        <td class="tableword">1 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">沖本秀 </td>
      </tr>
      <tr>
        <td class="tableword">56 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 特選幕之內 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尖端 </td>
        <td class="tableword">漥之內英 </td>
      </tr>
      <tr>
        <td class="tableword">57 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 寄生少女 </td>
        <td class="tableword">1 </td>
        <td class="tableword">台灣角川 </td>
        <td class="tableword">杉基 </td>
      </tr>
      <tr>
        <td class="tableword">58 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 東大特訓班 </td>
        <td class="tableword">6 </td>
        <td class="tableword">台灣東販 </td>
        <td class="tableword">三田紀房 </td>
      </tr>
      <tr>
        <td class="tableword">59 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 火箭人 </td>
        <td class="tableword">9 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">加藤元浩 </td>
      </tr>
      <tr>
        <td class="tableword">60 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"> 夢是永恆 </td>
        <td class="tableword">0 </td>
        <td class="tableword">尊龍文化 </td>
        <td class="tableword">志水 </td>
      </tr>
    </table>    </td>
  </tr>
  <tr>
    <td colspan="2"><p>&nbsp;</p>      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>

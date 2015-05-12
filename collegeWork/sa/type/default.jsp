<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>預設畫面</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" height="971" border="1" align="center">
  <tr>
    <td width="71" height="68">&nbsp;</td>
    <td width="362"><p><a href="change.jsp">更改註冊資料</a>　<a href="check.jsp">查詢借閱狀況</a>　預約新書　線上試閱</p></td>
  </tr>
  <tr valign="top">
    <td><p>你好</p>
        <p><a href="logout.jsp">登出</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>不分類新書 </strong></td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="8%"><strong>序號 </strong></td>
        <td class="tabletitle" width="15%"><strong>類別 </strong></td>
        <td class="tabletitle" width="25%"><strong>書名 </strong></td>
        <td class="tabletitle" width="10%"><strong>集數 </strong></td>
        <td class="tabletitle" width="15%"><strong>出版社 </strong></td>
        <td class="tabletitle" width="15%"><strong>作者 </strong></td>
        <td class="tabletitle" width="15%"><strong>出版日期 </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6908')">七龍珠-完全版 </a></td>
        <td class="tableword">13 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">鳥山明 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6919')">名偵探柯南特別篇 </a></td>
        <td class="tableword">23 </td>
        <td class="tableword">青文 </td>
        <td class="tableword">青山剛昌 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6920')">帝王之道 </a></td>
        <td class="tableword">1 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">志名阪高 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6923')">帝王之道 </a></td>
        <td class="tableword">2 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">志名阪高 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">少年漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6924')">魔偵探洛基RAGNAROK </a></td>
        <td class="tableword">5 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">木下 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">少女漫畫 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6925')">攜手同行-輪椅少女的真實故事</a></td>
        <td class="tableword">0 </td>
        <td class="tableword">東立 </td>
        <td class="tableword">折原美都 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6890')">猛龍過江 </a></td>
        <td class="tableword">2 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">骷髏精靈 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6891')">逍遙修神行 </a></td>
        <td class="tableword">15 </td>
        <td class="tableword">先創 </td>
        <td class="tableword">葉星 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6900')">異世帝王行 </a></td>
        <td class="tableword">24 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">網路騎士 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6901')">狡猾的風水相師 </a></td>
        <td class="tableword">20 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">焚摩 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6902')">魔幻星際 </a></td>
        <td class="tableword">10 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">流浪的蛤 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6904')">雷霆武士 </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">火槍手</td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6883')">都市妖(二) </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">蓋亞 </td>
        <td class="tableword">可蕊 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6905')">執法者 </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">小說頻 </td>
        <td class="tableword">幽靈大士 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6884')">鬼律師 </a></td>
        <td class="tableword">6 </td>
        <td class="tableword">承普 </td>
        <td class="tableword">丘達可 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6907')">你死我活 </a></td>
        <td class="tableword">9 </td>
        <td class="tableword">鮮鮮 </td>
        <td class="tableword">碎石 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6885')">虛空仙界 </a></td>
        <td class="tableword">1 </td>
        <td class="tableword">承普 </td>
        <td class="tableword">青冥 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6909')">貪睡狀師 </a></td>
        <td class="tableword">9 </td>
        <td class="tableword">鮮鮮 </td>
        <td class="tableword">聽語 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6886')">神魔 </a></td>
        <td class="tableword">18 </td>
        <td class="tableword">承普 </td>
        <td class="tableword">血紅 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6910')">無境玄兵 </a></td>
        <td class="tableword">14 </td>
        <td class="tableword">鮮鮮 </td>
        <td class="tableword">玄兵貓 </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
    </table>
</td>
  </tr>
</table>
</body>
</html>

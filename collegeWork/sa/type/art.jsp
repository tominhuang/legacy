<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>文藝小說</title>
</head>

<body>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<table width="80%" border="1" align="center" bgcolor="#CC33FF">
  <tr>
    <td width="15%" height="68">&nbsp;</td>
    <td width="85%"><p><a href="change.jsp">更改註冊資料</a>　<a href="check.jsp">查詢借閱狀況</a>　預約新書　線上試閱</p></td>
  </tr>
  <tr valign="top">
    <td><p>你好,藝術家</p>
        <p><a href="logout.jsp">登出</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>文藝小說書籍排行 </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="8%"><strong>名次 </strong></td>
        <td class="tabletitle" width="15%"><strong>類別 </strong></td>
        <td class="tabletitle" width="20%"><strong>書名 </strong></td>
        <td class="tabletitle" width="20%"><strong>最新集數 </strong></td>
        <td class="tabletitle" width="15%"><strong>出版社 </strong></td>
        <td class="tabletitle" width="15%"><strong>作者 </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 冤家鴛家 </td>
        <td class="tableword">858 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">洛煒 </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 野獸淑女 </td>
        <td class="tableword">55 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">季璃 </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 親親小管家 </td>
        <td class="tableword">56 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">四月 </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 首席大亨 </td>
        <td class="tableword">859 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">喬琪 </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 我愛小姨子 </td>
        <td class="tableword">54 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">阿潼 </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 冷孤鷹的水芙蓉 </td>
        <td class="tableword">53 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">蘇打 </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 總裁的嬌貴女友 </td>
        <td class="tableword">51 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">憐憐 </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 這一次玩真的 </td>
        <td class="tableword">455 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">路可可 </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 獨身貴族 </td>
        <td class="tableword">863 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">孟華 </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 料理娘娘腔 </td>
        <td class="tableword">385 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">忻彤 </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 記得那次約定 </td>
        <td class="tableword">127 </td>
        <td class="tableword">龍吟出版社 </td>
        <td class="tableword">樓采凝 </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 不做你的妾 </td>
        <td class="tableword">456 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">蘇柚 </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 麻煩讓一讓 </td>
        <td class="tableword">860 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">湛清 </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 王爺難伺侯 </td>
        <td class="tableword">384 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">夏蕗 </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 騙個老婆回家疼 </td>
        <td class="tableword">857 </td>
        <td class="tableword">狗屋出版社 </td>
        <td class="tableword">紫荊 </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 詐愛矇混騙 </td>
        <td class="tableword">2866 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">可兒 </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 男人,禍水 </td>
        <td class="tableword">129 </td>
        <td class="tableword">龍吟出版社 </td>
        <td class="tableword">呢喃 </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 暴龍總裁 </td>
        <td class="tableword">133 </td>
        <td class="tableword">龍吟出版社 </td>
        <td class="tableword">湛亮 </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 玉人不淑 </td>
        <td class="tableword">2860 </td>
        <td class="tableword">禾馬出版社 </td>
        <td class="tableword">蘭京 </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">文藝小說 </td>
        <td class="tableword"> 男朋友,請等等 </td>
        <td class="tableword">493 </td>
        <td class="tableword">禾揚 </td>
        <td class="tableword">七喜 </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

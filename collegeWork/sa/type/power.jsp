<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>武俠小說</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" border="1" align="center" bgcolor="#CC9933">
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">更改註冊資料</a>　<a href="check.jsp">查詢借閱狀況</a>　預約新書　線上試閱</p></td>
  </tr>
  <tr valign="top">
    <td><p>你好,大俠</p>
        <p><a href="logout.jsp">登出</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>武俠小說書籍排行 </strong>(2005-05-10 ~ 2005-06-10) </td>
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
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 小兵傳奇 </td>
        <td class="tableword">21 </td>
        <td class="tableword">恆嘉 </td>
        <td class="tableword">玄雨 </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 邊荒傳說 </td>
        <td class="tableword">45 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">黃易 </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 誅仙 </td>
        <td class="tableword">15 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">蕭鼎 </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 異人傲世錄 </td>
        <td class="tableword">29 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">明寐 </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 天書傳承者 </td>
        <td class="tableword">2 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">HELP HER </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 飄邈之旅 </td>
        <td class="tableword">28 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">蕭潛 </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 仙劍神曲II(戊) </td>
        <td class="tableword">5 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">牛語者 </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 仙人傳奇 </td>
        <td class="tableword">5 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">鬼面 </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 眠月魔情錄II </td>
        <td class="tableword">9 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">時之舞者 </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 靈動 </td>
        <td class="tableword">11 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">火槍手 </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 幻世道 </td>
        <td class="tableword">13 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">忘我 </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 斬風 </td>
        <td class="tableword">12 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">甲子 </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 通緝狂想曲-完 </td>
        <td class="tableword">9 </td>
        <td class="tableword">天恩書報社 </td>
        <td class="tableword">海城 </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 神魔變 </td>
        <td class="tableword">26 </td>
        <td class="tableword">冒險者天堂 </td>
        <td class="tableword">白夜 </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 龍戰士正傳 </td>
        <td class="tableword">8 </td>
        <td class="tableword">河圖 </td>
        <td class="tableword">半隻青蛙 </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 流氓聖皇 </td>
        <td class="tableword">3 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">御流風 </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 異俠 </td>
        <td class="tableword">19 </td>
        <td class="tableword">遊戲頻道 </td>
        <td class="tableword">自在 </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 商賈人生 </td>
        <td class="tableword">6 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">思銘 </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 傭者領域 </td>
        <td class="tableword">12 </td>
        <td class="tableword">小說頻道 </td>
        <td class="tableword">晨夜 </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">武俠小說 </td>
        <td class="tableword"> 魔武士II </td>
        <td class="tableword">3 </td>
        <td class="tableword">鮮鮮文化 </td>
        <td class="tableword">藍晶 </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

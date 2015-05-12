<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>管理介面</title>
<style type="text/css">
<!--
.style1 {
	font-size: xx-large;
	font-weight: bold;
	font-family: "標楷體";
}
-->
</style>
</head>

<body>
<p>
  <%
    String admin=(String)session.getAttribute("admin");
    if(!admin.equals("ok")){
		response.sendRedirect("index.htm");
    }	 
%>
</p>
<p align="center" class="style1">烏龍院管理介面 </p>
<table width="100%" border="1">
  <tr>
    <td>顧客管理</td>
    <td>電子報</td>
    <td>存貨管理</td>
  </tr>
  <tr>
    <td><a href="add.htm">新增</a></td>
    <td><a href="mail/single.htm">個別寄信</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="update.jsp">修改</a></td>
    <td><a href="mail/group.htm">群組寄信</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="query.jsp">查詢</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="delete.htm">刪除</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p><a href="logout.jsp">登出</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>

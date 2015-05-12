<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>搜尋</title>
</head>

<body>
．<a href="query_all.jsp">列出所有顧客的資料</a><br>
<br>
．條件搜尋
<br><br>
<form name="form1" method="post" action="query_option.jsp">
  　搜尋項目：
    <select name="select">
      <option value="1" selected>姓名</option>
      <option value="2">生日</option>
      <option value="3">電話</option>
      <option value="4">帳號</option>
    </select> 
    關鍵字
    <input type="text" name="textfield">
    <input type="submit" name="Submit" value="送出">

</form>
</body>
</html>

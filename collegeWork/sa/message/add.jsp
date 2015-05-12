<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>新增文章</title>
</head>

<body>
<form name="form1" method="post" action="add_deal.jsp">
  <p>姓名：
    <input type="text" name="textfield1">
</p>
  <p>標題：
    <input name="textfield2" type="text" size="50">
</p>
  <p>內容：</p>
  <p>
    <textarea name="textarea" cols="100" rows="10"></textarea>
</p>
  <p>
    <input type="submit" name="Submit" value="送出">
</p>
</form>
</body>
</html>

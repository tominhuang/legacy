<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>註冊會員</title>
</head>

<body>
<p>請輸入以下資料</p>
<form name="form1" method="post" action="register.jsp">
  <table width="50%" border="0">
    <tr>
      <td>姓名</td>
      <td><input type="text" name="textfield1"></td>
    </tr>
    <tr>
      <td>生日</td>
      <td><input name="textfield2" type="text" value="1980/01/01"></td>
    </tr>
    <tr>
      <td>住址</td>
      <td><input type="text" name="textfield3"></td>
    </tr>
    <tr>
      <td>電話</td>
      <td><input type="text" name="textfield4"></td>
    </tr>
    <tr>
      <td>信箱</td>
      <td><input type="text" name="textfield5"></td>
    </tr>
    <tr>
      <td>電子報信箱</td>
      <td><input type="text" name="textfield6"></td>
    </tr>
    <tr>
      <td>帳號</td>
      <td><input type="text" name="textfield7"></td>
    </tr>
    <tr>
      <td>密碼</td>
      <td><input type="text" name="textfield8"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><input type="submit" name="Submit" value="送出"></td>
      <td><input type="reset" name="Submit2" value="清除"></td>
    </tr>
  </table>
</form>

</body>
</html>

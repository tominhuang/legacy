<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>修改</title>
</head>
<%
	request.setCharacterEncoding("big5");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select * from customer";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);	
%>
<body>
<center>
  <br>
  <form name="form1" method="post" action="update_put.jsp">
    <p>
      <select name="select">
          <option selected>請選擇修改對象</option>
          <%while(rs.next()){%>
          <option value="<%=rs.getString(1)%>">===<%=rs.getString(1)%>===</option>
          <%}%>
      </select>
    </p>
    <hr>
    <br>
    <table width="35%" border="0">
      <tr>
        <td width="33%"><input name="checkbox0" type="checkbox" value="checkbox">
          姓名</td>
        <td width="67%"><input type="text" name="textfield0"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox1" value="checkbox">
          生日</td>
        <td><input name="textfield1" type="text"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox2" value="checkbox">
          住址</td>
        <td><input type="text" name="textfield2"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox3" value="checkbox">
          電話</td>
        <td><input type="text" name="textfield3"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox4" value="checkbox">
          信箱</td>
        <td><input type="text" name="textfield4"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox5" value="checkbox">
          電子報信箱</td>
        <td><input type="text" name="textfield5"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox6" value="checkbox">
          是否為VIP</td>
        <td><select name="VIP">
          <option value="0" selected>否</option>
          <option value="1">是</option>
        </select></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox7" value="checkbox">
          帳號</td>
        <td><input name="textfield6" type="text" id="textfield6"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox8" value="checkbox">
          密碼</td>
        <td><input name="textfield7" type="text" id="textfield7"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox9" value="checkbox">
          類型</td>
        <td><select name="type">
          <option value="尚未定義" selected>尚未定義</option>
          <option value="少年漫畫">少年漫畫</option>
          <option value="少女漫畫<">少女漫畫</option>
          <option value="武俠小說">武俠小說</option>
          <option value="文藝小說">文藝小說</option>
                        </select></td>
      </tr>
    </table>
    <p>提示：請自行勾選要修改的選項。</p>
    <p>
      <input type="submit" name="Submit" value="確定修改">
    </p>
  </form>
</center>
</body>
</html>

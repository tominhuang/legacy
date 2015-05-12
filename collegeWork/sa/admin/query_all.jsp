<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>管理介面</title>
</head>
<form name="form1" method="post" action="">
  <div align="center">排序：
    <select name="select">
      <option value="0" selected>預設</option>
            </select>
    <input name="radiobutton" type="radio" value="radiobutton" checked>
    無    
 <input name="radiobutton" type="radio" value="radiobutton">
    升冪
    <input name="radiobutton" type="radio" value="radiobutton"> 
    降冪
</div>
</form>
<body>
  <%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root");
    String sql = "select * from customer";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	
	out.print("<table border=1 width=\"100%\">");
	out.print("<th>姓名</th><th>生日</th><th>住址</th><th>電話</th><th>信箱</th><th>電子報信箱</th><th>是否為VIP</th><th>帳號</th><th>類型</th>");
	  while(rs.next()){
	    out.print("<tr>");
	    for(int i=1;i<=8; i++)
	      out.print("<td>" + rs.getString(i)+ "</td>");
		out.print("<td>" + rs.getString("type")+ "</td>");
	    out.print("</tr>");
	  }
	out.print("</table>");
	out.print("<center><br><a href=\"main.jsp\">回管理介面</center>");	
	rs.close();
    con.close();
%>
</body>
</html>

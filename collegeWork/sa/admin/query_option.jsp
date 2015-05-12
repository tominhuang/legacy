<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=MS950">
<title>條件搜尋結果</title>
</head>

<body>
<%
	request.setCharacterEncoding("Big5");
	String select=(String)request.getParameter("select");
	String keyword=(String)request.getParameter("textfield");	
	String option=null;
	if(select.equals("1"))option="Name";
    else if(select.equals("2"))option="Birth_Date";
    else if(select.equals("3"))option="Phone";	
    else if(select.equals("4"))option="id";
	else response.sendRedirect("query.jsp");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select * from customer where " + option + "='" + keyword + "'";
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
	rs.close();
    con.close();
%>
</body>
</html>

<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>刪除</title>
</head>

<body>
<%
	String select=(String)request.getParameter("select");
	String keyword=(String)request.getParameter("textfield");	
	String option=null;
	if(select.equals("1"))option="Name";
    else if(select.equals("2"))option="Birth_Date";
    else if(select.equals("3"))option="Phone";	
    else if(select.equals("4"))option="id";
	else response.sendRedirect("delete.jsp");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "delete from customer where " + option + "='" + keyword + "'";
    Statement stmt = con.createStatement();
    stmt.executeUpdate(sql);
    con.close();
	out.print("資料已刪除<br><br>");
	out.print("<a href=\"main.jsp\">回管理介面");	
%>
</body>
</html>

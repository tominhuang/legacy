<%-- Cookie要用的import --%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>刪除文章</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<body>
<%
	//接收字串
	String id=(String)request.getParameter("id");
	String password=(String)request.getParameter("password");
	//查詢密碼	
    String query = "select password from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
	rs.last();
	String dbpass=rs.getString("password");
		
	if(!password.equals(dbpass)){//如果密碼不符
		out.print("<br><br><br><br><br><br><br><br><br><br><center>");
		out.print("密碼錯誤<br><br>");
		out.print("三秒後自動返回</center>");				
		response.setHeader("Refresh","3;URL=message_single.jsp?id="+id);
	}
	else{
		String del_article="delete from message_whole where id="+id;
		String del_push="delete from message_single where article_id="+id;
		stmt.executeUpdate(del_article);
		stmt.executeUpdate(del_push);
		response.sendRedirect("message.jsp");
	}
	stmt.close();
	con.close();
%>
</body>
</html>

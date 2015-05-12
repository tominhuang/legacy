<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>編輯文章處理</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<body>
<%

	//接收字串
	String id=(String)request.getParameter("id");
	String oldpass=(String)request.getParameter("old_password");
	//查詢密碼	
    String query = "select password from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
	rs.last();
	String dbpass=rs.getString("password");
		
	if(!oldpass.equals(dbpass) || oldpass.equals("null")){//如果密碼不符
		out.print("<br><br><br><br><br><br><br><br><br><br><center>");
		out.print("密碼錯誤<br><br>");
		out.print("三秒後自動返回</center>");				
		response.setHeader("Refresh","3;URL=edit.jsp?id="+id);
	}
	else{//修改文章
		//接收字串
		String author=(String)request.getParameter("name");
		String title=(String)request.getParameter("title");
		String newpass=(String)request.getParameter("new_password");
		String article=(String)request.getParameter("article");
		out.print(author);
		String update="update message_whole set author='"+author+"',title='"+title+"',article='"+article+"',password='"+newpass+"' where id='"+id+"'";		
		stmt.executeUpdate(update);
		response.sendRedirect("message_single.jsp?id="+id);
	}
	stmt.close();
	con.close();
%>	
</body>
</html>

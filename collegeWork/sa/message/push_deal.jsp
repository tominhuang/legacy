<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>處理推文</title>
</head>
<body>
<%
	request.setCharacterEncoding("big5");
	String name=(String)request.getParameter("textfield1");
	String word=(String)request.getParameter("textfield2");
	String value=(String)request.getParameter("radiobutton");
	String IP=(String)request.getRemoteAddr();
	String article_id=(String)request.getParameter("article_id");
	Date time;
	
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
	if(!name.equals("") && !word.equals("")){
		String up="insert into message_single(push_name,push_word,value,time,IP,article_id) values('"+name+"','"+word+"','"+value+"',NOW(),'"+IP+"','"+article_id+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
	}
	response.sendRedirect("message_single.jsp?id="+article_id);
%>
</body>
</html>

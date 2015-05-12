<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>處理登入</title>
</head>

<body>
<%
	String id=request.getParameter("textfield1");
	String password=request.getParameter("textfield2");

	if(id.equals("admin") && password.equals("1234")){
		session.setAttribute("admin","ok");		
	}
	response.sendRedirect("admin.jsp");
%>
</body>
</html>

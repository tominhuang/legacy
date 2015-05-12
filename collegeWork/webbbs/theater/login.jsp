<%--Cookie要用的import--%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>登入</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<body>
<%
	String id=request.getParameter("textfield1");
	String password=request.getParameter("textfield2");
	String cookie=(String)request.getParameter("checkbox");	
	
	if(cookie!=null && cookie.equals("true")){
		//設定cookie
		Cookie cookie1 = new Cookie(URLEncoder.encode("id"),URLEncoder.encode(id));
		Cookie cookie2 = new Cookie(URLEncoder.encode("password"),URLEncoder.encode(password));		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	}

	if(id.equals("second") && password.equals("secret")){
  		session.setAttribute("theater","ok");
		response.sendRedirect("http://tomin.twbbs.org:8080/theater/message.jsp");
	}  
	else{
  		out.println("<br><br><br><br><center>Access denied.</center>");
  		response.setHeader("Refresh","3;URL=index.jsp"); 
	} 
%>
</body>
</html>

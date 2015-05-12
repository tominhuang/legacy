<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員專區</title>
</head>

<body>
<%
    String login=(String)session.getAttribute("login");
    String type=(String)session.getAttribute("type");

    if(login!=null && login.equals("ok")){
	    if(type.equals("少年漫畫"))response.sendRedirect("type/boy.jsp");
		else if(type.equals("少女漫畫"))response.sendRedirect("type/girl.jsp");
		else if(type.equals("武俠小說"))response.sendRedirect("type/power.jsp");
		else if(type.equals("文藝小說"))response.sendRedirect("type/art.jsp");
		else response.sendRedirect("type/default.jsp");
	}
    else{
	    out.print("<center><b>登入錯誤</b><br><br>");
		out.print("您尚未登入會員<br><br>");
	    out.print("五秒後將自動返回首頁</center>");		
		response.setHeader("Refresh","5;URL=index.jsp");
    }	 
%>

</body>
</html>

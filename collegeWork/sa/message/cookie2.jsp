
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
</head>

<body>

<%
	Cookie rcookie[] = request.getCookies();
	if (rcookie == null)
		out.print("讀不到cookie");
	else
	{
		for (int i = 0; i < rcookie.length; i++)
		{
			if (URLDecoder.decode(rcookie[i].getName()).equals("中文"))
			{
				out.print(URLDecoder.decode(rcookie[i].getName()) + "<br>" +
				URLDecoder.decode(rcookie[i].getValue()));
			}
		}
	}
%>
</body>
</html>

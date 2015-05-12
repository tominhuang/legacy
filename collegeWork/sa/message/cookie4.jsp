<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
</head>

<body>
 <table border=1>
<tr><td>Name</td><td>value</td></tr>
<%
Cookie cookies[]=request.getCookies();
Cookie sCookie=null;
String svalue=null;
String sname=null;
for(int i=0;i<cookies.length;i++)
{
sCookie=cookies[i];
svalue=sCookie.getValue();
sname=sCookie.getName();
%>
<tr><td><%=sname%></td><td><%=svalue%></td></tr>
<%
}
%>
</table>
</body>
</html>

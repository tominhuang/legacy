<%-- session 的 include --%>
<%@ include file="session.jsp" %>
<%-- Cookie要用的import --%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>新增文章</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<script language="javascript">
function checkdata() {
   	var a = document.form.textfield1.value;
   	var b = document.form.textfield2.value;
   	if(a=="" || b==""){
   		alert("姓名和標題一定要填！");
		return false;
	}
	else if(a.length>12)
   		alert("姓名太長囉！");
	else if(b.length>90)
   		alert("標題太長囉！");				
	else{
		return true;
	}			
}
</script>
<%
	String id="";
	String pass="";
	//取得cookie
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
		{
			if (URLDecoder.decode(rcookie[i].getName()).equals("帳號"))
				id=URLDecoder.decode(rcookie[i].getValue());
			if (URLDecoder.decode(rcookie[i].getName()).equals("密碼"))
				pass=URLDecoder.decode(rcookie[i].getValue());			
		}
%>	
<body>
<form name="form" method="post" action="add_deal.jsp">
  <p align="center">姓名：
    <input type="text" name="textfield1" value="<%=id%>">
密碼：
    <input type="password" name="textfield3" value="<%=pass%>">
</p>
  <p align="center">標題：
    <input name="textfield2" type="text" size="50">
</p>
  <p>
    <textarea name="textarea" cols="120" rows="20"></textarea>
</p>
  <p align="center">
    <input type="submit" name="Submit" value="送出" onclick="return checkdata()">
</p>
</form>
</body>
</html>

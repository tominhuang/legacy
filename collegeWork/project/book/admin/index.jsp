<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>社會化電子書革命</title>
<STYLE>
<!--
@import URL(include/style.css);
-->
</STYLE>
</head>
<script language="javascript">
function setfocus(){
        document.form.textfield1.focus();
        return;
}
</script>
<body>
<body onLoad="setfocus()">
<br><br>
<br><br>
<br><br>

<center>
	社會化電子書革命<br><br>
	<form name="form" method="post" action="check/login.jsp">
	帳號：<input type="text" name="textfield1"><p></p>
	密碼：<input type="password" name="textfield2"><p></p>
	<input type="submit" name="Submit" value="登入">    
	</form>
	<br><br>
</center>
			
</body>
</html>

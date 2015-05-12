<%@ page contentType="text/html; charset=big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Internet Identification System</title>
<STYLE>
<!--
@import URL(include/style.css);
.style1 {font-size: 12pt}
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
<form name="form" method="post" action="check/login.jsp">
  <p>ID:
    <input type="text" name="textfield1">¡@
    ¡@Password:
      <input type="password" name="textfield2">
    <input type="submit" name="Submit" value="Login">
  </p>
</form>

			
</body>
</html>

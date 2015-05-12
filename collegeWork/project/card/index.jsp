<%@ page contentType="text/html; charset=big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${sessionScope.id!=null}">
		<c:redirect url="user/main.jsp"/>
	</c:if>


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

<base target="bottom"/>
<body topmargin="0">
<div align="center">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="650" height="390">
    <param name="movie" value="sample1.swf">
    <param name="quality" value="high">
    <embed src="sample1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="650" height="390"></embed>
  </object>
  <iframe src="login.jsp" height="200" width="600" align="middle" style="border:none" name="bottom">
</iframe>
</div>



</body>
</html>

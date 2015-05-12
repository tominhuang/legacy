<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<div align="center">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="770" height="120">
    <param name="movie" value="banner.swf" />
    <param name="quality" value="high" />
    <embed src="banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="770" height="120"></embed>
  </object>
</div>
<div align="right">Signed in as <b><fmt:formatNumber value="${sessionScope.id}" minIntegerDigits="9" groupingUsed="false"/></b>¡@<a href="../check/logout.jsp" target="_top">Sign out</a>¡@¡@¡@¡@</div>

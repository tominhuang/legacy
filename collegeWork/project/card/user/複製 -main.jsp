<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>

<p align="center">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="1000" height="80">
    <param name="movie" value="../banner/banner_f.swf" />
    <param name="quality" value="high" />
    <embed src="../banner/banner_f.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1000" height="80"></embed>
  </object>
</p>
<div align="center">
<p>ID <fmt:formatNumber value="${sessionScope.id}" minIntegerDigits="9" groupingUsed="false"/>
, Welcome to Internet Identification System! </p>
<p>&nbsp;</p>
<p><a href="basic.jsp">Edit Basic Data</a></p>
<p><a href="../optional/optional.jsp">Edit Optional Data</a></p>
<p><a href="../look/design.jsp">Card Design</a></p>
<p><a href="../search/search.jsp">Search</a></p>
<p> <a href="../ip/ip.jsp">Manage Intellectual Property</a></p>
<p><a href="personal/control.jsp">Personal Control</a> </p>
<p><a href="../privacy/privacy.jsp">Privacy</a></p>
<p><a href="../check/logout.jsp">Logout</a></p>
<p><a href="doc/doc.jsp">Documentaion</a></p>
<p> <a href="92306075@nccu.edu.tw">Contact </a></p>
</div>
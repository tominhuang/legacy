<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<div align="center">
	你已經登出
	<form name="form" method="get" action="../chat">
	  <input name="name" type="hidden" size="12" value="系統廣播">
	  <input name="textfield" type="hidden" value="「${sessionScope.name}」離開會議">
	  <input type="submit" name="Submit" value="按此繼續">
	</form>
</div>
<c:remove var="name" scope="session"/>
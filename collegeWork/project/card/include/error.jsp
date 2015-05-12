<%@ page contentType="text/html; charset=big5" errorPage="true" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<br><br><br><br>
	<c:if test="${sessionScope.id!=null}">
		<p>Access deny</p>
	</c:if>
	<c:if test="${sessionScope.rank==null}">	
		<p>"Not log in" or "Idle too long"</p>
	</c:if>	
	<p><a href="../index.jsp" target="_top">Click here to log in</a></p>
</div>
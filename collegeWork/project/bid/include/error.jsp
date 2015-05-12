<%@ page contentType="text/html; charset=big5" errorPage="true" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<br><br><br><br>
	<c:if test="${sessionScope.id!=null}">
		<p>權限不足</p>
	</c:if>
	<c:if test="${sessionScope.rank==null}">	
		<p>您尚未登入或閒置過久</p>
	</c:if>	
	<p><a href="../index.jsp" target="_top">請按此登入</a></p>
</div>
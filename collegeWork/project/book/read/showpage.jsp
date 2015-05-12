<%@ include file="../check/session/read.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>


<c:set var="filedir" value="../file/${param.isbn}/page/${param.page}" />
<c:if test="${param.page=='content.jsp'}">
	<c:set var="filedir" value="../file/${param.isbn}/${param.page}" />
</c:if>
<jsp:include page="${filedir}" />
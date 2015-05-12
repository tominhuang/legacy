<%@ include file="../check/session/read.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>


<c:set var="filedir" value="../file/${param.isbn}/content.jsp" />
<jsp:include page="${filedir}" />
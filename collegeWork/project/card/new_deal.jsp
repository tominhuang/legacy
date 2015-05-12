<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../include/head.jsp" %>
<c:set var="title" value="${param.textfield1}" scope="session"/>
<c:set var="site" value="${param.textfield2}" scope="session"/>
<c:set var="description" value="${param.textarea}" scope="session"/>

<%
	pageContext.setAttribute("IP",request.getRemoteAddr());
%>

<c:if test="${param.stupid=='1'}">
¡@<c:redirect url="stupid.jsp?ip=${IP}"/>
</c:if>
<c:redirect url="${param.textfield3}?ip=${IP}"/>
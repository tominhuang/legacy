<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>

<%--
<sql:query var="user">
  SELECT * FROM user where ip = ${param.ip}
</sql:query>


<sql:query var="no">
  SELECT count(no) FROM identify
</sql:query>

<c:forEach items="${no.rowsByIndex}" var="row">
	<sql:update>
	  INSERT INTO identify
	  VALUES ( ? , ? , ? , ? , ? , ?  , ? , ? , ? , ? )  
	  <sql:param value="${row[0]}" />
	  <sql:param value="${sessionScope.id}" />
	  <sql:param value="${param.portal}" />
	  <sql:param value="${param.portalName}" /> 
	  <sql:param value="${param.site}" />    
	  <sql:param value="${param.siteTitle}" /> 
	  <sql:param value="${param.id2}" />  
	  <sql:param value="default" />  
	  <sql:param value="0" />  
	  <sql:param value="0" />   
	</sql:update>
</c:forEach>
--%>

<c:if test="${param.response!=null}">
	<c:redirect url="${param.response}">
			<c:param name="result" value="true"/>
	</c:redirect>
</c:if>
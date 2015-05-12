<%@ include file="check/session/comment.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<jsp:useBean id="now" class="java.util.Date" />

<sql:update>
  INSERT INTO comment
  VALUES ( ? , ? , ? , ? , ? )  
  <sql:param value="${param.isbn}" />
  <sql:param value="${sessionScope.id}" />
  <sql:param value="${now}" />  
  <sql:param value="${param.textarea}" />
  <sql:param value="${param.select}" />

</sql:update>

<c:redirect url="detail.jsp?isbn=${param.isbn}"/>
<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  UPDATE ch_comment
  SET comment = ?
  WHERE isbn = ${param.textfield0} AND id = 
  <sql:param value="${param.textarea}" /> 
</sql:update>

<sql:query var="result">
  SELECT * FROM ch_comment where Stu_ID = ${param.textfield0}
</sql:query>

<c:redirect url="../frame/demoFrameset.jsp"/>
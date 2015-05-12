<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>>

<sql:update>
  UPDATE member
  SET id = ? , password = ? , email = ? 
  WHERE id = '${param.id}'
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.textfield2}" />

</sql:update>

Finish<br>
<a href="edit.jsp">«ö¦¹Ä~Äò</a>

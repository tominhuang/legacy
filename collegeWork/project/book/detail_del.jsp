<%@ include file="check/session/comment.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<sql:update>
  delete from comment where isbn = '${param.isbn}' and id = '${sessionScope.id}'
</sql:update>

<c:redirect url="detail.jsp?isbn=${param.isbn}"/>
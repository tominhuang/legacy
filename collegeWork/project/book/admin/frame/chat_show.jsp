<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<meta http-equiv="refresh" content="6; url=chat_show.jsp">

<sql:query sql="SELECT * FROM chat ORDER BY ID DESC" var="chat" />
<div align="center">
  <p><font size="5" face="標楷體">專案會議室</font></p>
</div>
<table width="100%" border="0">
  <c:forEach items="${chat.rowsByIndex}" var="chat_put" >
  <tr>
  	 <td>${chat_put[1]}</td>
	 <td width="9%">${chat_put[2]}</td>
  	 <td width="73%">說：${chat_put[3]}</td>
  </tr>
  </c:forEach>
</table>


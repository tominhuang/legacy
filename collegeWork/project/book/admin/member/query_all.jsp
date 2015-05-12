<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<sql:query sql="SELECT * FROM member order by id asc" var="result" />

查詢全部會員<br><br>

共有 ${result.rowCount} 筆資料
<hr>

<table>
	<th>帳號</th><th>密碼</th><th>信箱</th>
	

    <c:forEach items="${result.rowsByIndex}" var="row" >
	<tr>	  
		  <td>${row[0]}</td>
		  <td>${row[1]}</td>
		  <td>${row[2]}</td>
	</tr>		  
    </c:forEach>		


</table>
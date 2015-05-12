<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--查詢符合資料--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo where ${param.select} = '${param.textfield0}'
</sql:query>

<c:choose>
	<c:when test="${bookinfo.rowCount=='0'}">
		查無資料
	</c:when>

	<c:otherwise>
		<p>查詢成功</p>
		<p>書籍基本資料報告單</p>
		<hr>
		<p>總共有 ${bookinfo.rowCount} 筆資料</p>
		<table border="1" cellspacing="0">
		<tr bgcolor="#CCCC99">
			<%--Title--%>
			<th>書名</th><th>作者</th><th>出版社</th><th>出版日期</th><th>ISBN</th><th>類別</th><th>語言</th>
		</tr>
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
			<c:forEach begin="0" end="6" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach>			
			</tr>		
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>		
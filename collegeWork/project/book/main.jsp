<%@ page contentType="text/html; charset=ms950" %>
<%@ include file="include/mysql.jsp" %>
<%@ include file="include/head.jsp" %>

<%--查詢編號對應的類別名稱--%>
<sql:query sql="SELECT * FROM typeno WHERE no = ${param.no}" var="typeno"/>
<c:forEach items="${typeno.rows}" var="typeno_put">
	<c:set value="${typeno_put.type}" var="type" scope="session" />
</c:forEach>
<%@ include file="check/session/count.jsp" %>

<%--查詢符合資料--%>
<sql:query var="bookinfo"> SELECT * FROM bookinfo where type = '${type}' </sql:query> 
<c:choose> <c:when test="${bookinfo.rowCount=='0'}"> 查無資料 </c:when> <c:otherwise> 
<p><u>${type}</u> 總共有 ${bookinfo.rowCount} 筆資料</p>
		<hr>
		<table border="0" cellspacing="0">
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
				<td>
					書名：${row[0]}<br>
					作者：${row[1]}<br>
					出版社：${row[2]}
				</td>			
			</tr>		
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>		
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--查詢符合資料--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo where name like '%${param.textfield}%' 
							OR author like '%${param.textfield}%'
							OR publisher like '%${param.textfield}%'
							OR date like '%${param.textfield}%'
							OR ISBN like '%${param.textfield}%'
							OR type like '%${param.textfield}%'
							OR language like '%${param.textfield}%'
</sql:query>


<sql:query var="tag">
	SELECT * FROM tag natural join bookinfo where tname like '%${param.textfield}%' ORDER BY tcount desc
</sql:query>



<c:choose>
	<c:when test="${bookinfo.rowCount=='0'}">
		<c:if test="${tag.rowCount=='0'}">
		查無資料
		</c:if>

		<c:if test="${tag.rowCount>'0'}">
		<p>查詢成功</p>
		<p>書籍基本資料報告單</p>
		<hr>
		<p>總共有 ${tag.rowCount} 筆資料</p>
		<table border="1" cellspacing="0" width="70%">
		<th>封面</th><th>基本資料</th><th>標籤名稱</th><th>相關性</th>
		<c:forEach items="${tag.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[0]}"><img src="images/${row[0]}.jpg" border="0"></a></td>
				<td>
					書名：${row[3]}<br>
					作者：${row[4]}<br>
					出版社：${row[5]}<br>
					出版日期：${row[6]}<br>						
				</td>
				<td align="center">
					${row[1]}
				</td>
				<td align="center">
					${row[2]}
				</td>

			</tr>	
		</c:forEach>
		</table>
		</c:if>

	</c:when>

	<c:otherwise>
		<p>查詢成功</p>
		<p>書籍基本資料報告單</p>
		<hr>
		<p>總共有 ${bookinfo.rowCount} 筆資料</p>
		<table border="1" cellspacing="0">
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
				<td>
					書名：${row[0]}<br>
					作者：${row[1]}<br>
					出版社：${row[2]}<br>
					出版日期：${row[3]}<br>	
					ISBN：${row[4]}<br>
					類別：${row[5]}<br>	
					語言：${row[6]}							
				</td>

			</tr>	
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>
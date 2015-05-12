<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query var="student">
	<c:choose>
		<%--排序不是空值--%>
		<c:when test="${param.sort!=null}">
			SELECT * FROM student where class_id = ${param.class_id} order by ${param.sort} asc
		</c:when>
		
		<%--學號不是空值--%>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM student where Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--查詢班級--%>
		<c:otherwise>						
			SELECT * FROM student where class_id = ${param.class_id}						
		</c:otherwise>				
	</c:choose>
</sql:query>

<c:choose>
	<c:when test="${student.rowCount=='0'}">
		查無資料
	</c:when>

	<c:otherwise>
		<p>查詢成功</p>
		<p>學生基本資料報告單</p>
		<hr>
		<p>總共有 ${student.rowCount} 筆資料</p>
		<table width="1600" border="1" cellspacing="0">
		<tr bgcolor="#CCCC99">
			<%--班級--%>
			<c:if test="${student.rowCount>'1'}">
				<th><a href="query_deal.jsp?class_id=${param.class_id}&sort=1">學號</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=2">系級</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=3">姓名</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=4">性別</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=5">出生日期</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=6">身分證字號</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=7">地址</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=8">電話</a></th>
				<th><a href="query_deal.jsp?class_id=${param.class_id}&sort=9">手機</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=10">e-mail</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=11">是否為轉學生</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=12">就學狀態</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=13">緊急聯絡人姓名</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=14">與聯絡人關係</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=15">聯絡人電話</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=16">聯絡人手機</a></th>						
			</c:if>
			<%--個人--%>
			<c:if test="${student.rowCount=='1'}">
				<th>學號</th><th>系級</th><th>姓名</th><th>性別</th><th>出生日期</th><th>身分證字號</th><th>地址</th><th>電話</th>
				<th>手機</th><th>e-mail</th><th>是否為轉學生</th><th>就學狀態</th><th>緊急聯絡人姓名</th><th>與聯絡人關係</th><th>聯絡人電話</th><th>聯絡人手機</th>						
			</c:if>			
		</tr>
		<c:forEach items="${student.rowsByIndex}" var="row">		
			<c:if test="${row[3]=='女'}">
				<tr align="center" bgcolor="#eecccc">
			</c:if>
			<c:if test="${row[3]=='男'}">		
				<tr align="center" bgcolor="#ccccee">
			</c:if>	
			<c:forEach begin="0" end="9" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach>
			<td>
			<c:if test="${row[10]=='false'}">
				否
			</c:if>
			<c:if test="${row[10]=='true'}">		
				是
			</c:if>
			</td>
			<c:forEach begin="11" end="15" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach> 			 			
			</tr>		
		</c:forEach>
	</table>
	</c:otherwise>
</c:choose>		
<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--查詢特殊疾病記錄資料--%>
<sql:query var="register">
    <c:choose>
		
		<%--學號--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM REGISTER NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.textfield0}
		</c:when>
		
		<%--班級--%>
		<c:otherwise>			
		  	SELECT * FROM REGISTER NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.CLASS_ID = ${param.select0} 
		</c:otherwise>
		
	</c:choose>
</sql:query>


<%--置中開始--%>
<div align="center">
	<%--特殊疾病記錄是否存在--%>
	<c:choose>
	
		<%--不存在--%>
		<c:when test="${register.rowCount=='0'}">
			查無資料
		</c:when>
			
		<%--存在--%>
		<c:otherwise>
			<p>查詢成功</p>
			<p>特殊疾病記錄報告單</p>
			<hr>
			<p>總共有 ${register.rowCount} 筆資料</p>		
			<table border="1" cellspacing="0">
				<tr bgcolor="#CCCC99">
					<th>學號</th><th>特殊疾病名稱</th><th>登錄日期</th><th>特殊疾病說明</th>
				</tr>

				<c:forEach items="${register.rowsByIndex}" var="register_put">
					<tr align="center" bgcolor="#ccccee">
						<td>${register_put[4]}</td>
						<sql:query var="disease">
						  SELECT * FROM disease where Disease_ID = ${register_put[1]}
						</sql:query>
						<c:forEach items="${disease.rowsByIndex}" var="disease_put">
							<td>${disease_put[1]}</td>
						</c:forEach>
						<td>${register_put[2]}</td>						
						<td>${register_put[3]}</td>						
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
		<%--存在--%>
	</c:choose>
	<%--特殊疾病記錄是否存在--%>						
</div>
<%--置中結束--%>
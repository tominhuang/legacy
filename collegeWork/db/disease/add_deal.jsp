<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT HER_ID FROM HER WHERE STU_ID = ${param.stu_id}" var="HER"/>
<c:forEach items="${HER.rows}" var="HER_put">
	<c:set value="${HER_put.HER_ID}" var="HER_ID"/>
</c:forEach>

<%--置中開始--%>
<div align="center">
	<%--是否有健檢資料開始--%>
	<c:choose>
		<%--沒有健檢資料--%>
		<c:when test="${HER.rowCount=='0'}">
			<br><br>沒有學號 ${param.stu_id} 的健檢資料
		</c:when>
		
		<%--有健檢資料開始--%>
		<c:otherwise>
			<%--讀取add.jsp傳過來的檢查結果--%>
			<c:forEach begin="1" end="12" var="item" varStatus="s">
				<% 
					int i = ((Integer) pageContext.getAttribute("item")).intValue();
					pageContext.setAttribute("text", "text"+i);		
				%>
				<%--如果有檢查--%>
				<c:if test="${param[text]!=''}">
					<sql:update>
					
						INSERT INTO Register
						VALUES ( ? , ? , ? , ? )
						
						<sql:param value="${HER_ID}"/>			
						<sql:param value="${item}"/>
						<sql:param value="${param.select1}+${param.select2}+${param.select3}"/>
						<sql:param value="${param[text]}"/>
						
					</sql:update>					
				</c:if>
			</c:forEach>  
			
			
			<sql:query var="register">
			  SELECT * FROM register where HER_ID = ${HER_ID}
			</sql:query>		
	
			<p>新增成功</p>
			特殊疾病記錄報告單
			<hr>
			<p>以下是學號 ${param.stu_id} 所有的特殊疾病記錄</p>
			<table border="1">
				<tr>
					<th>編號</th><th>特殊疾病名稱</th><th>登錄日期</th><th>特殊疾病說明</th>
				</tr>
				<c:forEach items="${register.rowsByIndex}" var="register_put">
					<tr align="center">
						<td>${register_put[0]}</td>
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
		<%--有健檢資料結束--%>
	</c:choose>
	<%--是否有健檢資料結束--%>						
</div>
<%--置中結束--%>
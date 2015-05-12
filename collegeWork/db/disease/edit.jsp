<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--置中開始--%>
<div align="center">
	<c:if test="${param.id==null}">
		<p>修改特殊疾病記錄</p>
		<form name="form" method="post" action="edit.jsp">
			學號：<input name="id" type="text"><input type="submit" name="Submit" value="修改"> 
		</form>
	</c:if>
	<c:if test="${param.id!=null}">
		<%--學號是否空白--%>
		<c:choose>
			<%--學號空白--%>
			<c:when test="${param.id==''}">
				學號不能空白
			</c:when>
			
			<%--學號有輸入--%>
			<c:otherwise>
				<%@ include file="../include/mysql.jsp" %>				
				
				<%--查詢矯治資料--%>
				<sql:query sql="SELECT * FROM REGISTER WHERE HER_ID = ANY ( SELECT HER_ID FROM HER WHERE STU_ID = ${param.id} )" var="register"/>
				
				<%--是否有矯治資料開始--%>
				<c:choose>
				
					<%--沒有矯治資料--%>
					<c:when test="${register.rowCount=='0'}">
						沒有學號 ${param.id} 的矯治資料
					</c:when>
					
					<%--有矯治資料開始--%>
					<c:otherwise>									
						修改特殊疾病記錄
						<p>學號 <c:out value="${param.id}"/></p>
						<form name="form" method="post" action="edit_deal.jsp">
							<table>
								<tr>
									<th>編號</th><th>特殊疾病名稱</th><th>登錄日期</th><th>特殊疾病說明</th>
								</tr>
								
								<c:forEach items="${register.rowsByIndex}" var="register_put">
									<tr align="center">
										<sql:query sql="SELECT * FROM disease WHERE Disease_ID = ${register_put[1]}" var="disease"/>										  
										<c:forEach items="${disease.rowsByIndex}" var="disease_put">
											<td>${disease_put[0]}</td>
											<td>${disease_put[1]}</td>											
										</c:forEach>
										<td><input type="text" name="day${register_put[1]}" value="${register_put[2]}" size="10"></td>
										<td><input type="text" name="text${register_put[1]}" value="${register_put[3]}" size="50"></td>
									</tr>
									<c:set value="${register_put[0]}" var="her_id"/>
								</c:forEach>
							</table>
							<input type="hidden" name="stu_id" value="${param.id}">
							<input type="hidden" name="her_id" value="${her_id}">																		  
							<p><input type="submit" name="Submit" value="送出"></p>
						</form>
					</c:otherwise>
					<%--有矯治資料結束--%>
				</c:choose>
				<%--是否有矯治資料結束--%>							
			</c:otherwise>				
		</c:choose>
	</c:if>
	</div>
<%--置中結束--%>
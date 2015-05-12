<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<center>
<br><br>
<br><br>
<c:choose>

	<c:when test="${param.textfield1==''}">
		帳號不能空白
	</c:when>

	<c:when test="${param.textfield2==''}">
		密碼不能空白
	</c:when>	
	
	<c:otherwise>
		<sql:query sql="SELECT * FROM user where id = '${param.textfield1}' AND password = '${param.textfield2}'" var="user"/>
		
		<c:choose>
		
			<c:when test="${user.rowCount=='0'}">
				帳號、密碼不符
			</c:when>
			
			<%--允許登入--%>		
			<c:otherwise>
				<c:forEach items="${user.rows}" var="user_put" >
					<%--設定session--%>
					<c:set var="id" value="${user_put.id}" scope="session"/>
				</c:forEach>
			　　Hello, <b><fmt:formatNumber value="${sessionScope.id}" minIntegerDigits="9" groupingUsed="false"/></b>.  Welcome to IIS! <br/><br/><a href="../user/main.jsp" target="_top">Click here to continue.</a>
				<%--<c:redirect url="../user/main.jsp"/>--%>
			</c:otherwise>
			
		</c:choose>	
		
	</c:otherwise>	
				
</c:choose>
</center>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:query var="id">
  SELECT * FROM user where id = ${sessionScope.id} AND password = '${param.textfield99}'
</sql:query>

<div align="center">

		<c:if test="${id.rowCount=='0'}">
			Wrong Old Password!<br />
			<a href="javascript:history.back()">Return</a>
		</c:if>
	
		<c:if test="${id.rowCount=='1'}">
			<sql:update>
			  UPDATE user
			  SET password = ? , firstName = ? , lastName = ? , nickName = ? , birthMonth = ? , birthDay = ? , birthYear = ? , sex = ? , email = ? , address = ? , phone = ?
			  WHERE id = ${sessionScope.id}
			  <sql:param value="${param.textfield2}" />
			  <sql:param value="${param.textfield3}" />
			  <sql:param value="${param.textfield4}" /> 
			  <sql:param value="${param.textfield5}" />    
			  <sql:param value="${param.select}" /> 
			  <sql:param value="${param.textfield6}" />  
			  <sql:param value="${param.textfield7}" />  
			  <sql:param value="${param.select2}" />
			  <sql:param value="${param.textfield8}" />  
			  <sql:param value="${param.textfield9}" />
			  <sql:param value="${param.textfield10}" />      
			</sql:update>
			Data Update!<br /><br />
			<a href="data.jsp">Click Here To Return</a>		
		</c:if>				

</div>
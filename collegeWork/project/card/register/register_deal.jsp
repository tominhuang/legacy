<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:query var="id">
  SELECT count(id) FROM user
</sql:query>

<div align="center">
	<c:forEach items="${id.rowsByIndex}" var="row">
			Registration Complete<br /><br />
		${param.textfield3} ${param.textfield4},<br />Your ID is <fmt:formatNumber value="${row[0]+1}" minIntegerDigits="9" groupingUsed="false"/><br/><br/>
		<sql:update>
		  INSERT INTO user
		  VALUES ( ? , ? , ? , ? , ? , ?  , ? , ? , ? , ? , ? , ? , ? )  
		  <sql:param value="${row[0]+1}" />
		  <sql:param value="${param.textfield1}" />
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
		  <sql:param value="140.119.195.9" />        
		</sql:update>
		
		<c:set var="id" value="${row[0]+1}" scope="session"/>	
	</c:forEach>	
	
	<a href="../user/main.jsp">Click Here To Continue</a>
</div>
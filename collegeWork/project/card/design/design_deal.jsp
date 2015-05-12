<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>


<sql:query var="design">
  SELECT * FROM design WHERE id = ${sessionScope.id}
</sql:query>

<c:choose>
	<c:when test="${design.rowCount=='0'}">
		<sql:update>
		  INSERT INTO design
		  VALUES ( ? , ? , ? )  

		  <sql:param value="${sessionScope.id}" />
		  <sql:param value="${param.select}" />
		  <sql:param value="${param.select2}" />  
      
		</sql:update>
	</c:when>
	<c:otherwise>
			<sql:update>
			  UPDATE design
			  SET page = ? , card = ?
			  WHERE id = ${sessionScope.id}

			  <sql:param value="${param.select}" /> 
			  <sql:param value="${param.select2}" /> 
     
			</sql:update>
	</c:otherwise>
</c:choose>	



			
			<c:redirect url="design.jsp"/>	
			


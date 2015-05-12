<c:if test="${sessionScope.id!=null}">
	<jsp:useBean id="now" class="java.util.Date" />
	<sql:update>
	  INSERT INTO record_book
	  VALUES ( ? , ? , ? )  
	  <sql:param value="${sessionScope.id}" />
	  <sql:param value="${param.isbn}" />
	  <sql:param value="${now}" />	
	</sql:update>		
</c:if>


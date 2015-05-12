<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.id!=null && sessionScope.type!=null}">
	<sql:query sql="SELECT * FROM record WHERE id = '${sessionScope.id}' AND type = '${sessionScope.type}'" var="record"/>
	
	<c:set value="1" var="count" />
	
	<c:if test="${record.rowCount=='1'}">
		<c:forEach items="${record.rowsByIndex}" var="record_put">
			<c:set value="${record_put[2]+1}" var="count" />
		</c:forEach>	
		
		<sql:update>
		  UPDATE record SET count = ?
		  WHERE id = '${sessionScope.id}' AND type = '${sessionScope.type}'
		  <sql:param value="${count}" />	
		</sql:update>				
	</c:if>	

	<c:if test="${record.rowCount=='0'}">
		<sql:update>
		  INSERT INTO record
		  VALUES ( ? , ? , ? )  
		  <sql:param value="${sessionScope.id}" />
		  <sql:param value="${sessionScope.type}" />
		  <sql:param value="${count}" />	
		</sql:update>	
	</c:if>	
</c:if>


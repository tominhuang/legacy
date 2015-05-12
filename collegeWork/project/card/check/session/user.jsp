<c:choose>
	<c:when test="${sessionScope.id!=null}"/>	
	<c:otherwise>
		<c:redirect url="../include/error.jsp"/>
	</c:otherwise>
</c:choose>
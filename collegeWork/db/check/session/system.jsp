<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.rank=='9'}"/>	
	<c:otherwise>
		<c:redirect url="../include/error.jsp"/>
	</c:otherwise>
</c:choose>


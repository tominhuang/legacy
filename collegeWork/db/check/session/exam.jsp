<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.rank=='2'}"/>
	<c:when test="${sessionScope.rank=='4'}"/>
	<c:when test="${sessionScope.rank=='5'}"/>	
	<c:when test="${sessionScope.rank=='9'}"/>		
	<c:otherwise>
		<c:redirect url="../include/error.jsp"/>
	</c:otherwise>
</c:choose>
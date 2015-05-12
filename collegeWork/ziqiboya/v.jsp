<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- 預設高度 --%>
<c:choose>
	<%-- 預設高度 --%>
	<c:when test="${param.height==null}">
		<c:set var="height" value="468" />
	</c:when>
		
	<%-- 使用者自訂 --%>
	<c:otherwise>			
		<c:set var="height" value="${param.height}"/>
	</c:otherwise>		
</c:choose>

<%-- 預設寬度 --%>
<c:choose>
	<%-- 預設寬度 --%>
	<c:when test="${param.width==null}">
		<c:set var="width" value="190" />
	</c:when>
		
	<%-- 使用者自訂 --%>
	<c:otherwise>			
		<c:set var="width" value="${param.width}"/>
	</c:otherwise>		
</c:choose>

<%-- 預設Scroll --%>
<c:choose>
	<%-- 預設不要 --%>
	<c:when test="${param.scrolling==null}">
		<c:set var="scrolling" value="no" />
	</c:when>
		
	<%-- 使用者自訂要 --%>
	<c:otherwise>			
		<c:set var="scrolling" value="${param.scrolling}"/>
	</c:otherwise>		
</c:choose>

document.write('<iframe marginheight="0" marginwidth="0" src="http://tomin.twbbs.org:8080/out.jsp?view=${param.view}&name=${param.name}&random=${param.random}&css=${param.css}" height="${height}" width="${width}" scrolling="${scrolling}" frameborder="0"></iframe>');
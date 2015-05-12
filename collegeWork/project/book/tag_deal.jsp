<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="include/mysql.jsp" %>
<c:if test="${sessionScope.id!=null}">
	<sql:query sql="SELECT * FROM tag WHERE isbn = '${param.isbn}' AND tname = '${param.textfield}'" var="tag"/>
	
	<c:set value="${param.select2}" var="count" />
	
	<c:choose>
		<c:when test="${param.textfield==''}">
			<p align="center">標籤不能空白</p>
		</c:when>
	
		<c:when test="${tag.rowCount=='1'}">
			<c:forEach items="${tag.rowsByIndex}" var="tag_put">
				<c:set value="${tag_put[2]+count}" var="count" />
			</c:forEach>	
			
			<sql:update>
			  UPDATE tag SET tcount = ?
			  WHERE isbn = '${param.isbn}' AND tname = '${param.textfield}'
			  <sql:param value="${count}" />	
			</sql:update>
			<c:redirect url="detail.jsp?isbn=${param.isbn}"/>				
		</c:when>	

		<c:when test="${tag.rowCount=='0'}">
			<sql:update>
			  INSERT INTO tag
			  VALUES ( ? , ? , ? )  
			  <sql:param value="${param.isbn}" />
			  <sql:param value="${param.textfield}" />
			  <sql:param value="${count}" />	
			</sql:update>	
			<c:redirect url="detail.jsp?isbn=${param.isbn}"/>
		</c:when>
		
		<c:otherwise>
			發生例外事件
		</c:otherwise>
	</c:choose>	
</c:if>


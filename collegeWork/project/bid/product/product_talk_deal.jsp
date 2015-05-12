<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>

<sql:query var="cid">
  SELECT count(cid) FROM product_talk
</sql:query>


<c:forEach items="${cid.rowsByIndex}" var="row">
	<sql:update>
	  INSERT INTO product_talk
	  VALUES ( ? , ? , ? , ? , ? )  
	  <sql:param value="${row[0]+1}" />
	  <sql:param value="${param.pid}" />
	  <sql:param value="${sessionScope.id}" />
	  <sql:param value="new java.util.Date()" /> 
	  <sql:param value="${param.textarea}" />  
	</sql:update>
</c:forEach>

<c:if test="${param.checkbox!=''}">
	<c:redirect url="http://npc.twbbs.org:8080/card/receive/receive.jsp}">
		<c:param name="portal" value="http://140.119.19.149:8080/bid/"/>
		<c:param name="portalName" value="Jimmy Bidding Site"/>
		<c:param name="site" value="http://140.119.19.149:8080/bid/product.jsp?pid=1"/>
		<c:param name="siteTitle" value="¦çªA"/>
		<c:param name="id2" value="${sessionScope.id}"/>		
	</c:redirect>
</c:if>
product.jsp?pid=${param.pid}
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<c:if test="${param.Submit=='Grouping'}">
	<sql:update>
	  UPDATE identify
	  SET kind = ?
	  WHERE no = '${param.checkbox}'
	  <sql:param value="${param.textfield}" />	
	</sql:update>
</c:if>

<c:if test="${param.Submit=='Public'}">
	<sql:update>
	  UPDATE identify
	  SET Public = '1'
	  WHERE no = '${param.checkbox}'
	</sql:update>
</c:if>

<c:if test="${param.Submit=='Private'}">
	<sql:update>
	  UPDATE identify
	  SET Public = '0'
	  WHERE no = '${param.checkbox}'
	</sql:update>
</c:if>


<c:if test="${param.Submit=='Delete'}">
	<sql:update>
	  DELETE FROM identify
	  WHERE no = '${param.checkbox}'
	</sql:update>
	<c:redirect url="http://npc.twbbs.org:8080/bid/new/del2.jsp"/>
</c:if>



<c:redirect url="ip.jsp"/>
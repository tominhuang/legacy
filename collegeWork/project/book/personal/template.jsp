<%@ include file="../check/session/member.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<c:if test="${sessionScope.id!=null}">
	<sql:query sql="SELECT * FROM personal WHERE id = '${sessionScope.id}'" var="personal"/>
	
	
	<c:choose>
	
		<c:when test="${personal.rowCount=='1'}">
			
			<sql:update>
			  UPDATE personal SET  fontsize = ? , fontfamily = ? , fontcolor = ? , lineheight = ? , letterspacing = ? , backcolor = ? , backimage = ?
			  WHERE id = '${sessionScope.id}'
			  <sql:param value="${param.select1}" />
			  <sql:param value="${param.select2}" />
			  <sql:param value="${param.select3}" />
			  <sql:param value="${param.select4}" />
			  <sql:param value="${param.select5}" />
			  <sql:param value="${param.select6}" />
			  <sql:param value="${param.select7}" />			  			  			  			  			  			  
			</sql:update>			
		</c:when>	

		
		<c:otherwise>
			<sql:update>
			  INSERT INTO personal
			  VALUES ( ? , ? , ? , ? , ? , ? , ? , ?)  
			  <sql:param value="${sessionScope.id}" />			  
			  <sql:param value="${param.select1}" />
			  <sql:param value="${param.select2}" />
			  <sql:param value="${param.select3}" />
			  <sql:param value="${param.select4}" />
			  <sql:param value="${param.select5}" />
			  <sql:param value="${param.select6}" />
			  <sql:param value="${param.select7}" />			  			  			  			  			  			  
			</sql:update>
		</c:otherwise>
	</c:choose>	
</c:if>

<p align="center">資料庫已更新</p>
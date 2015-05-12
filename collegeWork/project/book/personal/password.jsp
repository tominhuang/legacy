<%@ include file="../check/session/member.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<c:if test="${sessionScope.id!=null}">
	<sql:query sql="SELECT * FROM member WHERE id = '${sessionScope.id}' AND password = '${param.textfield3}'" var="personal"/>
	
	
	<c:choose>
	
		<c:when test="${param.textfield1!=param.textfield2}">
　　　　　　<div align="center">新密碼與密碼確認不符</div>
		</c:when>	
	
		<c:when test="${personal.rowCount=='1'}">
			
			<sql:update>
			  UPDATE member SET  password = ?
			  WHERE id = '${sessionScope.id}'
			  <sql:param value="${param.textfield1}" />
			</sql:update>
			<p align="center">資料庫已更新</p>
		</c:when>	

		
		<c:otherwise>
　　　　　　<p align="center">原始密碼不符合</p>
		</c:otherwise>
	</c:choose>	
</c:if>
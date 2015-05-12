<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>班級資料設定</p>
	<p>&nbsp;</p>
	<c:if test="${param.year==null}">
	<p><a href="class.jsp?year=up">年度調升</a></p>
	<p>&nbsp;</p>
	<p><a href="class.jsp?year=down">年度調降(復原用)</a></p>
	</c:if>
	<c:if test="${param.year!=null}">
		<%@ include file="../include/mysql.jsp" %>
		<c:if test="${param.year=='up'}">		
			<sql:query sql="SELECT DISTINCT STUDENT.CLASS_ID FROM STUDENT LEFT OUTER JOIN CLASS ON STUDENT.CLASS_ID = CLASS.CLASS_ID ORDER BY CLASS.CLASS_ID DESC" var="class" />
			<c:forEach items="${class.rowsByIndex}" var="class_put">			
				<sql:update>
					UPDATE STUDENT SET Class_ID = ${class_put[0]+10}
						WHERE CLASS_ID = ${class_put[0]}
				</sql:update>			
			</c:forEach>	
			調升成功
		</c:if>
		<c:if test="${param.year=='down'}">
			<sql:query sql="SELECT DISTINCT STUDENT.CLASS_ID FROM STUDENT LEFT OUTER JOIN CLASS ON STUDENT.CLASS_ID = CLASS.CLASS_ID ORDER BY CLASS.CLASS_ID ASC" var="class" />
			<c:forEach items="${class.rowsByIndex}" var="class_put">			
				<sql:update>
					UPDATE STUDENT SET Class_ID = ${class_put[0]-10}
						WHERE CLASS_ID = ${class_put[0]}
				</sql:update>			
			</c:forEach>	
			調降成功
		</c:if>		
	</c:if>
</div>



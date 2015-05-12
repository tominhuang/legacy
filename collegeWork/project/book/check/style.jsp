<%@ include file="../../include/mysql.jsp" %>
<%@ include file="../../include/head.jsp" %>

<sql:query sql="SELECT * FROM personal where id = '${sessionScope.id}'" var="personal" />

<c:if test="${personal.rowCount=='1'}">
	<STYLE>
	<!--

	body{			
		<c:forEach items="${personal.rowsByIndex}" var="personal_put">
			font-size:${personal_put[1]}pt;
			font-family:${personal_put[2]};
			color:${personal_put[3]};
			line-height:${personal_put[4]}pt;
			letter-spacing:${personal_put[5]}pt;
			background :${personal_put[6]}; 
			background-image:url('../include/style/background/${personal_put[7]}');
	
		</c:forEach>
	}
	-->
	</STYLE>

</c:if>
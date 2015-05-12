<%@ include file="../check/session/statistic.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>Ｂ型肝炎</p>
	<%--輸入--%>
	<form name="form" method="post">
		<sql:query sql="SELECT * FROM CLASS ORDER BY CLASS_ID ASC" var="result" />
		<p>系級：<select name="select"><c:forEach items="${result.rowsByIndex}" var="row" ><option value="${row[0]}">${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}</option></c:forEach></select></p>
		<p><input type="submit" name="Submit" value="查詢"></p>
	</form>

	<%--查詢--%>
	<c:if test="${!empty param.select}">
		<hr>
		<sql:query sql="SELECT * FROM CLASS WHERE CLASS_ID = ${param.select}" var="result" />
		<c:forEach items="${result.rowsByIndex}" var="row" >
			<p><u>${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}</u></p>
		</c:forEach>
		<sql:query sql="SELECT COUNT(*) FROM STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select}" var="total" />
		<c:forEach items="${total.rowsByIndex}" var="total_put" >
			<p>全班人數：<fmt:formatNumber value="${total_put[0]}" minIntegerDigits="2"/> 人</p>
		</c:forEach>
		
		<sql:query sql="SELECT COUNT(*) FROM HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select}" var="total" />
		<sql:query sql="SELECT COUNT(DISTINCT(HER.HER_ID)) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND ( (ITEM_ID = 34 AND EXAM_RESULT = '陽性反應') OR (ITEM_ID = 35 AND EXAM_RESULT = '陰性反應') )" var="total2" />
		<c:forEach items="${total.rowsByIndex}" var="total_put" >
			<p>健檢人數：<fmt:formatNumber value="${total_put[0]}" minIntegerDigits="2"/> 人</p>
			<c:forEach items="${total2.rowsByIndex}" var="total2_put" >
				<p>異常人數：<fmt:formatNumber value="${total2_put[0]}" minIntegerDigits="2"/> 人</p>
				<p>異常比率</p>
				<h2><fmt:formatNumber value="${total2_put[0]/total_put[0]*100}" minFractionDigits="2" maxFractionDigits="2" /> %</h2>
			</c:forEach>
		</c:forEach>
	</c:if>
</div>
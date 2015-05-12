<%@ include file="../check/session/statistic.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>近視分析</p>
	<%--輸入--%>
	<form name="form" method="post" action="nearsight.jsp">
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
		<sql:query sql="SELECT COUNT(DISTINCT(HER.HER_ID)) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND ITEM_ID BETWEEN 5 AND 6 AND EXAM_RESULT < 0.6" var="total2" />
		<c:forEach items="${total.rowsByIndex}" var="total_put" >
			<p>健檢人數：<fmt:formatNumber value="${total_put[0]}" minIntegerDigits="2"/> 人</p>
			<c:forEach items="${total2.rowsByIndex}" var="total2_put" >
				<p>近視人數：<fmt:formatNumber value="${total2_put[0]}" minIntegerDigits="2"/> 人</p>
				<p>近視比率</p>
				<h2><fmt:formatNumber value="${total2_put[0]/total_put[0]*100}" minFractionDigits="2" maxFractionDigits="2" /> %</h2>
			</c:forEach>
		</c:forEach>

		<table width="40%">
			<tr>
				<th>全體左眼</th><th>全體右眼</th>
			</tr>
			<tr align="center">
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>左眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>左眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>左眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>右眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>右眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>右眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>				
			</tr>

			<tr>
				<td>&nbsp;</td><td>&nbsp;</td>
			</tr>
			<tr>
				<th>正常左眼</th><th>正常右眼</th>
			</tr>			
			<tr align="center">
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5 AND EXAM_RESULT >= 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>左眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>左眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>左眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6 AND EXAM_RESULT >= 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>右眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>右眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>右眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>				
			</tr>

			<tr>
				<td>&nbsp;</td><td>&nbsp;</td>
			</tr>
			<tr>
				<th>近視左眼</th><th>近視右眼</th>
			</tr>			
			<tr align="center">
				<td>
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5 AND EXAM_RESULT < 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>左眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>左眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>左眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6 AND EXAM_RESULT < 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>右眼平均視力：<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>右眼最高視力：<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>右眼最低視力：<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:if>
</div>
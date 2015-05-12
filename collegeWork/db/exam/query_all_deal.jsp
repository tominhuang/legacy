<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<sql:query var="HER">
    <c:choose>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM HER where Stu_ID = ${param.textfield0}
		</c:when>
		
		<c:otherwise>			
		  	SELECT * FROM HER where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					ORDER BY Stu_ID ASC
		</c:otherwise>				
	</c:choose>
</sql:query>

<c:choose>

	<c:when test="${HER.rowCount=='0'}">
		查無資料
	</c:when>
		
	<c:otherwise>		
		<p>查詢成功</p>
		<p>健檢資料報告單</p>
		<p>總共有 ${HER.rowCount} 名學生的健檢資料</p>		
		<table>
		<c:forEach items="${HER.rowsByIndex}" var="HER_put">
			<tr>
				<td colspan="8">
					<hr>
					健檢記錄編號：${HER_put[0]}<br>
					學號：${HER_put[1]}<br>	
					檢查日期：${HER_put[2]}	
				</td>			
			</tr>			
			
			<tr>
				<th>編號</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th>檢查結果</th><th>是否異常</th>
			</tr>
				<sql:query sql="SELECT * FROM exam natural join item where HER_ID = ${HER_put[0]}" var="exam" />
				<c:forEach items="${exam.rowsByIndex}" var="exam_put">
					<tr align="center">
						<td>${exam_put[1]}</td>
						<td>${exam_put[8]}</td>
						<c:forEach begin="4" end="7" var="item">
							<td>${exam_put[item]}</td>
						</c:forEach>
						<td>${exam_put[2]}</td>
						<td>
							<c:choose>
								<c:when test="${exam_put[3]=='1'}">正常</c:when>
								<c:otherwise><font color="red">異常</font></c:otherwise>
							</c:choose>
						</td>						
					</tr>
				</c:forEach>  
		</c:forEach>
		</table>
	</c:otherwise>
					
</c:choose>		
<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--查詢健檢資料--%>
<sql:query var="HER">
    <c:choose>
	
		<%--排序--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} ) ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--學號--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--班級--%>
		<c:otherwise>			
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )		
		</c:otherwise>				
	</c:choose>
</sql:query>

<div align="center">
	<%--健檢資料是否存在--%>
	<c:choose>
	
		<%--不存在--%>
		<c:when test="${HER.rowCount=='0'}">
			查無資料
		</c:when>
	
		<%--存在--%>		
		<c:otherwise>
			<p>查詢成功</p>
			<p>健檢資料報告單</p>
			<hr>
			<c:forEach items="${HER.rowsByIndex}" begin="0" end="0" var="HER_put">
				<p>${HER_put[10]}</p>
				<p><u>${HER_put[6]} ${HER_put[7]}</u></p>
				<p>
					<c:if test="${HER_put[8]!=null}">			
						參考值:${HER_put[8]} 
					</c:if>
					<c:if test="${HER_put[9]!=null}">							
						單位:${HER_put[9]}			
					</c:if>				
				</p>				
			</c:forEach>
			<p>總共有 ${HER.rowCount} 筆資料</p>			
			<table width="80%" align="center" border="1">	
				<tr align="center">
					<c:choose>			
						<%--學號--%>
						<c:when test="${HER.rowCount=='1'}">
							<th>健檢編號</th><th>學號</th><th>檢查日期</th><th>檢查結果</th><th>是否異常</th>
						</c:when>						
						<%--班級--%>
						<c:otherwise>			
							<th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=1">健檢編號</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=2">學號</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=3">檢查日期</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=5">檢查結果</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=6">是否異常</a></th>
						</c:otherwise>				
					</c:choose>								
				</tr>					
				<c:forEach items="${HER.rowsByIndex}" var="HER_put">
					
					<tr align="center">
						<c:forEach begin="0" end="2" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[4]}</td>
						<td>
							<c:choose>
								<c:when test="${HER_put[5]=='1'}">正常</c:when>
								<c:otherwise><font color="red">異常</font></c:otherwise>
							</c:choose>
						</td>
					</tr>
						
				</c:forEach>
			</table>
		</c:otherwise>
						
	</c:choose>
</div>
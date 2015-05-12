<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--查詢健檢資料--%>
<sql:query var="HER">
    <c:choose>
	
		<%--排序--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )	
					ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--學號--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--班級--%>
		<c:otherwise>			
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )		
		</c:otherwise>				
	</c:choose>
</sql:query>

<%--健檢資料是否存在--%>
<c:choose>

	<%--不存在--%>
	<c:when test="${HER.rowCount=='0'}">
		<center>查無資料</center>
	</c:when>
		
	<%--存在--%>
	<c:otherwise>
		<div align="center">
			查詢成功<br><br>
			健檢資料報告單
			<hr>
			<p>以下為健檢記錄有異常的學生資料</p>
			<p>總共有 ${HER.rowCount} 筆資料</p>
		</div>
		<table align="center" border="1" cellspacing="0">
		
			<tr bgcolor="#99CCCC">
				<c:choose>
				
					<%--排序--%>
					<c:when test="${HER.rowCount>'9'}">
						<th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=1">編號</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=2">學號</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=3">健檢日期</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=4">項目</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=11">項目類型</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=7">項目中文名</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=8">項目英文名</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=9">參考值</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=5">檢查結果</a></th><th>矯治</a></th>
					</c:when>
										
					<%--學號--%>
					<c:otherwise>			
						<th>編號</th><th>學號</th><th>健檢日期</th><th>項目</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>檢查結果</th><th>矯治</th>
					</c:otherwise>
							
				</c:choose>											
			</tr>
									
			<%--顯示健檢記錄開始--%>								
			<c:forEach items="${HER.rowsByIndex}" var="HER_put">
			
				<c:if test="${HER_put[0]%2=='0'}">
					<tr align="center" bgcolor="#CCFF99">
				</c:if>
				<c:if test="${HER_put[0]%2=='1'}">
					<tr align="center" bgcolor="#CCFFFF">
				</c:if>				
						<c:forEach begin="0" end="3" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[10]}</td>
						<c:forEach begin="6" end="8" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[4]}</td>				
						<%--查詢矯治記錄--%>
						<sql:query sql="SELECT Treat_Finish FROM treat where item_id = ${HER_put[3]} AND TR_ID =  ANY ( SELECT TR_ID FROM TR where stu_id = ${HER_put[1]} )" var="treat" />
						<%--顯示矯治記錄開始--%>																	
						<td>											
							<c:choose>							
								<c:when test="${treat.rowCount=='0'}"><font color="red">未矯治</font></c:when>								
								<c:otherwise>
									<c:forEach items="${treat.rowsByIndex}" var="treat_put">		
										<c:choose>										
												<c:when test="${treat_put[0]=='true'}">已成功</c:when>
												<c:when test="${treat_put[0]=='false'}"><font color="green">未成功</font></c:when>										
										</c:choose>	
									</c:forEach>									
								</c:otherwise>
							</c:choose>																						
						</td>															
						<%--顯示矯治記錄結束--%>
					</tr>

			</c:forEach>
			<%--顯示健檢記錄結束--%>				
			 
		</table>
	</c:otherwise>
					
</c:choose>		
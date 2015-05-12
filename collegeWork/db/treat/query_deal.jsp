<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--查詢矯治資料--%>
<sql:query var="TR">
    <c:choose>
	
		<%--排序--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--學號--%>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--班級--%>
		<c:otherwise>			
		  	SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					
			<%--項目有選擇--%>
			<c:if test="${param.select1!=''}">
				AND TREAT.ITEM_ID = ${param.select1}
			</c:if>
			
		</c:otherwise>
	</c:choose>
</sql:query>

<%--置中開始--%>
<div align="center">
	<%--矯治資料是否存在--%>
	<c:choose>
	
		<%--不存在--%>
		<c:when test="${TR.rowCount=='0'}">
			查無資料
		</c:when>
	
		<%--存在--%>
		<c:otherwise>
			查詢成功<br><br>
			矯治資料報告單
			<hr>
			<p>總共有 ${TR.rowCount} 筆資料</p>
			<table align="center" border="1" cellspacing="0">

				<%--標題--%>	
				<tr align="center" bgcolor="papayawhip">
					<c:choose>			
						<%--少筆資料--%>
						<c:when test="${TR.rowCount<='5'}">
							<th>編號</th><th>學號</th><th>檢查日期</th><th>項目類型</th><th>矯治項目</th><th>未矯治狀況</th><th>矯治狀況</th><th>是否完成</th>
						</c:when>						
						<%--多筆資料--%>
						<c:otherwise>			
							<th><a href="query_deal.jsp?select0=${param.select0}&sort=1">編號</a><th><a href="query_deal.jsp?select0=${param.select0}&sort=2">學號</a></th></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=3">檢查日期</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=12">項目類型</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=8">矯治項目</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=5">未矯治狀況</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=6">矯治狀況</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=7">是否完成</a></th>
						</c:otherwise>				
					</c:choose>													
				</tr>
			
			<%--顯示矯治記錄開始--%>
			<c:forEach items="${TR.rowsByIndex}" var="TR_put">		

				<c:if test="${TR_put[0]%2=='0'}">
					<tr align="center" bgcolor="#eeeeee">
				</c:if>
				<c:if test="${TR_put[0]%2=='1'}">		
					<tr align="center" bgcolor="#cccccc">
				</c:if>				
			

					<c:forEach begin="0" end="2" var="item">
						<td>${TR_put[item]}</td>
					</c:forEach>
					<td>${TR_put[11]}</td>
					<td>${TR_put[7]}</td>
					<td>${TR_put[4]}</td>
					<td>${TR_put[5]}</td>
					<td>
						<c:choose>
							<c:when test="${TR_put[6]=='true'}"><strike>已經完成</strike></c:when>
							<c:otherwise><b><font color="darkorenge">尚未完成</font></b></c:otherwise>
						</c:choose>
					</td>						
				</tr>

	
			</c:forEach>		
			<%--顯示矯治記錄結束--%>
			</table>			
		</c:otherwise>	
		<%--存在--%>					
	</c:choose>
	<%--矯治資料是否存在--%>	
</div>
<%--置中結束--%>
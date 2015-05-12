<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--修改矯治日期--%>
<sql:update>
	UPDATE TR SET TREAT_DATE = '${param.textfield2}' WHERE TR_ID= ${param.textfield1}
</sql:update>

<%--刪除矯治記錄--%>
<sql:update>
	DELETE FROM TREAT WHERE TR_ID = ${param.textfield1}
</sql:update>

<%--讀取edit.jsp傳過來的檢查結果--%>
<c:forEach begin="1" end="${param.num}" var="item" varStatus="s">
	<% 
		int i = ((Integer) pageContext.getAttribute("item")).intValue();
		pageContext.setAttribute("item_id", "item_id"+i);
		pageContext.setAttribute("before", "before"+i);
		pageContext.setAttribute("after", "after"+i);	
		pageContext.setAttribute("finish", "finish"+i);				
	%>
	<%--如果有檢查--%>
	<c:if test="${param[before]!=''}">
		<c:if test="${param[after]!=''}">
			<sql:update>
				INSERT INTO TREAT
				VALUES ( ? , ? , ? , ? , ?)
				<sql:param value="${param.textfield1}" />
				<sql:param value="${param[item_id]}"/>
				<sql:param value="${param[before]}"/>
				<sql:param value="${param[after]}"/>
				<sql:param value="${param[finish]}"/>					
			</sql:update>					
		</c:if>
	</c:if>
</c:forEach>  

<sql:query sql="SELECT * FROM TR where TR_ID = ${param.textfield1}" var="TR" />
<sql:query sql="SELECT * FROM TREAT where TR_ID = ${param.textfield1}" var="TREAT" />
	

<div align="center">
	修改成功<br><br>
	矯治記錄報告單
	<hr>
	<c:forEach items="${TR.rowsByIndex}" var="TR_put">
		<table align="center">
			<tr>
				<td>
					學號：${TR_put[1]}<br>
					編號：${TR_put[0]}<br>
					日期：${TR_put[2]}<br>
				</td>
			</tr>
		</table>
	</c:forEach>	
</div>

<%--如果有矯治--%>
<c:if test="${TREAT.rowCount!='0'}">
	<p align="center">矯治項目</p>
	<table align="center" width="100%">
		<tr>
			<th>編號</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th>未矯治狀況</th><th>矯治狀況</th><th>完成</th>
		</tr>
		<c:forEach items="${TREAT.rowsByIndex}" var="TREAT_put">
		<sql:query sql="SELECT * FROM item where item_id = ${TREAT_put[1]}" var="item" />
		<tr align="center">
			<c:forEach items="${item.rowsByIndex}" var="item_put">
				<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td>
			</c:forEach>		
			<td>${TREAT_put[2]}</td>
			<td>${TREAT_put[3]}</td>
			<td>
				<c:choose>
					<c:when test="${TREAT_put[4]=='true'}">是</c:when>
					<c:otherwise><font color="red">否</font></c:otherwise>
				</c:choose>			
			</td>
		</tr>
		</c:forEach>  
	</table>
</c:if>   

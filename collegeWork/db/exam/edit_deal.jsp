<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--修改--%>
<c:if test="${param.sort==null}">
	<%--更新健檢記錄--%>
	<sql:update>
	  UPDATE HER
	  SET  HER_ID = ? , Stu_ID = ? , Exam_Date = ? 
	  WHERE stu_id = ${param.textfield0}
	  <sql:param value="${param.textfield}" />  
	  <sql:param value="${param.textfield0}" />
	  <sql:param value="${param.textfield1}" />
	</sql:update>
	
	<%--該名學生的檢查記錄全部刪掉--%>
	<sql:update>
		DELETE FROM EXAM WHERE HER_ID = ${param.textfield}
	</sql:update>
	<%--新增檢查記錄--%>
	<c:forEach begin="1" end="42" var="item" varStatus="s">
		<% 
			int i = ((Integer) pageContext.getAttribute("item")).intValue();
			pageContext.setAttribute("textStr", "text"+i);
			pageContext.setAttribute("selectStr", "select"+i); 
		%>
		<%--如果有檢查--%>
		<c:if test="${param[textStr]!=null}">
			<c:if test="${param[textStr]!=''}">
				<sql:update>
					INSERT INTO EXAM
					VALUES ( ? , ? , ? , ? )
					<sql:param value="${param.textfield}"/>		 
					<sql:param value="${item}"/>
					<sql:param value="${param[textStr]}"/>
					<sql:param value="${param[selectStr]}"/>          
				</sql:update>					
			</c:if>
		</c:if>
	</c:forEach>  
</c:if>

<sql:query sql="SELECT * FROM HER where Stu_ID = ${param.textfield0}" var="HER" />

<%--排序與否--%>
<c:choose>
	<%--排序--%>
	<c:when test="${param.sort!=null}">
		<sql:query sql="SELECT * FROM exam where HER_ID = ${param.textfield} order by ${param.sort} asc" var="exam" />
	</c:when>
	
	<%--不排序--%>
	<c:otherwise>
		<sql:query sql="SELECT * FROM exam where HER_ID = ${param.textfield}" var="exam" />
	</c:otherwise>
</c:choose>
	
修改成功<br><br>
健檢資料報告單
<hr>
<c:forEach items="${HER.rowsByIndex}" var="HER_put">
	健檢記錄編號：${HER_put[0]}<br>
	學號：${HER_put[1]}<br>	
	檢查日期：${HER_put[2]}	
</c:forEach>

<c:if test="${exam.rowCount!='0'}">
	<table>
		<tr>
			<th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=2">編號</a></th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=3">檢查結果</a></th><th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=4">是否異常</a></th>
		</tr>
		<c:forEach items="${exam.rowsByIndex}" var="exam_put">
		<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />
			<tr>
				<c:forEach items="${item.rowsByIndex}" var="item_put">
					<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td align="center">${item_put[3]}</td><td>${item_put[4]}</td>
				</c:forEach>		
				<td>${exam_put[2]}</td>
				<td align="center">
					<c:choose>
						<c:when test="${exam_put[3]=='1'}">正常</c:when>
						<c:otherwise><font color="red">異常</font></c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>  
	</table>
</c:if>   

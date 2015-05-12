<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<script language="javascript">
function checkdata() {
   	var id = document.form.stu_id.value;
   	if(id==""){
   		alert("學號一定要填！");
		return false;
	}			
	else{
		return true;
	}			
}
</script>

<%--置中開始--%>
<div align="center">
	新增特殊疾病記錄
	<form name="form" method="post" action="add_deal.jsp">
	  <p>學號：
		<input type="text" name="stu_id">
	  </p>
	
	  <p> 
		<select name="select1">
		  <c:forEach begin="2005" end="2020" var="year">
		  <option value="${year}">${year}年</option>
		  </c:forEach>
		</select> 
	
		<select name="select2">
		  <c:forEach begin="1" end="12" var="month">
		  <option value="${month}">${month}月</option>
		  </c:forEach>	  
		</select>
	
		<select name="select3">
		  <c:forEach begin="1" end="31" var="day">
		  <option value="${day}">${day}號</option>
		  </c:forEach>  
		</select>
		</p>
	  <sql:query sql="SELECT * FROM disease order by disease_id asc" var="disease" />
	<table>
		<tr>
			<th>編號</th><th>疾病名稱</th><th>特殊疾病說明</th>
		</tr>
	<c:forEach items="${disease.rowsByIndex}" var="disease_put" >	
		<tr align="center">
			<td>${disease_put[0]}</td><td>${disease_put[1]}</td><td><input type="text" name="text${disease_put[0]}" size="50"></td>
		</tr>
	</c:forEach>  
	</table>
	<p>
	  <input type="submit" name="Submit" value="送出" onClick="return checkdata()">
	</p>
	</form>
</div>
<%--置中結束--%>
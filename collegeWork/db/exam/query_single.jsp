<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<table align="center">
  <tr>
    <td>
		<center>單項查詢-請選擇以系級查詢或學號查詢</center><br>
		<form name="form" method="post" action="query_single_deal.jsp">
		  <p>．系級：
		  
			<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
		
			<select name="select0">
			  <c:forEach items="${result.rowsByIndex}" var="row" >
			  <option value="${row[0]}">
			  ${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}
			  </option>
			  </c:forEach>
			</select>
		  </p>
		  <p>．選項：
			<sql:query sql="SELECT * FROM item order by item_id" var="item" />
			<select name="select1">	
				<c:forEach items="${item.rowsByIndex}" var="item_put">
				<option value="${item_put[0]}">
				${item_put[0]}.${item_put[5]} ${item_put[1]} ${item_put[2]}
				</option>
				</c:forEach>
			</select>			
		  </p>  
		  <p>．學號：
			<input type="text" name="textfield0">
		  </p>    
		  <p><br><center><input type="submit" name="Submit" value="查詢"></center>
		  </p>  
		
		</form>
	</td>
  </tr>
</table>
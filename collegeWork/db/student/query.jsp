<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
查詢基本資料 -請選擇以系級查詢或學號查詢
<form name="form" method="post" action="query_deal.jsp">
  <p>．系級：
  
    <sql:query sql="SELECT * FROM class order by class_id asc" var="result" />

    <select name="class_id">
      <c:forEach items="${result.rowsByIndex}" var="row" >
      <option value="${row[0]}">
	  ${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}
      </option>
      </c:forEach>
        </select>	
  </p>
  <p>．學號：
    <input type="text" name="textfield0">
  </p>
  <p>    <input type="submit" name="Submit" value="查詢"> 
  </p>
</form>
<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<table align="center">
  <tr>
    <td>
	  <p align="center">異常明細查詢-請選擇以系級查詢或學號查詢 </p>
      <sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
      <form name="form" method="post" action="query_abnormal_deal.jsp">
        <p>．系級：
            <select name="select0">
              <c:forEach items="${result.rowsByIndex}" var="row" >
              <option value="${row[0]}"> ${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]} </option>
              </c:forEach>
            </select>
        </p>
        <p>．學號：
            <input type="text" name="textfield0">
        </p>
        <p align="center">
          <input type="submit" name="Submit" value="查詢">
        </p>
    </form>
	</td>
  </tr>
</table>

<%@ include file="../check/session/read.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT comment FROM ch_comment where isbn = '${sessionScope.isbn}' AND id = '${sessionScope.id}' AND chapter = ${sessionScope.chapter}" var="comment"/>

<form name="form1" method="post" action="comment_deal.jsp">
  <table width="88%" border="0" align="center">
    <tr> 
		<c:forEach items="${comment.rowsByIndex}" var="comment_put">
		<td rowspan="2"><textarea name="textarea" cols="80" rows="4">${comment_put[0]}</textarea></td>
		</c:forEach>
		
      
      <td> <p> 
          <input name="radiobutton" type="radio" value="radiobutton" checked>
          修改
		  <br>
          <input type="radio" name="radiobutton" value="radiobutton">
          刪除</p>
        </td>
    </tr>
    <tr> 
      <td><input type="submit" name="Submit" value="確定更動"></td>
    </tr>
  </table>
  </form>




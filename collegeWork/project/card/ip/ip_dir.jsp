<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:query var="identify">
  SELECT * FROM identify where id = ${sessionScope.id} AND kind = '${param.kind}'
</sql:query>

<div align="center">
  <form name="form1" method="post" action="ip_deal.jsp">
    <p>Manage Intellectual Property</p>
    <table width="730" border="0">
      <tr>
        <td width="33">&nbsp;</td>
        <td width="176">Directory/Site</td>
        <td width="253">Personal Site/Article</td>
        <td width="122">ID</td>
        <td width="124">Group</td>
      </tr>
	  <tr>
	   	    <td width="33">&nbsp;</td>
			<td colspan="4"><a href="ip.jsp">Back </a></td>
	  </tr>

	  <c:forEach items="${identify.rowsByIndex}" var="id_put">
		  <tr>
		    <td><input type="checkbox" name="checkbox" value="${id_put[0]}"></td>
			<td><img src="../images/html.gif" /><a href="${id_put[2]}">${id_put[3]}</a></td>
			<td>
			<c:if test="${id_put[8]=='1'}"><img src="../images/done.gif" /></c:if>
			<c:if test="${id_put[8]=='0'}"><img src="../images/!.gif" /></c:if>			
			<a href="${id_put[4]}">${id_put[5]}</a>
			</td>
			<td><strong>${id_put[6]}</strong></td>
			<td><input name="textfield" type="text" size="10" value="${id_put[7]}"></td>
	      </tr>
      </c:forEach>
    </table>
    <p>&nbsp;    </p>
    <p>
      <input type="submit" name="Submit" value="Delete">
      <input type="submit" name="Submit" value="Public">
	  <input type="submit" name="Submit" value="Private">
      <input type="submit" name="Submit" value="Receive" disabled="disabled">
      <input type="submit" name="Submit" value="Grouping">
    </p>
  </form>
</div>

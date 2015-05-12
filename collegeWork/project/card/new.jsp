<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%
//得到來源URL
String vendorA = request.getParameter("url");
//取出hostname，例如: http://www.idealist.idv.tw/index.jsp，這裡host將得到 www.idealist.idv.tw
int end = vendorA.indexOf("/", 7);
String host = vendorA.substring(0, end);
pageContext.setAttribute("dns",host);
%>
<a href="./"><img src="top.gif" border="0"/></a>

<sql:query var="echo">
  SELECT * FROM echo where dns = '${dns}'
</sql:query>

<c:forEach items="${echo.rowsByIndex}" var="echo_put">
	<c:set var="echosite" value="${echo_put[1]}" />
</c:forEach>

<p>&nbsp;</p>
<form name="form1" method="post" action="new_deal.jsp">
  <table width="390" border="0" align="center">
    <tr>
      <td width="27">Title:</td>
      <td width="353"><input name="textfield1" type="text" value="${param.title}" size="50"></td>
    </tr>
    <tr>
      <td>Site:</td>
      <td><input name="textfield2" type="text" value="${param.url}" size="50"></td>
    </tr>
    <tr>
      <td>Response:</td>	 
	      <td><input name="textfield3" type="text" value="${echosite}" size="50"></td>	  
    </tr>
    <tr>
      <td>Description:</td>
      <td><textarea name="textarea" cols="41" rows="4"></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
	  	<c:if test="${echo.rowCount!='0'}">
　　        <input type="submit" name="Submit" value="Identify" />
		</c:if>
		<c:if test="${echo.rowCount=='0'}">
		   Mission Failure!<br/><br/>
		   The site is not supported by IIS.<br/><br/>
		   <a href="./">Click here to visit IIS.</a><br/><br/>
		   <input type="hidden" name="stupid" value="1" />
		   <input type="submit" name="Submit" value="I'll do it manually!  Submit anyway!" />
		</c:if>
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>


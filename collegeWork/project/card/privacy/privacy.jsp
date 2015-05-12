<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>


<sql:query var="id">
  SELECT * FROM user WHERE id = ${sessionScope.id}
</sql:query>


<div align="center">
	<p><a href="../user/main.jsp">Return Main Page</a> </p>
	<p>Privacy</p>
	<form name="form" method="post" action="basic_deal.jsp">
      <p>&nbsp;</p>
      <table width="700" border="0">
        <tr>
          <td width="128"><div align="right">ID:</div></td>
          <td width="225"> 00000000${sessionScope.id}
          <input type="hidden" name="textfield0" value="00000000${sessionScope.id}" />          </td>
          <td width="188">Public</td>
          <td width="141">Auto Pass Data</td>
        </tr>
		
		
		<c:forEach items="${id.rowsByIndex}" var="row">			
        <tr>
          <td><div align="right">Name:
          </div></td>
          <td> ${row[2]} ${row[3]}</td>
          <td><input name="checkbox" type="checkbox" value="checkbox" checked="checked" /></td>
          <td><input type="checkbox" name="checkbox8" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Nick Name:</div></td>
          <td>${row[4]}</td>
          <td><input name="checkbox2" type="checkbox" value="checkbox" checked="checked" /></td>
          <td><input type="checkbox" name="checkbox9" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Birthdate:</div></td>
          <td>${row[7]}/${row[5]}${row[6]}</td>
          <td><input name="checkbox3" type="checkbox" value="checkbox" checked="checked" /></td>
          <td><input type="checkbox" name="checkbox10" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Sex: </div></td>
          <td><c:if test="${row[8]=='1'}"> Male </c:if>
              <c:if test="${row[8]=='0'}"> Female </c:if>          </td>
          <td><input name="checkbox4" type="checkbox" value="checkbox" checked="checked" /></td>
          <td><input type="checkbox" name="checkbox11" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Primary Email: </div></td>
          <td>${row[9]}</td>
          <td><input name="checkbox5" type="checkbox" value="checkbox" checked="checked" /></td>
          <td><input type="checkbox" name="checkbox12" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Address:
            </div>
            <div align="right"></div></td>
          <td>${row[10]}</td>
          <td><input name="checkbox6" type="checkbox" value="checkbox" /></td>
          <td><input type="checkbox" name="checkbox13" value="checkbox" /></td>
          </tr>
        <tr>
          <td><div align="right">Phone:</div></td>
          <td>${row[11]}</td>
          <td><input type="checkbox" name="checkbox7" value="checkbox" /></td>
          <td><input type="checkbox" name="checkbox14" value="checkbox" /></td>
          </tr>
		</c:forEach>		
      </table>
	  <p>&nbsp;      </p>
	  <p>
	    <input type="submit" name="Submit" value="Edit" onClick="return checkdata()">
      </p>
	</form>
</div>
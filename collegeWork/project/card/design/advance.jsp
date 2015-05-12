<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>



<style type="text/css">
<!--
.style3 {color: #00FF00}
.style4 {color: #0000FF}
-->
</style>


<sql:query var="id">
  SELECT * FROM user WHERE id = ${sessionScope.id}
</sql:query>

<sql:query var="design">
  SELECT * FROM design WHERE id = ${sessionScope.id}
</sql:query>

<c:choose>
	<c:when test="${design.rowCount=='0'}">
		<c:set value="../images/bluelove.gif" var="background" />
	</c:when>
	<c:otherwise>
		<c:forEach items="${design.rowsByIndex}" var="design_put">
			<c:set value="../images/${design_put[1]}" var="page" />
			<c:set value="../images/${design_put[2]}" var="background" />
		</c:forEach>
	</c:otherwise>
</c:choose>	
<body background="${page}">


<div align="center">
	<p>Design</p>
  <form name="form" method="post" action="design_deal.jsp">
	  <table width="434" border="0" cellspacing="0">
        <tr>
          <td background="${background}"><span class="style3"></span></td>
          <td background="${background}"><img src="../images/p1.jpg" width="154" height="115" /></td>
        </tr>
        <tr>
          <td width="129" background="${background}"><div align="right">ID:</div></td>
          <td width="295" background="${background}"><span class="style4">
			  00000000${sessionScope.id}
		      <input type="hidden" name="textfield0" value="00000000${sessionScope.id}" />		  
	      </span></td>
        </tr>
		
		
		<c:forEach items="${id.rowsByIndex}" var="row">			
        <tr>
          <td background="${background}"><div align="right">First Name:
          </div></td>
          <td background="${background}"><span class="style4">          ${row[2]} </span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Last Name:</div></td>
          <td background="${background}"><span class="style4">          ${row[3]} </span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Nick Name:</div></td>
          <td background="${background}"><span class="style4">          ${row[4]}</span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Birthdate:</div></td>
          <td background="${background}"><span class="style4">${row[7]}/${row[5]}/${row[6]}</span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Sex: </div></td>
          <td background="${background}">
		  	<span class="style4">
		  	<c:if test="${row[8]=='1'}">
		  	  Male            </c:if>
		  	<c:if test="${row[8]=='0'}">
		  	  Female            </c:if>
          </span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Primary Email: </div></td>
          <td background="${background}"><span class="style4">          ${row[9]}</span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Address:
            </div>
          <div align="right"></div></td>
          <td background="${background}"><span class="style4">          ${row[10]}</span></td>
        </tr>
        <tr>
          <td background="${background}"><div align="right">Phone:</div></td>
          <td background="${background}"><span class="style4">          ${row[11]}</span></td>
        </tr>
		</c:forEach>		
    </table>
      <p>Font Color:
        <input name="textfield" type="text" value="#008080" size="10" />
      </p>
      <p>Font Size:
        <input name="textfield3" type="text" value="12pt" size="10" />
      </p>
      <p>Background Color:
        <input name="textfield2" type="text" value="#ff00ff" size="10" />
      </p>
      <p>Page Picture:
        <input name="textfield222" type="text" value="http://www.nccu.edu.tw/abc.gif" size="30" />
</p>
      <p>Card Picture:
        <input name="textfield22" type="text" value="http://www.nccu.edu.tw/abc.gif" size="30" />
      </p>
    <p>
        <input type="submit" name="Submit" value="Change" onClick="return checkdata()">
    </p>
  </form>
</div>
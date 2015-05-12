<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:query var="product">
  SELECT * FROM product
</sql:query>

<table width="879" border="0">
  <tr>
    <td colspan="2"><div align="center">Jimmy's Bidding Website </div></td>
  </tr>
  <tr>
    <td width="137" valign="top">
	<c:if test="${sessionScope.id!=null}">
		Welcome, ${sessionScope.id}<br/>
		<a href="check/logout.jsp">µn¥X</a>
	</c:if>
	<c:if test="${sessionScope.id==null}">
		
	<form name="form1" method="post" action="check/login.jsp">
      <p>ID:
        <input name="textfield1" type="text" size="10">
      </p>
      <p>PW:
        <input name="textfield2" type="password" size="10">
      </p>
      <p>
        <input type="submit" name="Submit" value="Login">
        <a href="_blank">Sign Up</a> </p>
    </form>
	</c:if>	  		
    </td>
    <td width="732">
	  <p>
	    <c:forEach items="${product.rowsByIndex}" var="product_put">
		  <c:if test="${product_put[8]==0}">
		  ¡¸
		  </c:if>
		  <c:if test="${product_put[8]==1}">
		    <a href="http://npc.twbbs.org/000000001.htm">¡¹</a>
		  </c:if>		  
	      <a href="product/product.jsp?pid=${product_put[0]}">
  	      ${product_put[1]}</a><br/>
  	      <br/>
        </c:forEach>
  </tr>
</table>

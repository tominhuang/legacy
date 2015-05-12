<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  INSERT INTO member
  VALUES ( ? , ? , ? )  
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.textfield3}" />

</sql:update>


<div align="center">
	<br><br>
	恭禧你<br><br>
	帳號 ${param.textfield0} 已經建立<br><br>
	你立即可以登入
</div>
<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>>

<sql:update>
  UPDATE bookinfo
  SET name = ? , author = ? , publisher = ? , date = ? , ISBN = ? , type = ? ,  language = ? 
  WHERE ISBN = '${param.textfield4}'
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.textfield2}" />
  <sql:param value="${param.textfield3}" />
  <sql:param value="${param.textfield4}" />  
  <sql:param value="${param.textfield5}" />
  <sql:param value="${param.textfield6}" />

</sql:update>


<sql:query var="result">
  SELECT * FROM bookinfo where ISBN = '${param.textfield4}'
</sql:query>

修改成功<br><br>
書籍基本資料報告單<hr>
<c:forEach items="${result.rowsByIndex}" var="row">
	書名：${row[0]}<br>
	作者：${row[1]}<br>
	出版社：${row[2]}<br>
	出版日期：${row[3]}<br>	
	ISBN：${row[4]}<br>
	類別：${row[5]}<br>	
	語言：${row[6]}<br>
</c:forEach>
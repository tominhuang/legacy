<%@ include file="mysql.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>


<table>
  <tr>
    <td>
	  <p>請選擇 ID，並按更新，產生 RSS 。</p>
      <sql:query sql="SELECT * FROM user order by username asc" var="result" />
      <form name="form" method="get" action="">
        <p>ID：
            <select name="user">
              <c:forEach items="${result.rowsByIndex}" var="row" >
              <option value="${row[1]}"  <c:if test="${param.user==row[1]}">selected</c:if>> ${row[1]}</option>
              </c:forEach>
            </select>
          <input type="submit" name="Submit" value="更新">
        </p>
      </form>
	</td>
  </tr>
</table>

<c:if test="${param.user!=null}">
${param.user}的RSS已經更新。<br/>
RSS網址為  <A href="http://tomin.twbbs.org:8080/rss/${param.user}.xml">http://tomin.twbbs.org:8080/rss/${param.user}.xml</A><br/><br/><br/>
	<iframe scrolling="yes" height="800" width="800" marginheight="0" marginwidth="0" src="http://tomin.twbbs.org:8080/rss?user=${param.user}" frameborder="0"></iframe>
</c:if>

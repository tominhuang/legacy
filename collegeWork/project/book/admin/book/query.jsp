<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

查詢基本資料
<form name="form" method="post" action="query_deal.jsp">
  <p>． 
    <select name="select">
      <option value="name">書名</option>
      <option value="author">作者</option>
      <option value="publisher">出版社</option>
      <option value="date">出版日期</option>
      <option value="type">類型</option>
      <option value="ISBN">ISBN</option>
    </select>
    <input type="text" name="textfield0">
    <input type="submit" name="Submit" value="查詢">
  </p>
  </form>
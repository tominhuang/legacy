<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>


<c:set var="isbn" value="${param.isbn}" scope="session"/>
<c:set var="chapter" value="0" scope="session"/>


<frameset rows="60,*" frameborder="NO" border="0" framespacing="0">
  <frame src="page.jsp?isbn=${param.isbn}" name="topFrame" scrolling="NO" noresize >
  <frame src="show.jsp?isbn=${param.isbn}" name="main_book">
</frameset><noframes></noframes>

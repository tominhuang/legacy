
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<c:if test="${sessionScope.name==null}">
		<p>專案會議室</p>
		<form name="form" method="post" action="name.jsp">
		  請輸入你的名字： 
		  <input name="textfield" type="text" size="12">
		  <input type="submit" name="Submit" value="送出"> 
		</form>	
	</c:if>
	
	<c:if test="${sessionScope.name!=null}">
		<frameset rows="*,80" frameborder="NO" border="0" framespacing="0">
			<frame src="chat_show.jsp" name="main">
			<frame src="chat_input.jsp" name="bottomFrame" scrolling="NO" noresize></frameset>
		<noframes><body></body></noframes>
	</c:if>
	
</div>


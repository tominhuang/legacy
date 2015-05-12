<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<p>刪除資料</p>
	<hr>			
	<%--輸入--%>
    <c:if test="${param.select==null}">
		<form name="form1" method="post" action="">
    <p> ISBN: 
      <input type="text" name="textfield0">
      <select name="select">
        <option value="0">刪除全部的資料</option>
        <option value="1">只保留基本資料</option>
        <option value="2">只刪除會員資料</option>
        <option value="3">只刪除特殊資料</option>
      </select>
    </p>
			<p><input type="submit" name="Submit" value="確定刪除"></p>
		</form>
	</c:if>
	
    <c:if test="${param.select!=null}">
	
		<%--ISBN--%>
		<c:if test="${param.textfield0==''}">
			ISBN不可空白
		</c:if>
		
		<c:if test="${param.textfield0!=''}">
			<%@ include file="../include/mysql.jsp" %>
			<%--刪除書籍--%>
			<c:if test="${param.select!='4'}">
				<sql:update sql="delete from bookinfo where ISBN = '${param.textfield0}' "/>
				<p><u>書籍 ${param.textfield0} 刪除成功</u></p>
			</c:if>
		</c:if>	 	
	</c:if>	 			
</div>
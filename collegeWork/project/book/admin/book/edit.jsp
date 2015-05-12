<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.keyword==null}">
	<p>修改基本資料</p>
	<form name="form" method="post" action="edit.jsp">
  <p>ISBN: 
    <input type="text" name="keyword">
  </p>
  <p> 
    <input type="submit" name="Submit" value="修改">

  </p>
</form>
</c:if>
<c:if test="${param.keyword!=null}">
	<c:choose>
		<%--學號空白--%>
		<c:when test="${param.keyword==''}">
			ISBN不能空白
		</c:when>
		<c:otherwise>
			<script language="javascript">
			function checkdata() {
				var id = document.form.textfield0.value;
				var isbn = document.form.textfield4.value;
				if(id==""){
					alert("書名一定要填！");
					return false;
				}
				else if(isbn==""){
					alert("ISBN一定要填！");
					return false;
				}				
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM bookinfo where ISBN = '${param.keyword}'" var="bookinfo" />	
			<c:choose>
				<c:when test="${bookinfo.rowCount=='0'}">
					沒有ISBN ${param.id} 的基本資料
				</c:when>
				
				<c:otherwise>
					修改基本資料
				
					<c:forEach items="${bookinfo.rowsByIndex}" var="bookinfo_put" >
						<form name="form" method="post" action="edit_deal.jsp">
						  <p>書名： 
							<input type="text" name="textfield0" value="${bookinfo_put[0]}">
						  </p>
						  <p> 作者： 
							<input type="text" name="textfield1" value="${bookinfo_put[1]}">
						  </p>
						  <p> 出版社： 
							<input type="text" name="textfield2" value="${bookinfo_put[2]}">
						  </p>
						  <p> 出版日期： 
							<input type="text" name="textfield3" value="${bookinfo_put[3]}">
						  </p>
						  <p>ISBN ： 
							<input type="text" name="textfield4" value="${bookinfo_put[4]}">
						  </p>
						  <p>類別： 
							<input type="text" name="textfield5" value="${bookinfo_put[5]}">
						  </p>
						  <p> 語言： 
							<input type="text" name="textfield6" value="${bookinfo_put[6]}">
						  </p>
						  <p>
							 <input type="submit" name="Submit" value="送出" onClick="return checkdata()"> 
						  </p>
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</c:otherwise>				
	</c:choose>
</c:if>
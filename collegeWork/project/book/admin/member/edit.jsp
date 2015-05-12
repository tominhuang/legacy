<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.keyword==null}">
	
<p>修改會員資料</p>
	<form name="form" method="post" action="edit.jsp">
  <p>帳號: 
    <input type="text" name="keyword">
  </p>
  <p> 
    <input type="submit" name="Submit" value="修改">

  </p>
</form>
</c:if>
<c:if test="${param.keyword!=null}">
	<c:choose>
		<%--帳號空白--%>
		<c:when test="${param.keyword==''}">
			帳號不能空白
		</c:when>
		<c:otherwise>
			<script language="javascript">
			function checkdata() {
				var id = document.form.textfield0.value;
				var pass = document.form.textfield1.value;
				var email = document.form.textfield2.value;				
				if(id==""){
					alert("帳號一定要填！");
					return false;
				}
				else if(pass==""){
					alert("密碼一定要填！");
					return false;
				}
				else if(email==""){
					alert("信箱一定要填！");
					return false;
				}								
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM member where id = '${param.keyword}'" var="member" />	
			<c:choose>
				<c:when test="${member.rowCount=='0'}">
					沒有帳號 ${param.id} 的基本資料
				</c:when>
				
				<c:otherwise>
					修改基本資料
				
					<c:forEach items="${member.rowsByIndex}" var="member_put" >
						<form name="form" method="post" action="edit_deal.jsp?id=${param.id}">
						  
  <p>帳號： 
    <input type="text" name="textfield0" value="${member_put[0]}">
						  </p>
						  
  <p> 密碼： 
    <input type="text" name="textfield1" value="${member_put[1]}">
						  </p>
						  
  <p> 信箱： 
    <input type="text" name="textfield2" value="${member_put[2]}">
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
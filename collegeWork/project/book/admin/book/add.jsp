<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT * FROM typeno" var="typeno" />
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
新增書籍資料 
<form name="form" method="post" action="add_deal.jsp">
  <p>書名： 
    <input type="text" name="textfield0">
  </p>
  <p> 作者： 
    <input type="text" name="textfield1">
  </p>
  <p> 出版社： 
    <input type="text" name="textfield2">
  </p>
  <p> 出版日期： 
    <input type="text" name="textfield3">
  </p>
  <p>ISBN ： 
    <input type="text" name="textfield4">
  </p>
  <p>類別：
	<select name="textfield5">
	  <c:forEach items="${typeno.rowsByIndex}" var="typeno_put" >
	  <option value="${typeno_put[0]}">
			${typeno_put[0]}
	  </option>
	  </c:forEach>
	</select>
  </p>
  <p> 語言： 
    <select name="select">
      <option value="繁體中文">繁體中文</option>
      <option value="簡體中文">簡體中文</option>
    </select>
  </p>
  <p> 
    <input type="submit" name="Submit" value="送出" onClick="return checkdata()">
  </p>
  </form>
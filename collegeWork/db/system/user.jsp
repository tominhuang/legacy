<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata2() {
	var radio="";
    for(i=0; i<form2.radiobutton.length; i++){
      if(form2.radiobutton[i].checked){
        radio = form2.radiobutton[i].value;
        break;
      }
    }
   	var a = document.form2.id2.value;
   	var b = document.form2.password2.value;

   	if(radio==""){
   		alert("一定要先核取！");		
	}
	else if(a.length>15)
   		alert("帳號太長囉！");
	else if(b.length>15)
   		alert("密碼太長囉！");				
	else{
		return true;
	}
	return false;	
}
</script>

<script language="javascript">
function checkdata() {
   	var a = document.form.id.value;
   	var b = document.form.password.value;
   	if(a=="" || b==""){
   		alert("帳號和密碼一定要填！");
	}
	else if(a.length>15)
   		alert("帳號太長囉！");
	else if(b.length>15)
   		alert("密碼太長囉！");				
	else{
		return true;
	}
	return false;			
}
</script>
<sql:query sql="SELECT * FROM user" var="user" />
<form name="form2" method="get" action="../user">
<table width="100%">
  <tr>
     <td colspan="6">使用者及密碼設定</td>
  </tr>
  <tr>
  	 <td>核取</td>
     <td>使用者</td>
     <td>密碼</td>
	 <td>身份</td>	 
     <td colspan="2">權限</td>
  </tr>
  <c:forEach items="${user.rowsByIndex}" var="user_put" >	
  <tr>
	 <td><input name="radiobutton" type="radio" value="${user_put[0]}"></td>  	
  	 <td>${user_put[0]}</td>
  	 <td>${user_put[1]}</td>
	 <c:if test="${user_put[2]==0}">
	 	<td><b>停用</b></td>
		<td>無</td>
		</strike>
	 </c:if>	 
	 <c:if test="${user_put[2]==1}">
	 	<td>基本資料管理者</td>
		<td>學生基本資料</td>
	 </c:if>
	 <c:if test="${user_put[2]==2}">
	 	<td>管理、分析健檢資料人員</td>
		<td>健診資料管理、特殊疾病記錄、統計分析</td>
	 </c:if>
	 <c:if test="${user_put[2]==3}">
	 	<td>管理矯治人員</td>
		<td>矯治記錄管理</td>
	 </c:if>
	 <c:if test="${user_put[2]==4}">
	 	<td>管理健檢資料人員</td>
		<td>健診資料管理、特殊疾病記錄</td>
	 </c:if>
	 <c:if test="${user_put[2]==5}">
	 	<td>分析健檢資料人員</td>
		<td>健診資料管理、統計分析</td>
	 </c:if>
	 <c:if test="${user_put[2]==9}">
	 	<td>高級授權人員（維護掌控系統人員）</td>
		<td>所有權限</td>
	 </c:if>	 	 	 	 
	 	 	 
	 <c:if test="${user_put[0]!='admin'}">
		<td width="5%"><a href="../user?del=${user_put[0]}">刪除</a></td>	 
	 </c:if>

  </tr>
  </c:forEach>
</table>
	<br>
  修改使用者:
    <select name="select2">
      <option value="1">基本資料管理者</option>
      <option value="2">管理、分析健檢資料人員</option>
      <option value="3">管理矯治人員</option>
      <option value="4">管理健檢資料人員</option>
      <option value="5">分析健檢資料人員</option>
      <option value="9">高級授權人員</option>
	  <option value="0">停用</option>
    </select>
  變更帳號:
  <input type="text" name="id2">
  變更密碼:
  <input type="password" name="password2">
  <input type="submit" name="Submit2" value="修改" onClick="return checkdata2()">
</form>

<form name="form" method="get" action="../user">
	新增使用者:
	  <select name="select">
	    <option value="1">基本資料管理者</option>
		<option value="2">管理、分析健檢資料人員</option>
		<option value="3">管理矯治人員</option>
		<option value="4">管理健檢資料人員</option>
		<option value="5">分析健檢資料人員</option>
		<option value="9">高級授權人員</option>												
      </select>
	 設定帳號:
	 <input type="text" name="id">
	 設定密碼:
	 <input type="password" name="password">	 
	 <input type="submit" name="Submit" value="新增" onClick="return checkdata()">
</form>
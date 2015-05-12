<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
   	if(id==""){
   		alert("學號一定要填！");
		return false;
	}			
	else{
		return true;
	}			
}
</script>
新增基本資料
<form name="form" method="post" action="add_deal.jsp">
  <p>學號：
    <input type="text" name="textfield0">
(必填)</p>
  <p>系級：
  
<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />


<select name="select0">
<c:forEach items="${result.rowsByIndex}" var="row" >
<option value="${row[0]}">
	${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}
</option>
</c:forEach>
</select>	  
</p>
  <p>  姓名：
    <input type="text" name="textfield1">
  </p>
  <p>  性別： 
    <input name="sex" type="radio" value="男" checked> 
    男
    <input name="sex" type="radio" value="女">
女  </p>
  <p>  身分證字號： 
    <input type="text" name="textfield2"> 
  </p>
  <p>  出生日期： 
    <select name="select1">
	  <c:forEach begin="1970" end="1999" var="year">
	  <option>${year}</option>
	  </c:forEach>
    </select> 
    年
    <select name="select2">
	  <c:forEach begin="1" end="12" var="month">
	  <option>${month}</option>
	  </c:forEach>	  
    </select>
	月
	<select name="select3">
	  <c:forEach begin="1" end="31" var="day">
	  <option>${day}</option>
	  </c:forEach>  
	</select>
日  </p>
  <p>  地址： 
    <input type="text" name="textfield3"> 
  </p>
  <p>  電話： 
    <input type="text" name="textfield4"> 
  </p>
  <p>  手機： 
    <input type="text" name="textfield5"> 
  </p>
  <p>  e-mail ： 
    <input type="text" name="textfield6">
  </p>
  <p>  是否為轉學生： 
    <input name="trans" type="radio" value="1"> 
    是
    <input name="trans" type="radio" value="0" checked> 
  否  </p>
  <p>    就學狀態： 
    <input name="studying" type="radio" value="在學" checked>
    在學
    <input name="studying" type="radio" value="休學">
    休學
    <input name="studying" type="radio" value="畢業">
    畢業
    <input name="studying" type="radio" value="肄業">
  肄業</p>
  <p>  緊急聯絡人姓名：
    <input type="text" name="textfield9">
  </p>
  <p>  與聯絡人關係：
    <input type="text" name="textfield10">
  </p>
  <p>  聯絡人電話：
    <input type="text" name="textfield11">
  </p>
  <p>  聯絡人手機：
    <input type="text" name="textfield12">
  </p>
  <p>
    <input type="submit" name="Submit" value="送出" onClick="return checkdata()"> 
  </p>
</form>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
	var pass1 = document.form.textfield1.value;
	var pass2 = document.form.textfield2.value;	
	var email = document.form.textfield3.value;	
   	if(id==""){
   		alert("帳號一定要填！");
		return false;
	}
   	else if(pass1==""){
   		alert("密碼一定要填！");
		return false;
	}
   	else if(pass2==""){
   		alert("密碼確認一定要填！");
		return false;
	}
   	else if(email==""){
   		alert("電子信箱一定要填！");
		return false;
	}	
   	else if(pass1!=pass2){
   		alert("密碼與密碼確認不符合！");
		return false;
	}						
	else{
		return true;
	}			
}
</script>

<div align="center"> 
  <p>&nbsp;</p>
  <p>註冊會員 <a href="about:blank">(說明)</a></p>
  <form name="form" method="post" action="register_deal.jsp">
    <table width="50%" border="0">
      <tr>
        <td><div align="right">帳號：</div></td>
        <td><input type="text" name="textfield0"></td>
      </tr>
      <tr>
        <td><div align="right">密碼：</div></td>
        <td><input type="password" name="textfield1"></td>
      </tr>
      <tr>
        <td><div align="right">密碼確認：</div></td>
        <td><input type="password" name="textfield2"></td>
      </tr>
      <tr>
        <td><div align="right">電子信箱：</div></td>
        <td><input type="text" name="textfield3"></td>
      </tr>
    </table>
    <p> 
		<input type="submit" name="Submit" value="申請" onClick="return checkdata()">
	  </p>
	  </form>
</div>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>


<script language="javascript">
function checkdata() {
   	var password = document.form.textfield1.value;
	var password2 = document.form.textfield2.value;
   	if(password==""){
   		alert("Password Empty");
		return false;
	}
   	else if(password2==""){
   		alert("Re-type Password Empty");
		return false;
	}
   	else if(password!=password2){
   		alert("Password Not Equal");
		return false;
	}					
	else{
		return true;
	}			
}
</script>



<div align="center">
	<p><a href="../"><img src="../top.gif" border="0"/></a></p>
	<p>Registration
  </p>
	<form name="form" method="post" action="register_deal.jsp">
      <p>&nbsp;</p>
      <table width="434" border="0">
        <tr>
          <td width="129"><div align="right">ID:</div></td>
          <td width="295">This will be assigned later.</td>
        </tr>
        <tr>
          <td><div align="right">Password:</div></td>
          <td><input type="password" name="textfield1" />          </td>
        </tr>
        <tr>
          <td><div align="right">Password Again:</div></td>
          <td><input name="textfield2" type="password" id="textfield2" />          </td>
        </tr>
        <tr>
          <td><div align="right">First Name:
          </div></td>
          <td><input type="text" name="textfield3" />          </td>
        </tr>
        <tr>
          <td><div align="right">Last Name:</div></td>
          <td><input type="text" name="textfield4" />          </td>
        </tr>
        <tr>
          <td><div align="right">Nick Name:</div></td>
          <td><input type="text" name="textfield5" /></td>
        </tr>
        <tr>
          <td><div align="right">Birthdate:</div></td>
          <td><select name="select">
            <option value="1" selected="selected">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </select>
            <input name="textfield6" type="text" value="dd" size="6" />
           <input name="textfield7" type="text" value="yyyy" size="6" /></td>
        </tr>
        <tr>
          <td><div align="right">Sex: </div></td>
          <td><select name="select2">
            <option value="1" selected="selected">Male</option>
            <option value="0">Female</option>
                              </select></td>
        </tr>
        <tr>
          <td><div align="right">Primary Email: </div></td>
          <td><input type="text" name="textfield8" /></td>
        </tr>
        <tr>
          <td><div align="right">Address:
            </div>
            <div align="right"></div></td>
          <td><input type="text" name="textfield9" /></td>
        </tr>
        <tr>
          <td><div align="right">Phone:</div></td>
          <td><input type="text" name="textfield10" /></td>
        </tr>
      </table>
	  <p>
	    <input type="submit" name="Submit" value="Sign Up" onClick="return checkdata()">
	  </p>
  </form>
</div>
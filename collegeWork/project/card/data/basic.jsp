<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>


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

<sql:query var="id">
  SELECT * FROM user WHERE id = ${sessionScope.id}
</sql:query>


<div align="center">
	<p><a href="main.jsp">Return Main Page</a> </p>
	<p>Edit Basic Data
  </p>
	<form name="form" method="post" action="basic_deal.jsp">
      <p>&nbsp;</p>
      <table width="434" border="0">
        <tr>
          <td width="129"><div align="right">ID:</div></td>
          <td width="295">
				00000000${sessionScope.id}
				<input type="hidden" name="textfield0" value="00000000${sessionScope.id}" />
		  </td>
        </tr>
        <tr>
          <td><div align="right">Old Password: </div></td>
          <td><input type="password" name="textfield99" /></td>
        </tr>
        <tr>
          <td><div align="right">New Password:</div></td>
          <td><input type="password" name="textfield1" />          </td>
        </tr>
        <tr>
          <td><div align="right">Password Again:</div></td>
          <td><input name="textfield2" type="password" id="textfield2" />          </td>
        </tr>
		
		
		<c:forEach items="${id.rowsByIndex}" var="row">			
        <tr>
          <td><div align="right">First Name:
          </div></td>
          <td><input type="text" name="textfield3" value="${row[2]}" />          </td>
        </tr>
        <tr>
          <td><div align="right">Last Name:</div></td>
          <td><input type="text" name="textfield4" value="${row[3]}" />          </td>
        </tr>
        <tr>
          <td><div align="right">Nick Name:</div></td>
          <td><input type="text" name="textfield5" value="${row[4]}" /></td>
        </tr>
        <tr>
          <td><div align="right">Birthdate:</div></td>
          <td>Month
            <input name="select" type="text" value="${row[5]}" size="6" />
            Day
            <input name="textfield6" type="text" value="${row[6]}" size="6" />
            Year
            <input name="textfield7" type="text" value="${row[7]}" size="6" /></td>
        </tr>
        <tr>
          <td><div align="right">Sex: </div></td>
          <td><select name="select2">
		  	<c:if test="${row[8]=='1'}">
            <option value="1" selected="selected">Male</option>
            <option value="0">Female</option>
            </c:if>
		  	<c:if test="${row[8]=='0'}">
            <option value="1">Male</option>
            <option value="0" selected="selected">Female</option>
            </c:if>			                  
			</select></td>
        </tr>
        <tr>
          <td><div align="right">Primary Email: </div></td>
          <td><input type="text" name="textfield8" value="${row[9]}" /></td>
        </tr>
        <tr>
          <td><div align="right">Address:
            </div>
            <div align="right"></div></td>
          <td><input type="text" name="textfield9" value="${row[10]}" /></td>
        </tr>
        <tr>
          <td><div align="right">Phone:</div></td>
          <td><input type="text" name="textfield10" value="${row[11]}" /></td>
        </tr>
		</c:forEach>		
      </table>
	  <p>
	    <input type="submit" name="Submit" value="Edit" onClick="return checkdata()">
	  </p>
  </form>
</div>
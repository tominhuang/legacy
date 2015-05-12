<%@ page contentType="text/html; charset=big5" %>
<%@ include file="admin/include/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.id!=null}">
	<c:redirect url="member/welcome.jsp"/>
</c:if>
<body topmargin="0" leftmargin="0">
<div align="center"> 
  <table width="100%" border="0">
    <tr>
      
    <td width="50%" align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="700" height="100">
        <param name="movie" value="banner.swf">
        <param name="quality" value="high">
        <embed src="banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="700" height="100"></embed></object></td>
      <td width="*"><form name="form1" method="post" action="check/login.jsp">
        ±b¸¹<a href="member/register.jsp" target="main">(µù¥U?)</a>¡G 
        <input name="textfield1" type="text" size="10">
        <br>
        ±K½X<a href="forget.jsp">(§Ñ°O?)</a>¡G 
        <input name="textfield2" type="password" size="10">
        <input type="submit" name="Submit" value="µn¤J">
          </form>        
    </td>
    </tr>
  </table>
</body>
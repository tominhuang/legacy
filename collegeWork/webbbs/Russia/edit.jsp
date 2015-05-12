<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%-- Cookie要用的import --%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>編輯文章</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<script language="javascript">
function checkdata() {
	var name = document.form.name.value;
	var title = document.form.title.value;
   	var oldpass = document.form.old_password.value;
	
   	if(name=="" || title==""){
   		window.alert("姓名和標題一定要填！");
	}
	else if(oldpass==""){
   		window.alert("原始密碼一定要填！");
	}
	else{
		document.form.submit();
	}			
}
</script>
<body>
<%
	String id=(String)request.getParameter("id");//取得id
	String author=null;
	String subject=null;
	String article=null;

    String sql = "select * from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
	author=rs.getString("author");//取得作者
 	subject=rs.getString("title");//取得標題
	article=rs.getString("article");//取得內容
	}
	//取得cookie
	String pass="";
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
			if (URLDecoder.decode(rcookie[i].getName()).equals("密碼"))
				pass=URLDecoder.decode(rcookie[i].getValue());		
%>	
<form name="form" method="post" action="edit_deal.jsp">
  <p align="center">姓名：
      <input type="text" name="name" value="<%=author%>">
      密碼：
      <input type="password" name="new_password" value="<%=pass%>">
  </p>
  <p align="center">標題：
      <input type="text" name="title" value="<%=subject%>" size="50">
</p>
  <p>
    <textarea name="article" cols="120" rows="20"><%=article%></textarea>
</p>
  <p align="center">請輸入原始密碼：
    <input type="password" name="old_password" value="<%=pass%>">
	<input name="id" type="hidden" value="<%=id%>">
    <input type="button" name="Submit" value="確定修改" onclick="javascript:checkdata()">
  </p>
</form>
</body>
</html>

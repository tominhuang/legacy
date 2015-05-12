<%-- session 的 include --%>
<%@ include file="session.jsp" %>
<!--Cookie要用的import-->
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>回應文章</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<body>
<script language="javascript">
function checkdata() {
   	var a = document.form.textfield1.value;
   	var b = document.form.textfield2.value;
   	if(a=="" || b==""){
   		alert("姓名和標題一定要填！");
		return false;
	}			
	else{
		return true;
	}
			
}
</script>
<%
	String name="";
	String pass="";
	//取得cookie
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
		{
			if (URLDecoder.decode(rcookie[i].getName()).equals("帳號"))
				name=URLDecoder.decode(rcookie[i].getValue());
			if (URLDecoder.decode(rcookie[i].getName()).equals("密碼"))
				pass=URLDecoder.decode(rcookie[i].getValue());			
		}

	String id=(String)request.getParameter("id");
	String way=(String)request.getParameter("way");	
	String author=null;	
	String subject=null;
	String msg=null;
	String article=null;
		
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/theater?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select * from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	rs.first();
	author=rs.getString("author");
 	subject=rs.getString("title");
	msg=rs.getString("article");
	
	//內容處理
	if(way.equals("y")){
		msg =  msg.replaceAll("\r\n\r\n","\r\n");
		article = "※引述《" + author + "》之銘言：\r\n: " + msg.replaceAll("\r\n","\r\n: ");
	}else if(way.equals("n")){
		article = "";
	}else if(way.equals("repost")){
		article = msg;
	}else{//all(全部)
		article = "※引述《" + author + "》之銘言："
				+ "\r\n: 標題: " + subject
				+ "\r\n: 時間: " + rs.getString("date") + " " + rs.getString("time")
				+ "\r\n: " + msg.replaceAll("\r\n","\r\n: ")
				+ "\r\n: --"
				+ "\r\n: ※ 發信站: 劇場組"  
				+ "\r\n: ◆ From: " + rs.getString("IP");								
	}
	rs.close();
	stmt.close();
	con.close(); 	
%>
<form name="form" method="post" action="reply_deal.jsp">
  <p align="center">姓名：
      <input type="text" name="textfield1" value="<%=name%>">
密碼：
    <input type="password" name="textfield3" value="<%=pass%>">
</p>
  <p align="center">回應：
      <input name="textfield2" type="text" value="<%=subject%>" size="50">
</p>
  <p align="center">
    <select name="menu" onChange="MM_jumpMenu('parent',this,0)">
      <option selected>內容</option>
      <option value="reply.jsp?id=<%=id%>&way=y">引用</option>
      <option value="reply.jsp?id=<%=id%>&way=n">空白</option>
      <option value="reply.jsp?id=<%=id%>&way=repost">重貼</option>
      <option value="reply.jsp?id=<%=id%>&way=all">全部</option>	  
    </select>
  </p>
  <p>
    <textarea name="textarea" cols="120" rows="20"><%=article%></textarea>
  </p>
  <p align="center">
    <input type="submit" name="Submit" value="送出" onclick="return checkdata()">
  </p>
</form>
</body>
</html>

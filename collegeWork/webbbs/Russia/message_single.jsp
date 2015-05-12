<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%-- session 的 include --%>
<%@ include file="session.jsp" %>
<%-- Cookie要用的import--%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>Russia</title>
<STYLE>
<!--
@import URL(style.css);
body {
	background-image:url(images/message_single.gif);
}
-->
</STYLE>
</head>
<script>
function del() {
	var answer = confirm("確定要刪除留言嗎？");
	if (answer){
		var pass = prompt("請輸入密碼");
		if(pass==""){
			window.alert("請輸入密碼");
		}
		else{
		document.passform.password.value=pass;
　　	document.passform.submit();
		}
	}
}
</script>
<script language="javascript">
function checkdata() {
   var a = document.form.textfield1.value;
   var b = document.form.textfield2.value;
   if(a=="" || b==""){
   		alert("姓名和內容一定要填！");
		return false;
   }		
   else	 if(a.length>12){
   		alert("姓名太長囉！");
		return false;
   }				
   else	 if(b.length>80){
   		alert("內容太長囉！");
		return false;
   }				
   else
   		return true;
}
</script>
<body>
<%
	int stop=0;
	int push_value=0;
	//將接收來的string id轉為integer
	int id=Integer.parseInt(request.getParameter("id"));		

	//查詢文章編號	
    String query0 = "select id,stop from message_whole";
    Statement stmt0 = con.createStatement();
    ResultSet rs0 = stmt0.executeQuery(query0);
	
	rs0.first();//取得文章編號最小者
	int min_id=rs0.getInt("id");
	rs0.last();//取得文章編號最大者
	int max_id=rs0.getInt("id");
		
	//查詢此篇文章的所有資訊
    String query1 = "select * from message_whole where id="+id;
    Statement stmt1 = con.createStatement();
    ResultSet rs1 = stmt1.executeQuery(query1);
	ResultSet isEmpty;
	
	//列出單篇文章開始
	if(rs1.next()){
		stop=rs1.getInt("stop");//是否禁止推文			
		//字串斷行處理
		String msg = rs1.getString("article");
		String article; 
		article = msg.replaceFirst("※","<font color=\"green\">※");//最新回覆之銘言
		article = article.replaceFirst("\r\n: ※","</font><br><font color=\"#009999\">: ※");//第二篇回覆之銘言
		article = article.replaceAll("\r\n:","</font><br><font color=\"#009999\">:");//第二篇回覆引文的斷行
		article = article.replaceAll("\r\n","</font><br>");//回覆者的斷行
%>	
	<table border="0" width="100%" cellspacing="0">
		<tr>
			<td bgcolor="#CCCCCC" width="5%" style="color:#0000CC" align="center">作者</td>			
			<td bgcolor="#0033CC">&nbsp;<%=rs1.getString("author")%></td>
			<td bgcolor="#CCCCCC" width="5%" style="color:#0000CC" align="center">看板</td>
			<td bgcolor="#0033CC" width="8%" align="center">Russia</td>
		</tr>
		<tr>
			<td bgcolor="#CCCCCC" style="color:#0000CC" align="center">標題</td>
			<td bgcolor="#0033CC" colspan="3">&nbsp;<%=rs1.getString("title")%></td>
		</tr>
		<tr>
			<td bgcolor="#CCCCCC" style="color:#0000CC" align="center">時間</td>
			<td bgcolor="#0033CC" colspan="3">&nbsp;<%=rs1.getString("date")%> <%=rs1.getString("time")%></td>
		</tr>
	</table>
	
		<hr color="#009999" size="1"><br>
		<%=article%>
		</font>
		<br><br>
		--<br>
  		<font color="Green">※ 發信站: 俄羅斯</font><br>
  		◆ From: <%=rs1.getString("IP")%>
<%
	}
	else{//如果文章是空的(已被刪除）
		id++;//將文章編號加一
		response.sendRedirect("message_single.jsp?id="+id);		
	}//列出單篇文章結束
	
	//查詢此篇文章的推文
    String query2 = "select * from message_single where article_id="+id+" order by date,time asc";
	Statement stmt2 = con.createStatement();
    ResultSet rs2 = stmt2.executeQuery(query2);
%>	
	<table border=0 width="100%">
	<%while(rs2.next()){//列出推文%>	
			<tr>
				<td width="2%">
				<%if(rs2.getInt("value")==0){
					push_value--;%>
					<font color="#999999">噓</font></td>					
				<%}
				if(rs2.getInt("value")==1){
					push_value++;%>					
					推</td>
				<%}%>		
		    	<td>
					<font color="yellow"><%=rs2.getString("push_name")%></font><font color="#FFFF66">:<%=rs2.getString("push_word")%></font>
				</td>
				<td width="15%" align="right"><%=rs2.getString("IP")%></td>				
				<td width="13%" align="right"><%=rs2.getString("date")%></td>
			</tr>
	<%}%>
	</table>
<%
	String push_id="";//定義推文帳號
	//取得cookie
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
			if (URLDecoder.decode(rcookie[i].getName()).equals("帳號"))
				push_id=URLDecoder.decode(rcookie[i].getValue());
					
	//將推文數放入資料庫中
	String update_push = "update message_whole set value="+push_value+" where id="+id;
	Statement stmt = con.createStatement();
	stmt.executeUpdate(update_push);
	
	rs0.close();
	rs1.close();
	rs2.close();
	stmt0.close();
	stmt1.close();
	stmt2.close();		
    con.close();
%>

<%if(stop==0){//%>
	<form name="form" method="post" action="push_deal.jsp">
	  姓名：
	  <input name="textfield1" type="text" size="13" value="<%=push_id%>"> 
	  內容：
	  <input name="textfield2" type="text" size="70"> 
	  <input type="submit" name="Submit" value="送出" onClick="return checkdata()">
	  推
	  <input name="radiobutton" type="radio" value="1" checked> 
	  噓
	  <input name="radiobutton" type="radio" value="0">
	  <input name="article_id" type="hidden" value=<%=id%>>
	</form>
<%}else{%>
	<center><b>推文功能被禁止了</b></center>
<%}%>
<form name="passform" method="post" action="delete.jsp?id=<%=id%>">
	<input type="hidden" name="password" value="">
</form>	

<br>
	<table width="100%" border="0">
		<tr>
			<td>			
				<%if(min_id<id){%>
					<a href="message_single.jsp?id=<%=id-1%>">上篇</a>
				<%}else %>上篇
								
				<%if(id<max_id){%>
					<a href="message_single.jsp?id=<%=id+1%>">下篇</a>
				<%}else %>下篇
				<a href="message.jsp">列表</a>							
			</td>
			<td align="right">
				<a href="reply.jsp?id=<%=id%>&way=y">回應</a>
				<a href="edit.jsp?id=<%=id%>">修改</a>
				<a href="javascript:del()">刪除</a>
			</td>
		</tr>
	</table>
</body>
</html>

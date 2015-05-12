<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>留言討論</title>
</head>

<body>
<%
	int push_value=0;
	//好不容易找到string轉integer的方法..
	int id=Integer.parseInt(request.getParameter("id"));
	
	
	request.setCharacterEncoding("big5");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");

	//查詢文章編號	
    String query0 = "select id from message_whole";
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
			
	//列出單篇文章
	while(rs1.next()){
		//字串斷行處理
		String msg = rs1.getString("article");
		String article = msg.replaceAll("\r\n","<br>");
%>
	<table border="1" width="50%" align="center">
		<tr align="center">
			<td>
			<%if(min_id<id){%>
				<a href="message_single.jsp?id=<%=id-1%>">上一篇文章</a>
			<%}else%>上一篇文章
			</td>
			<td><a href="reply.jsp?id=<%=id%>">回應這篇文章</a></td>
			<td>
			<%if(id<max_id){%>
				<a href="message_single.jsp?id=<%=id+1%>">下一篇文章</a>
			<%}else%>下一篇文章
			</td>
			</td>	
		</tr>
	</table>		
		作者：<%=rs1.getString("author")%><br>
		標題：<%=rs1.getString("title")%><br>
		時間：<%=rs1.getString("date")%> <%=rs1.getString("time")%><br>		
		<hr><br>
		<%=article%>
		<br><br>
		--<br>
  		※ 發信站: 烏龍院實業坊<br>
  		◆ From: <%=rs1.getString("IP")%>
<%	
	}
	//查詢此篇文章的推文
    String query2 = "select * from message_single where article_id="+id;
	Statement stmt2 = con.createStatement();
    ResultSet rs2 = stmt2.executeQuery(query2);
%>	
	<table border=0 width="100%">
	<%while(rs2.next()){//列出推文%>	
			<tr>
				<td width="20">
				<%if(rs2.getInt("value")==0){
					push_value--;%>
					<font color="#999999">噓</font></td>					
				<%}
				if(rs2.getInt("value")==1){
					push_value++;%>					
					推</td>
				<%}%>		
		    	<td><%=rs2.getString("push_name")%>:<%=rs2.getString("push_word")%></td>
			</tr>
	<%}%>
	</table>
<%
	
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

<form name="form1" method="post" action="push_deal.jsp">
  姓名：
  <input name="textfield1" type="text" size="13" maxlength="12"> 
  內容：
  <input name="textfield2" type="text" size="70"> 
  <input type="submit" name="Submit" value="送出">
  推
  <input name="radiobutton" type="radio" value="1" checked> 
  噓
  <input name="radiobutton" type="radio" value="0">
  <input name="article_id" type="hidden" value=<%=id%>>
</form>
<br>
	<table border="0" width="40%" align="center">
		<tr>
			<td>．<a href="message.jsp">修改這篇文章</a></td>
			<td>．<a href="message.jsp">回到文章列表</a></td>
			<td>．<a href="message.jsp">刪除這篇文章</a></td>
		</tr>
	</table>
</body>
</html>

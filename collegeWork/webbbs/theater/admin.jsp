<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>管理介面</title>
<%
    String admin=(String)session.getAttribute("admin");

    if(admin==null || !admin.equals("ok"))
		response.sendRedirect("admin_login.jsp");
%>
<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
</head>

<%
    String sql = "select * from message_whole order by top desc,id asc";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
	<table width="95%" border="0" align="center" bgcolor="#3366CC">
  		<tr>
			<td><a href="admin_logout.jsp">登出</a></td>
  		</tr>
	</table>
	<form name="form" method="post" action="admin_deal.jsp">
	<table width="95%" border="1" align="center">	
		<tr><th width="4%">選項</th><th width="4%">編號</th><th width="4%">精華</th><th width="4%">推薦</th><th width="10%">日期</th></th><th width="15%">作者</th><th width="*">文　章　標　題</th></tr>
	<%while(rs.next()){
	
	%>
			<tr>
				<td align="center"><input name="id" type="radio" value="<%=rs.getInt("id")%>">
				<%if(rs.getInt("top")==1){//處理置頂顯示開始%>
			  <td align="center">置頂</td>
				<%}else{%>
					<td align="right"><%=rs.getInt("id")%></td>
				<%}//處理置頂顯示結束%>		
				
				<%if(rs.getString("type").equals("good")){//處理精華顯示開始%>
					<td align="center">m</td>
				<%}else{%>
					<td></td>
				<%}//處理精華顯示結束%>	
					
				<%if(rs.getInt("value")==0){//處理推文顯示開始%>
					<td></td>
				<%}else if(rs.getInt("value")>0){//如果推文值大於0%>
					<td align="center">
					<%if(rs.getInt("value")>9){//如果推文值大於9%>
						<font color="red">爆</font>
					<%}else{%>
						<font color="yellow"><%=rs.getInt("value")%></font>
					<%}%>
					</td>
				<%}else{//如果推文值小於0%>
					<td align="center">
					<%if(rs.getInt("value")<-9){//如果推文值小於-9%>
						<font color="#666666">噓</font>
					<%}else{%>
						<font color="#00FF00"><%=-rs.getInt("value")%></font>
					<%}%>
					</td>
				<%}//處理推文顯示結束%>
				
		    	<td align="center"><%=rs.getDate("date")%></td>
				<td><%=rs.getString("author")%></td>
				<td><a href="message_single.jsp?id=<%=rs.getInt("id")%>">
				<%if(rs.getInt("isReply")==0){%>★
				<%}else{%>☆
				<%}%>				
				<%=rs.getString("title")%></a></td>
			</tr>
<%}
	rs.close();
    con.close();
	%></table>

	  
	    <p align="center">
	      <input name="radiobutton" type="radio" value="good" checked> 
	      精華
	      <input name="radiobutton" type="radio" value="top"> 
	      置頂
	      <input name="radiobutton" type="radio" value="allow_push">
		  允許推文	      
		  <input name="radiobutton" type="radio" value="cancel_good"> 
	      取消精華	      
		  <input name="radiobutton" type="radio" value="cancel_top"> 
	      取消置頂
	      <input name="radiobutton" type="radio" value="stop_push">
		  禁止推文
		  <input name="radiobutton" type="radio" value="cancel">
	      刪除
		  <br><br>
          <input type="submit" name="Submit" value="送出">
      </p>
</form>

</body>
</html>

<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%-- session 的 include --%>
<%@ include file="session.jsp" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>俄羅斯概論</title>
<STYLE>
<!--
@import URL(style.css);
body {
	background-image:url(images/message.jpg);
}
-->
</STYLE>
</head>

<%
    String sql = "select * from message_whole order by top desc,id asc";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
	<table width="95%" border="0" align="center" cellspacing="0">
	  <tr bgcolor="#3366cc" style="color:white">
			<td width="23%" colspan="4">【<a href="javascript:window.external.AddFavorite('http://tomin.twbbs.org/russia', '俄羅斯概論')" style="color:white">我的最愛</a>】　</td>
			<td width="*" align="center" colspan="2"><a href="good.jsp"><font color="Yellow">俄羅斯概論</font></a></td>
  	  		<td width="23%" align="right">【<a href="admin.jsp" style="color:white">版主</a>：土銘】</td>
	  </tr>
      <tr>
        <th width="4%">編號</th>
        <th width="4%">精華</th>
        <th width="4%">推薦</th>
        <th width="10%">日期</th>
        <th width="14%">作者</th>
        <th width="*">文　章　標　題</th>
		<td width="8%" align="right" style="color:#444444">【<a href="logout.jsp" style="color:#444444">登出</a>】</td>
      </tr>
<%
	int max_id=0;
	while(rs.next()){//讀取文章列表開始	
		max_id++;
		if(max_id-rs.getInt("id")<=17 || rs.getInt("top")==1){//最大顯示數量開始(17筆+置頂)
%>
      <tr onMouseOver=this.bgColor='#999999'; onMouseOut=this.bgColor='#000000';>
        <%if(rs.getInt("top")==1){//處理置頂顯示開始%>
        <td align="center">置頂</td>
        <%}else{%>
        <td align="right"><%=rs.getInt("id")%></td>
        <%}//處理置頂顯示結束%>
		
		<%--處理精華顯示開始--%>
		<%if(rs.getInt("stop")==1){//如果禁止推文%>
			<td align="center">!</td>		
        <%}else{
			if(rs.getString("type").equals("good")){//如果是精華文章%>
        		<td align="center">m</td>
			<%}else{%>
        		<td></td>
			<%}%>
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
        <td colspan="2"><a href="message_single.jsp?id=<%=rs.getInt("id")%>">
          <%if(rs.getInt("isReply")==0){%>
          ★
          <%}else{%>
          Re
          <%}%>
          <%=rs.getString("title")%></a></td>
      </tr>
      <%
		}////最大顯示數量結束
	}//讀取文章列表結束
	rs.close();
    con.close();
	%>
</table>
	<center>
	  <p><a href="add.jsp">發表新文章</a></p>
    </center>
</body>
</html>

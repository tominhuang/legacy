<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%-- Cookie要用的import --%>
<%@ page import="java.net.*" %>
<%-- 處理時間要用的import --%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>回應文章處理</title>
</head>

<body>
<%
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	String password=(String)request.getParameter("textfield3");	
		
	if(!author.equals("") && !title.equals("")){
		//設定cookie
		Cookie cookie1 = new Cookie(URLEncoder.encode("帳號"),URLEncoder.encode(author));
		Cookie cookie2 = new Cookie(URLEncoder.encode("密碼"),URLEncoder.encode(password));		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
			
		int isReply=1;//是回應文章
		String textarea=(String)request.getParameter("textarea");		
		String IP;//取得客戶端IP	
			if (request.getHeader("X-FORWARDED-FOR") == null) {
				IP = request.getRemoteAddr();
			}
			else {
				IP = request.getHeader("X-FORWARDED-FOR");
			}	
		//取得日期
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//取得時間
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));

		//取得目前文章編號		
		int id=0;
		String search="select id from message_whole";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		rs.last();
			id=rs.getInt("id")+1;//最大的編號再加一
		rs.close();
		query.close();
		//將留言寫入資料庫	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply,password) values('"+author+"','"+title+"','"+date+"','"+time+"','"+IP+"','"+id+"','"+textarea+"','"+isReply+"','"+password+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>

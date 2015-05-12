<!--處理時間要用的import-->
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>新增文章處理</title>
</head>

<body>
<%
	request.setCharacterEncoding("big5");
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	
	if(!author.equals("") && !title.equals("")){
		int isReply=0;//不是回應文章
		String textarea=(String)request.getParameter("textarea");		
		String IP=(String)request.getRemoteAddr();	
		//取得日期
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//取得時間
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));

	
    	Class.forName("com.mysql.jdbc.Driver"); 
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
		//取得目前文章編號		
		int id=0;
		String search="select id from message_whole";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		rs.last();//while(rs.next())
			id=rs.getInt("id")+1;//最大的編號再加一
		rs.close();
		query.close();
		//將留言寫入資料庫	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply) values('"+author+"','"+title+"','"+date+"','"+time+"','"+IP+"','"+id+"','"+textarea+"','"+isReply+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>

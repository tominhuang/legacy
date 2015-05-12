<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<!--Cookie要用的import-->
<%@ page import="java.net.*" %>
<!--處理時間要用的import-->
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>處理推文</title>
</head>
<body>
<%
	String name=(String)request.getParameter("textfield1");
	String word=(String)request.getParameter("textfield2");
	String value=(String)request.getParameter("radiobutton");
	String article_id=(String)request.getParameter("article_id");
	String IP;//取得客戶端IP	
		if(request.getHeader("X-FORWARDED-FOR") == null){//如果沒有使用Proxy
			IP = request.getRemoteAddr();//直接取得客戶端IP
		}
		else{////如果使用Proxy
			IP = request.getHeader("X-FORWARDED-FOR");//從Proxy去取得IP
		}
	
	if(!name.equals("") && !word.equals("")){
		//設定cookie
		Cookie cookie = new Cookie(URLEncoder.encode("帳號"),URLEncoder.encode(name));
		response.addCookie(cookie);
		//取得日期
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//取得時間
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));
			
		String up="insert into message_single(push_name,push_word,value,date,time,IP,article_id) values('"+name+"','"+word+"','"+value+"','"+date+"','"+time+"','"+IP+"','"+article_id+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
	}
	response.sendRedirect("message_single.jsp?id="+article_id);
%>
</body>
</html>

<%-- 連接資料庫的 include --%>
<%@ include file="mysql.jsp" %>
<%-- 處理時間要用的import --%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!--Cookie要用的import-->
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>新增文章處理</title>
</head>

<body>
<%
	//接收字串
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	String password=(String)request.getParameter("textfield3");	
	
	if(!author.equals("") && !title.equals("")){//如果姓名、標題都有輸入字串
		//設定cookie
		Cookie cookie1 = new Cookie(URLEncoder.encode("帳號"),URLEncoder.encode(author));
		Cookie cookie2 = new Cookie(URLEncoder.encode("密碼"),URLEncoder.encode(password));		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
		int isReply=0;//不是回應文章
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
		
		//pageContext.setAttribute("dayStr", "day"+i);		

		//取得目前文章編號		
		int min_id=0,max_id=1;
		String search="select id,type from message_whole order by id asc";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		
		//取得最小編號文章
		while(rs.next()){
			if(rs.getString("type").equals("normal")){//第一個等於一般文章的(非精華、非置頂)
				min_id=rs.getInt("id");//就是最小id
				break;
			}
		}
		
		//取得最大編號文章
		if(rs.last()){//如果rs.last存在
			rs.last();
			max_id=rs.getInt("id");	//17
			max_id++;//最大的編號再加一，也就是第18筆
		}
		rs.close();
		query.close();
		
		//最多留言筆數設定					
		if(max_id-min_id>=17){//18-1，如果留言達到第18筆了
			//刪除文章
			String del_article="delete from message_whole where id="+min_id;//刪除編號最小的留言
			//刪除推文
			String del_push="delete from message_single where article_id="+min_id;			
			Statement delete = con.createStatement();
			delete.executeUpdate(del_article);
			delete.executeUpdate(del_push);			
			delete.close();
		}
		//將留言寫入資料庫	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply,password) values(' "+author+" ','"+title+"','"+date+"','"+time+"','"+IP+"','"+max_id+"','"+textarea+"','"+isReply+"','"+password+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
				
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>

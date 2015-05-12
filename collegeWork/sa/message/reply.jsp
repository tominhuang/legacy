<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>回應文章</title>
</head>

<body>
<%
	String id=(String)request.getParameter("id");
	String subject=null;
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select title from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	rs.first();
 	subject=rs.getString("title");
	
%>	
<form name="form1" method="post" action="reply_deal.jsp">
  <p>姓名：
      <input type="text" name="textfield1">
  </p>
  <p>回應：
      <input type="text" name="textfield2" value="<%=subject%>">
  </p>
  <p>內容：</p>
  <p>
    <textarea name="textarea" cols="100" rows="10"></textarea>
  </p>
  <p>
    <input type="submit" name="Submit" value="送出">
  </p>
</form>
</body>
</html>

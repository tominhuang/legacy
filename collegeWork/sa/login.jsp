<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>登入</title>
</head>

<body>
<%
	String id=request.getParameter("textfield1");
	String password=request.getParameter("textfield2");
	if(id!=null && password!=null){
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root");
        String sql = "select id,password,type from customer";
	    Statement stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery(sql);
	    while(rs.next()){
	       if(id.equals(rs.getString("id")) && password.equals(rs.getString("password"))){
		       session.setAttribute("login","ok");
			   String type=rs.getString("type");
			   session.setAttribute("type",type);		   
		   }
		}
	    rs.close();
	    con.close();
	    response.sendRedirect("member.jsp");
}
%>
</body>
</html>

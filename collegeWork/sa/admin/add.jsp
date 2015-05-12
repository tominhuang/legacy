<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>新增顧客</title>
</head>

<body>
<%
request.setCharacterEncoding("Big5");
String name=request.getParameter("textfield1");
String date=request.getParameter("textfield2");
String addr=request.getParameter("textfield3");
String phone=request.getParameter("textfield4");
String email=request.getParameter("textfield5");
String pmail=request.getParameter("textfield6");
String vip=request.getParameter("select1");
String id=request.getParameter("textfield7");
String password=request.getParameter("textfield8");
String type=request.getParameter("select2");

//if(request.getParameter("textfield1")!=null && request.getParameter("textfield2")!=null
//&& request.getParameter("textfield3")!=null && request.getParameter("textfield4")!=null
//&& request.getParameter("textfield5")!=null && request.getParameter("textfield6")!=null){
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
	String up="insert into customer(Name,Birth_Date,Address,phone,Email,Epa_Email,VIP,id,password,type) values('"+name+"','"+date+"','"+addr+"','"+phone+"','"+email+"','"+pmail+"','"+vip+"','"+id+"','"+password+"','"+type+"')";
    Statement stmt = con.createStatement();
    stmt.executeUpdate(up);
	out.print("新增成功<br><br>");
	out.print("<a href=\"main.jsp\">回管理介面");	

%>
</body>
</html>

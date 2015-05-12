<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>修改</title>
</head>

<body>
<%
	request.setCharacterEncoding("big5");
	String[] checkbox= new String[10];
	String[] textfield= new String[8];
    String VIP=(String)request.getParameter("VIP");
    String type=(String)request.getParameter("type");	
    String select=(String)request.getParameter("select");//修改對象	
	
  	for(int i=0;i<=9;i++)checkbox[i]=(String)request.getParameter("checkbox"+ i);
    for(int i=0;i<=7;i++)textfield[i]=(String)request.getParameter("textfield"+ i);
	
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&password=root&useUnicode=true&characterEncoding=utf-8");
    Statement stmt = con.createStatement();	
    String sql = "update customer set ";
	
	if(checkbox[0]!=null)
	sql=sql+"Name='"+textfield[0]+"',";
	if(checkbox[1]!=null)
	sql=sql+"Birth_Date='"+textfield[1]+"',";

	if(checkbox[2]!=null)
	sql=sql+"Address='"+textfield[2]+"',";
	if(checkbox[3]!=null)
	sql=sql+"phone='"+textfield[3]+"',";		

	if(checkbox[4]!=null)
	sql=sql+"Email='"+textfield[4]+"',";
	if(checkbox[5]!=null)
	sql=sql+"Epa_Email='"+textfield[5]+"',";
	
	if(checkbox[6]!=null)
	sql=sql+"VIP='"+VIP+"',";
	if(checkbox[7]!=null)
	sql=sql+"id='"+textfield[6]+"',";	

	if(checkbox[8]!=null)
	sql=sql+"password='"+textfield[7]+"',";
	if(checkbox[9]!=null)
	sql=sql+"type='"+type+"',";		

	sql=sql+"define=null where name='"+select+"'";				
	//out.print(sql);
	stmt.executeUpdate(sql);		
	
	stmt.close();
	con.close();
	
	out.print("修改成功<br><br>");
	out.print("<a href=\"main.jsp\">回管理介面");
%>	
</body>
</html>

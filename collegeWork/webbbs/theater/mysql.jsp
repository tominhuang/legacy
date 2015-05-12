<%
	request.setCharacterEncoding("MS950");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/theater?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
%>
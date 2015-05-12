<%
	request.setCharacterEncoding("MS950");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/russia?user=dba&password=dba&useUnicode=true&characterEncoding=utf-8");
%>
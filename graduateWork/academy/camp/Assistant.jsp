<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>國立臺灣大學98學年度新生學習入門書院 - 隊輔</title>
<LINK rel="icon" href="../favicon.png" type="image/x-icon">
<LINK REL="stylesheet" HREF="../css/querySelf.css" TYPE="text/css">

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" language="javascript"> google.load("jquery", "1.3"); </script>
<script src="http://www.google-analytics.com/ga.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="../js/public.js" type="text/javascript"></SCRIPT>
</head>
<body>
	
	<div class="left">
		<img class="pic" src="../images/medium/${param.id}.jpg" width="340" height="510">
	</div>

<%
	String[] assist=new String[8];
	for(int i=0;i<8;i++)assist[i]="查無此人";
	
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	String id = request.getParameter("id");
			
	try{		 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost/academy?user=academy&password=academy1976&useUnicode=true&characterEncoding=utf-8");		
		sql = "SELECT * FROM assist WHERE aid=? limit 1";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, id);

		rs = stmt.executeQuery();

		if(rs.next()){
			assist[0]=rs.getString(1);
			assist[1]=rs.getString(2);
			assist[2]=rs.getString(3);
			assist[3]=rs.getString(4);
			assist[4]=rs.getString(5);
			assist[5]=rs.getString(6);
			assist[6]=rs.getString(7);
			assist[7]=rs.getString(8);
		}
		
	}catch(SQLException e){
		e.printStackTrace();
		//out.print(e);
	}finally{
		//close sql
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(con!=null)con.close();				
		} catch (SQLException e) {
			e.printStackTrace();
		}  			
	}
%>		
	<div class="assistantInfo">
		<div class="line"><span class="item">姓名：</span><span class="name"><%=assist[1]%></span><br></div>
		<div class="line"><span class="item">科系：</span><span class="major"><%=assist[4]%></span><br></div>
		<div class="line"><span class="item">年級：</span><span class="grade"><%=assist[5]%></span><br></div>
		<div class="line"><span class="item">興趣：<br></span><span class="interest"><%=assist[6].replaceAll("\n","<br>")%></span><br></div>
		<div class="line"><span class="item">給小隊員的話：<br></span><span class="words"><%=assist[7].replaceAll("\n","<br>")%></span><br></div>
	</div>
</body>
</html>
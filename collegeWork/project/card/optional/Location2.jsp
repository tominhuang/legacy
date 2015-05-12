 <html>
<head>
<title>Location</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Location</font>

<%@ page contentType="text/html;charset=big5" language="java"  import="java.sql.*" import="java.util.*" import="java.text.*" %>
<%                                                                              
   
        Connection con = null; //起始設定資料庫連結相關物件
        Statement stmt = null;
        ResultSet rs = null;
                                                                                                                                                                                                                                      
                Class.forName("org.gjt.mm.mysql.Driver");
                //載入驅動程式類別
                                                                                
                con = DriverManager.getConnection
                ("jdbc:mysql://npc.twbbs.org:3306/meeting","root","root");
                //建立資料庫連線
                                                                                
                stmt = con.createStatement();
                //建立Statement物件, 並設定記錄指標類型為可前後移動
 

String SQL ="insert into Location (Street,City,Country,Zip_Code) values('
                '"+request.getParameter("Street")+"','"+request.getParameter("City")+"','"+request.getParameter("Country")+"'),'"+request.getParameter("Zip_Code")+"');";
                stmt.executeUpdate(SQL);

%>

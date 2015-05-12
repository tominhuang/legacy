import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.*;

public class chat extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			//定義變數
			String name=null;
			String text=null;
			String sql=null;
			
			//取得發言人名字
			if(request.getParameter("name")!=null)
				name = encoding(request.getParameter("name"));
			
			//取得新增事項
			if(request.getParameter("textfield")!=null)
				text = encoding(request.getParameter("textfield"));

			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://140.119.75.216/book?user=admin&password=1234&useUnicode=true&characterEncoding=utf-8");

				if(text!=null){//新增
					//取得日期
					Date cdate = new Date();
					SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.US);
					String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
					sql="insert into chat(date, name, word) values( '"+date+"', '"+name+"', '"+text+"')";
				}


			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			response.sendRedirect("frame/chat.jsp");

			 } catch (ClassNotFoundException e) {
					 throw new UnavailableException("不能載入驅動程式");
				 }catch (SQLException e){
					   throw new UnavailableException("資料庫連線失敗");
				 }catch (Exception e) {
					  System.out.println("發生了" + e + "例外");
			}

	}


  private String encoding(String str) {
		  try {
				   str = new String(str.getBytes("ISO-8859-1"), "MS950");
		   }
		   catch (UnsupportedEncodingException uee) {
			  System.out.println("UnsupportedEncodingException：" + uee.getMessage());
		   }

		   return str;
	}
}

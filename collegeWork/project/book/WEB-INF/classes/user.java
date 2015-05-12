import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class user extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			HttpSession session = request.getSession();

			//session.setAttribute("rank","abcdefg");
			//String rank=(String)session.getAttribute("rank");

			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			if(session==null){
					response.sendRedirect("../index.jsp");
			}


			//定義變數
			String select=null;
			String id=null;
			String password=null;
			String radio=null;
			String del=null;
			String sql=null;

			//取得新增使用者
			if(request.getParameter("id")!=null){
				select = request.getParameter("select");
				id = request.getParameter("id");
				password = request.getParameter("password");
				sql="insert into user(id,password,rank) values('"+id+"','"+password+"','"+select+"')";
			}
			//取得修改使用者
			if(request.getParameter("radiobutton")!=null){//有被核取
				radio = request.getParameter("radiobutton");//原帳號
				select = request.getParameter("select2");//新身份
				if(radio.equals("admin") && !select.equals("9")){
					out.print("admin身份不能被更動");
					return;
				}
				sql="update user set rank = '" + select + "'";

				if(!request.getParameter("id2").equals("")){//新帳號
					id = request.getParameter("id2");
					sql = sql + "  , id = '" + id + "'";
				}
				if(!request.getParameter("password2").equals("")){//新密碼
					password = request.getParameter("password2");
					sql = sql + "  , password = '" + password + "'";
				}
 					sql = sql + " where id = '" + radio + "'";
			}
			//取得刪除ID
			del = request.getParameter("del");
			if(del!=null){
				if(del.equals("admin")){
					out.print("admin帳號不能被刪除");
					return;
				}else{
					sql="delete from user where id = '"+del+"'";
				}
			}


			try{

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con = DriverManager.getConnection("jdbc:mysql://140.119.75.216/book?user=admin&password=1234");

				Statement stmt = con.createStatement();
				stmt.executeUpdate(sql);
				stmt.close();
				con.close();
				response.sendRedirect("./system/user.jsp");

			}catch (ClassNotFoundException e) {
					 throw new UnavailableException("不能載入驅動程式");
			}catch (SQLException e) {
					   throw new UnavailableException("資料庫連線失敗");
			}catch (Exception e) {
					  System.out.println("發生了" + e + "例外");
			}

	}

}

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.*;

public class BBS extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			//定義變數
			String text=null;
			String edit=null;
			String edit_word=null;
			String del=null;
			String sql=null;
			//取得新增事項
			if(request.getParameter("textfield")!=null)
				text = encoding(request.getParameter("textfield"));
			//取得修改ID
			edit = request.getParameter("edit_id");
			//取得修改事項
			if(request.getParameter("edit_word")!=null)
				edit_word = encoding(request.getParameter("edit_word"));
			//取得刪除ID
			del = request.getParameter("del_id");

			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://tomin.twbbs.org/hems?user=db&password=db&useUnicode=true&characterEncoding=utf-8");

				if(text!=null){//新增
					//取得日期
					Date cdate = new Date();
					SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
					String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
					sql="insert into bbs(date,word) values('"+date+"','"+text+"')";
				}

				if(edit!=null){//初次修改

					if(edit_word!=null){//確定修改
						sql="update bbs set word = '" + edit_word + "' where id = " + edit;
					}

					else{//修改介面
					String word =  encoding(request.getParameter("word"));
					out.print("<form name=\"form1\" method=\"get\" action=\"./BBS\">");
					out.print("修改事項：<input name=\"edit_word\" type=\"text\" size=\"90\" value=\""+word+"\"><input name=\"edit_id\" type=\"hidden\" value=\""+edit+"\"><input type=\"submit\" name=\"Submit\" value=\"送出\">");
					out.print("</form>");
					return;
					}

				}


				if(del!=null){//刪除
					sql="delete from bbs where id = " + del;
				}

			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			response.sendRedirect("frame/demoFramesetRightFrame.jsp");

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

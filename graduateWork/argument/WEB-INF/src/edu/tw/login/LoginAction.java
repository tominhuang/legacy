package edu.tw.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import edu.tw.ajax.JSONWriter;


public final class LoginAction extends Action {
		
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
	
		
		// 取得表單參數值
		String id = request.getParameter("id");
		String password = request.getParameter("password");
			
		HttpSession session = request.getSession();
			
        try{
        	sql = "SELECT id,grouping FROM user u where u.id = ? and u.password = ? limit 1";
        	
			con = DriverManager.getConnection("proxool.argument");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			rs = stmt.executeQuery();					
			
			if(rs.next()){
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("grouping", rs.getString("grouping"));
								
		   		list.add("ok");
		   			   		
		   		//record
		   		sql = "insert into log_record values (null,?,?,?,NOW())";
	    		stmt = con.prepareStatement(sql);    		
	    		stmt.setString(1, id);
	    		stmt.setString(2, rs.getString("grouping"));
	    		stmt.setString(3, "login");
	    		stmt.executeUpdate();		   				   		
			}else{				
		   		list.add("wrong");								
			}
			
		}catch(SQLException e){
			list.add("sql");			
		}catch(Exception e){
			list.add("other");		
		}finally{
			jsonWriter.send(list);
			//close sql
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}  			
		}
				
		return null;
	}	
}

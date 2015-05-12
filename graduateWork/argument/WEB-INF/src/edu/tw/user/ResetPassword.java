package edu.tw.user;

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

public class ResetPassword extends Action  {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		JSONWriter jsonWriter = new JSONWriter(res);
		JSONArray list = new JSONArray();
		
		HttpSession session = request.getSession();    	
    	if(session.getAttribute("id")==null){
    		list.add("invalid");
    		jsonWriter.send(list);
    		return null;    		
    	}
    	String id = session.getAttribute("id").toString();
    	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	
    	String password = request.getParameter("password");
    	String email = request.getParameter("email");
    	
        try{
        	sql = "update user set password = ?, email = ?,isPasswordChange = ? where id = ? limit 1";
			con = DriverManager.getConnection("proxool.argument");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, password);
			stmt.setString(2, email);
			stmt.setInt(3, 1);
			stmt.setString(4, id);
			int result = stmt.executeUpdate();
			if(result==1){				
				list.add("ok");
				session.setAttribute("isPasswordChange", "1");
			}
			if(result==0){
				list.add("fail");
			}
			
        } catch (SQLException e) {
       		list.add("sql");
    		
		} finally{
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
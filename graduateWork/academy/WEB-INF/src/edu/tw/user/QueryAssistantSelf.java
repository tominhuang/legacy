package edu.tw.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;

import edu.tw.ajax.JSONWriter;

public class QueryAssistantSelf extends Action  {

	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
		
		String id = request.getParameter("id");
					
        try{
        	sql = "SELECT * FROM assist WHERE aid=? limit 1";        	
			con = DriverManager.getConnection("proxool.academy");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);

			rs = stmt.executeQuery();

			if(rs.next()){
		   		list.add(rs.getString(1));
		   		list.add(rs.getString(2));
		   		list.add(rs.getString(3));
		   		list.add(rs.getString(4));
		   		list.add(rs.getString(5));
		   		list.add(rs.getString(6));
		   		list.add(rs.getString(7));
		   		list.add(rs.getString(8));
			}else{
				list.add("none");
			}
			
		}catch(SQLException e){
			list.add("sql");			
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


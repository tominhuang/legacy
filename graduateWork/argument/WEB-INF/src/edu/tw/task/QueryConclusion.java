package edu.tw.task;

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

public class QueryConclusion extends Action  {

	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
								
		HttpSession session = request.getSession();
    	if(session.getAttribute("id")==null){
    		list.add("");
    		jsonWriter.send(list);
    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString(); 						
				
        try{
        	sql = "SELECT conclusion,conclusionFinal FROM user where id = ? limit 1";        	
			con = DriverManager.getConnection("proxool.argument");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);

			rs = stmt.executeQuery();

			if(rs.next()){
		   		list.add(rs.getString("conclusion"));
		   		list.add(rs.getString("conclusionFinal"));
			}else{
				list.add("");				
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

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

public class QueryEvidence extends Action  {

	
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
    		list.add("invalid");
    		jsonWriter.send(list);
    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString(); 						
		String week = request.getParameter("week");
		
			
        try{
        	sql = "SELECT direction,summary,description,source,insertTime,eid FROM evidence where id = ? and  week= ? and isDelete is null order by insertTime desc";
        	
			con = DriverManager.getConnection("proxool.argument");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, week);
			rs = stmt.executeQuery();
			
			
			
			while(rs.next()){
		   		list.add(rs.getString("direction"));
		   		list.add(rs.getString("summary"));
		   		list.add(rs.getString("description"));
		   		list.add(rs.getString("source"));
		   		list.add(rs.getString("insertTime"));
		   		list.add(rs.getString("eid"));
			}
			
			rs.previous();
			int evidenceNum=rs.getRow();
			if(evidenceNum==0){
				list.add("0");
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

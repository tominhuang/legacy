package edu.tw.task;

import java.io.IOException;
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

public class DeleteEvidence extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {

    	request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
		
    	if(session.getAttribute("id")==null){
    		list.add("invalid");
    		jsonWriter.send(list);
    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString();
    	String grouping = session.getAttribute("grouping").toString();    	
    	    	    		
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	    	
    	   
    	//接收變數  
        String week = request.getParameter("week");
        String eid = request.getParameter("eid");
        String summary = request.getParameter("summary");
        String description = request.getParameter("description");
        String source = request.getParameter("source");
        String direction = request.getParameter("direction");
        

        try{
    		sql = "update evidence set isDelete = 1, deleteTime=NOW() where eid = ? limit 1";    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, eid);
    		int result=stmt.executeUpdate();    		
    		
    		sql = "insert into evidence_record values (null,?,?,?,?,?,?,?,?,NOW())";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, direction);
    		stmt.setString(4, week);
    		stmt.setString(5, summary);  		    	
    		stmt.setString(6, description);    		
    		stmt.setString(7, source);
    		stmt.setString(8, "delete");    		
    		stmt.executeUpdate();
    		
    		if(result==1){
    			list.add("ok");
    		}else{
    			list.add("fail");    			
    		}
    			
    		
        } catch (SQLException e) {
        	list.add("sql");
        	e.printStackTrace();
		} catch (Exception e) {
			list.add("other");
			e.printStackTrace();
		} finally{
			jsonWriter.send(list);
			try {
				if(rs!=null)con.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String url="../task/evidence" + week + ".html#yourAnchor";
			response.sendRedirect(url);			
		}

		
		return null;	   
    }
}

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

import edu.tw.ajax.TextWriter;


public class PostEvidence extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {    	
    	    	    	
		HttpSession session = request.getSession();		
    	if(session.getAttribute("id")==null){
    		TextWriter textWriter= new TextWriter(response);
    		String word="<script>alert('資料未儲存。你因閒置太久已登出！請重新登入。');window.location.href='./';</script>";
    		textWriter.send(word);

    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString();
    	String grouping = session.getAttribute("grouping").toString();    	
    	    	    		
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	    	
    	   
    	//接收變數  
        String direction = request.getParameter("direction");
        String week = request.getParameter("week");
        String summary = request.getParameter("summary");
        String description = request.getParameter("description");
        String source = request.getParameter("source");
        

        try{
    		sql = "insert into evidence values (null,?,?,?,?,?,?,?,NOW(),null,null,null)";    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, direction);
    		stmt.setString(4, week);
    		stmt.setString(5, summary);  		    	
    		stmt.setString(6, description);    		
    		stmt.setString(7, source);
    		stmt.executeUpdate();
    		

    		sql = "insert into evidence_record values (null,?,?,?,?,?,?,?,?,NOW())";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, direction);
    		stmt.setString(4, week);
    		stmt.setString(5, summary);  		    	
    		stmt.setString(6, description);    		
    		stmt.setString(7, source);
    		stmt.setString(8, "add");    		
    		stmt.executeUpdate();
    			
    		
        } catch (SQLException e) {
        	TextWriter textWriter= new TextWriter(response);
    		String word="<script>alert('系統出現錯誤，資料未儲存。請再試一次！');</script>";
    		textWriter.send(word);        	
        	e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null)con.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String url="../task/evidence" + week + ".html#yourAnchor";
			response.setHeader("Refresh", "0; URL=" + url);
			
			/*
        	TextWriter textWriter= new TextWriter(response);
    		String word="<script>window.location.href='" + url + "'</script>";
    		textWriter.send(word); 			
			*/		
		}

		
		return null;	   
    }
}

package gis.taiwan.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gis.taiwan.ajax.AjaxXMLResponseWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class SubTopicQuery extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse;
		HttpSession session = req.getSession();
   	
    	if(session.getAttribute("id")==null){
    		xmlResponse = "<validation>NO</validation><subtopic>Nobody</subtopic>";					
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	
    	String id = session.getAttribute("id").toString();
    	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";    	
    	
        try{
        	sql = "SELECT topic FROM user where id = ? limit 1";
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();					
				
			

			if(rs.next()){
				xmlResponse = "<validation>YES</validation><subtopic>" + rs.getString("topic") +"</subtopic>";    	
				xmlwriter.send(xmlResponse);				
			}else{
				xmlResponse = "<validation>YES</validation><subtopic>No setting</subtopic>";    	
				xmlwriter.send(xmlResponse);
			}        	
        	
        	
        } catch (SQLException e) {
			xmlResponse = "<validation>YES</validation><subtopic>SQL error</subtopic>";    	
			xmlwriter.send(xmlResponse);
		} finally{			
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

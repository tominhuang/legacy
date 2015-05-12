package gis.taiwan.registration;

import gis.taiwan.ajax.AjaxXMLResponseWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public final class SubTopicUpdate extends Action {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement stmt = null;
		String sql = "";
		String xmlResponse = "";
		xmlwriter = new AjaxXMLResponseWriter(res);

    	HttpSession session = req.getSession();
    	if(session.getAttribute("id")==null){
    		xmlResponse = "<status>not_login</status>";
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	String id = session.getAttribute("id").toString();
    	
		
		//接收變數  
        String radiobutton = req.getParameter("radiobutton");               
				
        try{
        	sql = "update user set topic = ? where id = ? limit 1";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, radiobutton);
			stmt.setString(2, id);
			
			stmt.executeUpdate();						
			
			xmlResponse = "<status>finish</status>";
    		xmlwriter.send(xmlResponse);
			
		}catch(SQLException e){
			xmlResponse = "<status>Database error</status>";
    		xmlwriter.send(xmlResponse);
		}finally{			
			//close sql
			try {
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}  			
		}
		

		return null;
	}	
}

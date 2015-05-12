package gis.taiwan.user;

import gis.taiwan.ajax.AjaxXMLResponseWriter;

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

public class ResetPassword extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse = "<status>fail</status>";
		
		HttpSession session = req.getSession();    	
    	if(session.getAttribute("id")==null){
    		xmlResponse = "<status>not_login</status>";					
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	String id = session.getAttribute("id").toString();
    	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	
    	String oldpwd = req.getParameter("oldpwd");
    	String newpwd = req.getParameter("newpwd");
    	
        try{
        	sql = "update user set password = AES_ENCRYPT(?,'GISTaiwan_2009_NTU') where password = AES_ENCRYPT(?,'GISTaiwan_2009_NTU') and id = ? limit 1";
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, newpwd);
			stmt.setString(2, oldpwd);
			stmt.setString(3, id);
			int result = stmt.executeUpdate();							
    		xmlResponse = "<status>" + result + "</status>";		
			xmlwriter.send(xmlResponse);
        	
        } catch (SQLException e) {
			xmlResponse = "<status>database_error</status>";    	
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
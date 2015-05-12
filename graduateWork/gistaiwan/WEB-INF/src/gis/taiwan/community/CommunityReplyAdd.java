package gis.taiwan.community;

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

public final class CommunityReplyAdd extends Action {
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
        String cid = req.getParameter("cid");
        String textarea = req.getParameter("textarea");                
				
        try{
        	//add
        	sql = "insert into community_reply values (null,?,?,NOW(),?)";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, textarea);
			stmt.setString(3, cid);//it should be int if mysql is not smart
			stmt.executeUpdate();
			
			
			
			//update
        	sql = "update community set update_time = NOW() where cid = ?";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, cid);
			stmt.executeUpdate();			
			
			xmlResponse = "<status>finish</status>";
    		xmlwriter.send(xmlResponse);
			
		}catch(SQLException e){
			e.printStackTrace();
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

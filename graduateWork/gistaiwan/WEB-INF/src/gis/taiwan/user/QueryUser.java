package gis.taiwan.user;

import gis.taiwan.ajax.AjaxXMLResponseWriter;
import gis.taiwan.login.OpCookies;

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

public class QueryUser extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse;
		HttpSession session = req.getSession();

		//取得cookie
		OpCookies opCookies = new OpCookies();
		String cookie_id = opCookies.Read_Cookies("id", req);
		
		//幫他登入
		if(cookie_id!=null){
			session.setAttribute("id", cookie_id);
		}		

    	
    	if(session.getAttribute("id")==null){
    		xmlResponse = "<validation>NO</validation><id>Nobody</id><pin>Nobody</pin><workshop>NO</workshop>";					
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	    	    	
    	String id = session.getAttribute("id").toString();
    	String pin = session.getAttribute("pin").toString();
    	boolean _isWorkshopMember = isWorkshopMember(pin);
    	
    	if(_isWorkshopMember){
    		xmlResponse = "<validation>YES</validation><id>" + id +"</id><pin>" + pin + "</pin><workshop>YES</workshop>";    		
    	}else{
    		xmlResponse = "<validation>YES</validation><id>" + id +"</id><pin>" + pin + "</pin><workshop>NO</workshop>";    		
    	}    	    	    	
		xmlwriter.send(xmlResponse);
		
		return null;
	}
	
	
	public boolean isWorkshopMember(String pin){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";

        try{
        	sql = "SELECT * FROM workshop w where pin = ? limit 1";
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, pin);
			rs = stmt.executeQuery();			
									
			if(rs.next()){
				return true;						    					
			}
		}catch(SQLException e){
			e.printStackTrace();
			return true;
		}finally{			
			//close sql
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}  			
		}
		return false;
	}
	
}

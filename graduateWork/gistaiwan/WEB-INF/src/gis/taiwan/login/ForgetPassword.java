package gis.taiwan.login;

import gis.taiwan.ajax.AjaxXMLResponseWriter;
import gis.taiwan.mail.Mail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ForgetPassword extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	private static final String PATH_CONFIG_BUNDLE_NAME = "path";
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse = "<status>fail</status>";;
    	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	
    	String email = req.getParameter("email");
    	
        try{
        	sql = "SELECT id,AES_DECRYPT(password,'GISTaiwan_2009_NTU') as password FROM user where email = ? limit 3";
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();					
							
			while(rs.next()){//這邊用while，因為沒限制一個信箱只能註冊一個id。
				
				//Mail
	    		
	    		// 從path.properties檔中取得設定
	    		ResourceBundle bundle;
	    	    bundle = ResourceBundle.getBundle(PATH_CONFIG_BUNDLE_NAME);
	    	    String site_url = bundle.getString("site_url");	  		
	    		
	    	    //寫信
	    		String words = "This is an auto-generated letter from Global Initiatives Symposium in Taiwan 2009 (GIS Taiwan 2009).\n\n"
	    					   + "Your ID: " + rs.getString("id") + "\n"
	    					   + "Your Password: " + rs.getString("password") + "\n\n\n"
	    					   + "--\n"
	    					   + "Please do not reply this letter.\n"
	    					   + "GIS Taiwan: " + site_url;
	    		Mail mailValidate = new Mail();
	    		mailValidate.SimpleMail(email, "[GIS Taiwan] Your ID and Password", words);
	    		
	    		xmlResponse = "<status>success</status>";
			}
			
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

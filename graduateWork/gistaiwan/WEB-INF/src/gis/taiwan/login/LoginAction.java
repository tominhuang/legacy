package gis.taiwan.login;

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

public final class LoginAction extends Action {
	private static final String secretKey = "GISTaiwan_2009_NTU";
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		xmlwriter = new AjaxXMLResponseWriter(res);
		
		// 取得表單參數值
		String id = req.getParameter("textfield");
		String password = req.getParameter("textfield2");
		String cookie=(String)req.getParameter("checkbox");	
		
		HttpSession session = req.getSession();
		
				
        try{
        	sql = "SELECT sid,id,isValid FROM user u where u.id = ? and u.password = AES_ENCRYPT( ? , ? ) limit 1";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			stmt.setString(3, secretKey);
			rs = stmt.executeQuery();					
			
			if(rs.next()){
				
				if(rs.getString("isValid").equals("1")){
					session.setAttribute("id", rs.getString("id"));
					session.setAttribute("pin", rs.getString("sid"));
					
			    	String xmlResponse = "<validation>OK</validation>";					
					xmlwriter.send(xmlResponse);
	
					if(cookie!=null && cookie.equals("true")){				
						OpCookies opCookies = new OpCookies();
						int MaxAge = 3600*24*270;//270天
						opCookies.Write_Cookies("id", rs.getString("id"), MaxAge, null, res);	
					}
				}else{
					String xmlResponse = "<validation>E-Mail is not confirmed yet.</validation>";					
					xmlwriter.send(xmlResponse);						
				}
				
			}else{			
				String xmlResponse = "<validation>Wrong ID or Password.</validation>";					
				xmlwriter.send(xmlResponse);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			String xmlResponse = "<validation>System Error.</validation>";					
			xmlwriter.send(xmlResponse);
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
		

		return null;
	}	
}

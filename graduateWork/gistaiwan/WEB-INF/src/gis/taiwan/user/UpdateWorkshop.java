package gis.taiwan.user;

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

public final class UpdateWorkshop extends Action {
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
    	if(session.getAttribute("pin")==null){
    		xmlResponse = "<status>not_login</status>";
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	String pin = session.getAttribute("pin").toString();    	
		
		//接收變數  
        String day1_1 = req.getParameter("day1_1");
        String day1_2 = req.getParameter("day1_2");
        String day1_3 = req.getParameter("day1_3");
        String day2_1 = req.getParameter("day2_1");
        String day2_2 = req.getParameter("day2_2");
        String day2_3 = req.getParameter("day2_3");
        				
        try{
        	sql = "update workshop set day1_1 = ?, day1_2 = ?, day1_3 = ?, day2_1 = ?, day2_2 = ?, day2_3 = ? where pin = ? limit 1";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, day1_1);
			stmt.setString(2, day1_2);
			stmt.setString(3, day1_3);
			stmt.setString(4, day2_1);
			stmt.setString(5, day2_2);
			stmt.setString(6, day2_3);
			stmt.setString(7, pin);
			
			int changeNum = stmt.executeUpdate();						
			
			if(changeNum==1){
				xmlResponse = "<status>finish</status>";
			}else{//==0
				xmlResponse = "<status>nothing_change</status>";
			}
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

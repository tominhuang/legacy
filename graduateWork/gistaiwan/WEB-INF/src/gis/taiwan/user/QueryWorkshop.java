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

public class QueryWorkshop extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse="";
		HttpSession session = req.getSession();
    	
    	if(session.getAttribute("id")==null){
    		xmlResponse = "<validation>NO</validation>" +
    				"<day1_1>-1</day1_1><day1_2>-1</day1_2><day1_3>-1</day1_3>" +
    				"<day2_1>-1</day2_1><day2_2>-1</day2_2><day2_3>-1</day2_3>" +
    				"<day1>-1</day1><day2>-1</day2>";					
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	    	    	
    	String pin = session.getAttribute("pin").toString();
    	String _getWorkshopNum = getWorkshopNum(pin);
    	
    	if(!_getWorkshopNum.equals("")){
    		xmlResponse = "<validation>YES</validation>" + _getWorkshopNum;    		
    	}    	    	    	
		xmlwriter.send(xmlResponse);
		
		return null;
	}
	
	
	public String getWorkshopNum(String pin){
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
				String list =  "<day1_1>" + rs.getString(2) + "</day1_1><day1_2>" + rs.getString(3) + "</day1_2><day1_3>" + rs.getString(4) + "</day1_3>" +
				"<day2_1>" + rs.getString(5) + "</day2_1><day2_2>" + rs.getString(6) + "</day2_2><day2_3>" + rs.getString(7) + "</day2_3>" +
				"<day1>" + rs.getString(9) + "</day1>" + "<day2>" + rs.getString(10) + "</day2>";					
				
				return list;						    					
			}
		}catch(SQLException e){
			e.printStackTrace();
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
		return "";
	}
	
}

package gis.taiwan.score;

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

public class ScoreLoginCheck extends Action  {
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse;
		HttpSession session = req.getSession();
    	
    	if(session.getAttribute("score_id")==null){
    		xmlResponse = "<validation>NO</validation><id>Nobody</id><name>Nobody</name><title>Nobody</title><score>None</score>";					
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}    	
    	String score_id = session.getAttribute("score_id").toString();
    	
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
			
        try{
        	sql = "SELECT name,title,score FROM score s where s.id = ? limit 1";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, score_id);
			rs = stmt.executeQuery();					
			
			
			if(rs.next()){
				String score = rs.getString("score");
				if(score==null || score.equals("")){
					score = "None";
				}
		    	xmlResponse = "<validation>YES</validation><id>" + score_id +"</id><name>" + rs.getString("name") + "</name><title>" + rs.getString("title") +"</title><score>" + score + "</score>";    	
				xmlwriter.send(xmlResponse);				
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
		
		return null;
	}
}

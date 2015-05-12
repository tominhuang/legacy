package edu.tw.task;

import java.io.IOException;
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
import org.json.simple.JSONArray;

import edu.tw.ajax.JSONWriter;

public class UpdateAdmin extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {

    	request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
		  	
    	    	    		
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	    	
    	   
    	//接收變數  
        String reply = request.getParameter("reply");
        String id = request.getParameter("aid");
        String value = request.getParameter("value");
        String week = request.getParameter("week");
     
        try{            
            sql = "update admin set value = ?, onchange=NOW() where id = ?";        	    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, value);
    		stmt.setString(2, id);
    		int result=stmt.executeUpdate();
    		
    		if(reply!=null){
	    		sql = "update researcher_reply set isReply = ?, replyTime=NOW() where week = ?";
	    		stmt = con.prepareStatement(sql);  	    	
	    		stmt.setString(1, value);
	    		stmt.setString(2, week);
	    		stmt.executeUpdate();
    		}
    		
    		if(result==1){
    			list.add("ok");
    		}else{
    			list.add("fail");    			
    		}
    			
    		
        } catch (SQLException e) {
        	list.add("sql");
        	e.printStackTrace();
		} catch (Exception e) {
			list.add("other");
			e.printStackTrace();
		} finally{
			jsonWriter.send(list);
			try {
				if(rs!=null)con.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return null;	   
    }
}

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


public class CheckEvidence extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {    	
    	    	    	
    	request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();
		
    	if(session.getAttribute("id")==null){
    		list.add("invalid");
    		jsonWriter.send(list);
    		return null;
    	}     	    	    	
    	String id = session.getAttribute("id").toString();    	
    	    	    		
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	    	    	   
        String check1 = request.getParameter("check1");
        String check2 = request.getParameter("check2");
        String check3 = request.getParameter("check3");
        String check4 = request.getParameter("check4");
        String check5 = request.getParameter("check5");
        String check6 = request.getParameter("check6");
        String check7 = request.getParameter("check7");
        String check8 = request.getParameter("check8");
        String check9 = request.getParameter("check9");
        String check10 = request.getParameter("check10");
 

        try{
    		sql = "update checked set check1=?, " + "check2=?, " + "check3=?, " +"check4=?, " +"check5=?, " +"check6=?, " +"check7=?, " +"check8=?, " +"check9=?, " +"check10=?, " +
    				"insertTime=NOW() where id = ?";    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, check1);
    		stmt.setString(2, check2);
    		stmt.setString(3, check3);  		    	
    		stmt.setString(4, check4);    		
    		stmt.setString(5, check5);
    		stmt.setString(6, check6);
    		stmt.setString(7, check7);
    		stmt.setString(8, check8);  		    	
    		stmt.setString(9, check9);    		
    		stmt.setString(10, check10);    		
    		stmt.setString(11, id);   
    		int result=stmt.executeUpdate();
    		
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

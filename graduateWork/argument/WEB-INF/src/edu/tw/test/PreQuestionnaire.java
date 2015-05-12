package edu.tw.test;

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

import edu.tw.ajax.TextWriter;


public class PreQuestionnaire extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
		HttpSession session = request.getSession();		
    	if(session.getAttribute("id")==null){
    		TextWriter textWriter= new TextWriter(response);
    		String word="<script>alert('資料未儲存。你因閒置太久已登出！請重新登入。');window.location.href='./';</script>";
    		textWriter.send(word);

    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString();
    	String grouping = session.getAttribute("grouping").toString();    	
    	
    	    	
    	request.setCharacterEncoding("utf-8");    	
	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	   
    	//接收變數  
        String group1 = request.getParameter("group1");
        String group2 = request.getParameter("group2");
        String group3 = request.getParameter("group3");
        String group4 = request.getParameter("group4");
        String group5 = request.getParameter("group5");
        String group6 = request.getParameter("group6");
        String group7 = request.getParameter("group7");
        String group8 = request.getParameter("group8");
        String group9 = request.getParameter("group9");
        String group10 = request.getParameter("group10");
        
        String group11 = request.getParameter("group11");
        String group12 = request.getParameter("group12");
        String group13 = request.getParameter("group13");
        String group14 = request.getParameter("group14");
        String group15 = request.getParameter("group15");
        String group16 = request.getParameter("group16");
        String group17 = request.getParameter("group17");                       
        String group18 = request.getParameter("group18");
        String group19 = request.getParameter("group19");
        String group20 = request.getParameter("group20");
        
        String group21 = request.getParameter("group21");
        String group22 = request.getParameter("group22");
        String group23 = request.getParameter("group23");
        String group24 = request.getParameter("group24");
        
        String gb1 = request.getParameter("gb1");
        String gb2 = request.getParameter("gb2");
        String gb3 = request.getParameter("gb3");
        String gb4 = request.getParameter("gb4");
        String gb5 = request.getParameter("gb5");
        String gb6 = request.getParameter("gb6");
        String gb7 = request.getParameter("gb7");
        String gb8 = request.getParameter("gb8");
        String gb9 = request.getParameter("gb9");
        String gb10 = request.getParameter("gb10");
        
        String gb11 = request.getParameter("gb11");
        String gb12 = request.getParameter("gb12");
        String gb13 = request.getParameter("gb13");
        String gb14 = request.getParameter("gb14");
        String gb15 = request.getParameter("gb15");
        String period = request.getParameter("period");        

    		        
        try{
        	//total 43 fields
    		sql = "insert into pre_questionnaire values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?)";
    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, group1);
    		stmt.setString(4, group2);
    		stmt.setString(5, group3);  		    	
    		stmt.setString(6, group4);    		
    		stmt.setString(7, group5);
    		stmt.setString(8, group6);
    		stmt.setString(9, group7);
    		stmt.setString(10, group8);    		
    		stmt.setString(11, group9);
    		stmt.setString(12, group10);    		
    		stmt.setString(13, group11);
    		stmt.setString(14, group12);    		
    		stmt.setString(15, group13);
    		stmt.setString(16, group14);
    		stmt.setString(17, group15);
    		stmt.setString(18, group16);    		
    		stmt.setString(19, group17);
    		stmt.setString(20, group18);
    		stmt.setString(21, group19);
    		stmt.setString(22, group20);
    		stmt.setString(23, group21);
    		stmt.setString(24, group22);
    		stmt.setString(25, group23);
    		stmt.setString(26, group24);
    		
    		stmt.setString(27, gb1);
    		stmt.setString(28, gb2);
    		stmt.setString(29, gb3);  		    	
    		stmt.setString(30, gb4);    		
    		stmt.setString(31, gb5);
    		stmt.setString(32, gb6);
    		stmt.setString(33, gb7);
    		stmt.setString(34, gb8);    		
    		stmt.setString(35, gb9);
    		stmt.setString(36, gb10);    		
    		stmt.setString(37, gb11);
    		stmt.setString(38, gb12);    		
    		stmt.setString(39, gb13);
    		stmt.setString(40, gb14);
    		stmt.setString(41, gb15);
    		stmt.setString(42, period);
    		
    		int result=stmt.executeUpdate();
    		
    		sql = "update user set isQuestionareDone = ? where id= ? limit 1";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, "1");
    		stmt.setString(2, id);    		
    		stmt.executeUpdate();    		
    		
    		int result2=stmt.executeUpdate();
    		
    		if(result==1 && result2==1){   			
    			response.sendRedirect("task/task.html");
    		}	
    		
        } catch (SQLException e) {
        	TextWriter textWriter= new TextWriter(response);
    		String word="<script>alert('系統出現錯誤，資料未儲存。請再試一次！\n也可能是因為你已經填過問卷了。');window.history.go(-1)</script>";
    		textWriter.send(word);        	
        	e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
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

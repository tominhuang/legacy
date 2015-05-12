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


public class PostQuestionnaire extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws IOException {    	
    	
		HttpSession session = request.getSession();		
    	if(session.getAttribute("id")==null){
    		TextWriter textWriter= new TextWriter(response);
    		String word="<script>alert('資料未儲存。你尚未登入，或是閒置太久已被登出！請重新登入。');window.location.href='./';</script>";
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
        String groupAlpha1 = request.getParameter("groupAlpha1");
        String groupAlpha2 = request.getParameter("groupAlpha2");
        String groupAlpha3 = request.getParameter("groupAlpha3");
        String groupAlpha4 = request.getParameter("groupAlpha4");
        String groupAlpha5 = request.getParameter("groupAlpha5");
        String groupAlpha6 = request.getParameter("groupAlpha6");
        String groupAlpha7 = request.getParameter("groupAlpha7");
        String groupAlpha8 = request.getParameter("groupAlpha8");
        String groupAlpha9 = request.getParameter("groupAlpha9");
        String groupAlpha10 = request.getParameter("groupAlpha10");
        
        String groupAlpha11 = request.getParameter("groupAlpha11");
        String groupAlpha12 = request.getParameter("groupAlpha12");
        String groupAlpha13 = request.getParameter("groupAlpha13");
        String groupAlpha14 = request.getParameter("groupAlpha14");
        String groupAlpha15 = request.getParameter("groupAlpha15");
        String groupAlpha16 = request.getParameter("groupAlpha16");
        String groupAlpha17 = request.getParameter("groupAlpha17");                       
        String groupAlpha18 = request.getParameter("groupAlpha18");

        String groupBeta1 = request.getParameter("groupBeta1");
        String groupBeta2 = request.getParameter("groupBeta2");
        String groupBeta3 = request.getParameter("groupBeta3");
        String groupBeta4 = request.getParameter("groupBeta4");
        String groupBeta5 = request.getParameter("groupBeta5");
        String groupBeta6 = request.getParameter("groupBeta6");
        String groupBeta7 = request.getParameter("groupBeta7");
        String groupBeta8 = request.getParameter("groupBeta8");
        String groupBeta9 = request.getParameter("groupBeta9");
        String groupBeta10 = request.getParameter("groupBeta10");
        
        String groupBeta11 = request.getParameter("groupBeta11");
        String groupBeta12 = request.getParameter("groupBeta12");
        String groupBeta13 = request.getParameter("groupBeta13");
        String groupBeta14 = request.getParameter("groupBeta14");
        String groupBeta15 = request.getParameter("groupBeta15");
        String groupBeta16 = request.getParameter("groupBeta16");
        
        String period = request.getParameter("period");
    		        
        try{
        	//total 37 question marks, 38 fields 
    		sql = "insert into post_questionnaire values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?)";
    		
    		con = DriverManager.getConnection("proxool.argument");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, groupAlpha1);
    		stmt.setString(4, groupAlpha2);
    		stmt.setString(5, groupAlpha3);  		    	
    		stmt.setString(6, groupAlpha4);    		
    		stmt.setString(7, groupAlpha5);
    		stmt.setString(8, groupAlpha6);
    		stmt.setString(9, groupAlpha7);
    		stmt.setString(10, groupAlpha8);    		
    		stmt.setString(11, groupAlpha9);
    		stmt.setString(12, groupAlpha10);    		
    		stmt.setString(13, groupAlpha11);
    		stmt.setString(14, groupAlpha12);    		
    		stmt.setString(15, groupAlpha13);
    		stmt.setString(16, groupAlpha14);
    		stmt.setString(17, groupAlpha15);
    		stmt.setString(18, groupAlpha16);    		
    		stmt.setString(19, groupAlpha17);
    		stmt.setString(20, groupAlpha18);
    		
    		stmt.setString(21, groupBeta1);
    		stmt.setString(22, groupBeta2);
    		stmt.setString(23, groupBeta3);  		    	
    		stmt.setString(24, groupBeta4);    		
    		stmt.setString(25, groupBeta5);
    		stmt.setString(26, groupBeta6);
    		stmt.setString(27, groupBeta7);
    		stmt.setString(28, groupBeta8);    		
    		stmt.setString(29, groupBeta9);
    		stmt.setString(30, groupBeta10);    		
    		stmt.setString(31, groupBeta11);
    		stmt.setString(32, groupBeta12);    		
    		stmt.setString(33, groupBeta13);    		
    		stmt.setString(34, groupBeta14);
    		stmt.setString(35, groupBeta15);
    		stmt.setString(36, groupBeta16);
    		stmt.setString(37, period);
    		
    		int result=stmt.executeUpdate();
    		
    		sql = "update user set postQ = ? where id= ? limit 1";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, "1");
    		stmt.setString(2, id);    		
    		stmt.executeUpdate();    		
    		
    		int result2=stmt.executeUpdate();
    		
    		if(result==1 && result2==1){   			
    			response.sendRedirect("task/post-questionnaire.html");
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

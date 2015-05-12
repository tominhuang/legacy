package edu.tw.login;

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

public class LogoutAction extends Action  {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

    	if(session.getAttribute("id")==null){
    		response.sendRedirect("./");
    		return null;
    	}    	    	    	
    	String id = session.getAttribute("id").toString();
    	String grouping = session.getAttribute("grouping").toString();
	    Connection con = null;
	    PreparedStatement stmt = null;
    	String sql = "";

        try{    		
    		con = DriverManager.getConnection("proxool.argument");
    		
    		//record
    		sql = "insert into log_record values (null,?,?,?,NOW())";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, id);
    		stmt.setString(2, grouping);
    		stmt.setString(3, "logout");
    		stmt.executeUpdate();    		
        } catch (SQLException e) {
        	e.printStackTrace();
		} finally{			
			try {
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}

		/*
		session.removeAttribute("id");
		session.removeAttribute("grouping");
		session.removeAttribute("isPasswordChange");
		session.removeAttribute("isQuestionareDone");
		*/
		session.invalidate();
		//response.setHeader("Refresh", "0; URL=./index.html");
		
		response.sendRedirect("./");
		
		return null;
		//return mapping.findForward("home");
	}
}

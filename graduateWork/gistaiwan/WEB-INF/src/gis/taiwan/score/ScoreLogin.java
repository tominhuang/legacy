package gis.taiwan.score;

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

public final class ScoreLogin extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
	
		// 取得表單參數值
		String id = req.getParameter("textfield");
		String password = req.getParameter("textfield2");

		HttpSession session = req.getSession();
		
				
        try{
        	sql = "SELECT id,password,name,title,score FROM score s where s.id = ? and s.password = ? limit 1";
        	
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			rs = stmt.executeQuery();					
			
			if(rs.next()){				
				session.setAttribute("score_id", rs.getString("id"));
			}else{
				return mapping.findForward("error");
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
		
		res.sendRedirect("score/main.html");
		return null;
		//return mapping.findForward("main");
		
	}	
}

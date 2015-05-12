package gis.taiwan.validate;

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


 
/**
* Deal Validation
* @lastUpate 2008/11/26
* @author tomin
*
*/
public class Validate extends Action {
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws IOException {
    	
    	//如果已經登入了
    	HttpSession session = req.getSession();
    	
    	if(session.getAttribute("id")!=null){
    		return mapping.findForward("success"); 
    	}
    	
       	req.setCharacterEncoding("utf-8");       
	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	
    	//接收變數  
        String key = req.getParameter("key");
           
        try{
        	sql = "SELECT u.id,u.sid FROM user_validate uv join user u on u.id = uv.id where uv.key = ? limit 1";
			con = DriverManager.getConnection("proxool.gistaiwan");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, key);
			rs = stmt.executeQuery();					
				
			
			//之前有註冊過
			if(rs.next()){
				
	        	//讓他通過認證
	    		sql = "update user set isValid = '1' where id = ? limit 1";
	    			
	    		stmt = con.prepareStatement(sql);	    		
	    		stmt.setString(1, rs.getString("id") );
	    		
	    		stmt.executeUpdate();
	    		

	        	//刪掉認證暫存
	    		sql = "delete from user_validate where id = ? limit 1";
	    			    			
	    		stmt = con.prepareStatement(sql);	    		
	    		stmt.setString(1, rs.getString("id") );
	    		
	    		stmt.executeUpdate();
	    		
	    		//幫他登入	    		
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("pin", rs.getString("sid"));
	    		
	    		return mapping.findForward("success");
				
				
			}else{
				return mapping.findForward("fail");
			}        	
        	
        	
        } catch (SQLException e) {
        	e.printStackTrace();
		} finally{			
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
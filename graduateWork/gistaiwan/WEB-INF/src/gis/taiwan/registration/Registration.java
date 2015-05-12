package gis.taiwan.registration;

import gis.taiwan.mail.Mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


 
/**
* Deal Registration Form
* @lastUpate 2008/12/08
* @author tomin
*
*/
public class Registration extends Action {
	
	private static final String PATH_CONFIG_BUNDLE_NAME = "path";
	
    public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res) throws IOException {
    	
       	req.setCharacterEncoding("utf-8");       
	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
    	   
    	//接收變數  
        String textfield = req.getParameter("textfield");
        String textfield2 = req.getParameter("textfield2");
        
        String textfield4 = req.getParameter("textfield4");
        String textfield5 = req.getParameter("textfield5");
        String textfield6 = req.getParameter("textfield6");
        String textfield7 = req.getParameter("textfield7");
        String textfield8 = req.getParameter("textfield8");
        String textfield9 = req.getParameter("textfield9");
        String textfield10 = req.getParameter("textfield10");
        String textfield11 = req.getParameter("textfield11");
        String textfield12 = req.getParameter("textfield12");
        String textfield13 = req.getParameter("textfield13");
        String textfield14 = req.getParameter("textfield14");
        String textfield15 = req.getParameter("textfield15");
        String textfield16 = req.getParameter("textfield16");
        String textfield17 = req.getParameter("textfield17");
                       
        String select = req.getParameter("select");
        String select2 = req.getParameter("select2");
        String select3 = req.getParameter("select3");
        String select4 = req.getParameter("select4");
        String select5 = req.getParameter("select5");
        String select6 = req.getParameter("select6");
        
        String h1 = req.getParameter("h1");
        String h2 = req.getParameter("h2");
        String h3 = req.getParameter("h3");
        
        String checkbox = req.getParameter("checkbox");
        String checkbox2 = req.getParameter("checkbox2");
        String checkbox3 = req.getParameter("checkbox3");
        String checkbox4 = req.getParameter("checkbox4");
        String checkbox5 = req.getParameter("checkbox5");
        String checkbox6 = req.getParameter("checkbox6");
        String checkbox7 = req.getParameter("checkbox7");        
        
        
        try{
        	//個資紀錄到資料庫
    		sql = "insert into user values (NULL,?,AES_ENCRYPT(?,'GISTaiwan_2009_NTU'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?,?,?,?,'0',NULL)";
    		
    		con = DriverManager.getConnection("proxool.gistaiwan");		
    		stmt = con.prepareStatement(sql);
    		stmt.setString(1, textfield);//id
    		stmt.setString(2, textfield2);//password
    		stmt.setString(3, textfield4);//first name
    		stmt.setString(4, textfield5);
    		stmt.setString(5, textfield6);
  		    	
    		stmt.setString(6, select);//gender    		
    		stmt.setString(7, select2);
    		stmt.setString(8, select3);
    		stmt.setString(9, select4);//school
    		stmt.setString(10, textfield7);
    		
    		stmt.setString(11, select5);//subject
    		stmt.setString(12, textfield8);    		
    		stmt.setString(13, textfield9);//school address
    		stmt.setString(14, select6);
    		
    		stmt.setString(15, textfield10);
    		stmt.setString(16, textfield11);
    		stmt.setString(17, textfield12);
    		stmt.setString(18, textfield13);//local phone
    		
    		stmt.setString(19, textfield14);
    		stmt.setString(20, h1);
    		stmt.setString(21, h2);
    		stmt.setString(22, h3);
    		stmt.setString(23, textfield15);
    		stmt.setString(24, textfield16);//email
    		
    		stmt.setString(25, checkbox);
    		stmt.setString(26, checkbox2);
    		stmt.setString(27, checkbox3);
    		stmt.setString(28, checkbox4);
    		stmt.setString(29, checkbox5);
    		stmt.setString(30, checkbox6);
    		stmt.setString(31, checkbox7);
    		stmt.setString(32, textfield17);
    		
    		stmt.executeUpdate();
	        
    		
    		//信箱驗證key    		
    		Random generator = new Random();    		
    		String key = Long.toString(Math.abs(generator.nextLong()), 36) + "_" + Long.toString(new Date().getTime());
    		
    		sql = "insert into user_validate values (?,?,NOW())";
    		stmt = con.prepareStatement(sql);    		
    		stmt.setString(1, textfield);//id
    		stmt.setString(2, key);//key
    		
    		stmt.executeUpdate();
    		
    		
        	sql = "SELECT sid FROM user u where u.id = ? limit 1";
        	stmt = con.prepareStatement(sql);
			stmt.setString(1, textfield);
			rs = stmt.executeQuery();
			
			String pin = "on the essay page";
			if(rs.next()){
				pin = rs.getString("sid");
			}
			
    		
    		//Mail
    		
    		// 從path.properties檔中取得設定
    		ResourceBundle bundle;
    	    bundle = ResourceBundle.getBundle(PATH_CONFIG_BUNDLE_NAME);
    	    String site_url = bundle.getString("site_url");	  		
    		
    	    //寫信
    		String words = "This is an auto-generated letter from Global Initiatives Symposium in Taiwan 2009 (GIS Taiwan 2009).\n\n"
    					   + "Your PIN is " + pin + ".\n"
    					   + "Word count and PIN should be disclosed at the beginning of your essay and abstract.\n\n"
    					   + "To complete your registration for GIS Taiwan, please click the hyperlink below to finish the registration:\n"
    					   + site_url + "validate.do?key=" + key
    					   + "\n\n\n\n"
    					   + "Please ingore this letter if you did not register.\n\n"
    					   + "--\n"
    					   + "Please do not reply this letter.\n"
    					   + "GIS Taiwan: " + site_url;
    		Mail mailValidate = new Mail();
    		mailValidate.SimpleMail(textfield16, "[GIS Taiwan] Confirm your registration!", words);
    			
    		return mapping.findForward("success");
    		
        } catch (SQLException e) {
    		//設定輸出編碼
            res.setContentType("text/html; charset=utf-8");			
    		res.setCharacterEncoding("utf-8");
    		
    		//print
    		PrintWriter out = res.getWriter();//務必宣告在utf-8後面..	
    		out.print(e);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} finally{			
			//close sql
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
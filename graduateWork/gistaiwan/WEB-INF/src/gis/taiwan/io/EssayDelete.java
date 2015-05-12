package gis.taiwan.io;

import gis.taiwan.ajax.AjaxXMLResponseWriter;
import java.io.File;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class EssayDelete extends Action {
	
	private static final String PATH_CONFIG_BUNDLE_NAME = "path";
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res)  {
				
			xmlwriter = new AjaxXMLResponseWriter(res);
			String xmlResponse;
			HttpSession session = req.getSession();
			
	    	if(session.getAttribute("pin")==null){
	    		xmlResponse = "<error>yes</error><errorType>not login</errorType>";
	    		xmlResponse += "<finish>0</finish>";
	    		xmlwriter.send(xmlResponse);
	    		return null;    		
	    	}
	    	
	    	String pin = session.getAttribute("pin").toString();		
					
			
			// 從path.properties檔中取得設定
			ResourceBundle bundle;
		    bundle = ResourceBundle.getBundle(PATH_CONFIG_BUNDLE_NAME);
		    String essay_url = bundle.getString("essay_url");		    		    			   
			String essayFile = essay_url + "E" + pin + ".pdf";
			
			    
		    // A File object to represent the filename
		    File f = new File(essayFile);
		    				
		    // Make sure the file or directory exists and isn't write protected
		    if (!f.exists()){
		    	xmlResponse = "<error>yes</error><errorType>no such file or directory: " + essayFile + "</errorType>";
	    		xmlResponse += "<finish>0</finish>";
	    		xmlwriter.send(xmlResponse);
	    		return null;
		    };
		
		    if (!f.canWrite()){
		    	xmlResponse = "<error>yes</error><errorType>write protected</errorType>";
	    		xmlResponse += "<finish>0</finish>";
	    		xmlwriter.send(xmlResponse);
	    		return null;
		    }
		
		    // Attempt to delete it
		    boolean success = f.delete();
		
		    if (!success){
		    	xmlResponse = "<error>yes</error><errorType>deletion failed</errorType>";
	    		xmlResponse += "<finish>0</finish>";
	    		xmlwriter.send(xmlResponse);
	    		return null;
		    }else{
		    	 xmlResponse = "<error>no</error><errorType>no</errorType>";
	    		xmlResponse += "<finish>1</finish>";
	    		xmlwriter.send(xmlResponse);
	    		return null;		    	
		    }

  }

}

           
       
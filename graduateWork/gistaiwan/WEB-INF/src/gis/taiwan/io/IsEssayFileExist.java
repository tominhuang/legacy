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

public class IsEssayFileExist extends Action {
	
	private static final String PATH_CONFIG_BUNDLE_NAME = "path";
	private AjaxXMLResponseWriter xmlwriter;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest req, HttpServletResponse res){
		
		xmlwriter = new AjaxXMLResponseWriter(res);
		String xmlResponse;
		HttpSession session = req.getSession();
		
    	if(session.getAttribute("pin")==null){
    		xmlResponse = "<error>no</error><errorType>no</errorType>";
    		xmlResponse += "<abstract>no</abstract><essay>no</essay>";
    		xmlwriter.send(xmlResponse);
    		return null;    		
    	}
    	
    	String pin = session.getAttribute("pin").toString();		
						
		// 從path.properties檔中取得設定
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle(PATH_CONFIG_BUNDLE_NAME);
	    String abstract_url = bundle.getString("abstract_url");		    
	    String essay_url = bundle.getString("essay_url");
		    
		//大小寫都可讀取到，不用另外判斷。
		String abstractFile = abstract_url + "A" + pin + ".pdf";
		String essayFile = essay_url + "E" + pin + ".pdf";
		    
	    // A File object to represent the filename
	    File abstractFileObject = new File(abstractFile);
	    File essayFileObject = new File(essayFile);
	    
	    String isAbstractExist = "0";	    
	    String isEssayExist = "0";
	    
	    // Make sure the file or directory exists and isn't write protected
	    if (abstractFileObject.exists()){
	    	isAbstractExist = "1";	    	
	    }

	    if (essayFileObject.exists()){
	    	isEssayExist = "1";	    	
	    }
	    
	    xmlResponse = "<error>no</error><errorType>no</errorType>";
		xmlResponse += "<abstract>" + isAbstractExist + "</abstract><essay>" + isEssayExist + "</essay>";
		xmlResponse += "<abstractFile>" + abstractFile + "</abstractFile><essayFile>" + essayFile + "</essayFile>";
		xmlwriter.send(xmlResponse);	    
		    
		    
		return null;
  }

}

           
       
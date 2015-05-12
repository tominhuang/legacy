package edu.tw.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;

import edu.tw.ajax.JSONWriter;

public class QueryUser extends Action  {

	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse res) throws Exception {
		
		HttpSession session = request.getSession();
		JSONWriter jsonWriter = new JSONWriter(res); 
		JSONArray list = new JSONArray();
    	
    	if(session.getAttribute("id")==null){    							
    		list.add("invalid");
    		list.add("invalid");
    		jsonWriter.send(list);
    		return null;    		
    	}
    	    	    	
    	String id = session.getAttribute("id").toString();
    	String grouping = session.getAttribute("grouping").toString();
    	    					
		list.add(id);
		list.add(grouping);
		jsonWriter.send(list);    	
		return null;
	}

}

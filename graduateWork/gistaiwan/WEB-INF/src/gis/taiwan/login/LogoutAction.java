package gis.taiwan.login;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
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
		session.removeAttribute("id");
		session.removeAttribute("pin");
		

	    Cookie cookie1 = new Cookie(URLEncoder.encode("id","UTF-8"),"");
	    cookie1.setMaxAge(0);
	    response.addCookie(cookie1);	     
		
		return null;
		//return mapping.findForward("home");
	}
}

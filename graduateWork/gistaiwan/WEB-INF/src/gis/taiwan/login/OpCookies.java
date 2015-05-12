package gis.taiwan.login;

/**
* <p>Title: Kenfor BBS System</p>
* <p>Description: Kenfor BBS System</p>
* <p>Copyright: Copyright ( c) 2004</p>
* <p>Company: Strong Software Co.Ltd.</p>
* @link http://strongd.net
* @author Strong
* @version 1.0.1
*/

import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;
 
public class OpCookies {
  public OpCookies() {}
 
  public String Write_Cookies(String CookiesName, String CookiesValue, int MaxAge, String path, HttpServletResponse response) {
    if (CookiesName == null)
      return null;
    if (MaxAge <= 0)
      MaxAge = 3600;
    if (path == null || path.length() == 0)
      path = "/";
    if (response == null)
      return null;
    Cookie nameCookie = new Cookie(CookiesName, CookiesValue);
    nameCookie.setMaxAge(MaxAge);
    nameCookie.setPath(path);
    response.addCookie(nameCookie);
    return CookiesValue;
  }
 
  public void Del_Cookies(String CookiesName,String path, HttpServletResponse response) {
    if (CookiesName == null)
      return;
    if (path == null || path.length() == 0)
      path = "/";
    if (response == null)
      return;
    Cookie nameCookie = new Cookie(CookiesName, "");
    nameCookie.setMaxAge(0);
    nameCookie.setPath(path);
    response.addCookie(nameCookie);
  }
 
  public String Read_Cookies(String CookieName, HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    String CookiesValue=null;
    if (cookies != null) {
      for (int i = 0; i < cookies.length; i++) {
        Cookie cookie = cookies[i];
        String cookieName = cookie.getName();
        if (cookieName.equals(CookieName)) {
         CookiesValue = cookie.getValue();
        }
      }
    }
    return CookiesValue;
  }
}
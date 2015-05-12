package gis.taiwan.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AjaxXMLResponseWriter{
	private PrintWriter out;
	private String header = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	
	public AjaxXMLResponseWriter(HttpServletResponse response) {
		response.setContentType("text/xml; charset=utf-8");
		try { this.out = response.getWriter(); }
		catch (IOException e) {	e.printStackTrace(); }
	}
	
	public AjaxXMLResponseWriter(HttpServletResponse response, String encoding) {
		response.setContentType("text/xml; charset=" + encoding);
		header = "<?xml version=\"1.0\" encoding=\"" + encoding + "\"?>";
		try { this.out = response.getWriter(); }
		catch (IOException e) {	e.printStackTrace(); }
	}
	
	public void send(String inline){
		String xmlResponse = header + "<root><debug type=\"none\" />" + 
						inline + "</root>";
		out.println(xmlResponse);
		out.flush();
	}
	
	public void sendSelectItem(String inline) {
		String xmlResponse = header + inline;//<ul><li>
		out.println(xmlResponse);
		out.flush();
	}
	
	public void send(String message, String inline){
		String xmlResponse = header + "<root><debug type=\"message\">" + 
			correctXMLEntity(message) + "</debug>" + inline + "</root>";
		out.println(xmlResponse);
		out.flush();
	}
	
	public void debug(String errorMessage){
		String xmlResponse = header + "<root><debug type=\"error\">" + 
			correctXMLEntity(errorMessage) + "</debug></root>";
		out.println(xmlResponse);
		out.flush();
	}
	
	private String correctXMLEntity(String original){
		String transitted = null;
		
		transitted = original.replaceAll("&", "&amp;");
		transitted = transitted.replaceAll("'", "&apos;");
		transitted = transitted.replaceAll("\"", "&quot;");
		transitted = transitted.replaceAll("<", "&lt;");
		transitted = transitted.replaceAll(">", "&gt;");
		
		return transitted;
	}
}

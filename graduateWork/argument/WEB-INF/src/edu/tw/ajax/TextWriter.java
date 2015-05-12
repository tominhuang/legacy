package edu.tw.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class TextWriter{
	private PrintWriter out;
	
	public TextWriter(HttpServletResponse response) {
		//response.setContentType("application/json; charset=utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		try { this.out = response.getWriter(); }
		catch (IOException e) {	e.printStackTrace(); }
	}
	
	public void send(String inline){
		out.println(inline);
		out.flush();
	}
	
}

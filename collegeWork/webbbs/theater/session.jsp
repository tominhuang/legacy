<%
    String theater=(String)session.getAttribute("theater");
	
    if(theater==null || !theater.equals("ok")){
		response.sendRedirect("index.jsp");
	}
%>
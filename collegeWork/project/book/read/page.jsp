<%@ include file="../check/session/read.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<base target="main_book">
<div align="center">
	<form name="form1" method="post" action="showpage.jsp?isbn=${sessionScope.isbn}">
      <input type="button" name="Submit3" value="上頁">
      <input type="button" name="Submit4" value="下頁">
      <select name="page">
        <option value="content.jsp">目錄</option>
        <%
					Vector vDirList = new Vector();
					String isbn=request.getParameter("isbn");
					String path=request.getRealPath("\\");
					File dir = new File(path+"\\file\\"+isbn+"\\page"); 
					String sDirList[] = dir.list();
					if (sDirList.length >0){
						for (int i =0; i < sDirList.length; i++){
							vDirList.add(sDirList[i]);
						}
					}
		
					for(int i=0; i<vDirList.size(); i++) {
						String sFileName = (String)vDirList.get(i);
						i=i+1;
						sFileName = "第" + i + "章";
						out.print("<option value=" + i + ".jsp>"+sFileName+"</option>");
						i=i-1;
					}   			
				%>
      </select>
      <input type="submit" name="Submit" value="翻閱">
      <a href=""> 
      <input type="button" name="Submit2" value="評論">
      </a>
    </form>
</div>
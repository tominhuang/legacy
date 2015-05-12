<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<div align="center">
	<p>資料還原</p>
	<%--輸入--%>
	<c:if test="${empty param.recover}">
		<p>&nbsp;</p>
		<form name="form1" method="post" action="?recover=true">
		  <p>請選擇欲還原的項目</p>
		  <p><input type="checkbox" name="checkbox1" value="checkbox">基本資料</p>
		  <p><input type="checkbox" name="checkbox2" value="checkbox">健檢資料</p>
		  <p><input type="checkbox" name="checkbox3" value="checkbox">矯治記錄</p>
		  <p><input type="checkbox" name="checkbox4" value="checkbox">特殊疾病</p>
		  <p>請將備份的檔案全選，複製到下方欄位內。</p>
		  <p><textarea name="textarea" cols="90" rows="10"></textarea></p>
		  <p>
		  	<select name="file">
				<option value="">或是選擇欲還原的檔案名稱</option>
				<%
					Vector vDirList = new Vector();
					String path=request.getRealPath("\\");
					File dir = new File(path+"\\backup"); 
					String sDirList[] = dir.list();
					if (sDirList.length >0){
						for (int i =0; i < sDirList.length; i++){
							vDirList.add(sDirList[i]);
						}
					}
		
					for(int i=0; i<vDirList.size(); i++) {
						String sFileName = (String)vDirList.get(i);
						out.print("<option>"+sFileName+"</option>");
					}   			
				%>				
			</select>
		  </p>		  
		  <p><b>注意：還原動作無法復原，建議備份目前的資料。</b></p>
		  <p><input type="submit" name="Submit" value="確定還原"></p>
		</form>
	</c:if>

	<%--處理開始--%>	
	<c:if test="${!empty param.recover}">
		<hr>
		<%
			if(!request.getParameter("file").equals("")){
				String path=request.getRealPath("\\");
				FileReader fr=new FileReader(path+"\\backup\\"+request.getParameter("file"));    
				BufferedReader br= new BufferedReader(fr);
				String text="";
				String Line="";
				while( (Line=br.readLine())!=null){	
					text = text + Line;
				}
				text = text.replaceAll("--  ",";");
				pageContext.setAttribute("textarea",text);
			}
		%>
		<%--欄位和檔案結合--%>
		<c:set value="${param.textarea}${textarea}" var="textarea"/>
		<%--還原開始--%>
		<c:if test="${!empty textarea}"> 
			<sql:transaction>
				<%--基本資料--%>
				<c:if test="${!empty param.checkbox1}">				
					<sql:update sql="DELETE FROM STUDENT"/>
					<p>基本資料還原中</p>
				</c:if>
				
				<%--健檢資料--%>
				<c:if test="${!empty param.checkbox2}">
					<sql:update sql="DELETE FROM HER"/>
					<sql:update sql="DELETE FROM EXAM"/>				
					<p>健檢資料還原中</p>
				</c:if>
				
				<%--矯治記錄--%>
				<c:if test="${!empty param.checkbox3}">			
					<sql:update sql="DELETE FROM TR"/>
					<sql:update sql="DELETE FROM TREAT"/>				
					<p>矯治記錄還原中</p>
				</c:if>
		
				<%--特殊疾病--%>
				<c:if test="${!empty param.checkbox4}">			
					<sql:update sql="DELETE FROM REGISTER"/>
					<p>特殊疾病還原中</p>
				</c:if>
				
				<c:forTokens items="${textarea}" delims=";" var="text">
					<sql:update sql="${text}"/>
				</c:forTokens>
				<p>還原完成</p>
			</sql:transaction>
		</c:if>
		<%--還原結束--%>			
	</c:if>
	<%--處理結束--%>
</div>




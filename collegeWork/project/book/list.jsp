<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>

<STYLE>
<!--
A:link {color:darkgoldenrod ;text-decoration:underline}
A:visited {color:orange ;text-decoration:underline}
A:hover {color:darkgoldenrod ;text-decoration:none}
-->
</STYLE>

<%--查詢符合資料--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo limit 0,5
</sql:query>

<sql:query var="hot">
	SELECT * FROM bookinfo WHERE type = '世界文學' limit 0,6
</sql:query>

<sql:query var="score">
	SELECT * FROM bookinfo WHERE type = '程式語言' limit 0,10
</sql:query>

<sql:query var="many">
	SELECT * FROM bookinfo WHERE type = '中國經典' limit 0,6
</sql:query>



<table width="100%" border="0">
  <tr>
    <td valign="top">
		<table border="1" bgcolor="#CCFFCC" bordercolor="#FFFFFF">
			
          <th colspan="2"><font size="+2" face="標楷體">最新的書籍</font></th>
			<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr> 
			
			  <td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
			  <td> 書名：${row[0]}<br>
				作者：${row[1]}<br>
				出版社：${row[2]}<br>
				</td>
			</tr>
			</c:forEach>
		  </table>
    </td>
	
	
	<td align="right" valign="top">

		<table border="0" width="200">    
			
          <th><font size="+1" face="標楷體">點閱率最高的書籍</font></th>
			
			<c:forEach items="${hot.rowsByIndex}" var="hot_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${hot_put[4]}">${hot_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		</table>
		  
		<br><br><br>
		
		<table border="0" width="200">    
			
          <th><font size="+1" face="標楷體">評分最高的書籍</font></th>
			
			<c:forEach items="${score.rowsByIndex}" var="score_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${score_put[4]}">${score_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		 </table>		
		
		<br><br>
		
		<table border="0" width="200">    
			
          <th><font size="+1" face="標楷體">評論最多的書籍</font></th>
			
			<c:forEach items="${many.rowsByIndex}" var="many_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${many_put[4]}">${many_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		 </table>		
		
		<br><br>

		
	</td>
  </tr>
</table>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT distinct(isbn),bookinfo.name FROM record_book natural join bookinfo where id = '${param.id}' order by count_date desc limit 0,8" var="record_book" />
<sql:query sql="SELECT * FROM comment where id = '${param.id}' order by time desc" var="comment" />
<div align="center">
  <table width="100%" border="0" bgcolor="#3399CC">
    <tr>
      <td align="center"><p><font size="7" face="標楷體">這是${param.id}的Blog</font></p>
        </td>
    </tr>
  </table>
  <p><font size="7" face="標楷體"></font></p>
</div>


<p>&nbsp;</p>
<table width="100%" border="0">
  <tr>
    <td width="19%"><p>正在看的書..</p>
      <p>&nbsp;</p>
      <p>最近看過的書</p>
		<c:choose>
			<c:when test="${record_book.rowCount=='0'}">
				查無資料
			</c:when>
		
			<c:otherwise>
				<c:forEach items="${record_book.rowsByIndex}" var="record_book_put">
					<a href="../detail.jsp?isbn=${record_book_put[0]}">${record_book_put[1]}</a><br>
				</c:forEach>
			</c:otherwise>
		</c:choose>	  

      <p>最近喜歡的書</p>
      <p>&nbsp;</p>
      <p>本年Top10書單</p>
      <p>終生Top10書單</p>
      </td>
    <td width="57%">
	<c:choose>
		<c:when test="${comment.rowCount=='0'}">
			<p align="center">無</p>
		</c:when>
	
		<c:otherwise>
			<table>			
			<c:forEach items="${comment.rowsByIndex}" var="comment_put">
			<tr>
				<td>
				<img src="../images/${comment_put[0]}.jpg">
				</td>
				<td>
					<img src="../comment/star/${comment_put[4]}.gif">發表時間：${comment_put[2]}
					<c:if test="${sessionScope.id==comment_put[1]}">
					<a href="detail_del.jsp?isbn=${comment_put[0]}">刪除</a>				
					</c:if>
					<br>
					<pre>${comment_put[3]}</pre>
					<br>
					<a href="../detail.jsp?isbn=${comment_put[0]}">按此連結書籍介紹</a>
				</td>

					
			</tr>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>		
	
	</td>
    <td width="24%"><p>．文學(10)</p>
      <p>．藝術(5)</p>
      <p>．電腦(20)</p>
      <p>．雜記(18)</p>
      <p>．抱怨(9)</p>
      </td>
  </tr>
</table>
<p>&nbsp;</p>

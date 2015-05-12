<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<p>刪除資料</p>
	<hr>			
	<%--輸入--%>
    <c:if test="${param.radiobutton==null}">
		<form name="form1" method="post" action="">			
			<p>
				<input name="radiobutton" type="radio" value="id" checked>學號：<input type="text" name="textfield0" size="15">
				<select name="select">
					<option value="0">刪除全部的資料</option>
					<option value="1">只保留基本資料</option>
					<option value="2">只刪除矯治資料</option>
					<option value="3">只刪除特殊疾病</option>
				</select>
			</p>
			<p><input name="radiobutton" type="radio" value="year">刪除所有<input type="text" name="textfield1" size="5">學年度入學的學生資料</p>
			<p>&nbsp;</p>
			<p><input type="submit" name="Submit" value="確定刪除"></p>
		</form>
	</c:if>
	
	<%--學號--%>
	<c:if test="${param.radiobutton=='id'}">		
		<c:if test="${param.textfield0==''}">
			學號不可空白
		</c:if>
		
		<c:if test="${param.textfield0!=''}">
			<%@ include file="../include/mysql.jsp" %>
			<%--刪除特殊疾病--%>
			<c:if test="${param.select!='2'}">
				<sql:update sql="delete from register where her_id = any ( select her_id from her where stu_id = ${param.textfield0} )"/>
				<p>特殊疾病記錄已刪除</p>
			</c:if>
			<%--刪除矯治記錄--%>			
			<c:if test="${param.select<='2'}">
				<sql:update sql="delete from treat where tr_id = any ( select tr_id from tr where stu_id = ${param.textfield0} )"/>
				<sql:update sql="delete from tr where stu_id = ${param.textfield0}"/>
				<p>矯治記錄已刪除</p>
			</c:if>
			<%--刪除健檢記錄--%>			
			<c:if test="${param.select<='1'}">
				<sql:update sql="delete from exam where her_id = any ( select her_id from her where stu_id = ${param.textfield0} )"/>
				<sql:update sql="delete from her where stu_id = ${param.textfield0}"/>
				<p>健檢記錄已刪除</p>
			</c:if>
			<%--刪除基本資料--%>						
			<c:if test="${param.select=='0'}">
				<sql:update sql="delete from student where stu_id = ${param.textfield0}"/>
				<p>學生基本資料已刪除</p>
			</c:if>			
			<p><u>學號 ${param.textfield0} 刪除成功</u></p>
		</c:if>	
	</c:if>	
	  
	<%--年度--%>
	<c:if test="${param.radiobutton=='year'}">
		<c:if test="${param.textfield1==''}">
			學年度不可空白
		</c:if>
		<c:if test="${param.textfield1!=''}">
			<%@ include file="../include/mysql.jsp" %>	
			<%--刪除特殊疾病--%>
			<sql:update sql="delete from register where her_id = any ( select her_id from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<p>特殊疾病記錄已刪除</p>			
			<%--刪除矯治記錄--%>
			<sql:update sql="delete from treat where tr_id = any ( select tr_id from tr where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<sql:update sql="delete from tr where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>矯治記錄已刪除</p>
			<%--刪除健檢記錄--%>
			<sql:update sql="delete from exam where her_id = any ( select her_id from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<sql:update sql="delete from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>健檢記錄已刪除</p>
			<%--刪除基本資料--%>	
			<sql:update sql="delete from student where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>學生基本資料已刪除</p>	
			<p><u>${param.textfield1} 學年度刪除成功</u></p>						
		</c:if>		
	</c:if>
	
</div>
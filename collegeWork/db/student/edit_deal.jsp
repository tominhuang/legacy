<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  UPDATE student
  SET Stu_ID = ? , Class_ID = ? , Name = ? , Sex = ? , Bdate = ? , IDCard = ? ,  Address = ? , Phone = ? , Cellphone = ? , Email = ? , Trans = ? , Studying = ? , ECP_Name = ? , ECP_Relation = ? , ECP_Phone = ? , ECP_Cellphone = ?
  WHERE stu_id = ${param.textfield0}
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.select0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.sex}" />
  
  <sql:param value="${param.date}" />
  <sql:param value="${param.textfield2}" />
  <sql:param value="${param.textfield3}" />
  <sql:param value="${param.textfield4}" />  

  <sql:param value="${param.textfield5}" />
  <sql:param value="${param.textfield6}" />  
  <sql:param value="${param.trans}" />  
  <sql:param value="${param.studying}" />

  <sql:param value="${param.textfield9}" />  
  <sql:param value="${param.textfield10}" />
  <sql:param value="${param.textfield11}" />
  <sql:param value="${param.textfield12}" />  
</sql:update>

<sql:query var="result">
  SELECT * FROM student where Stu_ID = ${param.textfield0}
</sql:query>

修改成功<br><br>
學生基本資料報告單<hr>
<c:forEach items="${result.rowsByIndex}" var="row">
	學號：${row[0]}<br>
	系級：${row[1]}<br>
	姓名：${row[2]}<br>
	性別：${row[3]}<br>
	
	出生日期：${row[4]}<br>
	身分證字號：${row[5]}<br>
	地址：${row[6]}<br>
	電話：${row[7]}<br>
	
	手機：${row[8]}<br>
	e-mail：${row[9]}<br>
	是否為轉學生：<c:if test="${row[10]=='false'}">否</c:if><c:if test="${row[10]=='true'}">是</c:if><br>
	就學狀態：${row[11]}<br>
	
	緊急聯絡人姓名：${row[12]}<br>
	與聯絡人關係：${row[13]}<br>
	聯絡人電話：${row[14]}<br>
	聯絡人手機：${row[15]}<hr>
</c:forEach>
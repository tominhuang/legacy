<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/head.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<base target="main">
<div align="center">
	<c:if test="${sessionScope.rank==1}">
		．<a href="student.jsp">學生基本資料</a>
	</c:if>
	<c:if test="${sessionScope.rank==2}">
		．<a href="exam.jsp">健檢資料管理</a>
		．<a href="disease.jsp">特殊疾病記錄</a>
		．<a href="statistic.jsp">統計分析</a>
	</c:if>	
	<c:if test="${sessionScope.rank==3}">	
		．<a href="treat.jsp">矯治記錄管理</a>
	</c:if>	
	<c:if test="${sessionScope.rank==4}">
		．<a href="exam.jsp">健檢資料管理</a>	
		．<a href="disease.jsp">特殊疾病記錄</a>
	</c:if>	
	<c:if test="${sessionScope.rank==5}">
		．<a href="exam.jsp">健檢資料管理</a>	
		．<a href="statistic.jsp">統計分析</a>
	</c:if>	
	<c:if test="${sessionScope.rank==9}">
		．<a href="student.jsp">學生基本資料</a>
		．<a href="exam.jsp">健檢資料管理</a>
		．<a href="treat.jsp">矯治記錄管理</a>
		．<a href="disease.jsp">特殊疾病記錄</a>
		．<a href="statistic.jsp">統計分析</a>
		．<a href="system.jsp">系統作業</a>
	</c:if>
		．<a href="team.jsp">開發團隊</a>
</div>
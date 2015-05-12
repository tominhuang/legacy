<%@ include file="../check/session/statistic.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>BMI計算</p>
	<%--輸入--%>
	<form name="form" method="post" action="BMI.jsp">
		<table align="center">
		  <tr>
			<td>
				<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
				<p>．系級：
					<select name="select">
						<c:forEach items="${result.rowsByIndex}" var="row" >
							<c:choose>
								<c:when test="${param.select==row[0]}">
									<option value="${row[0]}" selected>
								</c:when>						
								<c:otherwise>
									<option value="${row[0]}">
								</c:otherwise>
							</c:choose>
							${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}</option>
						</c:forEach>
					</select>
				</p>
				<p>．學號：
					<input type="text" name="id">
				</p>    
			</td>
		  </tr>
		</table>
		<p><input type="submit" name="Submit" value="查詢"></p>		
	</form>

	<%--查詢--%>
	<c:if test="${!empty param.select}">
		<hr>
		<p>系級 ${param.select} 之中</p>
		<c:choose>		
			<%--班級--%>
			<c:when test="${empty param.id}">
				<sql:query var="height">
					SELECT HER.HER_ID,HER.STU_ID,NAME,SEX,BDATE,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 1 
					<c:if test="${param.sort!=null}">
						ORDER BY ${param.sort} ASC
					</c:if>					
				</sql:query>
				<sql:query sql="SELECT HER.HER_ID,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 2" var="weight" />
			</c:when>

			<%--學號--%>			
			<c:otherwise>
				<sql:query sql="SELECT HER.HER_ID,HER.STU_ID,NAME,SEX,BDATE,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.id} AND EXAM.ITEM_ID = 1" var="height" />
				<sql:query sql="SELECT HER.HER_ID,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.id} AND EXAM.ITEM_ID = 2" var="weight" />
			</c:otherwise>
		</c:choose>
		
		<%--是否查得到資料--%>
		<c:choose>
			<%--無資料--%>
			<c:when test="${height.rowCount==0 || weight.rowCount==0}">
				查無資料
			</c:when>
			
			<%--有資料--%>
			<c:otherwise>
				<%--顯示查詢結果--%>
				<p>查詢到 ${height.rowCount} 筆資料</p>
				<table width="70%" cellspacing="0">
					<tr bgcolor="#99CCCC">
						<c:if test="${height.rowCount>1}">
							<th><a href="?select=${param.select}&sort=2">學號</a></th><th><a href="?select=${param.select}&sort=3">姓名</a></th><th><a href="?select=${param.select}&sort=4">性別</a></th><th><a href="?select=${param.select}&sort=5">生日</a></th><th>體重</th><th><a href="?select=${param.select}&sort=6">身高</a></th><th>BMI</th><th>結果</th>
						</c:if>
						<c:if test="${height.rowCount==1}">
							<th>學號</th><th>姓名</th><th>性別</th><th>生日</th><th>體重</th><th>身高</th><th>BMI</th><th>結果</th>
						</c:if>
					</tr>
					<c:forEach items="${height.rowsByIndex}" var="height_put" >
						<c:forEach items="${weight.rowsByIndex}" var="weight_put" >
							<c:if test="${height_put[0]==weight_put[0]}">
								<c:if test="${height_put[3]=='男'}">
									<tr align="center" bgcolor="#ccccee">
								</c:if>
								<c:if test="${height_put[3]=='女'}">
									<tr align="center" bgcolor="#eecccc">
								</c:if>								
									<td>${height_put[1]}</td>
									<td>${height_put[2]}</td>
									<td>${height_put[3]}</td>
									<td>${height_put[4]}</td>
									<td>${weight_put[1]}</td>
									<td>${height_put[5]}</td>
									<c:set value="${weight_put[1]/(height_put[5]/100*height_put[5]/100)}" var="BMI"/>
									<td><fmt:formatNumber value="${BMI}" maxFractionDigits="2"/></td>
									<%--判斷BMI結果--%>
									<td>
									<%--男生--%>
									<c:if test="${height_put[3]=='男'}">
										<c:choose>
											<c:when test="${BMI>=28}">
												<font color="red">過重</font>
											</c:when>
											
											<c:when test="${BMI>=25}">
												<font color="green">稍重</font>
											</c:when>

											<c:when test="${BMI>=20}">
												正常
											</c:when>
											
											<c:when test="${BMI>=15}">
												<font color="green">稍輕</font>
											</c:when>
											
											<c:otherwise>
												<font color="red">過輕</font>
											</c:otherwise>
										</c:choose>
									</c:if>

									<%--女生--%>
									<c:if test="${height_put[3]=='女'}">
										<c:choose>
											<c:when test="${BMI>=25}">
												<font color="red">過重</font>
											</c:when>
											
											<c:when test="${BMI>=22}">
												<font color="green">稍重</font>
											</c:when>

											<c:when test="${BMI>=18}">
												正常
											</c:when>
											
											<c:when test="${BMI>=14}">
												<font color="green">稍輕</font>
											</c:when>
											
											<c:otherwise>
												<font color="red">過輕</font>
											</c:otherwise>
										</c:choose>										
									</c:if>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>						
	</c:if>
</div>
<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--置中開始--%>
<div align="center">
	<%--輸入學號--%>
	<c:if test="${param.id==null}">
		<p>新增矯治記錄</p>
		<form name="form" method="post" action="add.jsp">
			學號：<input name="id" type="text"><input type="submit" name="Submit" value="新增"> 
		</form>
	</c:if>
	<%--主程式開始--%>
	<c:if test="${param.id!=null}">
		<%--選擇開始--%>	
		<c:choose>
		
			<%--學號空白--%>
			<c:when test="${param.id==''}">
				學號不能空白
			</c:when>
			
			<%--學號不是空白--%>
			<c:otherwise>
				<%--連接資料庫--%>
				<%@ include file="../include/mysql.jsp" %>
				<sql:query sql="SELECT * FROM TR WHERE STU_ID = ${param.id}" var="TR" />
				
				<%--矯治記錄是否存在--%>
				<c:choose>
				
					<%--有矯治記錄--%>	
					<c:when test="${TR.rowCount=='1'}">			
						<p>學號 ${param.id} 矯治記錄已經存在</p>
						<p>請使用<a href="edit.jsp?id=${param.id}">修改矯治記錄</a></p>
					</c:when>
					
					<%--新增開始--%>
					<c:otherwise>												
						<%--查詢健檢資料--%>
						<sql:query sql="SELECT * FROM HER where stu_id = '${param.id}'" var="HER" />
						<%--是否有健檢資料開始--%>
						<c:choose>
							<%--沒有健檢資料--%>
							<c:when test="${HER.rowCount=='0'}">
								沒有學號 ${param.id} 的健檢資料
							</c:when>
							
							<%--有健檢資料開始--%>
							<c:otherwise>
							
								<%--查詢有異常的項目--%>
								<c:forEach items="${HER.rowsByIndex}" var="HER_put">
									<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_put[0]} and Abnormal = 1" var="exam" />	
								</c:forEach>
								<%--判斷是否有異常開始--%>
								<c:choose>
									<%--無異常--%>
									<c:when test="${exam.rowCount=='0'}">
										學號 ${param.id} 查無異常項目
									</c:when>					
									
									<%--有異常--%>
									<%--新增矯治記錄開始--%>												
									<c:otherwise>
										<form name="form" method="post" action="add_deal.jsp">
											<table align="center">
												<tr>
													<td>
														<center>新增矯治記錄</center>
														<p>學號：
														<input type="text" name="textfield0" value="${param.id}" readonly>
														</p>
														<p>編號：
														<input type="text" name="textfield1">
														</p>
														<p>日期：
														<select name="select1"><c:forEach begin="2005" end="2020" var="year"><option>${year}</option></c:forEach></select>年
														<select name="select2"><c:forEach begin="1" end="12" var="month"><option>${month}</option></c:forEach></select>月
														<select name="select3"><c:forEach begin="1" end="31" var="day"><option>${day}</option></c:forEach></select>日
														</p>							
														<p align="center">矯治項目</p>
														<p></p>
													</td>
												</tr>
											</table>
			
											<table align="center">
												<tr>
													<th>編號</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th>健檢</th><th>未矯治狀況</th><th>矯治狀況</th><th>完成</th>
												</tr>
												<c:set value="0" var="num"/>
												<c:forEach items="${exam.rowsByIndex}" var="exam_put">
													<c:set value="${num+1}" var="num"/>
													<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />												
													<c:forEach items="${item.rowsByIndex}" var="item_put">	
														<tr align="center">												
															<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td><td>${exam_put[2]}</td>												
															<td><input type="text" name="before${num}" size="13"></td><td><input type="text" name="after${num}" size="13"></td><td><select name="finish${num}"><option value="0">否</option><option value="1">是</option></select></td>
															<c:set value="${item_put[0]}" var="item_id"/><input type="hidden" name="item_id${num}" value="${item_id}">
														</tr>
													</c:forEach>
												</c:forEach>
												<input type="hidden" name="num" value="${num}">
											</table>  
										  <p>
											<center>
												<input type="submit" name="Submit" value="送出">
											</center>
										  </p>
										</form>					
									</c:otherwise>
									<%--新增矯治記錄結束--%>
									
								</c:choose>									
								<%--判斷是否有異常結束--%>
							</c:otherwise>
							<%--有健檢資料結束--%>						
						</c:choose>
						<%--是否有健檢資料結束--%>
					</c:otherwise>
					<%--新增結束--%>						
				</c:choose>
				<%--矯治記錄是否存在--%>
			</c:otherwise>
			<%--學號不是空白--%>			
		</c:choose>
		<%--選擇結束--%>
	</c:if>
	<%--主程式結束--%>
</div>
<%--置中結束--%>
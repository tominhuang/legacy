<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--輸入學號--%>
<c:if test="${param.id==null}">
	<center>
	<p>修改矯治記錄</p>
	<form name="form" method="post" action="edit.jsp">
		學號：<input name="id" type="text"><input type="submit" name="Submit" value="修改"> 
	</form>
	</center>
</c:if>
<%--主程式開始--%>
<c:if test="${param.id!=null}">
	<%--選擇開始--%>	
	<c:choose>
	
		<%--學號空白--%>
		<c:when test="${param.id==''}">
			學號不能空白
		</c:when>
		
		<%--修改開始--%>
		<c:otherwise>
			<%--連接資料庫--%>
			<%@ include file="../include/mysql.jsp" %>
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
						<%--修改矯治記錄開始--%>												
						<c:otherwise>				
							<form name="form" method="post" action="edit_deal.jsp">
								<table align="center">
									<tr>
										<td>
											<center>修改矯治記錄</center>
											<p>學號：
											<input type="text" name="textfield0" value="${param.id}" readonly>
											</p>
											<sql:query sql="SELECT * FROM TR WHERE STU_ID = ${param.id}" var="TR" />												
											<c:forEach items="${TR.rowsByIndex}" var="TR_put">
												<c:set value="${TR_put[0]}" var="TR_ID"/>
												<p>編號：
												<input type="text" name="textfield1" value="${TR_put[0]}" readonly>
												</p>
												<p>日期：
												<input type="text" name="textfield2" value="${TR_put[2]}">
												</p>																			
											</c:forEach>																
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
												<sql:query sql="SELECT * FROM TREAT WHERE TR_ID = ${TR_ID} AND ITEM_ID = ${item_put[0]}" var="TREAT" />
												<c:choose>							
													<c:when test="${TREAT.rowCount=='0'}">
														<td><input type="text" name="before${num}" size="13"></td>
														<td><input type="text" name="after${num}" size="13"></td>
														<td><select name="finish${num}"><option value="0">否</option><option value="1">是</option></select></td>														
													</c:when>								
													<c:otherwise>
														<c:forEach items="${TREAT.rowsByIndex}" var="TREAT_put">												
															<td><input type="text" name="before${num}" size="13" value="${TREAT_put[2]}"></td>
															<td><input type="text" name="after${num}" size="13" value="${TREAT_put[3]}"></td>
															<td>
																<c:set value="" var="selected"/>
																<c:if test="${TREAT_put[4]=='true'}">
																	<c:set value=" selected" var="selected"/>
																</c:if>
																<select name="finish${num}">
																	<option value="0">否</option>
																	<option value="1"${selected}>是</option>
																</select>
															</td>
														</c:forEach>
													</c:otherwise>
												</c:choose>													
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
						<%--修改矯治記錄開始結束--%>
						
					</c:choose>									
					<%--判斷是否有異常結束--%>
				</c:otherwise>
				<%--有健檢資料結束--%>
			</c:choose>
			<%--是否有健檢資料結束--%>			
		</c:otherwise>
		<%--修改結束--%>				
	</c:choose>
	<%--選擇結束--%>
</c:if>
<%--主程式結束--%>
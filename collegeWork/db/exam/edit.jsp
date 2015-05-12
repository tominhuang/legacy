<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.id==null}">
	<p>修改健檢資料</p>
	<form name="form" method="post" action="edit.jsp">
		學號：<input name="id" type="text"><input type="submit" name="Submit" value="修改"> 
	</form>
</c:if>
<c:if test="${param.id!=null}">
	<c:choose>
		<%--學號空白--%>
		<c:when test="${param.id==''}">
			學號不能空白
		</c:when>
		<c:otherwise>
			<%@ include file="../include/mysql.jsp" %>			
			<sql:query sql="SELECT * FROM HER where stu_id = '${param.id}'" var="HER" />
			<c:choose>
			
				<c:when test="${HER.rowCount=='0'}">
				沒有學號 ${param.id} 的健檢資料
				</c:when>
				
				<c:otherwise>
				修改健檢資料
				<form name="form" method="post" action="edit_deal.jsp">
				<c:forEach items="${HER.rowsByIndex}" var="HER_put" >
				  <p>學號：
					<input type="text" name="textfield0" value="${HER_put[1]}" readonly="">
				  </p>
				  <p>  健檢記錄編號：
					<input type="text" name="textfield" value="${HER_put[0]}">
				  </p>
				  <p>  檢查日期： 
					<input type="text" name="textfield1" value="${HER_put[2]}">
				  </p>
					<sql:query sql="SELECT * FROM item order by item_id asc" var="item" />
					<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_put[0]}" var="exam" />	
				</c:forEach>  
				  <p>檢驗項目</p>
					<table>
						<tr>
							<th>編號</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th>檢查結果</th><th>是否異常</th>
						</tr>
						<c:forEach items="${item.rowsByIndex}" var="item_put">	
						<tr>
							<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td align="center">${item_put[3]}</td><td>${item_put[4]}</td>
							<td>
								<%--預設為空值--%>
								<c:set var="text" value=""/>
								<c:set var="select" value=""/>
								
								<c:forEach items="${exam.rowsByIndex}" var="exam_put">
									<%--如果該項目有檢查過--%>
									<c:if test="${item_put[0]==exam_put[1]}">									
										<%--將檢查結果放入text--%>
										<c:set var="text" value="${exam_put[2]}"/>
										
										<%--如果檢查結果為異常--%>
										<c:if test="${exam_put[3]=='true'}">
											<%--設定select為已選取--%>
											<c:set var="select" value=" selected"/>
										</c:if>
										
									</c:if>						
								</c:forEach> 
								<input type="text" name="text${item_put[0]}" value="${text}" size="13">
							</td>			
							<td>				
								<select name="select${item_put[0]}">
								  <option value="0">正常</option>
								  <option value="1"${select}>異常</option>
								</select>
							</td>
						</tr>
						</c:forEach>  
					</table>  
				  <p>
				  	<center>
					<input type="submit" name="Submit" value="送出"> 
					</center>
				  </p>
				</form>
				</c:otherwise>
			</c:choose>
		</c:otherwise>				
	</c:choose>
</c:if>
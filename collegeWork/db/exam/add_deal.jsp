<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--查詢學號是否在學生資料裡--%>
<sql:query sql="SELECT * FROM student where Stu_ID = ${param.textfield0}" var="student" />

<%--學號是否存在--%>
<c:choose>
	
	<%--學號不存在--%>
	<c:when test="${student.rowCount=='0'}">
		<center>
			<p>該名學生不存在</p>
			<p><a href="../student/add.jsp">新增學生資料</a></p>
		</center>
	</c:when>
			
	<%--一般情形開始--%>
	<c:otherwise>
		<%------------------------------------------------------------新增健檢記錄開始------------------------------------------------------------%>
		<c:if test="${param.sort==null}">
			<sql:update>
			  INSERT INTO HER
			  VALUES ( ? , ? , ? )  
			  <sql:param value="${param.textfield}" />
			  <sql:param value="${param.textfield0}" />  
			  <sql:param value="${param.select1}+${param.select2}+${param.select3}" />
			</sql:update>
	
			<%--讀取add.jsp傳過來的檢查結果--%>
			<c:forEach begin="1" end="42" var="item" varStatus="s">
				<% 
					int i = ((Integer) pageContext.getAttribute("item")).intValue();
					pageContext.setAttribute("textStr", "text"+i);				
				%>
				<%--該項目有檢查--%>
				<c:if test="${param[textStr]!=null}">
					<c:if test="${param[textStr]!=''}">
						
						<%--判斷檢查結果是否異常開始--%>
						
						<%--初始值為正常--%>
						<c:set value="0" var="abnormal"/>
						
						<c:choose>						
							<%--一般檢查--%>
								<%--收縮壓--%>
								<c:when test="${item=='3'}">
									<c:if test="${param[textStr]>160}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--舒張壓--%>
								<c:when test="${item=='4'}">
									<c:if test="${param[textStr]>90}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
	
								<%--祼視左眼視力--%>
								<c:when test="${item=='5'}">
									<%--未矯正--%>
									<c:if test="${param.text7==''}">
										<c:if test="${param[textStr]<0.6}">
											<c:set value="1" var="abnormal"/>
										</c:if>
									</c:if>
								</c:when> 	
	
								<%--祼視右眼視力--%>
								<c:when test="${item=='6'}">
									<%--未矯正--%>
									<c:if test="${param.text8==''}">
										<c:if test="${param[textStr]<0.6}">
											<c:set value="1" var="abnormal"/>
										</c:if>
									</c:if>
								</c:when> 								
		
								<%--矯正左眼視力--%>
								<c:when test="${item=='7'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 	
	
								<%--矯正右眼視力--%>
								<c:when test="${item=='8'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 	
								
								<%--辨色力--%>
								<c:when test="${item=='11'}">
									<c:if test="${param[textStr]=='有異樣'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
								
								<%--聽力--%>
								<c:when test="${item=='12'}">
									<c:if test="${param[textStr]=='有異樣'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
								
							<%--尿液檢查--%>
								<%--酸鹼值--%>
								<c:when test="${item=='18'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>8}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
		
								<%--尿膽素原--%>
								<c:when test="${item=='19'}">
									<c:if test="${param[textStr]=='不正常'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--膽紅素--%>
								<c:when test="${item=='20'}">
									<c:if test="${param[textStr]=='陽性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 						
				
								<%--潛血--%>
								<c:when test="${item=='21'}">
									<c:if test="${param[textStr]=='陽性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
								
								<%--亞硝酸鹽--%>
								<c:when test="${item=='22'}">
									<c:if test="${param[textStr]=='陽性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>						
		
								<%--白血球酯脢--%>
								<c:when test="${item=='23'}">
									<c:if test="${param[textStr]=='陽性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
								
							<%--血液檢查--%>
								<%--紅血球--%>
								<c:when test="${item=='24'}">
									<c:if test="${param[textStr]<380}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>600}">
										<c:set value="1" var="abnormal"/>
									</c:if>							
								</c:when>
								
								<%--血紅素--%>
								<c:when test="${item=='25'}">
									<c:if test="${param[textStr]<12}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>18}">
										<c:set value="1" var="abnormal"/>
									</c:if>								
								</c:when>
		
								<%--血球容積比--%>
								<c:when test="${item=='26'}">
									<c:if test="${param[textStr]<34}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>50}">
										<c:set value="1" var="abnormal"/>
									</c:if>							
								</c:when>						
		
								<%--平均血球體積--%>
								<c:when test="${item=='27'}">
									<c:if test="${param[textStr]<80}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>102}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--平均血球血紅素--%>
								<c:when test="${item=='28'}">
									<c:if test="${param[textStr]<27}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>34}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
								<%--平均血球血紅素濃度--%>
								<c:when test="${item=='29'}">
									<c:if test="${param[textStr]<32}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>36}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--白血球--%>
								<c:when test="${item=='30'}">
									<c:if test="${param[textStr]<4000}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>10000}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--血球血紅素濃度--%>
								<c:when test="${item=='31'}">
									<c:if test="${param[textStr]<15}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>45}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--肝功能檢查--%>
								<%--血清麩酸草酸轉胺脢--%>
								<c:when test="${item=='32'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>40}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--血清麩酸丙酮酸轉胺脢--%>
								<c:when test="${item=='33'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>40}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--B型肝炎檢查--%>
								<%--B型肝炎表面抗原--%>
								<c:when test="${item=='34'}">
									<c:if test="${param[textStr]=='陽性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--B型肝炎表面抗體--%>
								<c:when test="${item=='35'}">
									<c:if test="${param[textStr]=='陰性反應'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>						
							
							<%--腎功能檢查--%>
								<%--血尿素氮--%>
								<c:when test="${item=='36'}">
									<c:if test="${param[textStr]<8}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>23}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--肌酸酐--%>
								<c:when test="${item=='37'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>1.4}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--尿酸--%>
								<c:when test="${item=='38'}">
									<c:if test="${param[textStr]<2}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>8}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--血脂肪檢查--%>
								<%--總膽固醇--%>
								<c:when test="${item=='39'}">
									<c:if test="${param[textStr]<130}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>200}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>	
		
							<%--理學檢查--%>
								<%--胸部X光檢查--%>
								<c:when test="${item=='40'}">
									<c:if test="${param[textStr]=='有異樣'}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>	
		
							<%--其他檢查--%>
								<%--脈搏--%>
								<c:when test="${item=='41'}">
									<c:if test="${param[textStr]<60}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>90}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--總膽色素--%>
								<c:when test="${item=='41'}">
									<c:if test="${param[textStr]<0.5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>1.2}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>																
						</c:choose>
						<%--判斷檢查結果是否異常結束--%>
									
						<%--新增檢查結果至資料庫開始--%>
						<sql:update>
							INSERT INTO EXAM
							VALUES ( ? , ? , ? , ? )
							<%--健檢編號是否輸入--%>
							<c:choose>
								<%--有輪入--%>
								<c:when test="${param.textfield!=''}">
									<sql:param value="${param.textfield}" />
								</c:when> 
								<%--沒有輸入--%>
								<c:otherwise>
									<sql:query sql="SELECT MAX(HER_ID) FROM HER" var="MAX" />
										<c:forEach items="${MAX.rowsByIndex}" var="MAX_put">
											<sql:param value="${MAX_put[0]}" />
										</c:forEach>
								</c:otherwise>
							</c:choose>                   
							<sql:param value="${item}" />
							<sql:param value="${param[textStr]}"/>
							<sql:param value="${abnormal}"/>          
						</sql:update>
						
						<%--新增檢查結果至資料庫結束--%>
					</c:if>
				</c:if>
			</c:forEach>
			<%--讀取add.jsp傳過來的檢查結果結束--%>	
		</c:if>
		<%------------------------------------------------------------新增健檢記錄結束------------------------------------------------------------%>

		<%--查詢開始--%>
		
		<%--讀取健檢編號開始--%>
		
			<sql:query sql="SELECT * FROM HER where Stu_ID = ${param.textfield0}" var="HER" />					
			
			新增成功<br><br>
			健檢資料報告單
			<hr>
			<c:forEach items="${HER.rowsByIndex}" var="HER_put">
				<c:set value="${HER_put[0]}" var="HER_ID"/>
				健檢記錄編號：${HER_put[0]}<br>
				學號：${HER_put[1]}<br>	
				檢查日期：${HER_put[2]}	
			</c:forEach>
			
		<%--讀取健檢編號結束--%>
		
		<%--讀取檢查結果開始--%>
		
			<%--排序與否--%>
			<c:choose>
				<%--排序--%>
				<c:when test="${param.sort!=null}">
					<c:set value="${param.sort}" var="sort"/>			
				</c:when>
				
				<%--不排序--%>
				<c:otherwise>
					<c:set value="1" var="sort"/>
				</c:otherwise>
			</c:choose>							
	
			<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_ID} order by ${sort} asc" var="exam" />				
			
		<%--讀取檢查結果結束--%>
		
		<%--如果檢查結果存在開始--%>
		<c:if test="${exam.rowCount!='0'}">
		
			<%--列出檢查結果開始--%>
			<table>
			
				<%--標題--%>
				<tr>
					<th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=2">編號</a></th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=3">檢查結果</a></th><th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=4">是否異常</a></th>
				</tr>
				
				<%--內容開始--%>				
				<c:forEach items="${exam.rowsByIndex}" var="exam_put">
					<%--查詢項目--%>
					<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />
					<tr align="center">
						<%--列出檢查項目--%>
						<c:forEach items="${item.rowsByIndex}" var="item_put">
							<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td>
						</c:forEach>
						
						<%--健檢結果--%>		
						<td>${exam_put[2]}</td>
												
						<%--是否異常--%>
						<td>							
							<c:choose>
								<c:when test="${exam_put[3]=='1'}">正常</c:when>
								<c:otherwise><font color="red">異常</font></c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				<%--內容結束--%>  
			</table>
			<%--列出檢查結果結束--%>
		</c:if>
		<%--如果檢查結果存在結束--%>
		
		<%--查詢結束--%>
	</c:otherwise>
	<%--一般情形結束--%>
</c:choose>
<%--學號是否存在--%>
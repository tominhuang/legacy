<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.id==null}">
	<p>修改基本資料</p>
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
			<script language="javascript">
			function checkdata() {
				id = document.form.textfield0.value;
				if(id==""){
					alert("學號一定要填！");
					return false;
				}			
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM student where stu_id = '${param.id}'" var="student" />	
			<c:choose>
				<c:when test="${student.rowCount=='0'}">
					沒有學號 ${param.id} 的基本資料
				</c:when>
				
				<c:otherwise>
					修改基本資料
				
					<c:forEach items="${student.rowsByIndex}" var="student_put" >
						<form name="form" method="post" action="edit_deal.jsp">
						  <p>學號：<input type="text" name="textfield0" value="${student_put[0]}" readonly=""></p>
						  <p>系級：
							  
							<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
							<select name="select0">
								<c:forEach items="${result.rowsByIndex}" var="row" >
									<c:choose>
										<c:when test="${row[0]==student_put[1]}">
											<option value="${row[0]}" selected>					
										</c:when>
										
										<c:otherwise>			
											<option value="${row[0]}">
										</c:otherwise>				
									</c:choose>
										${row[0]}.${row[4]} ${row[1]} ${row[2]}年級 ${row[3]}
									</option>
								</c:forEach>
							</select>	  
						</p>
						  <p>  姓名：
							<input type="text" name="textfield1" value="${student_put[2]}">
						  </p>
						  <p>  性別：
							<c:choose>
								<c:when test="${student_put[3]=='男'}">
									<input name="sex" type="radio" value="男" checked>男
									<input name="sex" type="radio" value="女">女  
								</c:when>
										
								<c:otherwise>
									<input name="sex" type="radio" value="男">男			
									<input name="sex" type="radio" value="女" checked>女 
								</c:otherwise>				
							</c:choose>	   
						  </p>
						  <p>  身分證字號： 
							<input type="text" name="textfield2"  value="${student_put[5]}"> 
						  </p>
						  <p>  出生日期： 
							<input type="text" name="date"  value="${student_put[4]}">
						  </p>
						  <p>  地址： 
							<input type="text" name="textfield3" value="${student_put[6]}"> 
						  </p>
						  <p>  電話： 
							<input type="text" name="textfield4" value="${student_put[7]}"> 
						  </p>
						  <p>  手機： 
							<input type="text" name="textfield5" value="${student_put[8]}"> 
						  </p>
						  <p>  e-mail ： 
							<input type="text" name="textfield6" value="${student_put[9]}">
						  </p>
						  <p>  是否為轉學生： 
							<c:choose>
								<c:when test="${student_put[10]=='0'}">
									<input name="trans" type="radio" value="1">是			
									<input name="trans" type="radio" value="0" checked>否 			
								</c:when>
										
								<c:otherwise>
									<input name="trans" type="radio" value="1" checked>是
									<input name="trans" type="radio" value="0">否  
								</c:otherwise>				
							</c:choose>	  	  
						  </p>
						  <p>    就學狀態： 
							<input type="text" name="studying" value="${student_put[11]}">
						  </p>
						  <p>  緊急聯絡人姓名：
							<input type="text" name="textfield9" value="${student_put[12]}">
						  </p>
						  <p>  與聯絡人關係：
							<input type="text" name="textfield10" value="${student_put[13]}">
						  </p>
						  <p>  聯絡人電話：
							<input type="text" name="textfield11" value="${student_put[14]}">
						  </p>
						  <p>  聯絡人手機：
							<input type="text" name="textfield12" value="${student_put[15]}">
						  </p>
						  <p>
							<input type="submit" name="Submit" value="送出" onClick="return checkdata()"> 
						  </p>
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</c:otherwise>				
	</c:choose>
</c:if>
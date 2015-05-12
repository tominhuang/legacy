<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
   	if(id==""){
   		alert("學號一定要填！");
		return false;
	}			
	else{
		return true;
	}			
}
</script>
新增健檢資料
<form name="form" method="post" action="add_deal.jsp">
  <p>學號：
    <input type="text" name="textfield0">
(必填)</p>
  <p>  健檢記錄編號：
    <input type="text" name="textfield">
  </p>
  <p>  檢查日期： 
    <select name="select1">
      <c:forEach begin="2005" end="2020" var="year">
      <option>${year}</option>
      </c:forEach>
    </select> 
    年
    <select name="select2">
      <c:forEach begin="1" end="12" var="month">
      <option>${month}</option>
      </c:forEach>	  
    </select>
	月
	<select name="select3">
      <c:forEach begin="1" end="31" var="day">
      <option>${day}</option>
      </c:forEach>  
    </select>
	日
</p>
  <p>檢驗項目</p>
<sql:query sql="SELECT * FROM item order by item_id asc" var="item" />
<table>
	<tr>
		<th>編號</th><th>項目類型</th><th>項目中文名</th><th>項目英文名</th><th>參考值</th><th>單位</th><th>檢查結果</th>
	</tr>
	<c:forEach items="${item.rowsByIndex}" var="item_put" >	
		<tr>
			<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td>		
			<td align="center">${item_put[3]}</td><td>${item_put[4]}</td>		
			<td>
				<c:choose>
					<c:when test="${item_put[3]=='無異樣'}">
							<select name="text${item_put[0]}">
								<option value="">沒有檢查</option>
								<option value="無異樣">&nbsp;無異樣&nbsp;</option>
								<option value="有異樣">&nbsp;有異樣&nbsp;</option>
							</select>
					</c:when>
	
					<c:when test="${item_put[3]=='正常'}">
							<select name="text${item_put[0]}">
								<option value="">沒有檢查</option>
								<option value="正常">　正常　</option>
								<option value="不正常">&nbsp;不正常&nbsp;</option>
							</select>
					</c:when>				
					
					<c:when test="${item_put[3]=='陰性反應'}">
							<select name="text${item_put[0]}">
								<option value="">沒有檢查</option>
								<option value="陰性反應">陰性反應</option>
								<option value="陽性反應">陽性反應</option>
							</select>
					</c:when>
					
					<c:when test="${item_put[3]=='陽性反應'}">
							<select name="text${item_put[0]}">
							<option value="">沒有檢查</option>
							  <option value="陰性反應">陽性反應</option>
							  <option value="陽性反應">陰性反應</option>
							</select>
					</c:when>				
					
					<c:otherwise>					
						<input type="text" name="text${item_put[0]}" size="10">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>  
</table>
<center>  
  <p>
    <input type="submit" name="Submit" value="送出" onClick="return checkdata()"> 
  </p>
</center>
</form>

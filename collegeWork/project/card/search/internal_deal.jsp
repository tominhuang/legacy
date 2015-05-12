<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>




<style type="text/css">
<!--
.style3 {color: #00FF00}
.style4 {color: #0000FF}
-->
</style>

<c:choose>
	<c:when test="${param.abs=='1'}">
		<sql:query var="id">
		  SELECT * FROM user WHERE id = ${param.id}		  
		</sql:query>
		<sql:query var="identify">
			SELECT * FROM identify where id = ${param.id} and kind ='default' and public = '1'
		</sql:query>
		
		<sql:query var="kind">
			select distinct(kind) from identify where id = ${param.id} and kind !='default'
		</sql:query>				
	</c:when>
	<c:otherwise>
		<sql:query var="id">
		  SELECT * FROM user WHERE id = '${param.id}' OR sex = '${param.id}' OR lastName like 		'${param.id}' OR firstName like '${param.id}' OR nickName like '${param.id}' OR email like '${param.id}' OR ADDRESS LIKE '${param.id}' OR phone like '${param.id}'
		</sql:query>
		
		<sql:query var="identify">
			SELECT * FROM identify where id = 1 and kind ='default' and public = '1'
		</sql:query>
		
		<sql:query var="kind">
			select distinct(kind) from identify where id = 1 and kind !='default'
		</sql:query>		
	</c:otherwise>
</c:choose>	

<sql:query var="design">
  SELECT * FROM design WHERE id = 1
</sql:query>

<c:choose>
	<c:when test="${design.rowCount=='0'}">
		<c:set value="../images/bluelove.gif" var="background" />
	</c:when>
	<c:otherwise>
		<c:forEach items="${design.rowsByIndex}" var="design_put">
			<c:set value="../images/${design_put[1]}" var="page" />
			<c:set value="../images/${design_put[2]}" var="background" />
		</c:forEach>
	</c:otherwise>
</c:choose>	
<body background="${page}">



<div align="center">
<c:choose>
	<c:when test="${id.rowCount=='0'}">
		No match result
	</c:when>
	<c:otherwise>
			<c:forEach items="${id.rowsByIndex}" var="row">	
			  <table width="434" border="0" cellspacing="0">
				<tr>
					<td background="${background}"><span class="style3"></span></td>
					<td background="${background}"><img src="../images/p1.jpg" width="154" height="115" /></td>
				</tr>
		
				
				
				
				<tr>
				  <td width="129" background="${background}"><div align="right">ID:</div></td>
				  <td width="295" background="${background}"><span class="style4">
					  00000000${row[0]}
				  </span></td>
				</tr>				
				<tr>
				  <td background="${background}"><div align="right">First Name:
				  </div></td>
				  <td background="${background}"><span class="style4">          ${row[2]} </span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Last Name:</div></td>
				  <td background="${background}"><span class="style4">          ${row[3]} </span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Nick Name:</div></td>
				  <td background="${background}"><span class="style4">          ${row[4]}</span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Birthdate:</div></td>
				  <td background="${background}"><span class="style4">${row[7]}/${row[5]}/${row[6]}</span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Sex: </div></td>
				  <td background="${background}">
					<span class="style4">
					<c:if test="${row[8]=='1'}">
					  Male            </c:if>
					<c:if test="${row[8]=='0'}">
					  Female            </c:if>
				  </span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Primary Email: </div></td>
				  <td background="${background}"><span class="style4">          ${row[9]}</span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Address:
					</div>
				  <div align="right"></div></td>
				  <td background="${background}"><span class="style4">          ${row[10]}</span></td>
				</tr>
				<tr>
				  <td background="${background}"><div align="right">Phone:</div></td>
				  <td background="${background}"><span class="style4">          ${row[11]}</span></td>
				</tr>
		¡@¡@¡@</table>
			  <p>&nbsp;</p>
			  </c:forEach>
			  

		
		<div align="center">
		
			<table width="611" border="0" align="center">
			  <tr>
				<td width="157">Directory/Site</td>
				<td width="297">Personal Site/Article</td>
				<td width="143">ID</td>
			  </tr>
			  <c:forEach items="${kind.rowsByIndex}" var="kind_put">
				  <tr>
					<td><a href="ip_dir.jsp?kind=${kind_put[0]}"><img src="../images/folder.gif" / border="0">${kind_put[0]}</a></td>
					<td colspan="3">I'm just a directory.</td>
				  </tr>
			  </c:forEach>
			  <c:forEach items="${identify.rowsByIndex}" var="id_put">
				  <tr>
					<td><img src="../images/html.gif" /><a href="${id_put[2]}">${id_put[3]}</a></td>
					<td><a href="${id_put[4]}">${id_put[5]}</a>
					</td>
					<td><strong>${id_put[6]}</strong></td>
				  </tr>
			  </c:forEach>
			</table>
		
		
		</div>
		
			  
	  
	</c:otherwise>
</c:choose>	

</div>

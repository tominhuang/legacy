<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:query var="product">
  SELECT * FROM product where pid = ${param.pid}
</sql:query>

<sql:query var="product_talk">
  SELECT * FROM product_talk where pid = ${param.pid}
</sql:query>




<a href="../index.jsp">Jimmy's Bidding Website</a><br><br>
	  <c:forEach items="${product.rowsByIndex}" var="product_put">	 
		${product_put[1]}<br/><br/>
		One Buy:  ${product_put[3]}<br/>
		Difference:  ${product_put[4]}<br/>
		Owner:  ${product_put[5]}<br/>
		Now bidder:  ${product_put[6]}<br/>
		Now price:  ${product_put[7]}<br/>
		<pre>${product_put[2]}
		</pre>		
	  </c:forEach>



	  <c:forEach items="${product_talk.rowsByIndex}" var="product_talk_put">
	  
		<sql:query var="pti">
		  SELECT * FROM pti where cid = ${product_talk_put[0]}
		</sql:query>
		
		<c:if test="${pti.rowCount=='1'}">
		  	<c:forEach items="${pti.rowsByIndex}" var="pti_put">	 		
			<a href="http://npc.twbbs.org/000000001.htm">¡´</a>
	    	</c:forEach>			
		</c:if>	  	  
	  
	  
	  
		<a href="mailto:${product_talk_put[2]}@gmail.com">${product_talk_put[2]}</a>  ${product_talk_put[3]} says:<br/>
		<pre>${product_talk_put[4]}
		</pre>
		

		
	  </c:forEach>	  
	  
	<c:if test="${sessionScope.id==null}">
	   Note:<br>
       You are not logged in.	</c:if>	 

	  
	<c:if test="${sessionScope.id!=null}">
      <form name="form1" method="post" action="product_talk_deal.jsp">
        <p>
          <input type="submit" name="Submit2" value="I wanna Bid!">
          <input type="submit" name="Submit3" value="One Buy!">
          <input type="hidden" name="pid" value="${param.pid}">
</p>
        <p>
          <textarea name="textarea" cols="100" rows="6">Type Questions And Answers Here.</textarea>
        </p>
        <p>
          <input type="checkbox" name="checkbox" value="checkbox">
          Click Here To Do Internet Identification(<a href="""">Learn more</a>) </p>
        <p>
          <input type="submit" name="Submit" value="Submit">
        </p>
      </form>
	</c:if>	  
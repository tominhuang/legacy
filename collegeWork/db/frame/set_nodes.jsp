<script src="demoFramesetNodes.js"></script>

<c:if test="${sessionScope.rank==1}">
	<script src="nodes/student.js"></script>
</c:if>
<c:if test="${sessionScope.rank==2}">
	<script src="nodes/exam.js"></script>
	<script src="nodes/disease.js"></script>
	<script src="nodes/statistic.js"></script>
</c:if>	
<c:if test="${sessionScope.rank==3}">	
	<script src="nodes/treat.js"></script>
</c:if>	
<c:if test="${sessionScope.rank==4}">
	<script src="nodes/exam.js"></script>	
	<script src="nodes/disease.js"></script>
</c:if>	
<c:if test="${sessionScope.rank==5}">
	<script src="nodes/exam.js"></script>	
	<script src="nodes/statistic.js"></script>
</c:if>	
<c:if test="${sessionScope.rank==9}">
	<script src="nodes/student.js"></script>
	<script src="nodes/exam.js"></script>
	<script src="nodes/treat.js"></script>
	<script src="nodes/disease.js"></script>
	<script src="nodes/statistic.js"></script>
	<script src="nodes/system.js"></script>		
</c:if>

<script src="nodes/general.js"></script>

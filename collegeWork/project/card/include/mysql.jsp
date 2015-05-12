<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="Big5" />
<sql:setDataSource driver="com.mysql.jdbc.Driver"
		   url="jdbc:mysql://localhost:3306/card?useUnicode=true&characterEncoding=UTF-8"
		   user="pm"
		   password="mis_2007" />
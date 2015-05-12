<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="Big5" />
<sql:setDataSource driver="com.mysql.jdbc.Driver"
		   url="jdbc:mysql://140.119.19.149:3306/book?useUnicode=true&characterEncoding=UTF-8"
		   user="root"
		   password="root" />
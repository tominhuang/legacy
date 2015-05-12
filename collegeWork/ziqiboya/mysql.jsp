<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="com.mysql.jdbc.Driver"
		   url="jdbc:mysql://140.119.19.130:3306/ziqiboya?useUnicode=true&characterEncoding=utf-8"
		   user="ziqi"
		   password="boya2007" />
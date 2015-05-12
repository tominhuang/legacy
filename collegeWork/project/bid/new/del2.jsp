<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<sql:update>
  UPDATE `product` SET `true` = '0' WHERE `pid` = 13 
</sql:update>

<c:redirect url="http://npc.twbbs.org:8080/card/ip/ip.jsp"/>
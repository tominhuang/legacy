<%@ include file="../check/session/user.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<html>
<head>
<title>社會化電子書革命</title>
<script>
function op() { //This function is used with folders that do not open pages themselves. See online docs.
}
</script>
</head>

<!--
(Please keep all copyright notices.)
This frameset document includes the Treeview script.
Script found in: http://www.treeview.net
Author: Marcelino Alves Martins

You may make other changes, see online instructions, 
but do not change the names of the frames (treeframe and basefrm)
-->


<FRAMESET cols="20%,*" onResize="if (navigator.family == 'nn4') window.location.reload()" frameborder="no"> 
  <FRAME src="demoFramesetLeftFrame.jsp" name="treeframe" > 
  <FRAME SRC="demoFramesetRightFrame.jsp" name="basefrm"> 
</FRAMESET><noframes></noframes> 


</HTML>

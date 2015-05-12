<%@ include file="../include/head.jsp" %>
<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<base target="main">
                        <style type="text/css">
<!--
    body {
        margin:0;
        padding:0;
        font: bold 11px/1.5em Verdana;
}

h2 {
        font: bold 14px Verdana, Arial, Helvetica, sans-serif;
        color: #000;
        margin: 0px;
        padding: 0px 0px 0px 15px;
}


/*- Menu Tabs C--------------------------- */

    #tabsC {
      float:left;
      width:100%;
      background:#EDF7E7;
      font-size:93%;
      line-height:normal;
      }
    #tabsC ul {
        margin:0;
        padding:10px 10px 0 170px;
        list-style:none;
      }
    #tabsC li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsC a {
      float:left;
      background:url("tableftC.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsC a span {
      float:left;
      display:block;
      background:url("tabrightC.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#464E42;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsC a span {float:none;}
    /* End IE5-Mac hack */
    #tabsC a:hover span {
      color:#FFF;
      }
    #tabsC a:hover {
      background-position:0% -42px;
      }
    #tabsC a:hover span {
      background-position:100% -42px;
      }

        #tabsC #current a {
                background-position:0% -42px;
        }
        #tabsC #current a span {
                background-position:100% -42px;
        }
-->
</style>
                </head>

                <body>
<p align="center">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="1000" height="80">
    <param name="movie" value="../banner/banner_f.swf" />
    <param name="quality" value="high" />
    <embed src="../banner/banner_f.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1000" height="80"></embed>
  </object>
</p>
			
                        <div align="center"><fmt:formatNumber value="${sessionScope.id}" minIntegerDigits="9" groupingUsed="false"/>, Welcome!<br/></div>
                        <div id="tabsC">
                                <ul>
                                        <!-- CSS Tabs -->
<li><a href="welcome.html"><span>Home</span></a></li>
<li><a href="../data/data.jsp"><span>Peasonal Data</span></a></li>
<li><a href="../design/design.jsp"><span>Design</span></a></li>
<li><a href="../search/search.jsp"><span>Search</span></a></li>
<li><a href="../ip/ip.jsp"><span>Intellectual Property</span></a></li>
<li><a href="../privacy/privacy.jsp"><span>Privacy</span></a></li>
<li><a href="../docs/about.jsp"><span>About</span></a></li>
<li><a href="../docs/help.jsp"><span>Help</span></a></li>
<li><a href="../check/logout.jsp" target="_top"><span>Log out</span></a></li>

                                </ul>
                        </div>
                </body>
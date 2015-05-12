<%@ include file="mysql.jsp" %>
<%@ page contentType="text/html; charset=utf-8"  import="java.sql.*" pageEncoding="big5" %>
<script language="javascript" src="ajax.js"> </script>
<script type="text/javascript" src="playerUtil.js"></script>

<%-- 預設歌曲數量 --%>
<c:choose>
	<%-- 下限 --%>
	<c:when test="${param.page==null || ''}">
		<c:set var="page" value="0" />
	</c:when>
		
	<%-- 使用者自訂 --%>
	<c:otherwise>			
		<c:set var="page" value="${param.page}"/>
	</c:otherwise>		
</c:choose>

	<%-- 預設排序 --%>
	<c:if test="${param.sort==null}">
		<c:set var="sort" value="11" />
	</c:if>	

	<%-- 使用者自訂 --%>
	<c:if test="${param.sort!=null}">
		<c:set var="sort" value="${param.sort}" />
	</c:if>	

<%-- 熱門歌曲 --%>
<div class="feedBlock4" id="ziqiboya4">
<span class="user"><a href="http://140.119.19.130:8080/ziqiboya/" target="_blank" >Ziqi-Boya</a>累積熱門歌曲：</span>
<a href="?sort=${sort}&page=0">1~10</a> 
<a href="?sort=${sort}&page=1">11~20</a> 
<a href="?sort=${sort}&page=2">21~30</a>  
<a href="?sort=${sort}&page=3">31~40</a> 
<a href="?sort=${sort}&page=4">41~50</a> 
<a href="?sort=${sort}&page=5">51~60</a> 
<a href="?sort=${sort}&page=6">61~70</a> 
<a href="?sort=${sort}&page=7">71~80</a> 
<a href="?sort=${sort}&page=8">81~90</a> 
<a href="?sort=${sort}&page=9">91~100</a> 
<br/>
<p align="center">第${page*10+1}名~第${page*10+10}名</p>
<table border=0  width="100%">
<td><a href="?sort=1">封面</a></td><td><a href="?sort=3">歌手</a>/<a href="?sort=2">歌名</a></td>
<td align="right"><a href="?sort=11">綜合評比</a></td>
<td align="right"><a href="?sort=6">被播放次數</a></td>
<td align="right"><a href="?sort=7">多少人播過</a></td>
<td align="right"><a href="?sort=8">平均播放次數</a></td>
<td align="right"><a href="?sort=9">加入最愛</a></td>
<td align="right"><a href="?sort=10">平均加入最愛</a></td>
<td align="right">點播(施工中)</td>

	

<sql:query var="name">
SELECT s.song_id,title,artist,album,username,sum(sx) as msx,count(*) as mcx,sum(sx)/count(*),sum(cy),sum(cy)/count(*),sum(sx)/count(*)*sum(cy)
from (SELECT B.user_id,B.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy
FROM played_song B  left JOIN fav_song C ON(B.user_id=C.user_ID AND B.song_id=C.song_id)
group by B.user_id,B.song_id
union
SELECT C.user_id,C.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy
FROM fav_song C left JOIN played_song B ON(B.user_id=C.user_ID AND B.song_id=C.song_id)
group by C.user_id,C.song_id) AS n join song s on n.song_id=s.song_id join user u on u.user_id=s.user_id
 group by n.song_id having mcx<(select avg(cn) from (SELECT count(*) as cn FROM played_song p group by song_id) as g)
 order by ${sort} desc limit ${page*10},10
</sql:query>

	<c:forEach items="${name.rowsByIndex}" var="namelist" >
		<tr><td><a href="http://140.119.19.130:8080/ziqiboya/song/info.do?s=${namelist[0]}" target="_blank" ><img border="0" src="http://140.119.19.130:8080/ziqiboya/user/${namelist[4]}/cover/c${namelist[0]}_75.jpg" alt="${namelist[3]}" width="40px" height="40px" /></a></td><td><a href="http://140.119.19.130:8080/ziqiboya/song/info.do?s=${namelist[0]}" target="_blank" >${namelist[2]}<br/>${namelist[1]}</a>
		<td align="right"><fmt:formatNumber value="${namelist[10]}" minFractionDigits="2" maxFractionDigits="2" /></td>
		</td><td align="right">${namelist[5]} 次</td><td align="right">${namelist[6]} 人</td>
		<td align="right"><fmt:formatNumber value="${namelist[7]}" minFractionDigits="2" maxFractionDigits="2" /> 次/人</td>			
		<td align="right"><fmt:formatNumber value="${namelist[8]}" maxFractionDigits="0" /> 人</td>
		<td align="right"><fmt:formatNumber value="${namelist[9]*100}" minFractionDigits="2" maxFractionDigits="2" /> %</td>		
		<td align="right"><input type='button' value='play' style='border:outset 1px;' onClick='addPlayerWinAction("play","${namelist[0]}");'><input type='button' value='add' style='border:outset 1px;' onClick='addPlayerWinAction("add","${namelist[0]}");'></td>
		</tr>
	</c:forEach>	
</table>
<br/>
<div id="creditfooter" align="center"><a href="http://140.119.19.130:8080/ziqiboya/" target="_blank"><img src="http://tomin.twbbs.org:8080/logo.JPG" alt="Ziqi & Boya" style="border:0"/></a></div>
</div>
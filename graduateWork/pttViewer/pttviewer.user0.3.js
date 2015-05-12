var myMeta=<><![CDATA[
// ==UserScript==
// @name          PTTViewer
// @namespace     PTTViewer
// @description   更方便地瀏覽PTT BBS網頁板。More convenient to browse Web PTT BBS 
// @author        tomin
// @include       http://www.ptt.cc/*
// @updateURL     http://userscripts.org/scripts/source/105740.meta.js
// @version       0.3
// ==/UserScript==
]]></>.toString();

var $, myScriptId='105740';
var home = "http://userscripts.org/scripts/show/" + myScriptId;

// Add jQuery
(function(){
	if (typeof unsafeWindow.jQuery == 'undefined') {
		var GM_Head = document.getElementsByTagName('head')[0] || document.documentElement,
			GM_JQ = document.createElement('script');

		GM_JQ.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js';
		GM_JQ.type = 'text/javascript';
		GM_JQ.async = true;

		GM_Head.insertBefore(GM_JQ, GM_Head.firstChild);
	}
	GM_wait();
})();

// Check if jQuery's loaded
function GM_wait() {
	if (typeof unsafeWindow.jQuery == 'undefined') {
		window.setTimeout(GM_wait, 100);
	} else {
		$ = unsafeWindow.jQuery.noConflict(true);
		letsJQuery();
	}
}

// All your GM code must be inside this function
function letsJQuery() {	
	main();
}
function main(){
	if(!document.location.href.match(/http:\/\/www\.ptt\.cc\/.+/i))return;
	var pre = $("pre").html();
	pre = parserURL(pre);	
	$("pre").html(pre);
	customize();
	hotboard();

}
function hotboard(){
	$.ajax({
	  url: "http://www.ptt.cc/hotboard.html",
	  dataType: "html",
  
	  success: function(data){			
		$(data).find("dl tr td:nth-child(2)").each(function(index){			
			$("#nav>li:eq(3)").append($(this).html());
		});			
	  }
	});
}
function reset(){
	$("#tools").show();
	$("#mainContent").css({"position":"", "margin":"", "padding":""} );	
}
function go(e){ 
	location.href = "/bbs/" + $("#board").val() + "/index.html";
	e.preventDefault();
	return false;
}
function jumpArticle(list, start, move){
	var url = "";
	$.ajax({
	  url: list,
	  async: false,
	  beforeSend: function(xhr){
		xhr.overrideMimeType('text/html; charset=big5');
	  },		  
	  success: function(data){	
		url = $(data).find("dl tr td a[href='"+start+"']").parents("dd").next().next().find("td:eq(3) a").attr("href");
		if(move === "prev")
			url = $(data).find("dl tr td a[href='"+start+"']").parents("dd").prev().prev().find("td:eq(3) a").attr("href");
	  }	  
	});
	return url;	
}
function skipEmptyArticle(){
	var path = location.href.replace(/[\s\S]+cc/g,"");
	var nextPage = $("#finds p a:contains('下一篇')");
	var prevPage = $("#finds p a:contains('前一篇')");
	var nextURL = nextPage.prop("href");
	var prevURL = prevPage.prop("href");
	var list =  $("#finds p a:contains('文章列表')").attr("href");	
	if( nextURL === location.href ) nextPage.append("(已經是最後一篇)");
	if( prevURL === location.href ) prevPage.append("(已經是首篇)");
	if( nextURL && nextURL.match(/deleted/) ){		
		var url = jumpArticle(list, path, "next");		
		nextPage.prop("href",url);
	}
	if( prevURL && prevURL.match(/deleted/) ){
		var url = jumpArticle(list, path, "prev");
		prevPage.prop("href",url);
	}		
}
function customize(){	
	skipEmptyArticle();

	$("img").css("max-width","40em");
	$("#tools").hide();
	$("#finds h2").hide();
	$("#finds p a:first:contains('精華區')").hide();
	$("table:contains('人氣：') td:nth-child(4)").hide();//hotboard
	$("table tr:contains('被刪除')").hide();
	$("table tr:contains('劣退')").hide();
		
	$("td:contains('人氣')").css("width","130");
	$("#nav>li:eq(1)>ul li:first").hide();
	$("#nav>li:eq(1)>ul").append("<li><a href='/bbs/Songs/index.html'> Songs</a></li>");
	$("#nav").prepend("<ul><li>看板:<form name='go' id='go'><input style='width:5em' id='board' type='text' value='joke' /><input type='submit' value='Go' /></form></li></ul>");
	$("#go").bind("submit",function(e){	
		go(e);
	});		
	$("#nav>li:eq(2)").hide();
	
	$("#nav").append("<ul><li><input type='button' id='check' value='檢查是否有新版本' /></li></ul>");
	var check = document.getElementById('check');
	if(check) check.addEventListener('click',checkScriptUpdate,false);
	$("#nav").append("<ul><li><input type='button' id='visit' value='前往PTTViewer官網' /></li></ul>");
	$("#visit").bind("click",function(){
		location.href = home;
	});	
	$("#nav").append("<ul><li><input type='button' id='reset' value='顯示PTT上方工具列' /></li></ul>");
	$("#reset").bind("click", function(){
		reset();
	});		
	$("#mainContent").css({"position":"absolute", "margin":"0", "padding":"0" , "top":"-102px", "left":"225px", "width":"44em", "font-size": "1.4em"} );
}
function parserURL(_content){
	if(_content!=null && !_content.match(/href=/g)){//non html
		//video or sound
		_content = _content.replace(/(https?:\/\/[\w-\.]+(:\d+)?(\/[\w\.\/%\&\=;\-~:@\,()!]*)?(\?\S*)?(#\S*)?)/g,"<a href='$1' target='_blank'>$1</a>");
		_content = _content.replace(/<a href=[^>]+\/\/(\w+\.youtube\.[^\/]+)\/watch\?[^>]*v=([^>"&\']+)[^>]+>[^<]+<\/a>/g, '<object width="640" height="400"><param name="movie" value="http://$1/v/$2&hl=en&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="http://$1/v/$2&hl=en&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="640" height="390"></embed></object>');
		_content = _content.replace(/<a href=[^>]+\/\/(youtu\.be)\/([^>"&\']+)[^>]+>[^<]+<\/a>/g, '<iframe width="640" height="400" src="http://www.youtube.com/embed/$2" frameborder="0" allowfullscreen></iframe>');		
		_content = _content.replace(/<a href=[^>]+\/\/(\w+\.youtube\.[^\/]+)\/playlist\?p=PL([^>"&\']+)[^>]+>[^<]+<\/a>/g, '<object width="640" height="400"><param name="movie" value="http://$1/p/$2&hl=en&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="http://$1/p/$2&hl=en&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="640" height="390"></embed></object>');
		_content = _content.replace(/<a href=[^>]+\/\/(vimeo\.com)\/([^>"&\']+)[^>]+>[^<]+<\/a>/g, '<iframe src="http://player.vimeo.com/video/$2?title=0&amp;byline=0&amp;portrait=0" width="640" height="400" frameborder="0"></iframe>');		
		_content = _content.replace(/<a href=[^>]+\/\/(mymedia\.yam\.[^\/]+)\/\w{1}\/([^>"&\']+)[^>]+>[^<]+<\/a>/g, '$&<br/><object width="450" height="120"><param name="movie" value="http://mymedia.yam.com/*/$2"></param><param name="quality" value="high"></param><param name="wmode" value="transparent"></param><embed src="http://mymedia.yam.com/*/$2" quality="high" type="application/x-shockwave-flash" wmode="transparent" width="450" height="120"></embed></object>');
		_content = _content.replace(/<a href=[^>]+\/\/(\w+\.xiami\.[^\/]+)\/\w+\/([^>"&\']+)[^>]+>[^<]+<\/a>/g, '$&<br/><embed src="http://www.xiami.com/widget/0_$2/singlePlayer.swf" type="application/x-shockwave-flash" width="257" height="33" wmode="transparent"></embed>');				
		//photo
		_content = _content.replace(/<a href=[^>]+\/\/(ppt\.cc\/[^>"&\']+)[^>]+>[^<]+<\/a>/g, '<span style=color:#ccc><a href="http://$1" target=_blank>http://$1</a></span><br/><img src="http://$1@.jpg" />');
		_content = _content.replace(/<a href=[^>]+\/\/(imgur\.com\/[^>"&\']+)[^>]+>[^<]+<\/a>/g, '<span style=color:#ccc>http://$1</span><br/><img src="http://i.$1.jpg" />');
		_content = _content.replace(/<a href=[^>]+\/\/(?!imageshack)([^>"&\']+)\.(jpg|png|jpeg|gif){1}[^>]+>[^<]+<\/a>/g, '<span style=color:#ccc>http://$1.$2 </span><br/><img src="http://$1.$2" />');
	}
	return _content;
}
function checkScriptUpdate(){
	var ver=myMeta.match(/\/\/ @version\s+([\d.]+)/)[1];
					
	GM_xmlhttpRequest({
		method:'GET',
		url:'http://userscripts.org/scripts/source/'+myScriptId+'.meta.js',
		onload:function(response){
			if(response.status==200){
				var gver=response.responseText.match(/\/\/ @version\s+([\d.]+)\s/)[1];
				if(ver==gver){
					alert('目前已是最新版本。');
				}
				else if(ver>gver)
					alert('驚! 你的版本比 userscripts.org 的還新!');
				else
				if(confirm('有新版本: v'+gver+'\n您目前為: v'+ver+'\n\n要前往瀏覽新版本嗎? (以分頁開啟)'))
				GM_openInTab('http://userscripts.org/scripts/show/'+myScriptId);
			}
			else
			alert('無法確認更新，請稍後再試。');
		}
	});
}
function testKeyCode(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    var e = e || window.event;
	var path = location.href.replace(/[\s\S]+cc/g,"");


    if(keycode==37){//Left-Arrow ←	
		var link = $("#finds p a:contains('前一篇')").attr("href");
	    if(path !== link)
			location.href = link;
		else
			alert("已經是首篇了");
    }	
    if(keycode==39){//Right-Arrow →
		var link = $("#finds p a:contains('下一篇')").attr("href");
	    if(path !== link)
			location.href = link;
		else
			alert("已經是最後一篇了");
    }	
}
window.addEventListener('keydown', testKeyCode, true);
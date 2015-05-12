var t, keyword, focus;
var page=1;
var per_page=6;
var enableSuggest = false;

function validKeycode(e){
	var keycode;	
	if (!e) e = window.event;
	if (e.keyCode) keycode = e.keyCode;
	else if (e.which) keycode = e.which;
	return (keycode != 8 && keycode < 48 ? false : true);
}
$('#search').keydown(function(e) {
	var input = $('#search').attr('value');		
	if (enableSuggest) $("#suggestions").css("visibility", "visible");

	if(input===keyword){
		$("#suggestions").css("visibility","hidden");
		return;
	}
	var isVilid = validKeycode(e);
	if(!isVilid)return;	
	
	$('#results').html('Loading..');
	$('#search').keyup(function() {		
		clearTimeout(t);
		if (enableSuggest) t = setTimeout('searchInit()',500);
		else t = setTimeout('searchFlickr()',500);		
	});
});
//unavailable so far 
function searchInit(){
	var input = $('#search').val();	
    var suggesturl = 'http://suggestqueries.google.com/complete/search?hl=en&hjson=t&jsonp=window.handleResponse&q='+encodeURIComponent(input)+'&cp=1';

	if(input.length===0){
		keyword=null;
		$('#results').html('');
		$("#suggestions").css("visibility","hidden");
		return;
	}		
    $.ajax({
       type: "GET",
       url: suggesturl,
       dataType: "script"
    });
}
function searchFlickr(){
	var input = $('#search').val();

	if(keyword){
		//input=keyword;
		//$('#search').val(keyword);
		$('#suggest1').html(keyword);		
	}
	
	var url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=d05ec7a8111f1f0082d8ed3ae5305fae&safe_search=1&text="+input+"&tags="+input+"&sort=date-posted-desc&per_page="+per_page+"&page="+page+"&content_type=1&format=json&jsoncallback=?";
	var src, href, title, alt, captions;
		
	$.getJSON(url,function(data){ 
		$('#results').empty();
		if(typeof data.photos === undefined) {
			return;
		}
		if(data.photos.total == 0){
			$('#results').html("No results!<br><br> Try searching for something more specific or check for spelling errors.");
		}
		else{
			if(data.photos.total > per_page)$("#pages").show();
			else $("#pages").hide();
			$.each(data.photos.photo, function(i,item){
				href = "http://flickr.com/photos/"+item.owner+"/"+item.id;
				src = "http://farm"+ item.farm +".static.flickr.com/"+ item.server +"/"+ item.id +"_"+ item.secret +"_m.jpg";
				title = item.title;
				caption = title;
				
				if(caption.length>=25)caption = title.substr(0,25) + " ..";
				if(caption.length>0){				
					captions = "<div class='caption'>"+caption+"</div>";
				}else{
					captions = "";
				}
				
				alt = item.title;
				var floatp = (( (i+1)%3)==1)?"float_right":"float_left";
				$("#results").append("<div class=\"picContainer " +floatp+ "\"><a href=\""+href+"\" ><div class=\"img\"><img alt=\""+title+"\" src=\""+src+"\" />" + captions + "</div></a></div>");        
			});
    	}
	});		
}
$(function(){
	$('#search').focus();$('#search').val('');
});
$("#next").click(function(){
	page++;
	if(page>1)$("#previous").show();
	$('#results').html('Loading..');	
	searchFlickr();
});
$("#previous").click(function(){
	page--;
	if(page==1)$("#previous").hide();
	$('#results').html('Loading..');
	searchFlickr();
});
function testKeyCode(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    var e = e || window.event;
	if(keycode==40 && focus){//down arrow
		$("#suggest1").click();
	}	
	if(keycode==37 && !focus){//left arrow
		$("#previous").click();
	}
	if(keycode==39 && !focus){//right arrow
		$("#next").click();
	}			
}
$('#search').focus(function() {
	focus=true;
}).blur(function() {	
	focus=false;
	$("#suggestions").css("visibility","hidden");
}).change(function() {	
	searchFlickr();
}).on("keyup", function(){
	searchFlickr();
});  
handleResponse = function(suggestions) {	
    if (suggestions[1][0]) {
		keyword = suggestions[1][0][0];
	}else{
		keyword = null;
	}
	searchFlickr();
}
$(".suggestResults").click(function(){
	var suggestWord = $(this).html();
	if (suggestWord.length > 0) $('#search').val(suggestWord);
	searchFlickr();
	$("#suggestions").css("visibility","hidden");
});

document.onkeydown = testKeyCode;
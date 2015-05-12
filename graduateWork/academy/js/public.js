var login, logout, logoutHome, queryUser;
var isLogin, id, pin, loginReload, workshop;

/* onload */	
function goHome(){
	window.location.href=home;
}	
$(document).ready(function(){
	cmDraw ('myMenuID', myMenu, 'hbr', cmThemeGray, 'ThemeGray');
	$("#banner").click(function(){
		goHome();
	});
	
	$(".menuA").live("mouseover",function(){
		$("#menuA1").attr("id","menuA1Active");	
	});
	$(".menuA").live("mouseout",function(){
		$("#menuA1Active").attr("id","menuA1");	
	});	
	$(".menuC").live("mouseover",function(){
		$("#menuC1").attr("id","menuC1Active");	
	});
	$(".menuC").live("mouseout",function(){
		$("#menuC1Active").attr("id","menuC1");	
	});	
});
	
try {
	var pageTracker = _gat._getTracker("UA-6546404-1");
	pageTracker._trackPageview();
} catch(err) {}	

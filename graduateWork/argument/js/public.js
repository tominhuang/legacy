var id=null;
var grouping=null;
var begin=new Date().getTime();

$.ajaxSetup({cache:false});
$.postJSON = function(url, data, callback) { 
	$.post(url, data, callback, "json")
};
$(document).ready(function() {
	queryUser();
});
function queryUser(){
	$.getJSON("../queryUser.do",function(data){
		id=data[0];
		grouping=data[1];
		
		if(id!=null && id!="invalid"){
			$("#id").text(id);
			doSomething();
		}else{
			$("#id").text("你尚未登入");
			$("#log a").text("[登入]");
		}				
	});
}
function countPeriod(begin,end){	
	var oneSecond=1000;//in milliseconds
	var diff=end-begin;	
	var diffSecond=Math.floor(diff/oneSecond);	
	return diffSecond;
}
$(window).unload(function (){
	var end=new Date().getTime();
	var period=countPeriod(begin,end);

	if(page!=null){
		$.ajax({	
		  url: "../unload.do",
		  data: "period=" + period + "&page=" + page
		}); 
	}
});

try {
	var pageTracker = _gat._getTracker("UA-9418360-1");
	pageTracker._trackPageview();
} catch(err) {}
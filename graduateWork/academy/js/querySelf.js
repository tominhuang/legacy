$(document).ready(function(){
	var id = document.URL.replace(/.*?id=/, "");
	id = id.replace(/#.*/, "");
	
	$.getJSON("../querySelf.do",{id:id},function(data){			
	
		$(".pic").attr("src","../images/pic/"+data[0]+".jpg");
		$(".name").html(data[1]);
		$(".major").html(data[4]);
		$(".grade").html(data[5]);
		
		$(".interest").html(data[6].replace(/[\n]+/g,"<br>"));
		$(".words").html(data[7].replace(/[\n]+/g,"<br>"));
	
	});

});



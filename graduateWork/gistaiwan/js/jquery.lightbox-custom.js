$(function() {
    $('.gallery ul li a').lightBox();
});
$(document).ready(function () {

	//page
	$(".page").click(function () {
		/*page navigation*/
		$(".pageCurrent").removeClass().addClass("page");
		$(this).addClass("pageCurrent").removeClass("page");
		
		/*show,hide gallery*/
		if($(this).attr("rel")=="showAll"){
			$(".gallery").show();
		}else{
			$(".gallery").hide();
			$("#"+$(this).attr("rel")).fadeIn(500);
		}		
	});
	
	$(".page:first").removeClass().addClass("pageCurrent");
		
});

try {
	var pageTracker = _gat._getTracker("UA-6546404-1");
	pageTracker._trackPageview();
} catch(err) {}

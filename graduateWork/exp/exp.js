var t, keyword, focus;
var onload_time = new Date(),
	time = new Date(),
    page = 1,
	practice_page = 0,
	exp_page = 11,
    value = '',
	log = '',
	last_limit_page;


$(function(){
	$('#email').focus();//.val('');
});


function testKeyCode(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;

	//console.log(keycode);

	if(keycode==65){//aA
		if(isEnterPage()) return false;
		nextpage();
	} else if(keycode==75){//kK
		if(isEnterPage()) return false;
		nextpage();
	} else if(keycode==13){//enter
		pid = $("#pid").val();
		//console.log(page);		
		if (isEnterPage()) {
			nextpage();
		}
	}	
		
}

document.onkeydown = testKeyCode;

$("input").click(function(){
    var new_time = new Date();
    var diff = (new_time - time)/1000;
    value = $(this).val();
    log += "page " + page + " " + value + ": " + diff + " sec\n";
});

$(".page").click(function(){
    time = new Date();
    page = $(this).attr('id').replace('p','');    
    $('.pages').hide();
    $('#page' + page).show('slow');

});

function isEnterPage () {
	var enter_page_array = [1,2,9,16];
	
	if (enter_page_array.indexOf(page) != -1) {
		return true;
	} else {
		return false;
	}
}

function nextpage() {
    $('.pages').hide();
    $('#page' + page).show();	
    page++;
	
	if (page > 2) {
		practice();
	}
} 

function practice() {
	$('.pages').hide();
	$('#image_wrap').show();
	//$('#page').html(page);
	$('#image').prop('src', 'images/practice/images' + practice_page + '.png');
    practice_page++;
	
	if(page > 16) {
		exp();		
		limitTime();		
	}
	
}

function exp() {
	$('#image').prop('src', 'images/images' + exp_page + '.png');
    exp_page++;
	
	if(exp_page == 204) {//page 208
		$('#image_wrap').hide();
		$('#final').show();
	}
}

function limitTime() {
	var last_limit_page = page;
	self.setTimeout(function() {

		if (page == last_limit_page) {//current page doesn't increment
			nextpage();//force next page
		}
	}, 5000);
}


 
// preload
for(var i=0; i<=13; i++) {
	$('<img/>')[0].src = 'images/practice/images' + i + '.png';
}
for(var i=11; i<=202; i++) {
	$('<img/>')[0].src = 'images/images' + i + '.png';
}
    


$("#submit").click(function(){
	$('#final').hide();
    $('#success').show();
});

$("#log").click(function(){
    alert(log);
});


var origin_pid = window.location.search.replace('?', ''),
	pid = Base64.decode(origin_pid);

	
console.log(origin_pid);
console.log(pid);


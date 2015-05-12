var page=null;

$(document).ready(function () {	
	$("input[name=id]").focus();

	$("form").submit(function(){
		var id=$("input[name=id]").val();
		var password=$("input[name=password]").val();				
		$(".errorwords").html("&nbsp;");//reset
		
		if(id==""){
			$(".errorwords").text("帳號不可空白");
			$("input[name=id]").focus();
			return false;
		}
		if(password==""){
			$(".errorwords").text("密碼不可空白");
			$("input[name=password]").focus();
			return false;
		}		
		
		$.getJSON("../login.do", { id: id, password: password }, function(data){			
			var msg=data[0];
			if(msg=="wrong"){
				$(".errorwords").text("帳號或密碼錯誤");
			}
			if(msg=="ok"){
				window.location.href="../task/task.html";
			}
		});
	
		return false;
	});
	

});

function doSomething(){
	if(id!=null && id!="invalid"){
		window.location.href="../task/redirect.html";
	}
}

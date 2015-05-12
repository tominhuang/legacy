var page=null;

$(document).ready(function () {	
	$("input[name=email]").focus();

	$("form").submit(function(){
		var email=$("input[name=email]").val();
		$(".errorwords").html("&nbsp;").css("color","red");;//reset
		
		if(email==""){
			$(".errorwords").text("電子郵件信箱不可空白");
			$("input[name=email]").focus();
			return false;
		}
		
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
		var isEmailValidate = emailPattern.test(email);	
		if(!isEmailValidate){
			$(".errorwords").text("不是正確的信箱格式");
			$("input[name=email]").focus();
			return false;	
		}

		var send=$("input[name=send]").val()
		$("input[name=send]").val("處理中……")
		
		$.getJSON("../forgetPassword.do", { email: email }, function(data){			
			var msg=data[0];
			
			if(msg=="ok"){
				$(".errorwords").text("帳號、密碼已傳送到 "+email).css("color","blue");
			}else if(msg=="none"){
				$(".errorwords").text("這個信箱不存在");
			}else{
				$(".errorwords").text("發生錯誤，請稍後再試！");			
			}			
			$("input[name=send]").val(send)
		});
	
		return false;
	});	
});

function doSomething(){
	if(id!=null && id!="invalid"){
		window.location.href="../task/redirect.html";
	}
}

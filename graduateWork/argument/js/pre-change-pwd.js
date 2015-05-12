$(document).ready(function () {	
	$("input[name=password]").focus();

	$("form[name=form]").submit(function(){		
		var password=$("input[name=password]").val();
		var passwordAgain=$("input[name=passwordAgain]").val();
		var email=$("input[name=email]").val();
		$(".errorwords").html("&nbsp;");//reset	
		
		if(password==""){
			$(".errorwords").text("新密碼不可空白");
			$("input[name=password]").focus();
			return false;
		}
		if(passwordAgain==""){
			$(".errorwords").text("再次輸入新密碼不可空白");
			$("input[name=passwordAgain]").focus();
			return false;
		}	
		if(email==""){
			$(".errorwords").text("email不可空白");
			$("input[name=email]").focus();
			return false;
		}
		if(password!=passwordAgain){
			$(".errorwords").text("兩個新密碼不相同");
			$("input[name=password]").focus();
			return false;
		}
		if(password==id){
			$(".errorwords").text("新密碼不可以跟舊密碼相同");
			$("input[name=password]").focus();
			return false;
		}
		if(password.length<=3){
			$(".errorwords").text("新密碼長度太短");
			$("input[name=password]").focus();
			return false;	
		}

		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
		var isEmailValidate = emailPattern.test(email);	
		if(!isEmailValidate){
			$(".errorwords").text("不是正確的email格式");
			$("input[name=email]").focus();
			return false;	
		}
		
		$.getJSON("../resetPassword.do", { password: password, email: email }, function(data){			
			var msg=data[0];

			if(msg=="ok"){
				alert("密碼更新成功！下次登入請用新密碼登入。\n你的新密碼是"+password+"，請拿筆記本記下來。")
				window.location.href="../task/redirect.html";
			}
			if(msg!="ok"){
				alert("密碼更新失敗！請稍候再試一次。")
			}			
		});

		return false;	
		
	});	
});	

function doSomething(){

}
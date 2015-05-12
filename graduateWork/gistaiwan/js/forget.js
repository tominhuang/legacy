var forget;

	function forgetRequest(){
		var email = document.getElementById("email").value;
		
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
		var isEmailValidate = emailPattern.test(document.form.email.value);		
		
		if(email.length==0){
			document.getElementById("forgetMsg").innerHTML = "<img src=../images/icon_alert.gif></img> Email address is empty.";
			document.form.email.focus();
			return false;
		}else if(!isEmailValidate){
			document.getElementById("forgetMsg").innerHTML = "<img src=../images/icon_alert.gif></img> Email address is NOT valid.";
			document.form.email.focus();
			return false;
		}
				
		forget = createRequest();
		var send = "email=" + email + "&dummy=" + new Date().getTime();
		document.getElementById("forgetMsg").innerHTML = "Processing...";
		processStart();	
		sendAjaxPOSTRequest(forget, "forgetPassword.do", send, forgetResponse);
	}

	function forgetResponse(){
		processFinish();
		var xml = fetchXML(forget);
		if(xml!=null){
			var root = xml.getElementsByTagName("root");
			var status;
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				status = root[0].childNodes[1].firstChild.nodeValue;
			}

			if(status=="success"){
				document.getElementById("forgetMsg").innerHTML = "<img src=../images/accept.png></img> Your ID and Password have been sent to your email.";
			}else if(status=="database_error"){
				document.getElementById("forgetMsg").innerHTML = "<img src=../images/icon_alert.gif></img> Database error";
			}else{
				document.getElementById("forgetMsg").innerHTML = "<img src=../images/icon_alert.gif></img> The email you type does not exist.";
			}
		}
		
	}

	var oldOnload2 = window.onload || function () {};
	window.onload = function ()
	{
	  oldOnload2();
	  document.form.email.focus();
	}	

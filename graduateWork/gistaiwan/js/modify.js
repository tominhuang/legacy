var password;

function check(){
	if(document.form2.pwd.value.length == 0)
		document.getElementById("result").innerHTML = "<font color=red>Old Password Empty</font>";
	else if(document.form2.pwd2.value.length == 0)
		document.getElementById("result").innerHTML = "<font color=red>New Password Empty</font>";
	else if(document.form2.pwd3.value.length == 0)
		document.getElementById("result").innerHTML = "<font color=red>Re-type New Password Empty</font>";	
	else if(document.form2.pwd2.value != document.form2.pwd3.value)
		document.getElementById("result").innerHTML = "<font color=red>New Passwords don't match.</font>";
	else{		
		var passwordPattern = /^(?=.*[a-zA-Z0-9_]).{4,20}$/;
		var isPasswordValidate = passwordPattern.test(document.form2.pwd2.value);
		if(!isPasswordValidate)
			document.getElementById("result").innerHTML = "<font color=red>New Password Format is NOT valid.</font><br><br>Password allows digits, letters, and underline.  The length is at least 4, and at most 20.";
		else
			passwordRequest();
	}
}
function passwordRequest(){		
	password = createRequest();
	var send = "oldpwd=" + document.form2.pwd.value + "&newpwd=" + document.form2.pwd2.value +"&dummy=" + new Date().getTime();
	processStart();	
	sendAjaxPOSTRequest(password, "resetPassword.do", send, passwordResponse);
}
function passwordResponse(){
	processFinish();
	var xml = fetchXML(password);
	if(xml!=null){
		var root = xml.getElementsByTagName("root");
		var status;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			status = root[0].childNodes[1].firstChild.nodeValue;
		}

		if(status=="1"){
			document.getElementById("result").innerHTML = "<img src=../images/accept.png></img> Your Password Changed Successfully.";
			document.form2.pwd.value = "";
			document.form2.pwd2.value = "";
			document.form2.pwd3.value = "";
		}else if(status=="0"){
			document.getElementById("result").innerHTML = "<img src=../images/icon_alert.gif></img> Wrong Password.  Nothing changed.";			
		}else if(status=="database_error"){
			document.getElementById("result").innerHTML = "<img src=../images/icon_alert.gif></img> Database error";
		}else if(status=="not_login"){
			document.getElementById("result").innerHTML = "<img src=../images/icon_alert.gif></img> Please login in first.";
		}else{
			document.getElementById("result").innerHTML = "";
		}
	}	
}
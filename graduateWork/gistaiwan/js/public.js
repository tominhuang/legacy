var login, logout, logoutHome, queryUser;
var isLogin, id, pin, loginReload, workshop;

/* login  */
	function loginRequest(){
		var id = document.getElementsByName("textfield")[0].value.toLowerCase();
		var password = document.getElementsByName("textfield2")[0].value;
		var checkbox = document.getElementsByName("checkbox")[0].checked;
		
		if(id.length==0){
			document.getElementById("loginerror").innerHTML = "Empty ID.";
			document.form1.textfield.focus();
			return false;
		}else if(password.length==0){
			document.getElementById("loginerror").innerHTML = "Empty Password.";
			document.form1.textfield2.focus();
			return false;
		}		
				
		login = createRequest();
		var send = "textfield=" + id + "&textfield2=" + password + "&checkbox=" + checkbox + "&dummy=" + new Date().getTime();
		sendAjaxPOSTRequest(login, "login.do", send, loginResponse);
	}

	function loginResponse(){
		var xml = fetchXML(login);
		if(xml!=null){
			var root = xml.getElementsByTagName("root");
			var status;
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				status = root[0].childNodes[1].firstChild.nodeValue;
			}

			if(status=="OK"){
				if(loginReload=="yes"){
					loginReload = "no";
					location.reload(true);
				}else{					
					queryUserRequest();					
				}
				document.getElementById("loginerror").innerHTML = "";
			}else{
				document.getElementById("loginerror").innerHTML = status;		
			}
		}
		
	}
	
	function setLoginReload(){
		loginReload = "yes";		
	}

/* logout  */
	function logoutRequest(){
		logout = createRequest();
		var send = "dummy=" + new Date().getTime();	
		sendAjaxPOSTRequest(logout, "logout.do", send, logoutResponse);
	}

	function logoutResponse(){
		queryUserRequest();
		
		myMenu = myMenuNotLogin;
		cmDraw ('myMenuID', myMenu, 'hbr', cmThemeGray, 'ThemeGray');	
	}

	function logoutRequestHome(){
		logoutHome = createRequest();
		var send = "dummy=" + new Date().getTime();	
		sendAjaxPOSTRequest(logoutHome, "logout.do", send, logoutHomeResponse);
	}

	function logoutHomeResponse(){
		window.location.href = home;
	}

/* query, loginFrameSwitch  */

	function queryUserRequest(){
		queryUser = createRequest();	
		var send = "dummy=" + new Date().getTime();	
		sendAjaxPOSTRequest(queryUser, "queryUser.do", send, queryUserResponse);				
	}

	function queryUserResponse(){
		var xml = fetchXML(queryUser);
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				isLogin = root[0].childNodes[1].firstChild.nodeValue;
			}
			if(root[0].childNodes[2].firstChild.nodeValue!=null){
				id = root[0].childNodes[2].firstChild.nodeValue;
			}
			if(root[0].childNodes[3].firstChild.nodeValue!=null){
				pin = root[0].childNodes[3].firstChild.nodeValue;
			}
			if(root[0].childNodes[4].firstChild.nodeValue!=null){
				workshop = root[0].childNodes[4].firstChild.nodeValue;
			}			

			setUserRequest();
		}
	}

	function setUserRequest(){	
		if(isLogin=="YES"){
			if(id!=null){//already login				
				document.getElementById("loginid").innerHTML = id;
				document.getElementById("info").style.display = "none";
				document.getElementById("info2").style.display = "block";
				
				//myMenu = myMenuLogin;				
				cmDraw ('myMenuID', myMenu, 'hbr', cmThemeGray, 'ThemeGray');				
			}

			if(workshop!=null && workshop=='YES'){
				document.getElementById("workshop").style.display = "block";
			}			
		}else{
			document.getElementById("info").style.display = 'block';
			document.getElementById("info2").style.display = 'none';
			//myMenu = myMenuNotLogin;
			cmDraw ('myMenuID', myMenu, 'hbr', cmThemeGray, 'ThemeGray');
		}	
	}

/*Process*/
	
	function processStart(){				
		document.getElementById("process").style.background= "#990000";
		document.getElementById("process").innerHTML = "Loading...";
		document.getElementById("process").style.display = "block";
		
		setTimeout("s()",500);
	}	
	function s(){
	}	
	
	function processFinish(){		
		setTimeout("a()",1000);
		setTimeout("b()",1600);
		setTimeout("c()",2200);
	}	
	function a(){
		document.getElementById("process").innerHTML = "&nbsp;&nbsp;&nbsp;Done&nbsp;&nbsp;&nbsp;";
		document.getElementById("process").style.background= "#aa3300";		
	}	
	function b(){
		document.getElementById("process").style.background= "#bb3300";
		document.getElementById("process").style.border= "1px solid #ddd";
	}
	function c(){
		document.getElementById("process").style.display = "none";
	}

/* onload */	
	function setLogoLink(){
		setTimeout("document.getElementById('banner').onclick=goHome",10)
		setTimeout("document.getElementById('banner2').onclick=goHome",10)
		setTimeout("document.getElementById('banner3').onclick=goHome",10)
	}	
	function goHome(){
		window.location.href=home;
	}	
	
	var oldOnload = window.onload || function () {};
	window.onload = function ()
	{
	  oldOnload();
	  setLogoLink();     
	}
function resetIcons(){
	for(var i=1;i<=13;i++){
		var temp = "icon" + i.toString(); 
		document.getElementById(temp).innerHTML = "";
	}
	document.getElementById("icon_field").innerHTML = "";
}

function doCheck(){
	var error_empty = "";
	var error_validate = "";
	var error_total;
			
	resetIcons();
	
	/* Empty Test */
	if(document.form.textfield.value.length == 0){
		error_empty += "ID Empty.<br/>";	
		document.getElementById("icon1").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
		
	
	if(document.form.textfield2.value.length == 0){
		error_empty += "Password Empty.<br/>";	
		document.getElementById("icon2").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	
	if(document.form.textfield3.value.length == 0){
		error_empty += "Re-type Password Empty.<br/>";
		document.getElementById("icon3").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}

	if(document.form.textfield4.value.length == 0){
		error_empty += "First Name Empty.<br/>";
		document.getElementById("icon4").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}

	if(document.form.textfield6.value.length == 0){
		error_empty += "Last Name Empty.<br/>";
		document.getElementById("icon5").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	
	if(document.form.textfield7.value.length == 0){
		error_empty += "School Empty.<br/>";
			document.getElementById("icon6").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	
	if(document.form.select5.value.length == 0){
		error_empty += "Subject Field Not Selected.<br/>";
		document.getElementById("icon_field").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}		

	if(document.form.textfield8.value.length == 0){
		error_empty += "Subject Empty.<br/>";
		document.getElementById("icon7").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}

	if(document.form.textfield9.value.length == 0){
		error_empty += "School Address Empty.<br/>";
		document.getElementById("icon8").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	
	if(document.form.textfield10.value.length == 0){
		error_empty += "School Phone Empty.<br/>";
		document.getElementById("icon9").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}	
	
	if(document.form.textfield11.value.length == 0){
		error_empty += "Contact Address Empty.<br/>";
		document.getElementById("icon10").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}

	if(document.form.textfield12.value.length == 0){
		error_empty += "Permanent Address Empty.<br/>";
		document.getElementById("icon11").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	

	if(document.form.textfield16.value.length == 0){
		error_empty += "E-Mail Empty.<br/>";
		document.getElementById("icon13").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
	}
	
	/*Validate Test */
	if(error_empty == ""){//pass empty test
	
		var idPattern = /^[a-z][a-z0-9_]{2,18}[a-z0-9]$/;
		var isIDValidate = idPattern.test(document.form.textfield.value);
	
		var passwordPattern = /^(?=.*[a-zA-Z0-9_]).{4,20}$/;
		var isPasswordValidate = passwordPattern.test(document.form.textfield2.value);
		
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; 
		var isEmailValidate = emailPattern.test(document.form.textfield16.value);

	
		if(document.form.textfield2.value != document.form.textfield3.value){
			error_validate += "Password and Re-type Password doesn't match.<br/>";
			document.getElementById("icon2").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
			document.getElementById("icon3").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
		}
		
		if(!isIDValidate){
			error_validate += "ID is NOT valid. <br/><div class=\"errordescription\">- Only lowercase letter, digits, and underline are allowed. <br/>-  First charater only allows letter. <br/>- The length is at least 4, and at most 20.</div><br/>";
			document.getElementById("icon1").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
		}		
		
		if(!isPasswordValidate){
			error_validate += "Password is NOT valid. <br/><div class=\"errordescription\">- Only allows digits, letters, and underline.<br/>- The length is at least 4, and at most 20.</div><br/>";
			document.getElementById("icon2").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
		}
		
		if(!isEmailValidate){
			error_validate += "E-Mail is NOT valid.<br/>";
			document.getElementById("icon13").innerHTML = "<img src=\"../images/icon_alert.gif\"></img>";
		}
	}
	
	/*To Sum up */
	error_total = error_empty + error_validate;
	
	if(error_total!= ""){	
		document.getElementById("errorbox").style.display = "block";
		document.getElementById("errorword").innerHTML = error_total;
		
		return false;
		
	}else{
		document.getElementById("errorbox").style.display = "none";
		document.getElementById("next").value = "Processing...";
		document.getElementById("next").readonly = "true";
		return true;
	}
	
}

/* flag */
function nationSelect(selectX){
	var flag_url = "../images/flags/" + selectX.value.toLowerCase() + ".png";
	var img = "<img src=\"" + flag_url + "\"></img>";
	document.getElementById("flag").innerHTML = img;
}

function nationSelect2(selectX){
	var flag_url = "../images/flags/" + selectX.value.toLowerCase() + ".png";
	var img = "<img src=\"" + flag_url + "\"></img>";
	if(selectX!=""){
		document.getElementById("flag2").innerHTML = img;
	}
}

function nationSelect3(selectX){
	var flag_url = "../images/flags/" + selectX.value.toLowerCase() + ".png";
	var img = "<img src=\"" + flag_url + "\"></img>";
	document.getElementById("flag3").innerHTML = img;
}

function nationSelectAuto(selectX){
	var flag_url = "../images/flags/" + selectX.toLowerCase() + ".png";
	var img = "<img src=\"" + flag_url + "\"></img>";
	document.getElementById("flag").innerHTML = img;
	document.getElementById("flag3").innerHTML = img;
}


//IP
var countryCode;
var city;
var country;

function queryIP(){
	var MyIP = new SmartIP();

	MyIP.load();
	MyIP.onload = function() {
	   countryCode = MyIP.getCountryCode();
	   city = MyIP.getCity();
	   country = MyIP.getCountryName();
	   
	   var location = window.document.form.location;
	   var location3 = window.document.form.location3;
	   
	   var address = document.getElementById("address").innerHTML;
	   var address2 = document.getElementById("address2").innerHTML;
	   if(address==""){address = "Address Detail Here";} 
	   if(address2==""){address2 = "Address Detail Here";} 
	   

	   for(var idx=0;idx<location.options.length;idx++) 
	   {  
	       if(location.options[idx].value==countryCode)   
	       { 
	           location.options[idx].selected=true; 
	       } 
	   } 

	   for(var idx=0;idx<location3.options.length;idx++) 
	   {  
	       if(location3.options[idx].value==countryCode)   
	       { 
	           location3.options[idx].selected=true; 
	       } 
	   } 	   
	   
	   document.getElementById("address").value = address + ", " + city + ", " + country;
	   document.getElementById("address2").value = address2 + ", " + city + ", " + country;
	   nationSelectAuto(countryCode);
	   
	}
}

function copyAddress(){
	document.getElementById("textfield12").value = document.getElementById("address2").value;
}

function resetMajor(object){
	if(object.value=="Full Name of Your Major"){
		object.value = "";
	}
}

function resetSchool(object){
	if(object.value=="Full Name of Your School"){
		object.value = "";
	}
}
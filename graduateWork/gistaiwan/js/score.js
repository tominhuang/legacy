var p01=[10034,10046,10083,10100,10116,10119,10123,10145,10150,10162,10164,10168,10197,10206,10217,10219,10239,10245,10267,10283,10300,10310,10321,10331,10332,10336,10338,10351,10352,10359];
var p02=[10362,10368,10376,10404,10406,10407,10415,10434,10435,10437,10440,10441,10450,10457,10459,10462,10465,10468,10472,10478,10480,10485,10489,10491,10492,10497,10501,10505,10518,10525];
var p03=[10527,10536,10539,10545,10566,10567,10573,10576,10579,10583,10588,10589,10593,10597,10602,10607,10611,10619,10626,10627,10628,10678,10706,10723,10728,10729,10733,10737,10742];
var p04=[10037,10107,10143,10149,10166,10199,10241,10254,10256,10264,10274,10278,10285,10298,10309,10316,10329,10335,10342,10345,10357];
var p05=[10361,10365,10382,10388,10392,10397,10409,10417,10442,10452,10458,10463,10471,10477,10484,10490,10496,10502,10503,10510];
var p06=[10517,10528,10532,10541,10542,10543,10551,10563,10585,10591,10596,10599,10604,10622,10634,10664,10692,10736,10739,10740];
var p07=[10031,10141,10157,10159,10160,10172,10181,10193,10202,10234,10260,10262,10265,10279,10288,10294,10295,10296,10305,10326,10330,10333,10346,10354,10360,10371,10393,10399];
var p08=[10405,10410,10412,10420,10422,10424,10428,10436,10443,10446,10449,10469,10470,10474,10479,10488,10493,10495,10504,10509,10512,10516,10529,10546,10547,10550,10554,10562];
var p09=[10565,10570,10571,10574,10580,10581,10584,10586,10594,10595,10601,10605,10606,10613,10615,10616,10625,10630,10632,10670,10713,10722,10724,10725,10730,10734,10738];
var p10=[10057,10236,10358,10454,10559,10651,10104,10521,10635,10639,10344,10413,10456,10662,10673,10743,10744];
var tester=[10517,10528,10532,10541,10542,10543,10551,10563,10585,10591,10596,10599,10604,10622,10634,10664,10692,10736,10739,10740];
var allAnswers=[0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10];

var people, loginPerson, scoreLogin, update, content, score;
var isScoreLogin, score_id, score_name, score_title;

String.prototype.replaceAll  = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}  

//index
function checkLogin(){
	
	if(document.form1.textfield.value.length == 0){
		alert('Empty Account!');
		document.form1.textfield.focus();
		return false;
	}
	if(document.form1.textfield2.value.length == 0){
		alert('Empty Password!');
		document.form1.textfield2.focus();
		return false;
	}
	
	return true;
}

//scoreLogin
function scoreLoginRequest(){			
	scoreLogin = createRequest();
	var send = "dummy=" + new Date().getTime();
	sendAjaxPOSTRequest(scoreLogin, "scoreLoginCheck.do", send, scoreLoginResponse);	
}
function scoreLoginResponse(){
	var xml = fetchXML(scoreLogin);
	if(xml!=null){
		var root = xml.getElementsByTagName("root");		
		var score_result;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			isScoreLogin = root[0].childNodes[1].firstChild.nodeValue;			
		}
		if(root[0].childNodes[2].firstChild.nodeValue!=null){
			score_id = root[0].childNodes[2].firstChild.nodeValue;			
		}		
		if(root[0].childNodes[3].firstChild.nodeValue!=null){
			score_name = root[0].childNodes[3].firstChild.nodeValue;			
		}
		if(root[0].childNodes[4].firstChild.nodeValue!=null){
			score_title = root[0].childNodes[4].firstChild.nodeValue;			
		}
		if(root[0].childNodes[5].firstChild.nodeValue!=null){
			score_result = root[0].childNodes[5].firstChild.nodeValue;			
		}
		
		if(isScoreLogin=="YES"){	
			document.getElementById("name").innerHTML = "" + score_title + "  " + score_name + ". ";
			//document.getElementById("logout").innerHTML = "logout(" + score_id + ")";
			if(score_result!="None"){
				document.getElementById("score_result_textarea").innerHTML = score_result;
				score_result = "Your score: <br><br>" + score_result.replaceAll("\n","<br>") + "<br><br>";
				document.getElementById("score_result").innerHTML = score_result;
				document.getElementById("score_result_container").style.display = "block";
				document.getElementById("scorelist").style.display = "none";
			}
			listitems();
		}else{
			window.location.href = "./";
		}
	}	
}

function listitems(){	
	var leftitem="";
	var rightitem="";

	if(score_id!=null){
		if(score_id=="p01"){
			loginPerson = p01;
		}
		if(score_id=="p02"){
			loginPerson = p02;
		}
		if(score_id=="p03"){
			loginPerson = p03;
		}
		if(score_id=="p04"){
			loginPerson = p04;
		}
		if(score_id=="p05"){
			loginPerson = p05;
		}
		if(score_id=="p06"){
			loginPerson = p06;
		}
		if(score_id=="p07"){
			loginPerson = p07;
		}
		if(score_id=="p08"){
			loginPerson = p08;
		}
		if(score_id=="p09"){
			loginPerson = p09;
		}
		if(score_id=="p10"){
			loginPerson = p10;
		}		
		if(score_id=="tester"){
			loginPerson = tester;
		}		
		 
		people = loginPerson.length;		
		for(var i=0;i<people;i++){
			leftitem+="<div class=leftitems id=left"+i+">"+ loginPerson[i]+"</div>";
			rightitem+="<div class=rightitems><input type=text name=textfield"+i+" id=textfield"+i+" size=6 onchange=checkNum(this)></div>";
		}
		//alert(rightitem);
		document.getElementById('leftitems_list').innerHTML = leftitem;
		document.getElementById('rightitems_list').innerHTML = rightitem;						
	}	
}

function checkNum(obj){
	if(obj.value.length==1 || obj.value==10){
		obj.value=obj.value+".0";
	}

	var isInRange = false;
	for(var i=0;i<allAnswers.length;i++){
		isInRange = false;
		if(obj.value==allAnswers[i]){
			isInRange=true;
			break;
		}		
	}
	
	if(!isInRange){
		alert(obj.value + " is out of range.");
	}
}

function previewRequest(){
	window.location.href="#top2";
	content="";
	score="";
	for(var i=0;i<people;i++){
		var leftitem="left"+i;
		var rightitem="textfield"+i;		
		content += document.getElementById(leftitem).innerHTML + ":&nbsp;" + document.getElementById(rightitem).value + "\r\n<br>";
		score += document.getElementById(leftitem).innerHTML + ": " + document.getElementById(rightitem).value + "\r";
	}	
	document.getElementById("scorelist").style.display = "none";
	document.getElementById("score_result_container").style.display = "none";
	document.getElementById("preview").style.display = "block";
	document.getElementById("preview_content").innerHTML = content;	
}
function editRequest(){
	window.location.href="#top2";
	document.getElementById("scorelist").style.display = "block";
	document.getElementById("preview").style.display = "none";
}
function showFormRequest(){
	document.getElementById("scorelist").style.display = "block";
}
function editFormRequest(){
	document.getElementById("scorelist").style.display = "none";
	document.getElementById("score_result").style.display = "none";
	document.getElementById("score_result_form").style.display = "block";
	document.getElementById("score_result_textarea").focus();
}



//update
function setTextareaRequast(){
	score = document.getElementById("score_result_textarea").value;
}
function updateRequest(){			
	update = createRequest();
	var send = "score=" + score + "&dummy=" + new Date().getTime();
	//alert(send);
	sendAjaxPOSTRequest(update, "scoreUpdate.do", send, updateResponse);	
}
function updateResponse(){
	var xml = fetchXML(update);
	if(xml!=null){
		var root = xml.getElementsByTagName("root");
		var status;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			status = root[0].childNodes[1].firstChild.nodeValue;			
		}	

		if(status=="finish"){
			alert('Thank you! Your score saved successfully.');
			window.location.href="main.html";
		}else if(status=="database_error"){
			alert('Database error! Your score did not save.');
		}else if(status=="not_login"){
			alert('You need to re-login! (maybe because you idle too long) ');
		}else{
			alert('System error! Your score did not save.');
		}
	}	
}

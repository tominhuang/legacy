var upperbound=6;
var lowerbound=0;
var updateWorkshop, queryWorkshop;
var select1=0;
var select2=0;
var select3=0;
var selectA=0;
var selectB=0;
var selectC=0;

function removeDuplicate(selectValue){
	if(document.getElementById('select1').options[selectValue].selected==true){
		document.getElementById('select1').options[0].selected = true;
	}
	if(document.getElementById('select2').options[selectValue].selected==true){
		document.getElementById('select2').options[0].selected = true;
	}
	if(document.getElementById('select3').options[selectValue].selected==true){
		document.getElementById('select3').options[0].selected = true;
	}	
}

function removeDuplicate2(selectValue){
	if(document.getElementById('selectA').options[selectValue].selected==true){
		document.getElementById('selectA').options[0].selected = true;
	}
	if(document.getElementById('selectB').options[selectValue].selected==true){
		document.getElementById('selectB').options[0].selected = true;
	}
	if(document.getElementById('selectC').options[selectValue].selected==true){
		document.getElementById('selectC').options[0].selected = true;
	}
}

function rank(obj){
	//Step 0: remove duplicate	
	var selectValue = obj.value;
	removeDuplicate(selectValue);
	obj.options[selectValue].selected = true;		
	
	//Step 1: then get values
	select1=parseInt($("select[name='select1']").val());
	select2=parseInt($("select[name='select2']").val());
	select3=parseInt($("select[name='select3']").val());

	var day_currentValue=select1+select2+select3;
	var remain = upperbound - day_currentValue;
	var remain_option = ".option_" + remain;
	
	if(remain!=0){
		while(true){
			//Step 2, Condition: 2C3, Choose 2 from 3	
			if(select1!=0 && select2!=0){
				$("select[name='select3']").find(remain_option).attr("selected","selected");
				break;
			}
			if(select1!=0 && select3!=0){
				$("select[name='select2']").find(remain_option).attr("selected","selected");
				break;
			}
			if(select2!=0 && select3!=0){
				$("select[name='select1']").find(remain_option).attr("selected","selected");
				break;
			}					
			break;
		}		
	}	
}


function rank2(obj){
	//Step 0: remove duplicate	
	var selectValue = obj.value;
	removeDuplicate2(selectValue);
	obj.options[selectValue].selected = true;		
	
	//Step 1: then get values
	selectA=parseInt($("select[name='selectA']").val());
	selectB=parseInt($("select[name='selectB']").val());
	selectC=parseInt($("select[name='selectC']").val());
	
	var day_currentValue=selectA+selectB+selectC;
	var remain = upperbound - day_currentValue;
	var remain_option = ".option_two_" + remain;
	
	if(remain!=0){
		while(true){
			//Step 2, Condition: 2C3, Choose 2 from 3	
			if(selectA!=0 && selectB!=0){
				$("select[name='selectC']").find(remain_option).attr("selected","true");
				break;
			}
			if(selectA!=0 && selectC!=0){
				$("select[name='selectB']").find(remain_option).attr("selected","true");
				break;
			}
			if(selectB!=0 && selectC!=0){
				$("select[name='selectA']").find(remain_option).attr("selected","true");
				break;
			}					
			break;
		}		
	}	
}

/* updateWorkshop  */
function workshopRequest(){	
	//Final values for submit
	select1=parseInt($("select[name='select1']").val());
	select2=parseInt($("select[name='select2']").val());
	select3=parseInt($("select[name='select3']").val());	
	selectA=parseInt($("select[name='selectA']").val());
	selectB=parseInt($("select[name='selectB']").val());
	selectC=parseInt($("select[name='selectC']").val());

	/* This should not happen anymore.
	//for fxxking & sxxking IE
	var doDay1Check = (select1>0 && select2>0) || (select1>0 && select3>0) || (select2>0 && select3>0);
	var doDay2Check = (selectA>0 && selectB>0) || (selectA>0 && selectC>0) || (selectB>0 && selectC>0);	
	var isDay1Invalid = (select1==select2) || (select1==select3) || (select2==select3);
	var isDay2Invalid = (selectA==selectB) || (selectA==selectC) || (selectB==selectC);

	if(doDay1Check && isDay1Invalid){
		alert('There are duplicate ranks on Day 1. \nEvery rank should be unique.');
		return;
	}
	if(doDay2Check && isDay2Invalid){
		alert('There are duplicate ranks on Day 2. \nEvery rank should be unique.');
		return;
	}
	*/

	updateWorkshop = createRequest();	
	var send = "day1_1=" + select1 + "&day1_2=" + select2 + "&day1_3=" + select3 + "&day2_1=" + selectA + "&day2_2=" + selectB + "&day2_3=" + selectC + "&dummy=" + new Date().getTime();
	sendAjaxPOSTRequest(updateWorkshop, "updateWorkshop.do", send, workshopResponse);
}

function workshopResponse(){
	var xml = fetchXML(updateWorkshop);
	if(xml!=null){
		var root = xml.getElementsByTagName("root");
		var status;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			status = root[0].childNodes[1].firstChild.nodeValue;
		}

		if(status=="finish"){
			alert('Your selection saved successfully.');
			//location.reload(true);
		}else if(status=="not_login"){
			alert('Please login first.');
		}else if(status=="nothing_change"){
			alert('Nothing changed. Perhaps you are not selected as a participant.');
		}else{
			alert('Database error! Try again later or contact us.');
		}
	}	
}

/* queryWorkshop  */
function queryWorkshopRequest(){	
	queryWorkshop = createRequest();
	var send = "dummy=" + new Date().getTime();	
	sendAjaxPOSTRequest(queryWorkshop, "queryWorkshop.do", send, queryWorkshopResponse);
}

function queryWorkshopResponse(){
	var xml = fetchXML(queryWorkshop);
	if(xml!=null){
		var root = xml.getElementsByTagName("root");
		var validation, day1_1, day1_2, day1_3, day2_1, day2_2, day2_3;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			validation = root[0].childNodes[1].firstChild.nodeValue;
			day1_1 = root[0].childNodes[2].firstChild.nodeValue;
			day1_2 = root[0].childNodes[3].firstChild.nodeValue;
			day1_3 = root[0].childNodes[4].firstChild.nodeValue;
			day2_1 = root[0].childNodes[5].firstChild.nodeValue;
			day2_2 = root[0].childNodes[6].firstChild.nodeValue;
			day2_3 = root[0].childNodes[7].firstChild.nodeValue;
		}

		//alert(validation+day1_1+day1_2+day1_3+day2_1+day2_2+day2_3);
		if(validation=="YES"){
			if(day1_1!=null && day1_1>=0){
				var option = ".option_" + day1_1;
				$("select[name='select1']").find(option).attr("selected","true");
			}
			if(day1_2!=null && day1_2>=0){
				var option = ".option_" + day1_2;
				$("select[name='select2']").find(option).attr("selected","true");
			}
			if(day1_3!=null && day1_3>=0){
				var option = ".option_" + day1_3;
				$("select[name='select3']").find(option).attr("selected","true");
			}
			if(day2_1!=null && day2_1>=0){
				var option = ".option_two_" + day2_1;
				$("select[name='selectA']").find(option).attr("selected","true");
			}			
			if(day2_2!=null && day2_2>=0){
				var option = ".option_two_" + day2_2;
				$("select[name='selectB']").find(option).attr("selected","true");
			}
			if(day2_3!=null && day2_3>=0){
				var option = ".option_two_" + day2_3;
				$("select[name='selectC']").find(option).attr("selected","true");
			}						
		}
	}	
}
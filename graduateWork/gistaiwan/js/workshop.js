var queryWorkshop;

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
		var validation, day1_1, day1_2, day1_3, day2_1, day2_2, day2_3, day1, day2;
		if(root[0].childNodes[1].firstChild.nodeValue!=null){
			validation = root[0].childNodes[1].firstChild.nodeValue;
			day1_1 = root[0].childNodes[2].firstChild.nodeValue;
			day1_2 = root[0].childNodes[3].firstChild.nodeValue;
			day1_3 = root[0].childNodes[4].firstChild.nodeValue;
			day2_1 = root[0].childNodes[5].firstChild.nodeValue;
			day2_2 = root[0].childNodes[6].firstChild.nodeValue;
			day2_3 = root[0].childNodes[7].firstChild.nodeValue;
			day1 = root[0].childNodes[8].firstChild.nodeValue;
			day2 = root[0].childNodes[9].firstChild.nodeValue;
		}

		//alert(validation+day1_1+day1_2+day1_3+day2_1+day2_2+day2_3);
		if(validation=="YES"){
			if(day1_1!=null && day1_1>=0){
				$("span[name='select1']").text( "#" + day1_1);
			}else{
				$("span[name='select1']").text("N/A ");
			}
			
			if(day1_2!=null && day1_2>=0){
				$("span[name='select2']").text( "#" + day1_2);
			}else{
				$("span[name='select2']").text("N/A ");
			}
			
			if(day1_3!=null && day1_3>=0){
				$("span[name='select3']").text( "#" + day1_3);
			}else{
				$("span[name='select3']").text("N/A ");
			}
			
			if(day2_1!=null && day2_1>=0){
				$("span[name='select4']").text( "#" + day2_1);
			}else{
				$("span[name='select4']").text("N/A ");
			}
			
			if(day2_2!=null && day2_2>=0){
				$("span[name='select5']").text( "#" + day2_2);
			}else{
				$("span[name='select5']").text("N/A ");
			}
			
			if(day2_3!=null && day2_3>=0){			
				$("span[name='select6']").text( "#" + day2_3);
			}else{
				$("span[name='select6']").text("N/A ");
			}
			
			var day1_topic;
			var day2_topic;
			switch(day1){
				case "1":
					day1_topic=$("#day1_1_topic").text();
					break;
				case "2":
					day1_topic=$("#day1_2_topic").text();
					break;
				case "3":
					day1_topic=$("#day1_3_topic").text();
					break;
				default:
					break;					
			}
			switch(day2){
				case "1":
					day2_topic=$("#day2_1_topic").text();
					break;
				case "2":
					day2_topic=$("#day2_2_topic").text();
					break;
				case "3":
					day2_topic=$("#day2_3_topic").text();
					break;
				default:
					break;					
			}			
			
			$("#day1").text(day1_topic);
			$("#day2").text(day2_topic);
			
			
		}
	}	
}
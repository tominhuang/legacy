var abstract_file, essay_file, abstractFileStatus, essayFileStatus, abstractDelete, essayDelete;
var subTopic, subTopicQuery;

	function setPINRequest(){
		abstract_file = "A" + pin + ".pdf";
		essay_file = "E" + pin + ".pdf";
	}
		
	function showPINRequest(){
		
		if(isLogin!="YES"){//not login
			return false;
		}
	
		setPINRequest();				
		document.getElementById("pin_no").innerHTML = pin;		
		document.getElementById("abstract_file").innerHTML = abstract_file;
		document.getElementById("essay_file").innerHTML = essay_file;
	}

/* form valid check */	
	function abstractCheck(){				
		var abstract_name = document.getElementById("abstract_name").value;				
		document.getElementById("abstract_error").innerHTML = "";		
		
		if(abstract_name!=null && abstract_name!=""){
			
			document.getElementById("abstract_button").value = "Now Uploading...";
			document.formA.submit();
			
			return true;
			/*skip
			var forStupidIE;
			var forStupidIE2;
			var forStupidIEValid;
			
			if(abstract_name.length > abstract_file.length){
				forStupidIE = abstract_name.lastIndexOf(abstract_file);
				forStupidIE2 = abstract_name.lastIndexOf(abstract_file.toUpperCase());
				if(forStupidIE>=0 || forStupidIE2>=0){
					forStupidIEValid = "ok";
				}
			}			
			
			if( abstract_name==abstract_file || abstract_name==abstract_file.toUpperCase() || forStupidIEValid=="ok"){
				document.getElementById("abstract_button").value = "Now Uploading...";
				//document.getElementById("abstract_button").disabled = "true";				
				document.formA.submit();
			}else{						
				document.getElementById("abstract_error").innerHTML = "File name is not correct.";
				return false;			
			}
			*/
		}else{
			document.getElementById("abstract_error").innerHTML = "No file selected.";
			return false;
		}
		return false;	
	}

	function essayCheck(){
		var essay_name = document.getElementById("essay_name").value;
		document.getElementById("essay_error").innerHTML = "";
		
		if(essay_name!=null && essay_name!=""){

			document.getElementById("essay_button").value = "Now Uploading...";				
			document.formB.submit();
			return true;
			/* skip
			var forStupidIE;
			var forStupidIE2;
			var forStupidIEValid;
			
			if(essay_name.length > essay_file.length){
				forStupidIE = essay_name.lastIndexOf(essay_file);
				forStupidIE2 = essay_name.lastIndexOf(essay_file.toUpperCase());
				if(forStupidIE>=0 || forStupidIE2>=0){
					forStupidIEValid = "ok";
				}
			}	
			
			if( essay_name==essay_file || essay_name==essay_file.toUpperCase() || forStupidIEValid=="ok" ){
				document.getElementById("essay_button").value = "Now Uploading...";
				//document.getElementById("essay_button").disabled = "true";				
				document.formB.submit();
			}else{
				document.getElementById("essay_error").innerHTML = "File name is not correct.";
				return false;			
			}
			*/
		}else{
			document.getElementById("essay_error").innerHTML = "No file selected.";
			return false;
		}
		return false;
	}
	
/* file status */
	
	function abstractFileStatusRequest(){			
		abstractFileStatus = createRequest();	
		var send = "dummy=" + new Date().getTime();
		sendAjaxPOSTRequest(abstractFileStatus, "isEssayFileExist.do", send, abstractFileStatusResponse);				
	}

	function abstractFileStatusResponse(){	
		var xml = fetchXML(abstractFileStatus);
		var isAbstractFileExist;
	
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[3].firstChild.nodeValue!=null){
				isAbstractFileExist = root[0].childNodes[3].firstChild.nodeValue;
			}

			if(isAbstractFileExist=="1"){			
				document.getElementById("formA").style.display = "none";
				document.getElementById("statusA").style.display = "block";				
			}
			
		}
	}


	function essayFileStatusRequest(){			
		essayFileStatus = createRequest();	
		var send = "dummy=" + new Date().getTime();
		sendAjaxPOSTRequest(essayFileStatus, "isEssayFileExist.do", send, essayFileStatusResponse);				
	}

	function essayFileStatusResponse(){	
		var xml = fetchXML(essayFileStatus);
		var isEssayFileExist;
	
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[4].firstChild.nodeValue!=null){
				isEssayFileExist = root[0].childNodes[4].firstChild.nodeValue;
			}

			if(isEssayFileExist=="1"){			
				document.getElementById("formB").style.display = "none";
				document.getElementById("statusB").style.display = "block";				
			}
			
		}
	}	
	
/* show hide */		
	function showFormA(){	
		document.getElementById("formA").style.display = "block";
		document.getElementById("statusA").style.display = "none";
	}
	
	function showFormB(){	
		document.getElementById("formB").style.display = "block";
		document.getElementById("statusB").style.display = "none";
	}

	function show_formSubTopic(){	
		document.getElementById("formSubTopic").style.display = "block";
		document.getElementById("formSubTopicDone").style.display = "block";
		document.getElementById("changeSubTopic").style.display = "none";
	}
	
	function show_formSubTopicDone(){	
		document.getElementById("formSubTopic").style.display = "none";
		document.getElementById("formSubTopicDone").style.display = "block";
		document.getElementById("changeSubTopic").style.display = "block";
	}	
	
	

/* delete */	
	
	function abstractDeleteRequest(){
		var answer = window.confirm("Do you really want to delete your abstract?")
		
		if(answer){
			abstractDelete = createRequest();	
			var send = "dummy=" + new Date().getTime();
			sendAjaxPOSTRequest(abstractDelete, "abstractDelete.do", send, abstractDeleteResponse);				
		}
	}

	function abstractDeleteResponse(){	
		var xml = fetchXML(abstractDelete);
		var finish;
		
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[3].firstChild.nodeValue!=null){
				finish = root[0].childNodes[3].firstChild.nodeValue;
			}

			if(finish=="1"){
				showFormA();
				alert('Your abstract was deleted successfully.')
			}else{
				alert('Action Delete Not Finished.')			
			}
			
		}
	}


	function essayDeleteRequest(){
		var answer = window.confirm("Do you really want to delete your essay?")
		
		if(answer){
			essayDelete = createRequest();	
			var send = "dummy=" + new Date().getTime();
			sendAjaxPOSTRequest(essayDelete, "essayDelete.do", send, essayDeleteResponse);				
		}
	}

	function essayDeleteResponse(){	
		var xml = fetchXML(essayDelete);
		var finish;
		
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[3].firstChild.nodeValue!=null){
				finish = root[0].childNodes[3].firstChild.nodeValue;
			}

			if(finish=="1"){	
				showFormB();
				alert('Your essay was deleted successfully.')
			}else{
				alert('Action Delete Not Finished.')			
			}
			
		}
	}

/* set subtopic */

	function subTopicUpdateRequest(){			
		var f = document.form2.radiobutton;
		var isSelect;
		var subtopic;
		
		for(i=0;i<f.length;i++){
			if(f[i].checked){
				isSelect = "yes";
				subtopic = i+1;
			}
		}

		if(isSelect==null){
			document.getElementById("subtopic_error").innerHTML = "No Subtopic selected.";
		}else{
			subTopic = createRequest();	
			var send = "radiobutton=" + subtopic + "&dummy=" + new Date().getTime();
			sendAjaxPOSTRequest(subTopic, "subTopicUpdate.do", send, subTopicUpdateResponse);			
		}			
	}

	function subTopicUpdateResponse(){	
		var xml = fetchXML(subTopic);
		var finish;
		
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				finish = root[0].childNodes[1].firstChild.nodeValue;
			}

			if(finish=="finish"){
				subTopicQueryRequest();
			}else{
				alert(finish);
			}
			
		}
	}	
	
	
	function subTopicQueryRequest(){			
		subTopicQuery = createRequest();	
		var send = "dummy=" + new Date().getTime();
		sendAjaxPOSTRequest(subTopicQuery, "subTopicQuery.do", send, subTopicQueryResponse);			
	}

	function subTopicQueryResponse(){	
		var xml = fetchXML(subTopicQuery);
		var subtopic;
		
		if(xml!=null){
			var root = xml.getElementsByTagName("root");			
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				subtopic = root[0].childNodes[2].firstChild.nodeValue;
			}

			if(subtopic=="1"){				
				document.getElementById("formSubTopicChoice").innerHTML = document.getElementById("subtopic1").innerHTML;
				show_formSubTopicDone();
			}else if(subtopic=="2"){
				document.getElementById("formSubTopicChoice").innerHTML = document.getElementById("subtopic2").innerHTML;
				show_formSubTopicDone();
			}else if(subtopic=="3"){
				document.getElementById("formSubTopicChoice").innerHTML = document.getElementById("subtopic3").innerHTML;
				show_formSubTopicDone();
			}else{				
				
			}
			
		}
	}		
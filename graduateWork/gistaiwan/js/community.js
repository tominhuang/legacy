var community, communityReply, postComment, postTopic;
var currentID;

/* query,  */

	function communityRequest(){//step1
		community = createRequest();	
		var send = "dummy=" + new Date().getTime();	
		sendAjaxPOSTRequest(community, "communityIndex.do", send, communityResponse);				
	}
	
	function communityAllRequest(){//step1
		community = createRequest();	
		var send = "all=yes&dummy=" + new Date().getTime();	
		sendAjaxPOSTRequest(community, "communityIndex.do", send, communityResponse);				
	}	

	function communityResponse(){
		var text = fetchText(community);
		if(text!=null){
				if(text==""){
					document.getElementById("community_content_main").innerHTML = "&nbsp;Wow, you're so lucky to <u><a onclick=showTopic()>post the first topic!</a></u><br/><br/>";
					return false;
				}
		
				document.getElementById("community_content_main").innerHTML = text;		
				initShowHideContent();//step2
		}
	}
	
	//step3
	function initShowHideContent()
	{
		var divs = document.getElementsByTagName('DIV');
		for(var no=0;no<divs.length;no++){
			if(divs[no].className=='community_content_table_odd'){
				divs[no].onclick = showHide;			
			}
			
			if(divs[no].className=='community_content_table_even'){
				divs[no].onclick = showHide;
			}
		}		
	}

	//step4
	function showHide(){
		var numericID = this.id.replace(/[^\d]/g,'');		
		var obj = document.getElementById('x' + numericID);
		var status;

		if(obj.style.display=='block'){//如果本來是顯示的
			status = "block_to_none";
		}else{//如果本來是隱藏的				
			status = "none_to_block";
		}				
		
		var divs = document.getElementsByTagName('DIV');
		for(var no=0;no<divs.length;no++){
		
			if(divs[no].className=='community_content_table_post_odd'){
				divs[no].style.display='none';//先全部關掉
			}
			
			if(divs[no].className=='community_content_table_post_even'){
				divs[no].style.display='none';//先全部關掉
			}
			
		}
		
		if(status == "block_to_none"){
			obj.style.display='none';
		}else{
			obj.style.display='block';
		}
		
		currentID = numericID;
		
		communityReplyRequest(numericID);
		
	}
			
	//step5
	function communityReplyRequest(cid){
		communityReply = createRequest();	
		var send = "cid=" + cid + "&dummy=" + new Date().getTime();
		sendAjaxPOSTRequest(communityReply, "communityReply.do", send, communityReplyResponse);
	}

	function communityReplyResponse(){
		var text = fetchText(communityReply);
		if(text!=null){
				document.getElementById("replyLayout"+currentID).innerHTML = text;
		}
	}
	
	//step6
	function showCommentRequest(){
		document.getElementById("replyForm"+currentID).style.display = "block";
		document.getElementById("textarea"+currentID).focus();
	}
	
	//step7
	function postCommentRequest(){
		postComment = createRequest();
		var currentTextarea;
		if(currentID){
			currentTextarea = document.getElementById("textarea"+currentID).value;
			document.getElementById("textareaErrorBox"+currentID).innerHTML = "";
			var textPattern = /<(.|\n)+?>/;//consist <> html code
			var isNotTextValidate = textPattern.test(currentTextarea);
			
			if(isLogin!="YES"){
				document.getElementById("textareaErrorBox"+currentID).innerHTML = "Please login first.";			
			}else if(currentTextarea.length<11){
				document.getElementById("textareaErrorBox"+currentID).innerHTML = "Comment too short.  Please add more!";
				document.getElementById("textarea"+currentID).focus();
			}else if(currentTextarea.length>2000){
				document.getElementById("textareaErrorBox"+currentID).innerHTML = "Comment too long.  Please trim some.";
				document.getElementById("textarea"+currentID).focus();
			}else if(isNotTextValidate){
				document.getElementById("textareaErrorBox"+currentID).innerHTML = "Comment has illegal characters!";
				document.getElementById("textarea"+currentID).focus();
			}else{
				var send = "cid=" + currentID + "&textarea=" + currentTextarea + "&dummy=" + new Date().getTime();
				document.getElementById("replyForm"+currentID).style.display = "none";
				processStart();
				sendAjaxPOSTRequest(postComment, "communityReplyAdd.do", send, postCommentResponse);
			}
		}
	}

	function postCommentResponse(){
		var xml = fetchXML(postComment);
		if(xml!=null){
			var root = xml.getElementsByTagName("root");
			var status;
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				status = root[0].childNodes[1].firstChild.nodeValue;
			}

			if(status=="finish"){
				communityReplyRequest(currentID);
				processFinish();
				/*Youtube Version
					document.getElementById("textarea"+currentID).readOnly = "true";
					document.getElementById("textarea"+currentID).style.background = "#999";
					document.getElementById("button"+currentID).disabled = "true";
					document.getElementById("button"+currentID).value = "Your comment has been posted.";
				*/				
			}
		}
	}
	

	//step-1
	function showTopic(){
	
		if(document.getElementById("new_topic_form").style.display == "block"){
			document.getElementById("new_topic_form").style.display = "none";
		}else{
			document.getElementById("new_topic_form").style.display = "block";
			document.getElementById("new_topic_form_title").focus();
		}	
	}

	
	//step0
	function postTopicRequest(){
		postTopic = createRequest();

		var title = document.getElementById("new_topic_form_title").value;
		var content = document.getElementById("new_topic_form_content").value;		
		var textPattern = /<(.|\n)+?>/;//consist <> html code
		var isNotTextValidate = textPattern.test(content);
				
		document.getElementById("topicErrorBox").innerHTML = "";
		
		if(isLogin!="YES"){
			document.getElementById("topicErrorBox").innerHTML = "Please login first.";			
		}else if(title.length<2){
			document.getElementById("topicErrorBox").innerHTML = "Title too short.";
			document.getElementById("new_topic_form_title").focus();
		}else if(content.length<10){
			document.getElementById("topicErrorBox").innerHTML = "Content too short.";
			document.getElementById("new_topic_form_content").focus();
		}else if(content.length>5000){
			document.getElementById("topicErrorBox").innerHTML = "Content too long.";
			document.getElementById("new_topic_form_content").focus();
		}else if(isNotTextValidate){
			document.getElementById("topicErrorBox").innerHTML = "Content has illegal characters!";
			document.getElementById("new_topic_form_content").focus();
		}else{
			document.getElementById("new_topic_form").style.display = "none";
			var send = "title=" + title + "&content=" + content + "&dummy=" + new Date().getTime();			
			processStart();
			sendAjaxPOSTRequest(postTopic, "communityTopicAdd.do", send, postTopicResponse);
		}
	}

	function postTopicResponse(){
		var xml = fetchXML(postTopic);
		if(xml!=null){
			var root = xml.getElementsByTagName("root");
			var status;
			if(root[0].childNodes[1].firstChild.nodeValue!=null){
				status = root[0].childNodes[1].firstChild.nodeValue;
			}

			if(status=="finish"){
				communityRequest();
				//showTopic();//close
				processFinish();
			}else{
				alert(status);
				//document.getElementById("topicErrorBox").innerHTML = status;			
			}
		}
		
	}	
	
	//others
	function hideCurrentTopic(){
		document.getElementById('x'+currentID).style.display = "none";
	}
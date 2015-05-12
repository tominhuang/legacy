function createRequest() {
  var request = null;
 
  try {
    request = new XMLHttpRequest();	
	} catch (trymicrosoft) {
    try {
      request = new ActiveXObject("Msxml2.XMLHTTP");	  	  
    } catch (othermicrosoft) {
      try {
        request = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (failed) {
        request = null;
      }
    }
  }

  if (request == null) {
    alert("Error creating request object!");
  } else {
    return request;
  }
}

function sendAjaxGETRequest(req, url, fetcher){
	req.onreadystatechange = fetcher;
	req.open("GET", home + url, true);
	req.send(null);
}
	
function sendAjaxPOSTRequest(req, url, send, fetcher){
	req.onreadystatechange = fetcher;
	req.open("POST",  home + url, true);
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.send(send);
}

function fetchXML(req){
	if(req.readyState == 4){
		if(req.status == 200){
		
			var xml = req.responseXML;
			var debug = xml.getElementsByTagName("debug")[0].getAttribute('type');
			switch (debug){
				case "none": // 沒有狀況訊息
					return xml;
					break;
				case "message": // 呈現狀況訊息，並回傳xml
					alert(xml.getElementsByTagName("debug")[0].firstChild.nodeValue);
					return xml;
					break;
				case "error": // 發生程式錯誤，停止回傳xml
					alert(xml.getElementsByTagName("debug")[0].firstChild.nodeValue);
					return null;
					break;
				default:
					return xml;
			}
		}else{
			var message = req.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + req.status);
			}else{
				alert(message);
			}
			return null;
		}
	}
}

function fetchText(req){
	if(req.readyState == 4){
		if(req.status == 200){
		
			var txt = req.responseText;
			return txt;
			
		}else{
			var message = req.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + req.status);
			}else{
				alert(message);
			}
			return null;
		}
	}
}
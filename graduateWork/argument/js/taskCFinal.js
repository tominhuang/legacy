var page="conclusionFinal";

function doSomething(){
}
function closeResult(){
	$(".saveResult").fadeOut(2000);
}
$(function(){
    $("textarea").fck({path: '../include/fckeditor/', toolbar: 'argument'});
	
	$.getJSON("../queryConclusion.do",function(data){
		var msg=data[0];
		if(msg=="sql"){
			alert("資料讀取時發生錯誤，請再試一次。");
		}else{		
			$("#conclusion").val(data[1]);		
		}
	});
	
	$("input[type=submit]").click(function(){	
		var end=new Date().getTime();	
		var period=countPeriod(begin,end);	
		var oEditor = FCKeditorAPI.GetInstance("conclusion") ;
		var conclusion = oEditor.GetHTML();
		
		$.postJSON("../postConclusionFinal.do",{conclusion: conclusion,period:period},function(data){
			var msg=data[0];
			if(msg=="ok"){
				//var now=new Date().toLocaleString();
				var word="結論已儲存！";
				$(".saveResult").show().html(word);
				setTimeout("closeResult();",3000);
			}
			if(msg=="sql"){
				alert("資料儲存時發生錯誤，請再試一次。");
			}
			if(msg=="invalid"){
				alert("資料未儲存！你閒置過久或尚未登入。請重新登入！請將結論文字另外用記事本備份存檔，重新登入後即可正常存檔。");
			}			
		});
		
	});	
		
});
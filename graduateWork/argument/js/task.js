var supportPositive="當前目標：<br>替<b>克萊兒</b>找有利的證據<br><br>";
var supportNegative="當前目標：<br>替<b>華納公司</b>找有利的證據<br><br>";

$(document).ready(function () {	
	var summaryDefault=$("#summary").text();
	var descriptionDefault=$("#description").text();
	var sourceDefault=$("#source").text();
	
	$(".postButton").click(function(){		
		$("#postContainer").toggle();
		window.location.href="#newAnchor";
	});
	
	$(".postCancel").click(function(){	
		$("#postContainer").fadeOut(500);
	});		

	$(".listMode").click(function(){		
		$(this).parent().find(".browseMode").slideToggle();		
	});	
		
	$(".closeEvidence").click(function(){		
		$(this).parent().parent().slideToggle();	
	});

	$(".editEvidence").click(function(){
		$(this).parent().parent().prev().fadeOut(500);
		$(this).parent().parent().fadeOut(500,function(){
			$(this).next().fadeIn(1000);			
			window.location.href="#yourAnchor";
		});				
	});	
	
	$(".editSave").click(function(){
		var eid=$(this).parent().find("input[name=eid]").val();
		var editDirection=$(this).parent().find("input[name=editDirection]").val();
		var editSummary=$(this).parent().find(".editSummary").val();
		var editDescription=$(this).parent().find(".editDescription").val();
		var editSource=$(this).parent().find(".editSource").val();						
		var evidence=$(this).parent().parent();
		var editCancel=$(this).parent().find(".editCancel");
		
		evidence.find(".listSummary").html(editSummary.replace(/\n/g,"<br>"));
		evidence.find(".descriptionContent").html(editDescription.replace(/\n/g,"<br>"));
		evidence.find(".sourceContent").html(editSource.replace(/\n/g,"<br>"));


		$.postJSON("../editEvidence.do",{week:week,eid:eid,summary:editSummary,description:editDescription,source:editSource,direction:editDirection},function(data){					
			if(data[0]=="ok"){			
				editCancel.click();
			}else{
				alert("發生錯誤！資料未儲存！");
			}		
		});	

	});	
	
	
	$(".editCancel").click(function(){
		$(this).parent().fadeOut(500,function(){
			$(this).prev().fadeIn(1000);
			$(this).prev().prev().fadeIn(1000);
			window.location.href="#yourAnchor";
		});		
	});
	
	$(".deleteEvidence").click(function(){
		var summary=$(this).parent().parent().prev().find(".listSummary").text();
		var description=$(this).parent().parent().find(".descriptionContent").text();
		var source=$(this).parent().parent().find(".sourceContent").text();
		var direction=$(this).parent().parent().parent().find("input[name=editDirection]").val();
		var eid=$(this).parent().parent().parent().find("input[name=eid]").val();
		var evidence=$(this).parent().parent().parent();
		
		var answer = confirm("你確定要刪除「" + summary + "」嗎？");
		if(answer){
			
			$.getJSON("../deleteEvidence.do",{week:week,eid:eid,summary:summary,description:description,source:source,direction:direction},function(data){			
				if(data[0]=="ok"){
					evidence.fadeOut();
				}else{
					alert("發生錯誤！資料未儲存！");
				}		
			});

		}
	});

	$("#summary").focus(function(){
		var value=$("#summary").text();
		if(value==summaryDefault){
			$("#summary").text("");
		}
	});

	$("#summary").blur(function(){
		var value=$("#summary").val();
		if(value==""){
			$("#summary").text(summaryDefault);
		}
	});	

	$("#description").focus(function(){
		var value=$("#description").text();
		if(value==descriptionDefault){
			$("#description").text("");
		}
	});

	$("#description").blur(function(){
		var value=$("#description").val();
		if(value==""){
			$("#description").text(descriptionDefault);
		}
	});	
	
	$("#source").focus(function(){
		var value=$("#source").text();
		if(value==sourceDefault){
			$("#source").text("");
		}
	});

	$("#source").blur(function(){
		var value=$("#source").val();
		if(value==""){
			$("#source").text(sourceDefault);
		}
	});			
		
	$(".replyRead").click(function(){
		$.getJSON("../markRead.do",{week: week},function(data){		
			if(data[0]=="invalid"){
				alert("請先登入！");
				return;
			}else if(data[0]=="ok"){
				$(".replyConfirm").hide();
				$(".replyDone").show();	
			}else{
				alert("存取資料庫時發生錯誤，請稍候再試");			
			}
		});	
	});	

	$("#searchHint").click(function(){		
		$("#searchHintWord").toggle();
	});		
	
	$(".helpClaire").click(function(){
		$("#postContainer").show();
		$("input[name=direction]").val("positive");			
		$(".target").show().html(supportPositive);
	});	
	
	$(".helpWarner").click(function(){
		$("#postContainer").show();
		$("input[name=direction]").val("negative");			
		$(".target").show().html(supportNegative);
	});
	
	$.getJSON("../queryAdmin.do",function(data){
		if(week==2 && data[1]=="0"){$(".evidence2inside").hide();$(".msg").html("本週還沒開放喔！");return;}
		if(week==3 && data[2]=="0"){$(".evidence3inside").hide();$(".msg").html("本週還沒開放喔！");return;}
		if(week==4 && data[3]=="0"){$(".evidence4inside").hide();$(".msg").html("本週還沒開放喔！");return;}
	});		
	
	
});
function doSomething(){
	var word="";

	if(grouping=="positive"){
		$("input[name=direction]").val(grouping);
		word="我們必須幫忙克萊兒維護她的權益，所以至少必須找到<span class=key>一項以上的證據</span>，才能讓克萊兒在這場訴訟中獲勝。記住，證據的來源必須是<span class=key>可靠與值得信任的</span>，才能被檢察官和法官所採納。";
	}
	if(grouping=="negative"){
		$("input[name=direction]").val(grouping);
		word="我們必須幫忙華納公司維護他們的權益，所以至少必須找到<span class=key>一項以上的證據</span>，才能讓華納公司在這場訴訟中獲勝。記住，證據的來源必須是<span class=key>可靠與值得信任的</span>，才能被檢察官和法官所採納。";
	}
	if(grouping=="balanced"){				
		if(week==1){
			word="哇，這真是個棘手的案件！兩邊似乎都很有道理，那我們只好同時為他們找有利的證據，而為了公平起見，兩邊必須<span class=key>交替進行</span>，也就是說，當為克萊兒找到一個證據之後，下次就必須為華納公司找到一個證據，以此類推。<br><br>記住，每個禮拜至少要找到<span class=key>一個以上的證據</span>，才有助於釐清案情。你可以先幫克萊兒或是華納公司，但是下一次就必須幫另一邊。證據的來源必須是<span class=key>可靠與值得信任的</span>，才能被檢察官和法官所採納。<br><br>別擔心，福爾摩斯會幫我們找到<span class=purple>祕密證人</span>。祕密證人說的話，相信對我們的案情會有所幫助。";
		}else{
			word="兩邊似乎都很有道理，我們只好同時為他們找有利的證據，本週的證據順序，要接著上週的證據順序<span class=key>交替進行</span>，也就是說，當為克萊兒找到一個證據之後，下次就必須為華納公司找到一個證據，以此類推。<br><br>記住，每個禮拜至少要找到<span class=key>一個以上的證據</span>，才有助於釐清案情。你可以先幫克萊兒或是華納公司，但是下一次就必須幫另一邊。證據的來源必須是<span class=key>可靠與值得信任的</span>，才能被檢察官和法官所採納。<br><br>別擔心，福爾摩斯會幫我們找到<span class=purple>祕密證人</span>。祕密證人說的話，相信對我們的案情會有所幫助。";
		}
		$("#secret").show();
	}
	$(".taskDescription").html(word);
				

	$.getJSON("../queryEvidence.do",{week: week},function(data){
		var size=$(data).size();
		var jsonUnit=6;
		var evidenceNum=size/jsonUnit;
		var evidenceNumCopy=evidenceNum-1;
		
		//at least one piece of evidence
		if(size>=2){
			$(".editEvidence").show();
			$(".deleteEvidence").show();
		
			//copy DOM
			for(var i=0;i<evidenceNumCopy;i++){
				var x=$(".evidence:first").clone(true);						
				$(x).insertAfter(".evidence:last");
			}
			
			//set value
			var position=0;			
			$(".evidence").each(function(){				
				$(this).find(".listSummary").html(data[position+1].replace(/\n/g,"<br>"));
				$(this).find(".descriptionContent").html(data[position+2].replace(/\n/g,"<br>"));
				$(this).find(".sourceContent").html(data[position+3].replace(/\n/g,"<br>"));
				
				$(this).find("input[name=editDirection]").val(data[position]);
				$(this).find(".editSummary").text(data[position+1]);
				$(this).find(".editDescription").text(data[position+2]);
				$(this).find(".editSource").text(data[position+3]);
				$(this).find("input[name=eid]").val(data[position+5]);
				
				position+=jsonUnit;
			});					
		}						
	});
	
	if(grouping=="balanced"){
		$.getJSON("../queryEvidenceLast.do",function(data){	
			var size=$(data).size();
									
			if(size>2){//at least one piece of evidence
				var lastEvidenceDirection=data[0];
				
				if(lastEvidenceDirection=="positive"){
					//change to negative
					$("input[name=direction]").val("negative");
					$(".target").show().html(supportNegative);
				}
				if(lastEvidenceDirection=="negative"){
					//change to positive
					$("input[name=direction]").val("positive");
					$(".target").show().html(supportPositive);
				}			
			
			}else{//no evidence
				$(".initial").show();
				$(".postButton").hide();
			}
		});
		
		$.getJSON("../queryReply.do",{week: week},function(data){		
			if(data[0]=="1"){			
				var isRead=data[1];
				var replyDate=data[2].substring(0,10);

				$(".replyTrue").show();
				$(".replyDefault").hide();
				$(".replyMessage").append("<br><br>"+replyDate);
				if(isRead!="0"){
					$(".replyConfirm").hide();
					$(".replyDone").show();
				}
			}
		});		
	}	
}


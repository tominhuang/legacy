$(function() {
	$.getJSON("../queryPostQ.do",function(data){
		var status=data[0];		
		if(status=="done"){
			$(".openingTitleQ").html("完成");
			$(".openingQ").html("你的問卷已繳交！");
			$("#questionnaireMain").hide();
		}
	});
});
$(".next").live("click",function(){	
	var ATTITUDE_SIZE=18;
	var BEHAVIOR_SIZE=16;
	var attitudeMissing=0;
	var behaviorMissing=0;
	var error="";
	
	var end=new Date().getTime();	
	var diffSecond=countPeriod(begin,end);
	$("input[type=hidden]").val(diffSecond);
	//alert(diffSecond);

	for(var i=1;i<=ATTITUDE_SIZE;i++){
		var selector="input[name=groupAlpha" + i + "]";
		var value=null;

		$(selector).each(function(){
			if(this.checked){
				value=$(this).attr("value");
			}
		});
		if(value==null){
			$(selector).parent().parent().parent().addClass("unchecked");
			attitudeMissing++;
		}
	}
	for(var i=1;i<=BEHAVIOR_SIZE;i++){
		var selector="input[name=groupBeta" + i + "]";
		var value=null;

		$(selector).each(function(){
			if(this.checked){
				value=$(this).attr("value");
			}
		});
		if(value==null){
			$(selector).parent().parent().parent().addClass("unchecked");
			behaviorMissing++;			
		}
	}
	
	if(attitudeMissing>0){
		error+="資訊倫理態度問卷有" + attitudeMissing + "題未答。\n"
	}
	if(behaviorMissing>0){
		error+="資訊倫理行為問卷有" + behaviorMissing + "題未答。"
	}
	
	if(error!=""){
		alert("請完整填完問卷！\n" + error);
		return false;
	}
	if(error==""){
		$(this).val("處理中，請稍候……");
		return true;
	}
	
});	
	
$(".items").live("click",function(){
	$(this).find("input[type=radio]").attr("checked",true);
	$(this).addClass("checked");
	$(this).siblings().removeClass("checked");	
	$(this).parent().parent().removeClass("unchecked");
});

$(".itemsUncertain").live("click",function(){
	$(this).find("input[type=radio]").attr("checked",true);
	$(this).addClass("checked");
	$(this).siblings().removeClass("checked");	
	$(this).parent().parent().removeClass("unchecked");
});

function doSomething(){
}
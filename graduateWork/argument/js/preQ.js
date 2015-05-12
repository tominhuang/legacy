$(".next").live("click",function(){	
	var GROUP_SIZE=24;
	var GB_SIZE=15;
	var groupMissing=0;
	var gbMissing=0;
	var error="";
	//var choice=new Array(39);
	
	var end=new Date().getTime();	
	var diffSecond=countPeriod(begin,end);
	$("input[type=hidden]").val(diffSecond);
	//alert(diffSecond);

	for(var i=1;i<=GROUP_SIZE;i++){
		var selector="input[name=group" + i + "]";
		var value=null;

		$(selector).each(function(){
			if(this.checked){
				value=$(this).attr("value");
			}
		});
		if(value==null){
			$(selector).parent().parent().parent().addClass("unchecked");
			groupMissing++;
		}
		//choice[i-1]=value;
	}
	for(var i=1;i<=GB_SIZE;i++){
		var selector="input[name=gb" + i + "]";
		var value=null;

		$(selector).each(function(){
			if(this.checked){
				value=$(this).attr("value");
			}
		});
		if(value==null){
			$(selector).parent().parent().parent().addClass("unchecked");
			gbMissing++;			
		}
		//choice[i-1+GROUP_SIZE]=value;
	}
	
	/*
	var x="";
	for(var i in choice){
		x+= ++i +": " + choice[--i]+", \n";		
	}
	alert(x);
	*/	
	
	if(groupMissing>0){
		error+="資訊倫理態度問卷有" + groupMissing + "題未答。\n"
	}
	if(gbMissing>0){
		error+="資訊倫理行為問卷有" + gbMissing + "題未答。"
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
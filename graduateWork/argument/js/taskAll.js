var page="taaskAll";//for public.js

$(document).ready(function () {	
	/*
	$(".each").live("click",function(){
		$(this).find(".content").slideToggle();
	});	
	*/
	$(".summary").live("click",function(){
		$(this).next().slideToggle();
	});	
	
	$(".eid").live("click",function(){
		$(".eviNo").html($(".eid:checked").size());
		$(this).parent().parent().toggleClass("checked");
	});

	
	$(".save").click(function(){
		var checked=$(".eid:checked");
		var data="";
		var checkNo=0;
		
		if(checked.size()>10){
			alert("你不能選擇超過10個證據！")
			return;
		}
		if(checked.size()==0){
			alert("你未選擇證據！")
			return;
		}						
		checked.each(function(index){
			data += "check"+ (index+1) + "=" + $(this).attr("value") + "&";				
		});

		$.getJSON("../checkEvidence.do",data,function(data){
			var msg=data[0];
			if(msg=="ok"){
				alert("資料已儲存！");				
			}else if(msg=="sql"){
				alert("資料儲存時發生錯誤，請再試一次。");
			}else if(msg=="invalid"){
				alert("資料未儲存！你閒置過久或尚未登入。請重新登入！請將結論文字另外用記事本備份存檔，重新登入後即可正常存檔。");
			}
		});
	});	
	
	$.getJSON("../queryEvidenceAll.do",function(data){
		var size=$(data).size();		
		var inner="";
		var unitSize=8;
		
		if(size>2){
			for(var i=0;i<size;i+=unitSize){
				var direction="克萊兒";
				if(data[i+1]=="negative")direction="華納公司";
				
				inner+= "<tr><td><input type=checkbox class=eid name=eid value=" + data[i+6] + "></td>" +
					"<td>" + data[i+6] + "</td>" +
					"<td>" + direction + "</td>" +
					"<td>" + data[i+7] + "</td>" +
					"<td class=each><div class=summary>" + data[i+2] + 
					"</div><div class=content><br><br>證據說明：<br>" + data[i+3] + 
					"<br><br>證據來源：<br>" + data[i+4] +
					"<br><br>發表時間：<br>" +  data[i+5] + "</div></td></tr>";
			}
			$("tbody").html(inner);
			$("#eviAllNo").html(size/unitSize);
					
			$.getJSON("../queryCheckEvidence.do",function(data){
				if(data[0]=="ok"){
					var checked=0;
					for(var i=1;i<11;i++){
						if(data[i]!=null && data[i]!=0){							
							$(".eid[value='"+data[i]+"']").attr("checked",true);
							$(".eid[value='"+data[i]+"']").parent().parent().addClass('checked');
							checked++;
						}
					}
					$(".eviNo").html(checked);
				}
			});
			
			$("#lib").tablesorter({
				headers: {           
					0: { sorter: false } 
				} 
			}); 
		}
	});		
	
	
});
function doSomething(){
}
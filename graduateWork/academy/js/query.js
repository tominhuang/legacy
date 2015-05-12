$(document).ready(function(){
	$("input[name=id]").focus();
		
	$("form[name=form1]").submit(function(){	
		var id=$("input[name=id]").val();
		$(".queryResultMsg").html("查詢中...");
		
		if(id.length<7){
			$(".queryResultMsg").html("查無資料");
			return false;
		}
		
		$.getJSON("../query.do",{id:id},function(data){			
		
			if($(data).size()<2){
				$(".queryResultMsg").html("查無資料");
				$(".queryResult").hide();
				
				return false;
			}else{
				var team=data[2];
				var group=data[3];
				var column;

				$(".queryResultMsg").html("").show();
				$(".queryResult").show();

				$(".studentID").html(data[0]);
				$(".name").html(data[1]);
				$(".group").html(data[3]);

				if(team==1){
					if(data[6]==group && data[14]==group){
						column="onetwo";
					}else{
						column="threefour";
					}
				}else if(team==2){
					if(data[7]==group && data[15]==group){
						column="onetwo";
					}else{
						column="threefour";
					}				
				}				
				
				var link,link2;
				if(column=="onetwo"){
					link="<a href=../camp/Assistant.jsp?height=518&width=620&id=" + data[5] + " class=thickbox>" + data[4] + "</a>";
					link2="<a href=../camp/Assistant.jsp?height=518&width=620&id=" + data[13] + " class=thickbox>" + data[12] + "</a>";					
				}
				else if(column=="threefour"){
					link="<a href=../camp/Assistant.jsp?height=518&width=620&id=" + data[21] + " class=thickbox>" + data[20] + "</a>";
					link2="<a href=../camp/Assistant.jsp?height=518&width=620&id=" + data[29] + " class=thickbox>" + data[28] + "</a>";
				}
				$(".assistant1").html(link);
				$(".assistant2").html(link2);				
			}
			
		});
	
		return false;
	});	
});





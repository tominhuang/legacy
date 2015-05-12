function countdown(){
	//Set the two dates
	var openDate =new Date(2009, 7-1, 19, 00, 00, 00) //Month is 0-11 in JavaScript
	var today=new Date();

	//in milliseconds
	var oneDay=1000*60*60*24;
	var oneHour=1000*60*60;
	var oneMinute=1000*60;
	var oneSecond=1000;

	//diff
	var diff=openDate.getTime()-today.getTime();	
	var diffDay=Math.floor((openDate.getTime()-today.getTime())/oneDay);	
	var diffHour=Math.floor((diff - diffDay*oneDay)/oneHour);
	var diffMinute=Math.floor((diff - diffDay*oneDay - diffHour*oneHour)/oneMinute);
	var diffSecond=Math.floor((diff - diffDay*oneDay - diffHour*oneHour - diffMinute*oneMinute )/oneSecond);
	
	if(diffDay<0){diffDay=0;}
	if(diffHour<0){diffHour=0;}
	if(diffMinute<0){diffMinute=0;}
	if(diffSecond<0){diffSecond=0;}	

	//Calculate difference btw the two dates
	var diffString=diffDay+"天"+diffHour+"小時"+diffMinute+"分"+diffSecond+"秒";
	document.getElementById("countdown").innerHTML = diffString;
}
window.onload=function(){
	countdown();
	setInterval(countdown,1000);
}
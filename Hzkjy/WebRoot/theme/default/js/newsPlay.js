//var box;
//rollDivId:滚动内容所在的div的id
//playTime:每次滚动的时间间隔
//rollVisible：移动到div上时，是否显示滚动条。
function startRoll(rollDivId,playTime,rollVisible){
	var box=document.getElementById(rollDivId);
	var stop=true;
	//352是滚动的div的高
	var innerHTML=box.innerHTML;
	box.innerHTML=innerHTML+innerHTML;
	var height=pxToVal(box.scrollHeight);
	if (isScroll(box,height)==true){
		stop=false;
		box.innerHTML=innerHTML+innerHTML;
	}else{
		box.innerHTML=innerHTML;
	}

	window[rollDivId]={"id":rollDivId,"box":box,"stop":stop,"playTime":playTime};

	box.scrollTop=0;
	box.onmouseover=function(){window[rollDivId].stop=true;if (rollVisible==true){document.getElementById(rollDivId).style.overflow="scroll"};};
	box.onmouseout=function(){window[rollDivId].stop=false;if (rollVisible==true){document.getElementById(rollDivId).style.overflow="hidden"};};

	newsRoll(rollDivId);
}

function newsRoll(rollDivId){
	var box=window[rollDivId].box;
    	if(!window[rollDivId].stop){
		if (box.scrollTop>=parseInt(box.scrollHeight/2) ){
			box.scrollTop=0;
		}else{
			box.scrollTop++;
		}
	}
	setTimeout("newsRoll('"+rollDivId+"')",window[rollDivId].playTime);
};
//判断滚动条是否能够一直滚动
function isScroll(box,rollHeight){
	var top;
	var partHeight=0.5*rollHeight;
	box.scrollTop=partHeight;
	if (Math.abs(box.scrollTop-partHeight)<1){
		return true;
	}else{
		return false;
	}
}
//将px转化为数值,例如将"50px"转化为"50"
//px:要转化的px.例如"50px"
function pxToVal(px){
	px=px.toString();
	var pxVal=Number(px.replace("px",""));
	return pxVal;
}

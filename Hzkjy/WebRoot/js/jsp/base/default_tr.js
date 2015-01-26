$(function(){
	// 为tr绑定onmouseover与onmouseout事件
	$("tr").hover(
		function(){ // onmouseover 
			$(this).css({"background-color" : "#FFFFBF", "cursor" : "pointer"});
		},
		function(){ // onmouseout
			$(this).css("background-color","#FFFFFF");
		}
	);
});

//合并时间列相同的
function tdCombine(id){
	
	var tds = $("td[id^='" + id + "']");
	var td_content = "";
	var rowSpanCount = 1;
	var rowSpanIndex = 0;
	for(var i = 0; i < tds.length; i++){
		if(i == 0){
			td_content = tds[i].innerHTML;
		}else{
			if(td_content != tds[i].innerHTML){
				if(rowSpanCount > 1){
					$("#" + id + rowSpanIndex).attr("rowspan",rowSpanCount);
				}
				
				rowSpanCount = 1;
				rowSpanIndex = i;
				td_content = tds[i].innerHTML;
			}else{
				$("#" + id + i).remove();
				rowSpanCount ++;
			}
		}
		if(i == tds.length - 1){
			if(rowSpanCount > 1){
				$("#" + id + rowSpanIndex).attr("rowspan",rowSpanCount);
			}
		}
	}
}

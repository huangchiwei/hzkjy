var row_count = 0; 
function addNew() 
{ 
var table1 = $('#myTable'); 
var firstTr = table1.find('tbody>tr:first'); 
var row = $("<tr></tr>"); 
var td = $("<td></td>"); 
var td1 = $("<td></td>"); 
var td2 = $("<td></td>");  
var td3 = $("<td></td>"); 
var td4 = $("<td></td>");  
var td5 = $("<td></td>"); 
var td6 = $("<td></td>"); 

td.append($("<input type='button' value='删除' id='dl"+row_count+"' class='initial' onclick='javascript:del(this);'/>") 
);
td1.append($("  <select name='isSetUp' class='input_a1' ><option value='0' >未知</option><option value='1' >否</option><option value='2' >是</option></select>") 
);  
td2.append($("<input  name='projectName' type='text' size='20'  class='input_a1' /><font color='red'>*</font>") 
);  
td3.append($(" <select name='projectLevel' class='input_a1' ><option value='0' >国家级</option><option value='1' >省级</option><option value='2' >市级</option><option value='2' >区级</option></select>") 
);  
td4.append($("<input  name='applyAmount' type='text' size='7'  class='input_a1' /><font color='red'>*</font>") 
);  
td5.append($("<input  name='setUpAmount' type='text' size='7'  class='input_a1' /><font color='red'>*</font>") 
);  
td6.append($("<input class='input_a1'   name='projectType' type='text'/><font color='red'>*</font>") 
);  
row.append(td); 
row.append(td1); 
row.append(td2); 
row.append(td3); 
row.append(td4); 
row.append(td5); 
row.append(td6); 
table1.append(row); 
row_count++; 

} 

function del(obj) 
{ 
var dtrid=obj.id;

$("#" + dtrid).parent().parent().remove(); 

} 
var corpNameJson="";
function loadCorpName(){
	if(corpNameJson!=""){
		corpAutocomplete(corpNameJson);
		}else{
			$.ajax({
				url:ctx+'/admin/memberBasic/getAllMember.html?random='+Math.random(),
		  		type:'post',
		  		dataType:'json',
		  		async:false,
		  		success:function(data){
		  			corpAutocomplete(data);
		  			corpNameJson=data;
		  		},
		  		error:function(){
		  			alert('获取会员信息失败');
		  		} 
		  		
		  	});
			}
}
function corpAutocomplete(data){
	$("#memberNo").autocomplete(data,{
			 minChars:0,
			matchContains: true,
			//autoFill:true,
			//mustMatch:true,
			dataType:"json",
			formatItem: function(row, i, max) {
	                 return row.Qymc;
	            },
	            formatMatch: function(row, i, max) {
	                 return row.Qymc;
	            },
	            formatResult: function(row) {
	                 return row.Hybh;
	            }
		}).result(function(event, data, formatted) {
			 
	});
}


function validate(){
	
	var memberNo=$("#memberNo");
	if(memberNo.val()==""){
		alert("请选择所属企业!");
		memberNo.focus();
		return false;
		}
	var year=$("#year");
	if(year.val()==""){
		alert("年份不为空!");
		year.focus();
		return false;
		}
	var projectType=$("#projectType");
	if(projectType.val()==""){
		alert("项目类别不为空!");
		projectType.focus();
		return false;
		}
	
	var pnArray = $("input[name^='projectName']");
	for(var i=0;i<pnArray.length;i++){
		if(pnArray[i].value==""){
			alert("项目名称不为空!");
			//projectName.focus();
			return false;
			}
        
    }

	
	
	
	var re1=/^-?\d+$/;
	var re2=/^(-?\d+)(\.\d+)?$/;
	
	var aaArray = $("input[name^='applyAmount']");
	for(var i=0;i<aaArray.length;i++){
		if(aaArray[i].value==""){
			alert("项目名称不为空!");
			//projectName.focus();
			return false;
			}else{
				if(!re1.test(aaArray[i].value)&&!re2.test(aaArray[i].value)){
					alert("申报额度(万)必须为整数或浮点 ");
					//applyAmount.focus();
						return false;
					}
			}
        
    }
	
	var suaArray = $("input[name^='setUpAmount']");
	for(var i=0;i<suaArray.length;i++){
		if(suaArray[i].value==""){
			alert("立项资助金额(万)不为空!");
			//projectName.focus();
			return false;
			}else{
				if(!re1.test(suaArray[i].value)&&!re2.test(suaArray[i].value)){
					alert("立项资助金额(万)必须为整数或浮点 ");
					//applyAmount.focus();
						return false;
					}
			}
        
    }
	/*	var applyAmount=$("#applyAmount");
		if(applyAmount.val()==""){
			alert("申报额度(万)不为空!");
			applyAmount.focus();
			return false;
			}
		
		if(applyAmount.val()!=""){
			if(!re1.test(applyAmount.val())&&!re2.test(applyAmount.val())){
				alert("申报额度(万)必须为整数或浮点 ");
				applyAmount.focus();
					return false;
				}
			}
	
		
		var setUpAmount=$("#setUpAmount");
		if(setUpAmount.val()==""){
			alert("立项资助金额(万)不为空!");
			setUpAmount.focus();
			return false;
			}
		
		if(setUpAmount.val()!=""){
			if(!re1.test(setUpAmount.val())&&!re2.test(setUpAmount.val())){
				alert("立项资助金额(万)必须为整数或浮点 ");
				setUpAmount.focus();
					return false;
				}
			}*/
		
	
	document.forms[0].submit();
}

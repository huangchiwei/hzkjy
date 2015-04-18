
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

td.append($("<input type='button' value='删除' id='dl"+row_count+"' class='initial' onclick='javascript:del(this);'/>") 
);
td1.append($("  <select name='type' class='input_a1' ><option value='0' >发明专利</option><option value='1' >实用新型</option><option value='2' >外观设计</option><option value='3' >软件著作权</option></select>") 
);  
td2.append($("<input  name='name' type='text' size='20' class='input_a1' /><font color='red'>*</font>") 
);  
td3.append($("<input  size='20' name='patentNo' type='text'  class='input_a1'/><font color='red'>*</font>") 
);  
row.append(td); 
row.append(td1); 
row.append(td2); 
row.append(td3); 
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
		var nameArray = $("input[name^='name']");
		for(var i=0;i<nameArray.length;i++){
			if(nameArray[i].value==""){
				alert("专利名称不为空!");
				return false;
				}
	        
	    }
		var pnArray = $("input[name^='patentNo']");
		for(var i=0;i<pnArray.length;i++){
			if(pnArray[i].value==""){
				alert("专利编号不为空!");
				return false;
				}
	        
	    }
		
	/*	var name=$("#name");
		if(name.val()==""){
			alert("专利名称不为空!");
			name.focus();
			return false;
			}
		var patentNo=$("#patentNo");
		if(patentNo.val()==""){
			alert("专利编号不为空!");
			patentNo.focus();
			return false;
			}*/
	
	document.forms[0].submit();
}
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/adminthemes/css/style.css" type="text/css"
			rel="stylesheet" />
		<link href="${ctx}/adminthemes/default/css/master.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/adminthemes/default/css/default.css"
			rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="${ctx}/js/jquery_autocomplete/jquery.autocomplete.js"></script>
<link href="${ctx}/js/jquery_autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" >
var corpNameJson="";


function loadCorpName(){
	if(corpNameJson!=""){
		corpAutocomplete(corpNameJson);
		}else{
			$.ajax({
				url:'${ctx}/admin/memberBasic/getAllMember.html?random='+Math.random(),
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
		var year=$("#year");
		if(year.val()==""){
			alert("年份不为空!");
			year.focus();
			return false;
			}
		var name=$("#name");
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
			}
		var memberNo=$("#memberNo");
		if(memberNo.val()==""){
			alert("请选择所属企业!");
			memberNo.focus();
			return false;
			}
	document.forms[0].submit();
}
</script>
<script type="text/javascript" language="javascript"> 
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
td1.append($("  <select name='type' class='input_a1' ><option value='0' <c:if test='${entity.ProjectLevel==0}'>selected='selected'</c:if>>发明专利</option><option value='1' <c:if test='${entity.ProjectLevel==1}'>selected='selected'</c:if>>实用新型</option><option value='2' <c:if test='${entity.ProjectLevel==2}'>selected='selected'</c:if>>外观设计</option><option value='3' <c:if test='${entity.ProjectLevel==3}'>selected='selected'</c:if>>软件著作权</option></select>") 
);  
td2.append($("<input id='name' name='name' type='text' size='20' value='${entity.Name}' class='input_a1' /><font color='red'>*</font>") 
);  
td3.append($("<input id='patentNo' size='20' name='patentNo' type='text' value='${entity.PatentNo}' class='input_a1'/><font color='red'>*</font>") 
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
</script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='${ctx}/admin/memberPatent/save.html' method="post">
<input type="hidden" name="ptype" value="${ptype}"/>
<input type="hidden" name="id" value="${entity.Id}"/>
  <div class="add_info">

   <h2>${type=='A'?'添加':'修改' }专利</h2>
    <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
    <tr>
      
     <c:if test="${cookie.admin_key.value=='admin'}">
      <th>所属企业</th>
     <td >
     <input type="text" id="memberNo" name="memberNo" value="${entity.MemberNo}"  class="input_a1" size="20" onfocus="loadCorpName();"/>
     <%--
     <select name="memberNo" id="memberNo">
     <option value="">--请选择--</option>
     <c:forEach items="${list}" varStatus="i" var="o" >  
     <option value="${o.Hybh }"  <c:if test="${o.Hybh==entity.MemberNo}">selected="selected"</c:if>>${o.Qymc }</option>
     </c:forEach>
     </select>
    	--%><font color="red">*</font>
     </td>
    </c:if>
     

       <th> 年份：</th>
     <td>
 <input id="year" name="year"  class="input_a1"  onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${entity.Year}" maxlength="10"/><font color="red">*</font>
     	
     </td>
    <th> 月份：</th>
    <td><select name="month" id="month" class="input_a1" >
    <option value="0" <c:if test="${entity.Month==0}">selected="selected"</c:if>>1~6月</option>
    <option value="1" <c:if test="${entity.Month==1}">selected="selected"</c:if>>7~12月</option></select></td>
    </tr>
	 </table>  
	  <table id="myTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
    <tr>
    <th>操作</th>
     <th class="w100">专利类别:</th>
    <th>专利名称：</th>
     
      <th>专利编号：</th>
     
       
    
    </tr>
    <tr>
     <td><input type="button" value="新增行" class="initial" onclick="addNew();"/></td>
        <td>
       <select name="type" class="input_a1" >
 		<option value="0" <c:if test="${entity.ProjectLevel==0}">selected="selected"</c:if>>发明专利</option>    
 		<option value="1" <c:if test="${entity.ProjectLevel==1}">selected="selected"</c:if>>实用新型</option>  
 		<option value="2" <c:if test="${entity.ProjectLevel==2}">selected="selected"</c:if>>外观设计</option>  
 		<option value="3" <c:if test="${entity.ProjectLevel==3}">selected="selected"</c:if>>软件著作权</option>  
     </select>
  
      </td>
    <td>
     	<input id="name" name="name" type="text" size="20" value="${entity.Name}" class="input_a1" /><font color="red">*</font>
     </td>
     <td >
    	<input id="patentNo" size="20" name="patentNo" type="text" value="${entity.PatentNo}" class="input_a1"/><font color="red">*</font>
     </td>
   
    </tr>
   </table>   
  <div class="div_submit">
					<input id="sumbit_bt" name="" type="submit" value="提  交"
						class="photo_btn" />
					<input type="reset" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div>
  </form>
</div>

</body>
</html>
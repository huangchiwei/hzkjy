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

$(document).ready(function(){
      var userNo='${userNo}';
	  var status='${entity.Status}';
  if(userNo=='4401' &&  status=='1'){
	  $("#add_form input").attr("disabled",true);
	  $("#add_form select").attr("disabled",true);
	 }
	 $("#hyflname option[value='${model.hyfl}']").attr("selected", true);  
	$("#back_bt").attr("disabled",false);
	
	formInitConfig("add_form",3000);
	autoValidate();
		
});
var ctx="${ctx}";

</script>
<script type="text/javascript" src="${ctx}/theme/admin/member/MemberPatentA_U.js"></script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" action='${ctx}/admin/memberPatent/save.html' method="post" onsubmit="return validate()">
<input type="hidden" name="ptype" value="${ptype}"/>
<input type="hidden" name="id" value="${entity.Id}"/>
  <div class="add_info">

   <h2>${ptype=='A'?'添加':'修改' }专利</h2>
    <table id="questTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">
    <tr>
      
     <c:if test="${cookie.admin_key.value=='admin'}">
      <th>所属企业</th>
     <td >
     <input type="text" id="memberNo" name="memberNo" value="${entity.MemberNo}"  class="input_a1" size="20" onfocus="loadCorpName();"/>
    <font color="red">*</font>
     </td>
    </c:if>
     

       <th > 年份：</th>
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
     <td> <c:if test="${ptype=='A'}"><input type="button" value="新增行" class="initial" onclick="addNew();"/></c:if></td>
        <td>
       <select name="type" class="input_a1" >
 		<option value="0" <c:if test="${entity.Type==0}">selected="selected"</c:if>>发明专利</option>    
 		<option value="1" <c:if test="${entity.Type==1}">selected="selected"</c:if>>实用新型</option>  
 		<option value="2" <c:if test="${entity.Type==2}">selected="selected"</c:if>>外观设计</option>  
 		<option value="3" <c:if test="${entity.Type==3}">selected="selected"</c:if>>软件著作权</option>  
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
        <c:if test="${userNo!= '4401' || entity.Status!= '1'}">
					<input id="sumbit_bt" name="" type="submit" value="提  交"
						class="photo_btn" />
						</c:if>
					<input type="reset" id="back_bt" value="返回" onclick="javascript:history.back(-1);"
						class="photo_btn" />
				</div>
  
  </div>
  </form>
</div>

</body>
</html>
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
var ctx="${ctx}";

</script>
<script type="text/javascript" src="${ctx}/theme/admin/member/MemberIntellectualProA_U.js"></script>
<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="admin_table">
<form id="add_form" name="add_form" action='${ctx}/admin/memberIntellectualPro/save.html' method="post" onsubmit="return validate()">
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="id" value="${entity.Id}"/>
  <div class="add_info">

   <h2>${type=='A'?'添加':'修改' }科技项目</h2>
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
          <th> 年份：</th>
     <td>
 <input id="year" name="year"  size="5" class="input_a1"   onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${entity.Year}" maxlength="10"/><font color="red">*</font>
     	
     </td>
    <th> 月份：</th>
    <td><select name="month" id="month" class="input_a1"  >
    <option value="0" <c:if test="${entity.Month==0}">selected="selected"</c:if>>1~6月</option>
    <option value="1" <c:if test="${entity.Month==1}">selected="selected"</c:if>>7~12月</option></select></td>
	 
  
	</tr>				
	</table>
	<table id="myTable" border="0" cellspacing="0" cellpadding="0"
					class="ListTable">		
					  <tr>
    <th>操作</th>
     <th >是否立项:</th>
    <th>项目名称：</th>
      <th>项目级别：</th>
      <th>申报额度(万)：</th>
       <th>立项资助金额(万)：</th>
       <th>项目类别：</th>
    </tr>		
    <tr>
    <td> <c:if test="${type=='A'}"><input type="button" value="新增行" class="initial" onclick="addNew();"/></c:if></td>
        
	     <td>
	       <select name="isSetUp" class="input_a1"  >
 		<option value="2" <c:if test="${entity.IsSetUp==1}">selected="selected"</c:if>>是</option>    
 		<option value="1" <c:if test="${entity.IsSetUp==0}">selected="selected"</c:if>>否</option>  
 		<option value="0" <c:if test="${entity.IsSetUp==0}">selected="selected"</c:if>>未知</option>  
     </select>
	    <font color="red">*</font>
	     	</td>
          
     <td >
    	<input id="projectName" name="projectName" type="text" value="${entity.ProjectName}"  class="input_a1"  /><font color="red">*</font>
     </td>
       
     <td>
     <select name="projectLevel" class="input_a1"  >
 		<option value="0" <c:if test="${entity.ProjectLevel==0}">selected="selected"</c:if>>国家级</option>    
 		<option value="1" <c:if test="${entity.ProjectLevel==1}">selected="selected"</c:if>>省级</option>  
 		<option value="2" <c:if test="${entity.ProjectLevel==2}">selected="selected"</c:if>>市级</option>  
 		<option value="3" <c:if test="${entity.ProjectLevel==3}">selected="selected"</c:if>>区级</option>  
     </select>
   
      </td>
        
	     <td>
	     <input id="applyAmount" size="7" class="input_a1"   name="applyAmount" type="text" value="${entity.ApplyAmount}" maxlength="100"   /><font color="red">*</font>
	     </td>
	    
	   	 <td>
	   	 	<input name="setUpAmount" size="7" id="setUpAmount" type="text" class="input_a1" value="${entity.SetUpAmount}"/><font color="red">*</font>
	   	 </td>
	   	 
	   	    <td>
     	<input id="projectType" class="input_a1"   name="projectType" type="text" value="${entity.ProjectType}" maxlength="20"/><font color="red">*</font>
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
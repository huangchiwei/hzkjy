<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="permission-tags" prefix="pm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<link href="${ctx}/theme/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/default/css/font.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" >
function validate(){
	<%--var re1="/^-?\d+$/";
	var re2="/^(-?\d+)(\.\d+)?$/";
	var applyAmount=$("#applyAmount").val();
	var setUpAmount=$("#setUpAmount").val();
	if(applyAmount!=""){
		if(!re1.test(applyAmount)&&!re2.test(applyAmount)){
			alert("申报额度(万)必须为整数或浮点 ");
			$("#applyAmount").focus();
				return false;
			}
		}
	if(setUpAmount!=""){
		if(!re1.test(setUpAmount)&&!re2.test(setUpAmount)){
			alert("立项资助金额(万)必须为整数或浮点 ");
			$("#setUpAmount").focus();
				return false;
			}
		}--%>
		var projectType=$("#projectType");
		if(projectType.val()==""){
			alert("项目类别不为空!");
			projectType.focus();
			return false;
			}
		var applyAmount=$("#applyAmount");
		if(applyAmount.val()==""){
			alert("申报额度(万)不为空!");
			applyAmount.focus();
			return false;
			}
		var setUpAmount=$("#setUpAmount");
		if(setUpAmount.val()==""){
			alert("立项资助金额(万)不为空!");
			setUpAmount.focus();
			return false;
			}
		var projectName=$("#projectName");
		if(projectName.val()==""){
			alert("项目名称不为空!");
			projectName.focus();
			return false;
			}
	document.forms[0].submit();
}
</script>

<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:history.back(-1);"/>
   </div>
<form id="add_form" name="add_form" action='${ctx}/admin/memberIntellectualPro/save.html' method="post">
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="id" value="${entity.Id}"/>
  <div class="add_info">

   <h2>${type=='A'?'添加':'修改' }科技项目</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">项目级别:</th>
     <td>
     <select name="projectLevel">
 		<option value="0" <c:if test="${entity.ProjectLevel==0}">selected="selected"</c:if>>国家级</option>    
 		<option value="1" <c:if test="${entity.ProjectLevel==1}">selected="selected"</c:if>>省级</option>  
 		<option value="2" <c:if test="${entity.ProjectLevel==2}">selected="selected"</c:if>>市级</option>  
 		<option value="3" <c:if test="${entity.ProjectLevel==3}">selected="selected"</c:if>>区级</option>  
     </select>
   
      </td>
     
     <th>项目类别：</th>
     <td>
     	<input id="projectType" name="projectType" type="text" value="${entity.ProjectType}" maxlength="20"/><font color="red">*</font>
     </td>
   
	     <th>申报额度(万)：</th>
	     <td>
	     <input id="applyAmount" name="applyAmount" type="text" value="${entity.ApplyAmount}" maxlength="100"   /><font color="red">*</font>
	     </td>
	     
       
    </tr>
	   
	    <tr>
	      <th> 年份：</th>
     <td>
 <input id="year" name="year"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${entity.Year}" maxlength="10"/>
     	
     </td>
    <th> 月份：</th>
    <td><select name="month" id="month">
    <option value="0" <c:if test="${entity.Month==0}">selected="selected"</c:if>>1~6月</option>
    <option value="1" <c:if test="${entity.Month==1}">selected="selected"</c:if>>7~12月</option></select></td>
     <th>是否立项：</th>
	     <td>
	       <select name="isSetUp">
 		<option value="2" <c:if test="${entity.IsSetUp==1}">selected="selected"</c:if>>是</option>    
 		<option value="1" <c:if test="${entity.IsSetUp==0}">selected="selected"</c:if>>否</option>  
 		<option value="0" <c:if test="${entity.IsSetUp==0}">selected="selected"</c:if>>未知</option>  
     </select>
	    <font color="red">*</font>
	     	</td>
	    </tr>
	    <tr>
	   
	     <th>立项资助金额(万)：</th>
	   	 <td>
	   	 	<input name="setUpAmount"  id="setUpAmount" type="text" class="input_a1" value="${entity.SetUpAmount}"/><font color="red">*</font>
	   	 </td>
	   	   <th>项目名称：</th>
     <td colspan="3">
    	<input id="projectName" name="projectName" type="text" value="${entity.ProjectName}" /><font color="red">*</font>
     </td>
	    </tr>
 
   </table>
     
   
    
    	<p class="div_submit">
				   <img src="${ctx}/theme/default/images/submit.png" onclick="validate()"/>
				</p>
  
  </div>
  </form>
</div>

</body>
</html>
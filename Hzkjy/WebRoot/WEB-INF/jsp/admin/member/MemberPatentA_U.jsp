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
<form id="add_form" action='${ctx}/admin/memberPatent/save.html' method="post">
<input type="hidden" name="ptype" value="${ptype}"/>
<input type="hidden" name="id" value="${entity.Id}"/>
  <div class="add_info">

   <h2>${type=='A'?'添加':'修改' }专利</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">专利类别:</th>
     <td>
       <select name="type">
 		<option value="0" <c:if test="${entity.ProjectLevel==0}">selected="selected"</c:if>>发明专利</option>    
 		<option value="1" <c:if test="${entity.ProjectLevel==1}">selected="selected"</c:if>>实用新型</option>  
 		<option value="2" <c:if test="${entity.ProjectLevel==2}">selected="selected"</c:if>>外观设计</option>  
 		<option value="3" <c:if test="${entity.ProjectLevel==3}">selected="selected"</c:if>>软件著作权</option>  
     </select>
  
      </td>

       <th> 年份：</th>
     <td>
 <input id="year" name="year"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',minDate:'2000',dateFmt:'yyyy'})" type="text" 
     	value="${entity.Year}" maxlength="10"/><font color="red">*</font>
     	
     </td>
    <th> 月份：</th>
    <td><select name="month" id="month">
    <option value="0" <c:if test="${entity.Month==0}">selected="selected"</c:if>>1~6月</option>
    <option value="1" <c:if test="${entity.Month==1}">selected="selected"</c:if>>7~12月</option></select></td>
    </tr>
	 
    <tr>
    <th>专利名称：</th>
     <td>
     	<input id="name" name="name" type="text" value="${entity.Name}" /><font color="red">*</font>
     </td>
      <th>专利编号：</th>
     <td colspan="3">
    	<input id="patentNo" name="patentNo" type="text" value="${entity.PatentNo}"/><font color="red">*</font>
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
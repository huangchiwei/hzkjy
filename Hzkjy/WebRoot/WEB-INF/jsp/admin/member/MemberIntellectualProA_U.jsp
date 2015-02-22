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
<script type="text/javascript" src="${ctx}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>



<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>

<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:history.back(-1);"/>
   </div>
<form id="add_form" action='${ctx}/admin/memberIntellectualPro/save.html' method="post">
<input type="hidden" name="type" value="${type}"/>
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
     	<input id="projectType" name="projectType" type="text" value="${entity.ProjectType}" maxlength="20"/>
     </td>
   
       <th>申报时间：</th>
     <td>
     <input id="applyTime" name="applyTime"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" type="text" 
     	value="<fmt:formatDate value="${entity.ApplyTime}" pattern="yyyy-MM-dd"/>" maxlength="10"/>
     	
     </td>
    </tr>
	    <tr>
	    
	     <th>申报额度(万)：</th>
	     <td>
	     <input id="applyAmount" name="applyAmount" type="text" value="${entity.ApplyAmount}" maxlength="100"   />
	     </td>
	     <th>是否立项：</th>
	     <td>
	     <input name="isSetUp"  id="isSetUp" type="text" class="input_a1" value="${entity.IsSetUp}"/>
	     	</td>
	     <th>立项资助金额(万)：</th>
	   	 <td>
	   	 	<input name="setUpAmount"  id="setUpAmount" type="text" class="input_a1" value="${entity.SetUpAmount}"/>
	   	 </td>
	    </tr>
    <tr>
   
      <th>项目名称：</th>
     <td colspan="5">
    	<input id="projectName" name="projectName" type="text" value="${entity.ProjectName}" maxlength="500"  size="150"/>
     </td>
    </tr>
   </table>
     
   
    
    	<p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
  
  </div>
  </form>
</div>

</body>
</html>
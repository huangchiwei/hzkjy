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
<form id="add_form" action='${ctx}/admin/memberPatent/save.html' method="post">
<input type="hidden" name="type" value="${type}"/>
  <div class="add_info">

   <h2>${type=='A'?'添加':'修改' }专利</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th class="w100">专利类别:</th>
     <td>
      </td>

       <th>申报时间：</th>
     <td>
     <input id="applyTime" name="applyTime"  class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" type="text" 
     	value="<fmt:formatDate value="${entity.ApplyTime}" pattern="yyyy-MM-dd"/>" maxlength="10"/>
     	
     </td>
    </tr>
	 
    <tr>
    <th>专利名称：</th>
     <td>
     	<input id="name" name="name" type="text" value="${entity.Name}" maxlength="20"/>
     </td>
      <th>专利编号：</th>
     <td colspan="5">
    	<input id="patentNo" name="patentNo" type="text" value="${entity.PatentNo}" maxlength="500"  size="150"/>
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
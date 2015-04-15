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
<script type="text/javascript" src="${ctx }/js/jquery-1.8.3.js"></script>

<script type="text/javascript">

function submitFun(){
	var name=$("#name").val();
	if(name==""){
		alert("名称不允许为空!");
		$("#name").focus();
		return false;
		}
	var urlLink=$("#urlLink").val();
	if(urlLink==""){
		alert("链接不允许为空!");
		$("#urlLink").focus();
		return false;
		}
	

	return true;
}
</script>

	


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/newsLink/list/1.html'"/>
   </div>
<form id="add_form" action='${ctx }/admin/newsLink/save.html'  method="post"  onsubmit="return submitFun();">
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" name="id" value="${entity.Id}"/>


  <div class="add_info">

   <h2>页面管理&gt;&gt;${type == 'add' ? '添加' : '修改'}友情链接</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
     <th width="100px;">名称：</th>
     <td>
     	<input id="name" name="name" type="text" value="${entity.Name}"  />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
   <tr>
     <th width="100px;">链接地址：</th>
     <td>
     	<input id="urlLink" name="urlLink" type="text" value="${entity.UrlLink}"  />&nbsp;&nbsp;<font color="red">*</font>
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
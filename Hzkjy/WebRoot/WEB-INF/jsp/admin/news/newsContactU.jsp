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
	var tel=$("#tel").val();
	if(tel==""){
		alert("电话不允许为空!");
		$("#tel").focus();
		return false;
		}
	var max=$("#max").val();
	if(max==""){
		alert("传真不允许为空!");
		$("#max").focus();
		return false;
		}
	var address=$("#address").val();
	if(address==""){
		alert("地址不允许为空!");
		$("#address").focus();
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
   
<form id="add_form" action='${ctx }/admin/newsContact/save.html'  method="post"  onsubmit="return submitFun();">
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" name="id" value="${entity.Id}"/>


  <div class="add_info">

   <h2>页面管理&gt;&gt;${type == 'add' ? '添加' : '修改'}联系我们</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
     <th width="100px;">电话：</th>
     <td>
     	<input id="tel" name="tel" type="text" value="${entity.Tel}" size="40px" />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
   <tr>
     <th width="100px;">传真：</th>
     <td>
     	<input id="max" name="max" type="text" value="${entity.Max}"  size="40px" />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
 <tr>
     <th width="100px;">地址：</th>
     <td>
     	<input id="address" name="address" type="text" value="${entity.Address}" size="40px" />&nbsp;&nbsp;<font color="red">*</font>
     </td>
   </tr>
   
   </table>
  
   <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>&nbsp;&nbsp;<b><font color="red" ><c:if test="${not empty msg}">${msg}</c:if></font></b>
				</p>
  </div>
  </form>
</div>

</body>
</html>
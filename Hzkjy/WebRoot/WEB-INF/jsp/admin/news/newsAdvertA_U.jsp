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
function changeFlag(){
	 $("#flag").attr("value","1");
}

</script>

	


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/admin/news/listAdvert/1.html'"/>
   </div>
<form id="add_form" action='${ctx }/admin/newsAdvert/save.html'  method="post" enctype="multipart/form-data">
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" name="id" value="${entity.id}"/>

  <div class="add_info">

   <h2>首页广告&gt;&gt;${type == 'add' ? '添加' : '修改'}${category.cateName }</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th >标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${entity.title}"  />
     </td>
   
	  <th>备注</th>
	  <td colspan="3"><textarea id="remark" name="remark" rows="3" cols="120" >${entity.content }</textarea>
	  </td>
	  </tr>
     
  <tr >
      <th>附件上传：</th>
     <td  colspan="6">
     <input  id="flag" name="flag" type="hidden"   value="0"/>
      <input  id="file" name="file" type="file"  onchange="changeFlag()" value="${entity.path}"/>
      <font color="red"><c:if test="${ empty entity.path }">未上传附件</c:if>
      <c:if test="${not empty entity.path }">已上传的附件(限一份):<a href="${ctx}/admin/newsAdvert/downLoad/${entity.id}.html">${fn:substringAfter(entity.path, '/userfiles/advertFile/')}</a></c:if></font> 
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
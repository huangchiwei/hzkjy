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
<script type="text/javascript" src="${ctx }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx }/js/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">


</script>

	


<style type="text/css">
html { overflow:-moz-scrollbars-vertical;}
</style>

</head>

<body>
<div class="content_box">
    <div class="btn_box">
  <input type="button" value="返回" class="initial" style="cursor:hand" onclick="javascript:location.href='${ctx}/manager/news/list/1.html?cateCode=${cateCode}'"/>
   </div>
<form id="add_form" action='${ctx }/manager/news/save.html' method="post">
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" name="id" value="${entity.id}"/>
	<input type="hidden" name="cateCode" value="${cateCode}"/>
  <div class="add_info">

   <h2>${category.remark }&gt;&gt;${type == 'add' ? '添加' : '修改'}${category.cateName }</h2>
   <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
     <th >标题：</th>
     <td>
     	<input id="title" name="title" type="text" value="${entity.title}"  />
     </td>
     
     <th>文档原始时间：</th>
     <td>
     	<input id="realTime" name="realTime" size="22" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" 
     	value="<fmt:formatDate value="${entity.realTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" maxlength="20"/>
     </td>
    
    </tr><%--
    <tr> <th>阅读次数：</th>
     <td>
    	<c:if test="${not empty entity.clicks }">${entity.clicks }</c:if>
    	<c:if test="${ empty entity.clicks }">0</c:if>
     </td>
      <th>创建用户：</th>
     <td>
    	${cookie.user_key.value }
     </td></tr>
	  --%><tr>
	  <th>内容</th>
	  <td colspan="3"><textarea id="content" name="content" rows="3" cols="120" >${news.Content }</textarea>
	  </td>
	  </tr>
   
   
   </table>
  
   <p class="div_submit">
				    <input id="sumbit_bt" name="" type="image" src="${ctx}/theme/default/images/submit.png"/>
				</p>
  </div>
  </form>
</div>
<script type="text/javascript">
	var editor;
	editor= CKEDITOR.replace("content"); 
	CKFinder.setupCKEditor(editor, '${ctx}/js/ckfinder/');
	

	function BrowseServer()
{
	var finder = new CKFinder();
	finder.basePath = '${ctx}/js/ckfinder/';
	finder.selectActionFunction = SetFileField;
	finder.popup();
}

</script>
</body>
</html>
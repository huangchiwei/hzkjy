<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.2.min.js"></script>
				<script language="JavaScript" type="text/javascript" src="${ctx}/js/jquery-1.2.6.pack.js"></script>
				<script language="JavaScript" type="text/javascript" src="${ctx}/js/jquery.messager.js"></script>
		<script type="text/javascript">
		var all1='';
		var all2='';
		var all3='';
		$(document).ready(function(){
		 $.messager.lays(300, 200);
		<c:forEach items="${bslist}" var="mb" varStatus="sta">
		 all3+='<a href="${ctx}/admin/bsNews/add/new.html?id=${mb.id}" style="text-decoration:none;">'+"${mb.title}"+'</a>&nbsp&nbsp&nbsp'+
		'<a href="${ctx}/admin/bsNews/add/new.html?id=${mb.id}" style="text-decoration:none;">'+"<fmt:formatDate value="${mb.createTime}" pattern="yyyy-MM-dd" />"+'</a></br>';
	     </c:forEach>
				$.messager.show('<font color="red">您有新的通知</font>', all3+'', 0);
		});
		</script>

</head>

<body>
	
  
<div class="content_box">
	欢迎使用！
</div>
</body>
</html>
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
			var tcbt='${tcbt}'; 
			var tcnr='${tcnr}';
			 var tcsj='<fmt:formatDate value="${tcsj}"
								pattern="yyyy-MM-dd" />';
			
				var tcid='${tcid}'; 
		$(document).ready(function(){
		if(tcbt !=''){
		 $.messager.lays(300, 200);
		 
		 tcbt=  '<a href="${ctx}/admin/bsNews/add/new.html?id=${tcid}" style="text-decoration:none;">'+tcbt+'</a></br>';
		 tcnr= '<a href="${ctx}/admin/bsNews/add/new.html?id=${tcid}" style="text-decoration:none;">'+tcnr+'</a></br>';
		 tcsj= '<a href="${ctx}/admin/bsNews/add/new.html?id=${tcid}" style="text-decoration:none;">'+tcsj+'</a>';
				$.messager.show('<font color="red">您有新的通知</font>', tcbt+tcnr+tcsj+'', 0);
		}
		       
		});
		</script>

</head>

<body>
	
  
<div class="content_box">
	欢迎使用！
</div>
</body>
</html>
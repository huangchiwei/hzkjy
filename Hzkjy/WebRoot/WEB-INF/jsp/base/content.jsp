<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 

<!--tab's css and javascript-->
<link rel="stylesheet" type="text/css"
			href="${ctx}/js/easyui/easyui.css"/>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/js/easyui/main.css"/>

		<link rel="stylesheet" type="text/css"
			href="${ctx}/js/easyui/prettify.css"/>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/js/easyui/icon.css"/>
			  <script type="text/javascript" src="${ctx}/js/easyui/jquery-1.8.0.min.js"></script><!-- 有先后顺序,先jquery-1.8.0.min.js，后layer.min.js-->
	
		<script type="text/javascript"
			src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/theme/default/js/content.js"></script>
<%--<script type="text/javascript" src="${ctx}/js/jsp/base/content.js"></script>
--%><script type="text/javascript">
	$(function(){
		//openTabs('welcome','${ctx}/centerPage/welcome.html');
	});
</script>
</head>

<body>
<div id="tt" class="easyui-tabs" fit="true" border="false" plain="true">
 </div>
</body>
</html>
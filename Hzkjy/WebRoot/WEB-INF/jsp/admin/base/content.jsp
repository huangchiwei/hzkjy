<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>content</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<link href="${ctx}/js/tab/css/tab.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/theme/admin/default/css/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/tab/content.js"></script>
<script type="text/javascript">
	$(function(){
		openNew('welcome','${ctx}/admin/welcome.html');
	});
</script>
</head>

<body>
    <div id="wrapper">
     <div class="div_tabla">
     <ul id="tabs" style="height: 26px;">
       <!-- Tabs go here -->
     </ul>
     </div>
     <div class="div_icon"><a href="#" onClick="refresh();"><img src="${ctx}/js/tab/images/refresh.png"  alt="刷新当前页面" border="0"/></a><%--
     &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="closeCurrentTab();"><img src="${ctx}/js/tab/images/close.png" alt="关闭当前页面" border="0"/></a>
     --%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="closeAllTab();openNew('welcome','${ctx}/admin/welcome.html');"><img src="${ctx}/js/tab/images/close_all.png" alt="关闭所有页面" border="0"/></a></div>
       <div id="content">
           <!-- Tab content goes here -->
        </div>
    </div>
</body>
</html>
